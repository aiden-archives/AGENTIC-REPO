# Branching Strategy

## Overview

We use a simplified trunk-based development approach with short-lived feature branches.

```
main ─────●─────●─────●─────●─────●─────●─────
           \   /       \       /
            ●─●         ●─────●
         feature-a    feature-b
```

---

## Branches

| Branch | Purpose | Lifespan |
|--------|---------|----------|
| `main` | Production-ready code. Always deployable. | Permanent |
| `feature/*` | New features | Days (not weeks) |
| `fix/*` | Bug fixes | Hours to days |
| `hotfix/*` | Urgent production fixes | Hours |
| `docs/*` | Documentation changes | Hours to days |
| `refactor/*` | Code restructuring (no behavior change) | Days |

---

## Branch naming

```
<type>/<issue-number>-<short-description>
```

**Examples:**
```
feature/123-user-authentication
fix/456-cart-total-calculation
hotfix/789-payment-crash
docs/101-api-examples
refactor/202-extract-validation
```

**Rules:**
- Lowercase only
- Hyphens, not underscores
- Keep it short but descriptive
- Include issue number when applicable

---

## Workflow

### Starting work

```bash
# Always start from latest main
git checkout main
git pull origin main

# Create your branch
git checkout -b feature/123-new-widget
```

### While working

```bash
# Commit frequently with clear messages
git add .
git commit -m "feat(widget): add basic structure"

# Keep up with main (rebase preferred)
git fetch origin
git rebase origin/main
```

### Opening a PR

```bash
# Push your branch
git push origin feature/123-new-widget

# Open PR via GitHub UI
# Fill out the template completely
```

### After merge

```bash
# Clean up your local branch
git checkout main
git pull origin main
git branch -d feature/123-new-widget
```

---

## Rules

1. **Never commit directly to `main`** — always use PRs
2. **Keep branches short-lived** — merge within days, not weeks
3. **One branch = one logical change** — don't bundle unrelated work
4. **Rebase before merge** — keep history clean
5. **Delete branches after merge** — don't let them pile up

---

## Merge strategy

- **Squash and merge** for feature branches (clean history)
- **Merge commit** for release branches (preserve history)
- **Rebase** to keep branches up to date (before opening PR)

---

## Hotfix process

For critical production issues:

```bash
git checkout main
git pull origin main
git checkout -b hotfix/789-critical-fix

# Make minimal fix
# Test thoroughly
# Push and open PR with "priority: critical" label

# After merge, verify in production immediately
```

---

## FAQ

**Q: My branch is behind main and has conflicts.**
A: Rebase onto main: `git rebase origin/main`. Resolve conflicts, then force push: `git push --force-with-lease`.

**Q: Should I create a branch for a one-line docs fix?**
A: Yes. PRs are cheap. Surprises in main are expensive.

**Q: How long is too long for a branch?**
A: If it's been more than a week, break it into smaller pieces or merge what's ready.
