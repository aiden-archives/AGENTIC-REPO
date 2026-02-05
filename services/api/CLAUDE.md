# Service: api

## Purpose
REST API for [describe purpose]. Handles business logic and data persistence.

## Tech Stack
- Language: [Go 1.22+ / Python 3.12+ / Node 20+]
- Framework: [Chi / FastAPI / Express]
- Database: PostgreSQL via Docker
- Cache: Redis via Docker

## Directory Structure
```
api/
├── cmd/
│   └── server/          # Main entry point
├── internal/
│   ├── handlers/        # HTTP handlers
│   ├── services/        # Business logic
│   ├── repository/      # Data access
│   └── config/          # Configuration
├── migrations/          # SQL migrations
├── Dockerfile
├── Makefile
└── CLAUDE.md
```

## Local Development
```bash
# From project root
make up              # Start all services
make logs-svc SVC=api  # View API logs
make shell SVC=api   # Shell into container

# Inside container
make run             # Run with hot reload
make test            # Run tests
make lint            # Run linter
```

## API Endpoints
| Method | Path | Description |
|--------|------|-------------|
| GET | /health | Health check |
| GET | /api/v1/items | List items |
| POST | /api/v1/items | Create item |
| GET | /api/v1/items/:id | Get item |
| PUT | /api/v1/items/:id | Update item |
| DELETE | /api/v1/items/:id | Delete item |

## Environment Variables
| Name | Description | Default |
|------|-------------|---------|
| PORT | Server port | 8080 |
| ENV | Environment | development |
| DATABASE_URL | PostgreSQL connection | (required) |
| REDIS_URL | Redis connection | (optional) |
| LOG_LEVEL | Logging level | info |

## Testing
```bash
# Unit tests
make test

# With coverage
make test-coverage

# Integration tests (requires running DB)
make test-integration
```

## Database Migrations
```bash
# Create new migration
make migrate-new NAME=add_users_table

# Run migrations
make migrate-up

# Rollback
make migrate-down
```
