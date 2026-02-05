# QUICK-START

A complete template repository combining GitHub workflows and Claude Code development patterns.

## What's Included

```
/
├── .github/                    # GitHub configuration
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.yml      # Bug report template
│   │   ├── feature_request.yml # Feature request template
│   │   ├── task.yml            # Task template with definition of done
│   │   └── config.yml          # Issue config (disables blank issues)
│   ├── PULL_REQUEST_TEMPLATE.md
│   ├── CONTRIBUTING.md
│   └── labels.yml              # Consistent label set
│
├── docs/                       # Documentation
│   ├── BRANCHING.md            # Branch naming & workflow
│   ├── DESIGN_SYSTEM.md        # Visual design reference
│   ├── PROJECT_PROMPTS.md      # AI prompt templates
│   └── RELEASE_PROCESS.md      # Version & deploy guide
│
├── services/                   # Backend services
│   └── api/
│       ├── Dockerfile          # Multi-stage Docker build
│       └── CLAUDE.md           # Service-specific context
│
├── CLAUDE.md                   # Project context for Claude
├── CHANGELOG.md                # Keep a Changelog format
├── docker-compose.yml          # Local development stack
├── Makefile                    # Build and run commands
└── STATUS.md                   # Progress tracker
```

## Quick Start

1. **Use this template** to create a new repository
2. Update placeholders:
   - `[PROJECT-NAME]` in CLAUDE.md
   - `ORG/REPO` in `.github/ISSUE_TEMPLATE/config.yml` and `.github/CONTRIBUTING.md`
   - Adjust `docs/DESIGN_SYSTEM.md` colors for your brand
3. Copy `.env.example` to `.env` (create your own)
4. Run `make up` to start development

## Key Commands

```bash
make up          # Start development environment
make down        # Stop all containers
make build       # Build all images
make logs        # Tail all logs
make shell SVC=x # Shell into service x
make test        # Run all tests
make lint        # Run linters
```

## Sync GitHub Labels

```bash
npx github-label-sync --labels .github/labels.yml owner/repo
```

## Philosophy

- **Docker-first development** — All services containerized for dev/prod parity
- **Templates force clarity** — Issues and PRs require structured information
- **Claude-aware** — CLAUDE.md files provide context at every level
- **Status is observable** — STATUS.md tracks progress without meetings

## Customization

### For solo/small teams
- Simplify issue templates (fewer required fields)
- Skip the size labels in `.github/labels.yml`

### For enterprise/regulated
- Add required reviewers to PR template
- Add compliance checklist items
- Configure branch protection rules

## License

MIT