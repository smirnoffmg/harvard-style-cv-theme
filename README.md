# Harvard‑Style CV Jekyll Template for GitHub Pages 🎓

## 🖼️ Screenshots

### Desktop

![Desktop screenshot of the Harvard-style CV theme](assets/screenshot-desktop.png)

### Mobile

![Mobile screenshot of the Harvard-style CV theme](assets/screenshot-mobile.png)

*If you don't see images above, add your own screenshots to the `assets/` folder!*

---


## 🚀 Remote Theme Usage
You can use this template **without forking** by adding the following to your Jekyll site’s `_config.yml`:

```yaml
remote_theme: smirnoffmg/harvard-style-cv-theme
```

- Then add your own `_config.yml` and `_data/cv.yml` as described below.
- [GitHub Pages supports `remote_theme` by default.](https://github.com/benbalter/jekyll-remote-theme)

---

## ✨ Features
- **Classic Harvard layout**: bold centered name, centered contact info, department/affiliation line
- **Section headings**: all-caps, bold, with horizontal rules
- **Entry layout**: left-aligned institution/title, right-aligned date/location, bullet-point lists
- **Modular data**: manage all CV content via `_data/cv.yml`
- **GitHub Pages‑ready**: no unsupported plugins, works out of the box
- **Print/PDF friendly**: styled for crisp print/PDF results
- **Responsive**: looks great on all screens

---

## 🏗️ Using by Forking (Alternative)
1. **Fork this repository** to your own GitHub account.
2. **Edit your CV content:**
   - Update `_config.yml` with your name, contact info, etc.
   - Edit `_data/cv.yml` to add your education, experience, skills, etc.
3. **Enable GitHub Pages** in your repo settings (set source to `main` branch, `/ (root)` folder).
4. Visit `https://yourusername.github.io/your-repo-name` to see your CV!

---

## 📝 Configuration Guide

### `_config.yml` fields
```yaml
title: "Your Name"
email: "your@email.com"
phone: "(123) 456-7890"
address: "123 Main St, City, Country"
website: "https://yourwebsite.com"
department: "Your Department, University, City, Country"
affiliation: "Optional: Additional affiliation or department"
linkedin: yourlinkedinusername   # Just the username, e.g. johndoe
github: yourgithubusername       # Just the username, e.g. johndoe
twitter: yourtwitterhandle      # Just the handle, e.g. johndoe
# Optional Google Analytics (UA- or G- ID, or leave blank)
google_analytics: G-XXXXXXXXXX
description: "Harvard‑style CV • Example"
```

### `_data/cv.yml` structure
```yaml
sections:
  - title: Education
    entries:
      - title: "University Name"
        sub: "Degree, Major"
        location: "City, Country"
        dates: "Year or Date Range"
        bullets:
          - "Key achievement or detail."
          - "Another bullet point."
  - title: Experience
    entries:
      - title: "Job Title · Employer"
        location: "City, Country"
        dates: "Year or Date Range"
        bullets:
          - "What you did, impact, etc."
          - "Another accomplishment."
  - title: Skills
    entries:
      - title: "Programming Languages"
        bullets:
          - "Python, JavaScript, Ruby, C++"
      - title: "Frameworks & Tools"
        bullets:
          - "Jekyll, React, Node.js, Git, Docker"
  - title: Publications
    entries:
      - title: "Article Title"
        sub: "Journal Name, Year"
        bullets:
          - "Short description or highlight of the publication."
      - title: "Conference Paper Title"
        sub: "Conference Name, Year"
        bullets:
          - "Summary of the paper or your contribution."
  - title: Projects
    entries:
      - title: "Open Source Project Name"
        sub: "Role (e.g., Maintainer)"
        location: "GitHub"
        dates: "2022-Present"
        bullets:
          - "Brief description of the project."
          - "Key features or your contributions."
      - title: "Personal Website"
        sub: "Designer & Developer"
        location: "yourwebsite.com"
        dates: "2021-Present"
        bullets:
          - "Built with Jekyll and custom CSS."
          - "Showcases portfolio and blog."
```
- You can use **HTML** in bullets for bold, italics, or links.

---

## 🎨 Customization
- Edit `assets/css/main.scss` to change fonts, colors, or spacing.
- Layout is in `_layouts/cv.html`.
- You can customize the About page by editing `about.markdown`.

---

## 📊 Google Analytics (Optional)
To enable Google Analytics, add your tracking ID to `_config.yml`:
```yaml
google_analytics: G-XXXXXXXXXX  # or UA-XXXXXXXXX-X
```
If left blank or omitted, analytics will not be included.

---

## 📄 License
MIT — free to use, modify, and share.

---

## 🛠️ Troubleshooting: Blank or Empty Page with Remote Theme

If you use this theme as a `remote_theme` and see a blank or empty page (no HTML output), check the following:

1. **Add an `index.md` file**
   - Your test repo must have an `index.md` (or `index.html`) file with at least:
     ```markdown
     ---
     layout: cv
     title: CV
     ---
     ```
2. **Check `_config.yml`**
   - It should contain:
     ```yaml
     remote_theme: smirnoffmg/harvard-style-cv-theme
     ```
   - Do **not** include a `theme:` line.
3. **Provide `_data/cv.yml`**
   - Make sure your repo has a valid `_data/cv.yml` file with at least one section and entry.
4. **Ensure valid front matter**
   - All content files (like `index.md`) must start with `---` (YAML front matter).
5. **Theme repository is public**
   - The theme repo must be public for GitHub Pages to access it.
6. **No custom plugins**
   - Only use plugins supported by GitHub Pages.
7. **Check GitHub Pages build logs**
   - If the page is still blank, check the Pages build log (Actions tab or Pages status) for errors.
8. **Wait for propagation**
   - Sometimes, changes take a few minutes to appear.

### Minimal Test Repo Structure

```
_config.yml
_data/
  cv.yml
index.md
```

If you still see a blank page, double-check the above and consult the [GitHub Pages documentation](https://docs.github.com/en/pages/troubleshooting-github-pages-sites) for more help.

