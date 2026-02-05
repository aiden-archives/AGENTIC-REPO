# syntax=docker/dockerfile:1

# ====================
# Base
# ====================
FROM node:25-alpine AS base
WORKDIR /app

# Install dependencies for native modules
RUN apk add --no-cache libc6-compat

# ====================
# Dependencies
# ====================
FROM base AS deps

COPY package.json package-lock.json* ./
RUN npm ci --legacy-peer-deps

# ====================
# Development
# ====================
FROM base AS development

COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Install dev tools
RUN npm install -g nodemon

ENV NODE_ENV=development
ENV PORT=8080

EXPOSE 8080

CMD ["nodemon", "--watch", "src", "src/index.js"]

# ====================
# Builder
# ====================
FROM base AS builder

COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN npm run build

# ====================
# Production
# ====================
FROM base AS production

ENV NODE_ENV=production
ENV PORT=8080

# Create non-root user
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 appuser

COPY --from=builder --chown=appuser:nodejs /app/dist ./dist
COPY --from=deps --chown=appuser:nodejs /app/node_modules ./node_modules
COPY --chown=appuser:nodejs package.json ./

USER appuser

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/health || exit 1

CMD ["node", "dist/index.js"]
