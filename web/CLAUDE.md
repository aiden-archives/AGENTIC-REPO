# Frontend Service

## Overview
React + TypeScript frontend built with Vite and styled with Tailwind CSS.

## Tech Stack
- **Framework**: React 19
- **Language**: TypeScript
- **Build Tool**: Vite
- **Styling**: Tailwind CSS
- **Testing**: Vitest

## Directory Structure
```
web/
├── src/
│   ├── components/     # Reusable UI components
│   ├── pages/          # Page components (routes)
│   ├── hooks/          # Custom React hooks
│   ├── lib/            # Utilities and helpers
│   ├── services/       # API client and external services
│   ├── stores/         # State management (if using)
│   ├── types/          # TypeScript type definitions
│   ├── App.tsx         # Root component
│   ├── main.tsx        # Entry point
│   └── index.css       # Global styles
├── public/             # Static assets
├── Dockerfile          # Container configuration
└── package.json        # Dependencies and scripts
```

## Commands
```bash
pnpm dev          # Start dev server (port 3000)
pnpm build        # Build for production
pnpm preview      # Preview production build
pnpm lint         # Run ESLint
pnpm format       # Format with Prettier
pnpm test         # Run tests
pnpm typecheck    # TypeScript check
```

## Conventions
- Use functional components with hooks
- Colocate tests with components (`Component.test.tsx`)
- Use path alias `@/` for src imports
- Follow component naming: `PascalCase.tsx`
- API calls go through `services/api.ts`

## Environment Variables
Frontend env vars must be prefixed with `VITE_`:
- `VITE_API_URL` - Backend API URL
- `VITE_APP_NAME` - Application name
