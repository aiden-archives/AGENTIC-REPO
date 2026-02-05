# Project Status

## Current Phase
**Template Complete** - Ready for use

## Last Updated
2025-01-31 - Template finalized

## Template Checklist

### Core Files
- [x] README.md - Project overview
- [x] CLAUDE.md - Claude context file
- [x] Makefile - Build and run commands
- [x] docker-compose.yml - Development stack
- [x] docker-compose.prod.yml - Production overrides
- [x] .env.example - Environment variables template
- [x] .gitignore - Git ignore patterns
- [x] .dockerignore - Docker build context filter
- [x] .editorconfig - Editor settings
- [x] .nvmrc - Node version pinning
- [x] LICENSE - MIT license

### GitHub Configuration
- [x] Issue templates (bug, feature, task)
- [x] Pull request template
- [x] Labels configuration
- [x] Contributing guidelines
- [x] CI workflow (lint, test, build)
- [x] Release workflow
- [x] Dependabot configuration

### Documentation
- [x] Branching strategy
- [x] Release process
- [x] Design system
- [x] Project prompts

### Services
- [x] API service scaffold (services/api/)
- [x] Web frontend scaffold (web/)
- [x] Database init script (scripts/init.sql)

### Claude Integration
- [x] .claude/commands/ - Slash commands
- [x] .claude/settings.json - Permissions

### Quality Tools
- [x] Pre-commit hooks configuration
- [x] ESLint + Prettier setup (web)

---

## How to Use This Template

### 1. Clone and Rename
```bash
# Clone the template
git clone <this-repo> my-project
cd my-project

# Remove git history and reinitialize
rm -rf .git
git init
```

### 2. Configure
1. Update `CLAUDE.md` - Replace placeholders with project info
2. Update `services/api/CLAUDE.md` - Add API-specific context
3. Update `web/CLAUDE.md` - Add frontend-specific context
4. Copy `.env.example` to `.env` and fill in values
5. Update `package.json` files with project name

### 3. Start Development
```bash
make up    # Start all services
make logs  # View logs
```

### 4. Customize
- Modify `scripts/init.sql` for your schema
- Add routes/handlers to `services/api/`
- Build your UI in `web/src/`

---

## Architecture Decisions

### ADR-001: Docker-First Development
**Decision**: All services run in Docker, even locally
**Rationale**: Ensures parity between dev and prod environments

### ADR-002: Single docker-compose.yml with Overrides
**Decision**: Use one compose file with prod overrides
**Rationale**: Simplifies local development while supporting production

### ADR-003: React + Vite Frontend
**Decision**: Use React with Vite as the default frontend
**Rationale**: Fast builds, great DX, widely supported

### ADR-004: Conventional Commits
**Decision**: Enforce conventional commit messages
**Rationale**: Enables automated changelog generation and semantic versioning
