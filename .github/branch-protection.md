# Branch Protection Configuration

This document outlines the recommended branch protection settings for this repository.

## Required Settings

### Master Branch Protection
- **Require a pull request before merging**: ✅ Enabled
- **Require approvals**: 1 approval required
- **Dismiss stale PR approvals when new commits are pushed**: ✅ Enabled
- **Require status checks to pass before merging**: ✅ Enabled
  - Required status checks: `test` (from CI workflow)
- **Require branches to be up to date before merging**: ✅ Enabled
- **Restrict pushes that create files**: ✅ Enabled
- **Require linear history**: ✅ Enabled
- **Include administrators**: ✅ Enabled

### Develop Branch Protection
- **Require a pull request before merging**: ✅ Enabled
- **Require approvals**: 1 approval required
- **Dismiss stale PR approvals when new commits are pushed**: ✅ Enabled
- **Require status checks to pass before merging**: ✅ Enabled
  - Required status checks: `test` (from CI workflow)
- **Require branches to be up to date before merging**: ✅ Enabled
- **Restrict pushes that create files**: ✅ Enabled
- **Include administrators**: ✅ Enabled

## Workflow Rules

### Development Process
1. **Feature development**: Create feature branches from `develop`
2. **Integration**: Merge feature branches to `develop` via PR
3. **Release preparation**: Create PR from `develop` to `master`
4. **Automated release**: Merging to `master` triggers automated release

### Commit Message Convention
Use conventional commit messages for better automation:
- `feat:` for new features (triggers minor version bump)
- `fix:` for bug fixes (triggers patch version bump)
- `BREAKING CHANGE:` for breaking changes (triggers major version bump)
- `docs:` for documentation changes
- `style:` for formatting changes
- `refactor:` for code refactoring
- `test:` for adding tests
- `chore:` for maintenance tasks

## Setup Instructions

1. Go to repository Settings > Branches
2. Add rule for `master` branch with above settings
3. Add rule for `develop` branch with above settings
4. Ensure GitHub Actions have proper permissions
5. Configure required status checks for both branches

## Benefits

- **Code quality**: Ensures all code is reviewed
- **Automated testing**: Prevents merging broken code
- **Release safety**: Protects production branch
- **Workflow consistency**: Enforces proper development process
- **Automated versioning**: Semantic versioning based on commit messages 