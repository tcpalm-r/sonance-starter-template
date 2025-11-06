# Agent Configuration

This file ensures AI agents (Claude Code, Cursor, and other AI assistants) follow project conventions.

## Primary Configuration Source

**`CLAUDE.md`** is the single source of truth for all project rules, guidelines, and workflows.

All AI agents working on this project MUST:

1. Read `CLAUDE.md` completely before making changes
2. Follow all guidelines specified in `CLAUDE.md`
3. Adhere to the Golden Rules (especially branch protection)
4. Use the documented workflows and commands

## Agent Behavior

### Code Changes

- Always create feature branches (never work on main)
- Follow the branch naming conventions in `CLAUDE.md`
- Use pre-commit hooks (automatic via Husky)
- Write TypeScript with strict types
- Follow code style preferences in `CLAUDE.md`

### Parallel Agent Work (Git Worktrees)

- **Multiple agents can work simultaneously** using git worktrees
- Use `./scripts/worktree.sh create <branch-name>` to create a new worktree
- Each worktree is a separate directory in `worktrees/` folder
- Each worktree can run its own dev server and be opened in separate editor windows
- See `CLAUDE.md` → "Git Worktrees" section for complete documentation
- When user requests parallel agent work, suggest creating a worktree

### Pull Requests

- Never create PRs without user approval after committing
- Follow PR workflow documented in `USER_GUIDE.md`
- Ensure CI passes before requesting merge
- Include clear descriptions following `CLAUDE.md` guidelines

### Deployments

- GitHub Actions handles all deployments
- Preview deployments on PRs (automatic)
- Production deployments on main merges (automatic)
- See `GITHUB_ACTIONS_DEPLOYMENT.md` for details

### Database Changes

- Use Supabase with Row Level Security
- Never expose service role keys
- Test queries before committing
- Follow database guidelines in `CLAUDE.md`

## Configuration Files

- **`CLAUDE.md`** - Primary project rules and guidelines
- **`.cursorrules`** - Cursor-specific configuration
- **`AGENTS.md`** (this file) - Agent behavior documentation
- **`USER_GUIDE.md`** - Complete user guide including PR workflow for non-technical users
- **`GITHUB_ACTIONS_DEPLOYMENT.md`** - Deployment configuration

## Tech Stack Summary

From `CLAUDE.md`:

- Next.js 14 with TypeScript
- React with Tailwind CSS
- Supabase (PostgreSQL)
- Vercel (via GitHub Actions)
- GitHub Actions (CI/CD)

## Quick Reference

When working on this project:

1. ✅ Read `CLAUDE.md` first
2. ✅ Create feature branch from main
3. ✅ Make changes following guidelines
4. ✅ Commit (pre-commit hooks run automatically)
5. ✅ Push and create PR
6. ✅ Wait for CI and deployment
7. ✅ Get approval and merge

## Emergency Contacts

See `CLAUDE.md` → Emergency Help section for troubleshooting:

- Vercel deployment failures
- Database issues
- Merge conflicts
- Production site issues

---

**Remember:** When in doubt, consult `CLAUDE.md`. It contains all the information needed to work on this project correctly.
