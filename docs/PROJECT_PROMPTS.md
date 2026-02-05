# Project Prompts

A collection of ready-to-use prompts for common development tasks.

---

## Starting

**Initialize project**
> Set up a new [type] project with [framework]. Include Docker, basic CI, and a hello world endpoint.

**Bootstrap from template**
> Initialize this project using the template structure. Create placeholder services and a working docker-compose setup.

**Add new service**
> Add a new service called [name] that handles [purpose]. Include Dockerfile, health check, and basic tests.

---

## Continuing

**Resume work**
> Read STATUS.md and continue where we left off.

**Implement feature**
> Implement [feature description]. Follow existing patterns and add tests.

**Add endpoint**
> Add a [METHOD] endpoint at /api/[path] that [description].

**Connect services**
> Connect [service-a] to [service-b] so that [purpose].

---

## Fixing

**Debug issue**
> [Describe the problem]. Check logs, trace the issue, and fix it.

**Fix failing tests**
> Run the tests, identify failures, and fix them.

**Fix build**
> The build is failing. Diagnose and fix the issue.

**Fix Docker issues**
> Docker containers aren't working properly. Debug and resolve.

---

## Testing

**Add tests**
> Add tests for [component/feature]. Cover happy path and edge cases.

**Run full test suite**
> Run all tests and fix any failures.

**Add integration test**
> Add an integration test that verifies [workflow].

---

## Refactoring

**Clean up code**
> Refactor [file/component] to improve readability without changing behavior.

**Extract common logic**
> Extract shared logic from [locations] into a reusable [module/function].

**Update dependencies**
> Update dependencies to latest compatible versions. Run tests to verify.

---

## Documentation

**Document API**
> Document all API endpoints with request/response examples.

**Update README**
> Update README.md to reflect current project state.

**Add inline docs**
> Add documentation comments to [file/module].

---

## Releasing

**Prepare release**
> Prepare a release for version [X.Y.Z]. Update changelog, version numbers, and create release notes.

**Deploy to staging**
> Deploy current state to staging environment and verify it works.

**Hotfix**
> Create a hotfix for [issue]. Minimal changes, focused fix.

---

## Reviewing

**Code review**
> Review recent changes for bugs, security issues, and code quality.

**Security check**
> Audit the codebase for common security vulnerabilities.

**Performance review**
> Identify performance bottlenecks in [area].

---

## Session Management

**Start session**
> Read STATUS.md and CLAUDE.md. Summarize current state and pending tasks.

**End session**
> Commit all changes, update STATUS.md with progress, and summarize what was done.

**Handoff**
> Prepare a handoff summary of current state, pending work, and blockers.

---

## Quick Commands

| Task | Prompt |
|------|--------|
| Status check | `What's the current project state?` |
| Run locally | `Start the dev environment and verify it works` |
| Quick fix | `Fix [specific issue] with minimal changes` |
| Explain code | `Explain how [component] works` |
| Find bugs | `Look for bugs in [area]` |

---

## Tips

- Be specific: "Add user authentication" < "Add JWT auth with refresh tokens"
- Reference files: "Fix the bug in src/api/users.ts"
- Set constraints: "Fix this without changing the public API"
- Chain prompts: Complete one task, then start the next
