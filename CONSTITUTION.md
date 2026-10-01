# Harvard-Style CV Theme - AI Agent Constitution

## 🎯 Project Purpose
This constitution defines the technical constraints, architecture decisions, and collaboration guidelines for AI agents working on the Harvard-Style CV Jekyll Template. This document ensures consistent development practices and maintains the project's integrity.

## 🏗️ Technical Architecture

### Core Technology Stack
- **Static Site Generator**: Jekyll 3.10, pinned by the `github-pages` gem (v232)
- **Hosting Platform**: GitHub Pages (with remote theme support)
- **Template Engine**: Liquid templating
- **Styling**: SCSS with print-optimized CSS
- **Content Management**: YAML-based data files
- **Markdown Processor**: Kramdown 2.4
- **CI/CD**: GitHub Actions with automated testing and releases
- **Ruby Version**: 3.2.x (required for Bundler 2.7.0 compatibility)

### File Structure Constraints
```
harvard-style-cv-theme/
├── _config.yml              # Site configuration and metadata
├── _data/
│   └── cv.yml              # CV content structure (REQUIRED)
├── _layouts/
│   ├── cv.html             # Main CV layout template
│   └── default.html        # Base layout: <head>, SEO tag, optional analytics
├── assets/
│   ├── css/
│   │   └── main.scss       # Stylesheet with print media queries
│   └── screenshot-*.png    # README screenshots
├── .github/
│   ├── scripts/
│   │   ├── next-version.sh      # Semver bump from Conventional Commits
│   │   └── test-next-version.sh # Its tests, run in CI
│   ├── workflows/
│   │   ├── ci.yml          # Continuous Integration workflow
│   │   ├── release.yml     # Automated release workflow
│   │   └── pages.yml       # GitHub Pages deployment
│   ├── branch-protection.md # Recommended branch protection settings
│   └── pages-setup.md      # One-time GitHub Pages setup guide
├── index.md                # Entry point (REQUIRED for remote theme)
├── 404.html                # Not-found page (default layout)
├── about.markdown          # Placeholder About page
├── Gemfile                 # Ruby dependencies
├── CHANGELOG.md            # Keep a Changelog, maintained by hand
├── VERSION                 # Not updated by the release workflow; tags are the source of truth
└── README.md               # User-facing documentation
```

### Critical Dependencies
- **jekyll-seo-tag**: SEO optimization
- **github-pages**: GitHub Pages compatibility

## 📋 Technical Constraints

### 1. GitHub Pages Compatibility
- **NO unsupported plugins**: Only use plugins included in `github-pages` gem
- **Remote theme support**: Must work with `remote_theme: smirnoffmg/harvard-style-cv-theme`
- **Public repository requirement**: Theme repo must be public for GitHub Pages access
- **No custom build steps**: The demo site is built by `pages.yml` with a plain `bundle exec jekyll build`; anything beyond that would break users relying on GitHub Pages' own build of the remote theme

### 2. Layout Structure Requirements
- **Header**: Centered name, contact info, social links, department/affiliation
- **Sections**: All-caps bold titles with horizontal rules
- **Entries**: Left-aligned institution/title, right-aligned date/location
- **Bullets**: Standard unordered lists for achievements/details, each rendered through `markdownify`
- **Social links**: SVG icons on screen (`.cv-socials`), full text URLs in print (`.cv-socials-print`)
- **Responsive**: Breakpoints at 800px and 500px, plus a print media query

### 3. Data Schema Constraints
```yaml
# _config.yml required fields
title: "Full Name"                    # Large, bold, centered
email: "email@domain.com"            # Clickable mailto: link
department: "Dept, University, City" # Primary affiliation
# Optional: phone, address, website, affiliation,
#           linkedin, github, twitter, telegram, leetcode,
#           google_analytics, yandex_metrika

# _data/cv.yml structure
sections:
  - title: "Section Name"            # All-caps in display
    entries:
      - title: "Institution/Title"   # Bold, left-aligned
        sub: "Degree/Role"           # Italic, optional
        location: "City, Country"    # Right-aligned, optional
        dates: "Year/Range"          # Right-aligned, optional
        bullets:                     # Array of Markdown strings
          - "Achievement or detail"
```

### 4. Styling Constraints
- **Typography**: Times New Roman (serif) for academic appearance
- **Colors**: Black text on white background for print compatibility
- **Spacing**: 1-inch margins on screen (0.5in in print), 1.3 line height
- **Line length**: Body capped at `max-width: 44rem` (~85–90 characters per line). Do not raise it much: Bringhurst puts the limit for discontinuous text such as bibliographies at 85–90 characters (*The Elements of Typographic Style*, §2.1.2)
- **Print optimization**: Separate print media queries
- **Social icons**: SVG-based with fallback text for print

