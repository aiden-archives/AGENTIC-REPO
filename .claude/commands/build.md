# Build All Services

Build Docker images for all services.

## Steps
1. Run `make build` to build all images
2. Report build status for each service
3. Show image sizes

## Options
- Build specific service: `make build SVC=api`
- Build for production: `make build-prod`
