# Harvard‑Style CV Jekyll Template for GitHub Pages 🎓

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
linkedin: "linkedin.com/in/yourprofile"
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
```
- You can use **HTML** in bullets for bold, italics, or links.

---

## 🖼️ Screenshot
> _Add a screenshot of your published CV here!_

---

## 🎨 Customization
- Edit `assets/css/main.scss` to change fonts, colors, or spacing.
- Layout is in `_layouts/cv.html`.

---

## 📄 License
MIT — free to use, modify, and share.