### 5. Content Guidelines
- **Markdown in bullets**: Bullets pass through `markdownify` with the wrapping `<p>` stripped, so links, bold and italics work; inline HTML still works via Kramdown
- **Social handles**: Username only (not full URLs)
- **Contact links**: Email (`mailto:`), phone (`tel:`) and website rendered as clickable links
- **External links**: Links opening in a new tab carry `target="_blank" rel="noopener"`
- **Print-friendly**: Social links hidden in print, replaced with text URLs

### 6. Analytics (opt-in)
- **Google Analytics** (`google_analytics`) and **Yandex.Metrika** (`yandex_metrika`) are rendered in `default.html` only when their ID is set; with neither set the page ships no JavaScript
- **Metrika goals**: Contact and social links carry `data-ym-goal="<name>_click"`; a small inline script sends `reachGoal` on click. Keep the attribute on any new contact link
- **Metrika options**: Webvisor, clickmap and link tracking are enabled; document this in the README if it changes, since it affects visitors' privacy

## 🔄 Git Workflow & Branch Strategy

### 1. Branch Structure
- **`main`**: Production-ready code, automatically deployed to GitHub Pages
- **`develop`**: Active development branch, integration point for features
- **`feature/*`**: Feature branches for new development (optional)

### 2. Development Process
1. **Active development** happens in `develop` branch
2. **Feature development** can use `feature/*` branches from `develop`
3. **Merge requests** (MR) created from `develop` to `main`
4. **Automated releases** triggered on successful merge to `main`

### 3. Version Management
- **Semantic versioning**: Follow semver (MAJOR.MINOR.PATCH)
- **Automatic versioning**: `release.yml` derives the bump from commit message prefixes, so use Conventional Commits
- **Release notes**: GitHub generates them per release; `CHANGELOG.md` remains the curated record
- **Tagging**: Automatic `vX.Y.Z` git tags for each release

## 🚀 CI/CD Pipeline

### 1. Continuous Integration (`ci.yml`)
- **Trigger**: Push and pull request to `develop` and `main`
- **YAML check**: `_config.yml` and `_data/cv.yml` must parse
- **Build testing**: `bundle exec jekyll build` must succeed
- **Output check**: `_site/index.html` and `_site/assets/css/main.css` must exist (file presence only, no HTML validation)
- **Artifact generation**: `_site/` uploaded as `jekyll-build`, kept 7 days
- **Remote theme smoke test**: Builds with `remote_theme`, but never fails the job (`|| true`) — treat it as informational

### 2. Automated Release Process (`release.yml`)
- **Trigger**: Push to `main`, skipped when the head commit message contains `ci skip` or `skip ci`
- **Version bump**: `.github/scripts/next-version.sh` reads non-merge commits since the last tag (tested by `test-next-version.sh` in CI):
  - `type!:`, `type(scope)!:` or a `BREAKING CHANGE:` footer → major
  - `feat:` / `feat(scope):` → minor
  - `fix:`, `perf:` or a non-conventional subject → patch
  - only `docs`, `ci`, `chore`, `style`, `test`, `build`, `refactor` → no release
  - no tags yet → `1.0.0`
