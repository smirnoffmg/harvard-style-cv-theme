# Harvard-Style CV Theme - AI Agent Constitution

## 🎯 Project Purpose
This constitution defines the technical constraints, architecture decisions, and collaboration guidelines for AI agents working on the Harvard-Style CV Jekyll Template. This document ensures consistent development practices and maintains the project's integrity.

## 🏗️ Technical Architecture

### Core Technology Stack
- **Static Site Generator**: Jekyll 4.x
- **Hosting Platform**: GitHub Pages (with remote theme support)
- **Template Engine**: Liquid templating
- **Styling**: SCSS with print-optimized CSS
- **Content Management**: YAML-based data files
- **Markdown Processor**: Kramdown
- **CI/CD**: GitHub Actions with automated testing and releases

### File Structure Constraints
```
harvard-style-cv-theme/
├── _config.yml              # Site configuration and metadata
├── _data/
│   └── cv.yml              # CV content structure (REQUIRED)
├── _layouts/
│   ├── cv.html             # Main CV layout template
│   └── default.html        # Base layout (inherited from Jekyll)
├── assets/
│   └── css/
│       └── main.scss       # Stylesheet with print media queries
├── .github/
│   └── workflows/
│       ├── ci.yml          # Continuous Integration workflow
│       ├── release.yml     # Automated release workflow
│       └── pages.yml       # GitHub Pages deployment
├── index.md                # Entry point (REQUIRED for remote theme)
├── Gemfile                 # Ruby dependencies
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
- **No custom build processes**: Rely on GitHub Pages automatic builds

### 2. Layout Structure Requirements
- **Header**: Centered name, contact info, social links, department/affiliation
- **Sections**: All-caps bold titles with horizontal rules
- **Entries**: Left-aligned institution/title, right-aligned date/location
- **Bullets**: Standard unordered lists for achievements/details
- **Responsive**: Mobile-first design with print optimization

### 3. Data Schema Constraints
```yaml
# _config.yml required fields
title: "Full Name"                    # Large, bold, centered
email: "email@domain.com"            # Clickable mailto: link
department: "Dept, University, City" # Primary affiliation
# Optional: phone, address, website, affiliation, social handles

# _data/cv.yml structure
sections:
  - title: "Section Name"            # All-caps in display
    entries:
      - title: "Institution/Title"   # Bold, left-aligned
        sub: "Degree/Role"           # Italic, optional
        location: "City, Country"    # Right-aligned, optional
        dates: "Year/Range"          # Right-aligned, optional
        bullets:                     # Array of strings
          - "Achievement or detail"
```

### 4. Styling Constraints
- **Typography**: Times New Roman (serif) for academic appearance
- **Colors**: Black text on white background for print compatibility
- **Spacing**: 1-inch margins, 1.3 line height
- **Print optimization**: Separate print media queries
- **Social icons**: SVG-based with fallback text for print

### 5. Content Guidelines
- **HTML in bullets**: Allowed for formatting (bold, italics, links)
- **Social handles**: Username only (not full URLs)
- **Contact links**: Email and website rendered as clickable links
- **Print-friendly**: Social links hidden in print, replaced with text URLs

## 🔄 Git Workflow & Branch Strategy

### 1. Branch Structure
- **`master`**: Production-ready code, automatically deployed to GitHub Pages
- **`develop`**: Active development branch, integration point for features
- **`feature/*`**: Feature branches for new development (optional)

### 2. Development Process
1. **Active development** happens in `develop` branch
2. **Feature development** can use `feature/*` branches from `develop`
3. **Merge requests** (MR) created from `develop` to `master`
4. **Automated releases** triggered on successful merge to `master`

### 3. Version Management
- **Semantic versioning**: Follow semver (MAJOR.MINOR.PATCH)
- **Automatic versioning**: GitHub Actions automatically increments version
- **Release notes**: Generated from commit messages and PR descriptions
- **Tagging**: Automatic git tags for each release

## 🚀 CI/CD Pipeline

### 1. Continuous Integration (CI)
- **Trigger**: On every push to `develop` and `master`
- **Build testing**: Verify Jekyll builds successfully
- **Lint checking**: Validate YAML syntax and HTML structure
- **Dependency checking**: Ensure all dependencies are compatible
- **Artifact generation**: Build and store site artifacts

### 2. Automated Release Process
- **Trigger**: On merge to `master` branch
- **Version bump**: Automatically increment semantic version
- **Release creation**: Generate GitHub release with changelog
- **Asset upload**: Include built site as release asset
- **Tag creation**: Create git tag for the release

### 3. GitHub Pages Deployment
- **Source**: `master` branch
- **Build**: Automatic Jekyll build by GitHub Pages
- **Deployment**: Available at `https://smirnoffmg.github.io/harvard-style-cv-theme`

## 🔧 Development Rules

### 1. Configuration Management
- **Never hardcode personal data** in templates
- **Use site variables** for all configurable content
- **Maintain backward compatibility** with existing `_config.yml` fields
- **Validate YAML syntax** before deployment

### 2. Template Development
- **Liquid templating only**: No JavaScript or dynamic content
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
- **No JavaScript frameworks**: Pure HTML/CSS/SCSS only
- **No database dependencies**: Static site generation only
- **No external APIs**: Self-contained functionality
- **No build tools**: No Webpack, Gulp, or similar

### 2. Content Restrictions
- **No dynamic content**: All content must be pre-rendered
- **No user input**: No forms or interactive elements
- **No external dependencies**: No CDN resources or external fonts
- **No complex animations**: Simple CSS transitions only

### 3. Deployment Restrictions
- **No custom domains**: GitHub Pages subdomain only
- **No server-side processing**: Static file serving only
- **No environment variables**: Configuration through YAML files only

### 4. Git Workflow Restrictions
- **No direct pushes to master**: All changes must go through develop branch
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

**Last Updated**: December 2024
**Version**: 2.0
**Maintainer**: Maksim Smirnov