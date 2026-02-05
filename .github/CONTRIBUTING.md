# Contributing

## How to contribute

1. **Check existing issues** before creating a new one
2. **Use templates** — they exist to help you provide what we need
3. **One issue = one thing** — don't bundle unrelated bugs or features
4. **PRs should reference an issue** — except for tiny fixes

---

## Development workflow

### Setup

```bash
git clone <repo>
cd <repo>
npm install  # or your setup command
```

### Making changes

1. Create a branch from `main` (see [Branching](./docs/BRANCHING.md))
2. Make your changes
3. Write/update tests
4. Run tests locally: `npm test`
5. Commit using conventional commits (see below)
6. Push and open a PR

### Running locally

```bash
npm run dev
```

---

## Commit messages

Use [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <description>

[optional body]
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Formatting (no code change)
- `refactor`: Code change that neither fixes a bug nor adds a feature
- `test`: Adding or updating tests
- `chore`: Maintenance (deps, build, etc.)

**Examples:**
```
feat(auth): add password reset flow
fix(cart): prevent negative quantities
docs: update API examples
```

---

## Code style

- Run linter before committing: `npm run lint`
- Format with Prettier: `npm run format`
- Follow existing patterns in the codebase
- When in doubt, ask

---

## Pull requests

- Fill out the PR template completely
- Keep PRs focused — one logical change per PR
- Respond to review feedback within 48 hours or let us know you need more time
- Squash commits before merge (or we'll do it)

---

## Questions?

Open a [Discussion](https://github.com/ORG/REPO/discussions) — issues are for actionable bugs and features.