- **Release creation**: `gh release create` with `--generate-notes` (GitHub's auto-generated notes since the previous tag)
- **Asset upload**: Built site as `harvard-cv-theme-vX.Y.Z.zip`
- **Tag creation**: The release creates the `vX.Y.Z` tag

### 3. GitHub Pages Deployment (`pages.yml`)
- **Trigger**: Push to `main`, or manual `workflow_dispatch`
- **Build**: `bundle exec jekyll build` with `JEKYLL_ENV=production` in Actions, deployed via `actions/deploy-pages`
- **Pages source**: Must be set to "GitHub Actions" (see `.github/pages-setup.md`)
- **Deployment**: Available at `https://smirnoffmg.github.io/harvard-style-cv-theme`

## 🔧 Development Rules

### 1. Configuration Management
- **Never hardcode personal data** in templates
- **Use site variables** for all configurable content
- **Maintain backward compatibility** with existing `_config.yml` fields
- **Validate YAML syntax** before deployment

### 2. Template Development
- **Liquid templating only**: No JavaScript or dynamic content, except the opt-in analytics snippets (see Analytics)
- **Conditional rendering**: Handle missing optional fields gracefully
- **Accessibility**: Maintain semantic HTML structure
- **SEO optimization**: Use jekyll-seo-tag plugin

### 3. Styling Guidelines
- **Mobile-first**: Responsive design starting from mobile breakpoints
- **Print optimization**: Separate print stylesheets
- **Cross-browser compatibility**: Test on major browsers
- **Performance**: Minimize CSS file size

### 4. Content Structure
- **Modular sections**: Each CV section is independently configurable
- **Flexible entries**: Support various entry types (education, experience, skills, etc.)
- **Extensible**: Easy to add new section types
- **Validation**: Ensure required fields are present

### 5. CI/CD Guidelines
- **Test locally first**: Always test changes locally before pushing
- **Meaningful commits**: Use conventional commit messages
- **PR descriptions**: Provide clear descriptions for merge requests
- **Version compatibility**: Ensure changes don't break existing functionality

## 🚫 Forbidden Practices

### 1. Technology Restrictions
- **No JavaScript frameworks**: Pure HTML/CSS/SCSS; the only scripts allowed are the opt-in analytics snippets
- **No database dependencies**: Static site generation only
- **No external APIs**: Self-contained functionality; the analytics endpoints (googletagmanager.com, mc.yandex.ru) are the sole exception and load only when configured
- **No build tools**: No Webpack, Gulp, or similar

### 2. Content Restrictions
- **No dynamic content**: All content must be pre-rendered
- **No user input**: No forms or interactive elements
- **No external dependencies**: No CDN resources or external fonts; fonts come from the system stack
- **No complex animations**: Simple CSS transitions only

### 3. Deployment Restrictions
- **No custom domains**: GitHub Pages subdomain only
- **No server-side processing**: Static file serving only
- **No environment variables**: Configuration through YAML files only

### 4. Git Workflow Restrictions
- **No direct pushes to main**: All changes must go through develop branch
- **No force pushes**: Maintain git history integrity
- **No breaking changes without major version bump**: Follow semver strictly

## 🔄 Maintenance Guidelines

### 1. Version Control
- **Semantic versioning**: Follow semver for releases
- **Feature branches**: Develop new features in separate branches
- **Pull request reviews**: All changes require review
- **Changelog maintenance**: Document all changes

### 2. Testing Requirements
- **Local testing**: Test with `bundle exec jekyll serve`
- **CI testing**: Automated testing on every push
- **GitHub Pages testing**: Verify remote theme functionality
- **Cross-device testing**: Test on desktop, tablet, mobile
- **Print testing**: Verify PDF generation and print layout

### 3. Documentation Standards
- **Code comments**: Document complex Liquid logic
- **Configuration examples**: Provide clear examples in README
- **Troubleshooting guides**: Document common issues and solutions
- **Migration guides**: Help users upgrade between versions
- **Release notes**: Document all changes in releases

## 🎯 Success Criteria

### 1. Functionality
- ✅ Renders correctly on GitHub Pages
- ✅ Works with remote theme deployment
- ✅ Responsive design on all devices
- ✅ Print-friendly output
- ✅ SEO optimized

### 2. Usability
- ✅ Easy configuration via YAML files
- ✅ Clear documentation
- ✅ Minimal setup requirements
- ✅ Fast loading times

### 3. Maintainability
- ✅ Clean, readable code
- ✅ Modular structure
- ✅ Comprehensive documentation
- ✅ Backward compatibility

### 4. CI/CD
- ✅ Automated testing on every push
- ✅ Automated releases with semantic versioning
- ✅ Automated deployment to GitHub Pages
- ✅ Proper branch protection and workflow

## 🤝 AI Agent Collaboration Rules

### 1. Code Changes
- **Always test locally** before proposing changes
- **Maintain existing structure** unless explicitly requested
- **Document complex changes** with inline comments
- **Follow established patterns** for consistency
- **Use conventional commit messages** for better automation

### 2. Content Updates
- **Preserve data schema** compatibility
- **Update examples** when changing structure
- **Maintain backward compatibility** for existing users
- **Validate YAML syntax** in all changes

### 3. Documentation
- **Keep technical details** in this constitution
- **User-facing docs** should focus on usage
- **Provide clear examples** for all features
- **Update troubleshooting** sections as needed

### 4. Quality Assurance
- **Test all changes** in multiple environments
- **Verify GitHub Pages compatibility**
- **Check print layout** for all modifications
- **Validate responsive design** across devices
- **Ensure CI/CD pipeline passes** before merging

### 5. Release Management
- **Follow semantic versioning** strictly
- **Update changelog** with meaningful descriptions
- **Test release artifacts** before publishing
- **Verify GitHub Pages deployment** after release

---

**Last Updated**: October 2026
**Version**: 2.1
**Maintainer**: Maksim Smirnov