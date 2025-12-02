# Sonance Starter Template

Next.js 14 + TypeScript + Supabase + Tailwind. Solo development with direct-to-main workflow.

---

## Core Rules

| DO ✅                                            | NEVER ❌                                  |
| ------------------------------------------------ | ----------------------------------------- |
| Pull latest at session start                     | Edit `.env*` files                        |
| Commit after each completed task                 | Push automatically                        |
| Use conventional commits (`feat:`, `fix:`, etc.) | Edit `CLAUDE.md` or `.cursorrules`        |
| Work directly on `main` branch                   | Commit with type errors or build failures |

---

## Session Workflow

### Start (Automatic)

```bash
git checkout main
git status
git pull origin main
```

Report: sync status, uncommitted changes, ready confirmation.

### During Work (Automatic)

- Commit after completing logical units of work
- Pre-commit hooks auto-fix formatting (Prettier, ESLint)
- Show commit message after each commit

### End (Manual)

- User runs: `git push origin main`
- GitHub Actions auto-deploys to Vercel

---

## Tech Stack

| Layer            | Technology                    |
| ---------------- | ----------------------------- |
| Frontend/Backend | Next.js 14, React, TypeScript |
| Styling          | Tailwind CSS                  |
| Database         | Supabase (PostgreSQL)         |
| Hosting          | Vercel                        |
| CI/CD            | GitHub Actions                |

**Flow:** `git push main` → GitHub Actions → Vercel → Supabase

**Required Env Vars:** `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY`

---

## Project Structure

```
/app          → Next.js pages and layouts
/components   → React components (/ui, /features, /layout)
/lib          → Utilities and Supabase client
/types        → TypeScript definitions
```

**Naming:** Components `PascalCase.tsx`, utilities `camelCase.ts`, pages `kebab-case/page.tsx`

---

## Commands

```bash
npm run dev          # Local dev server
npm run build        # Production build
npm run type-check   # TypeScript validation
npm run lint         # ESLint check
```

---

## Template Rename

When user says **"rename to [Name]"** or **"rename to [Name], then push"**:

1. Check git status is clean
2. Get username/repo from `git remote -v`
3. Normalize: `"My Project"` → `my-project` (kebab-case for package/URLs), `My Project` (Title Case for display)
4. Update: `package.json` name, `README.md` title + URLs, `CLAUDE.md` title
5. Commit: `chore: rename project to [Name]`
6. Push only if user said "then push"

---

## Conflict Resolution

If `git pull` conflicts:

1. Explain what conflicted in plain English
2. Show both versions
3. Suggest which to keep
4. Apply with user approval
5. Verify with type-check, then commit

---

## Emergency Help

| Issue             | Action                                     |
| ----------------- | ------------------------------------------ |
| Deployment failed | Check Vercel logs, verify env vars         |
| Database issues   | Check status.supabase.com, verify env vars |
| Merge conflicts   | Pull first, resolve carefully, test after  |
| Site down         | Check Vercel dashboard, rollback if needed |

---

## Code Guidelines

- TypeScript strict mode, types for all params/returns
- Functional React components with hooks
- Use Supabase RLS policies
- Never expose service role key in client code
- Check for existing patterns before creating new ones
