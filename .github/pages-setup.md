# GitHub Pages Setup Guide

This guide helps you configure GitHub Pages to work with the automated CI/CD pipeline.

## 🔧 Manual Setup Required

### Step 1: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** tab
3. Scroll down to **Pages** section in the left sidebar
4. Under **Source**, select **GitHub Actions**
5. Click **Save**

### Step 2: Configure Repository Permissions

1. In **Settings** > **Actions** > **General**
2. Under **Workflow permissions**, select:
   - ✅ **Read and write permissions**
   - ✅ **Allow GitHub Actions to create and approve pull requests**
3. Click **Save**

### Step 3: Set Up Branch Protection (Optional but Recommended)

1. Go to **Settings** > **Branches**
2. Add rule for `main` branch:
   - ✅ **Require a pull request before merging**
   - ✅ **Require status checks to pass before merging**
   - ✅ **Require branches to be up to date before merging**
3. Add rule for `develop` branch with similar settings

## 🚀 Alternative: Use Traditional GitHub Pages

If you prefer to use traditional GitHub Pages (without Actions):

### Option A: Deploy from main branch
1. Go to **Settings** > **Pages**
2. Select **Deploy from a branch**
3. Choose **main** branch
4. Select **/(root)** folder
5. Click **Save**

### Option B: Deploy from gh-pages branch
1. Create a `gh-pages` branch
2. Build the site locally: `bundle exec jekyll build`
3. Copy `_site` contents to `gh-pages` branch
4. Configure Pages to deploy from `gh-pages` branch

## 🔍 Troubleshooting

### Common Issues:

1. **"Pages site not found"**
   - Ensure Pages is enabled in repository settings
   - Check that the repository is public (required for free accounts)

2. **"Permission denied"**
   - Verify workflow permissions are set to "Read and write"
   - Check that Pages is configured to use GitHub Actions

3. **"Build failed"**
   - Check the Actions tab for detailed error logs
   - Ensure all required files are present (`_config.yml`, `_data/cv.yml`, etc.)

### Manual Deployment Test:

If Actions deployment fails, you can test manually:

```bash
# Build locally
bundle install
bundle exec jekyll build

# Check if _site directory was created
ls -la _site/
```

## 📋 Verification Checklist

- [ ] GitHub Pages enabled in repository settings
- [ ] Source set to "GitHub Actions"
- [ ] Workflow permissions configured
- [ ] Repository is public (for free accounts)
- [ ] CI/CD pipeline passes all checks
- [ ] Release workflow creates releases successfully

## 🎯 Expected Results

After proper setup:
- ✅ **Automatic deployment** on every push to `main`
- ✅ **Live site** at `https://yourusername.github.io/harvard-style-cv-theme`
- ✅ **Release artifacts** uploaded to GitHub releases
- ✅ **Version tags** created automatically 