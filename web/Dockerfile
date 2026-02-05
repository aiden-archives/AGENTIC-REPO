# ===========================================
# Frontend Dockerfile (Multi-stage build)
# ===========================================
# Supports: React, Vue, Svelte, or any Vite-based app
# Stages: base → deps → development / builder → production

# -------------------------------------------
# Base stage: Common Node.js setup
# -------------------------------------------
FROM node:25-alpine AS base

WORKDIR /app

# Install pnpm globally
RUN corepack enable && corepack prepare pnpm@latest --activate

# -------------------------------------------
# Dependencies stage: Install packages
# -------------------------------------------
FROM base AS deps

# Copy package files
COPY package.json pnpm-lock.yaml* package-lock.json* yarn.lock* ./

# Install dependencies based on lockfile present
RUN \
  if [ -f pnpm-lock.yaml ]; then pnpm install --frozen-lockfile; \
  elif [ -f package-lock.json ]; then npm ci; \
  elif [ -f yarn.lock ]; then yarn --frozen-lockfile; \
  else npm install; \
  fi

# -------------------------------------------
# Development stage: Hot reload server
# -------------------------------------------
FROM base AS development

WORKDIR /app

# Copy dependencies from deps stage
COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Expose Vite dev server port
EXPOSE 3000

# Start development server
CMD ["pnpm", "dev", "--host", "0.0.0.0"]

# -------------------------------------------
# Builder stage: Build production assets
# -------------------------------------------
FROM base AS builder

WORKDIR /app

# Copy dependencies
COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Build the application
RUN pnpm build

# -------------------------------------------
# Production stage: Serve static files
# -------------------------------------------
FROM nginx:alpine AS production

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy built assets from builder stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Add healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:80/health || exit 1

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
