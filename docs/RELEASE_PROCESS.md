# Release Process

## Overview

We use [Semantic Versioning](https://semver.org/): `MAJOR.MINOR.PATCH`

- **MAJOR**: Breaking changes (users must change their code)
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

---

## Release checklist

### Before release

- [ ] All PRs for this release are merged to `main`
- [ ] CI passes on `main`
- [ ] CHANGELOG.md is updated
- [ ] No critical bugs in the backlog
- [ ] Manual smoke test passes
- [ ] Team is aware (no one mid-deploy on something else)

### During release

- [ ] Create release tag: `git tag v1.2.3`
- [ ] Push tag: `git push origin v1.2.3`
- [ ] CI builds and deploys (automated)
- [ ] Create GitHub Release with notes

### After release

- [ ] Verify deployment succeeded
- [ ] Smoke test production
- [ ] Announce release (if applicable)
- [ ] Close milestone (if using milestones)

---

## Creating a release

### 1. Update CHANGELOG

Add a new section at the top of `CHANGELOG.md`:

```markdown
## [1.2.3] - 2024-01-15

### Added
- New feature X (#123)

### Changed
- Improved performance of Y (#124)

### Fixed
- Bug where Z happened (#125)

### Removed
- Deprecated API endpoint (#126)
```

### 2. Commit the changelog

```bash
git add CHANGELOG.md
git commit -m "chore: prepare release v1.2.3"
git push origin main
```

### 3. Create and push the tag

```bash
git tag -a v1.2.3 -m "Release v1.2.3"
git push origin v1.2.3
```

### 4. Create GitHub Release

1. Go to Releases → Draft a new release
2. Choose the tag you just created
3. Title: `v1.2.3`
4. Copy the changelog section into the description
5. Publish release

---

## Hotfix releases

For urgent production fixes:

```bash
# Start from the release tag that's in production
git checkout v1.2.3
git checkout -b hotfix/critical-fix

# Make the fix
git commit -m "fix: critical issue"

# Tag the hotfix
git tag -a v1.2.4 -m "Hotfix: critical issue"
git push origin v1.2.4

# Merge back to main
git checkout main
git merge hotfix/critical-fix
git push origin main
```

---

## Version bump guidelines

| Change | Example | Bump |
|--------|---------|------|
| Breaking API change | Remove endpoint, change response format | MAJOR |
| New feature | Add endpoint, new UI section | MINOR |
| Bug fix | Fix calculation error | PATCH |
| Docs only | Update README | PATCH (or skip) |
| Dependency update (non-breaking) | Bump lodash | PATCH |
| Dependency update (breaking) | Major version of core dep | Depends on impact |

---

## Rollback procedure

If a release has critical issues:

### Option 1: Hotfix forward (preferred)

Fix the issue and release a patch version.

### Option 2: Revert and redeploy

```bash
# Revert the problematic commits
git revert <commit-hash>
git push origin main

# Tag a new patch release
git tag -a v1.2.4 -m "Revert problematic changes"
git push origin v1.2.4
```

### Option 3: Redeploy previous version

```bash
# Deploy the previous known-good tag
# (depends on your deployment setup)
./deploy.sh v1.2.2
```

---

## Automated releases (optional)

If using CI for releases, the workflow typically:

1. Triggers on tag push (`v*`)
2. Runs tests
3. Builds artifacts
4. Deploys to production
5. Creates GitHub Release

See `.github/workflows/release.yml` for configuration.
