# Project: [PROJECT-NAME]

## Overview
[Brief description of what this project does]

## Tech Stack
- **Runtime**: Docker + Docker Compose
- **Backend**: [e.g., Go, Python, Node.js]
- **Frontend**: [e.g., React, Vue, Svelte]
- **Database**: [e.g., PostgreSQL, SQLite, Redis]
- **Deployment**: Coolify (self-hosted) or local Docker

## Directory Structure
```
/
├── docker-compose.yml      # Local development stack
├── docker-compose.prod.yml # Production overrides
├── services/               # Backend services
│   └── [service-name]/
│       ├── Dockerfile
│       ├── CLAUDE.md       # Service-specific context
│       └── ...
├── web/                    # Frontend application
│   ├── Dockerfile
│   └── ...
├── .claude/
│   ├── skills/             # Claude skill definitions
│   └── commands/           # Slash commands
├── Makefile                # Build and run commands
└── STATUS.md               # Progress tracker
```

## Quick Start
```bash
# Start all services
make up

# View logs
make logs

# Stop everything
make down

# Rebuild and restart
make rebuild
```

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

## Conventions
- All services are containerized with their own Dockerfile
- Use conventional commits (feat:, fix:, docs:, etc.)
- Every service has its own CLAUDE.md with service-specific context
- Update STATUS.md after completing significant work
- Environment variables go in .env (not committed)

## Environment Setup
1. Copy `.env.example` to `.env`
2. Run `make up` to start all services
3. Access the app at http://localhost:3000

## Deployment (Coolify)
This project is configured for Coolify deployment:
- Each service has a Dockerfile ready for Coolify
- Use docker-compose.prod.yml for production settings
- Configure environment variables in Coolify dashboard

## Session Guidelines
1. Read STATUS.md first to understand current state
2. Work on one focused task per session
3. Commit frequently with clear messages
4. Update STATUS.md before ending session
5. Test changes with `make test` before committing
