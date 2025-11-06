# Ari and Jorge Starter

## Project Overview

A Next.js 14 collaborative development starter project designed for non-technical collaboration using Claude Code. The project demonstrates best practices for AI-assisted development with GitHub workflow enforcement, automatic CI/CD, and database integration.

---

## Golden Rules

**NEVER work directly on main branch**

⚠️ **TECHNICAL ENFORCEMENT ENABLED:** GitHub will reject any direct pushes to `main`. This is not just a suggestion - it's technically impossible to push to main without a Pull Request.

All changes must:

1. Be made on a feature branch
2. Have a Pull Request (PR) created
3. Be reviewed by the other person
4. Get explicit approval before merging
5. Be merged through GitHub (not locally)

**Daily Workflow:**

- Start day: Pull latest main
- Create feature branch for your work
- Make changes and commit regularly (pre-commit hooks auto-fix issues!)
- Push and create PR when ready
- Review partner's PRs within 24 hours
- After merge: Pull latest main again

**Pre-commit Hooks (Automatic):**

- Every commit automatically runs Prettier, ESLint, and TypeScript checks
- Code formatting happens automatically (spacing, quotes, semicolons)
- Code style issues are fixed automatically
- Bad commits are blocked before reaching GitHub
- No need to manually run `npm run lint` or `npm run format` - it happens automatically!

**Branch Naming:**

- `feature/description` - new functionality
- `fix/description` - bug fixes
- `docs/description` - documentation updates

---

## Git Worktrees (Parallel Agent Work)

**Git worktrees allow you to work on multiple branches simultaneously in separate directories.** This is perfect for running multiple AI agents at the same time, each working on different features.

### Quick Start

```bash
# Create a new worktree for a feature branch
./scripts/worktree.sh create feature/my-new-feature

# List all worktrees
./scripts/worktree.sh list

# Remove a worktree (keeps the branch)
./scripts/worktree.sh remove feature/my-new-feature
```

### How It Works

1. **Main Repository**: Your main workspace (current directory)
2. **Worktrees Directory**: All additional worktrees are created in `worktrees/`
3. **Independent Development**: Each worktree can:
   - Run its own dev server (`npm run dev`)
   - Have its own terminal sessions
   - Be opened in separate Cursor/VS Code windows
   - Run different AI agents simultaneously

### Workflow for Multiple Agents

**Scenario: Running 2 agents in parallel**

```bash
# Agent 1: Working on feature A (in main workspace)
cd "/Users/thomas.palmer/Documents/Ari and Jorge Starter"
git checkout feature/feature-a
npm run dev  # Runs on port 3000

# Agent 2: Working on feature B (in worktree)
./scripts/worktree.sh create feature/feature-b
cd worktrees/feature/feature-b
npm install  # First time only
npm run dev  # Runs on port 3001 (Next.js auto-increments)
```

**Each worktree:**
- Has its own `node_modules/` (shared via symlinks when possible)
- Shares the same `.env.local` (via symlink)
- Can commit and push independently
- Follows all the same Golden Rules (feature branches, PRs, etc.)

### Best Practices

1. **Always create branches from main:**
   ```bash
   # The script does this automatically
   ./scripts/worktree.sh create feature/new-feature
   ```

2. **Keep worktrees organized:**
   - All worktrees go in `worktrees/` directory
   - Use descriptive branch names
   - Remove worktrees when done: `./scripts/worktree.sh remove feature/name`

3. **Environment Variables:**
   - `.env.local` is automatically symlinked from main repo
   - Changes in one worktree affect all (by design - shared config)

4. **Port Conflicts:**
   - Next.js automatically increments ports (3000, 3001, 3002, etc.)
   - Each worktree can run its own dev server

5. **Git Operations:**
   - Commits in any worktree affect the same repository
   - Push/pull from any worktree works normally
   - All worktrees share the same `.git` directory

### Managing Worktrees

```bash
# List all worktrees
./scripts/worktree.sh list

# Remove a worktree (doesn't delete the branch)
./scripts/worktree.sh remove feature/old-feature

# Clean up stale references
./scripts/worktree.sh prune
```

### Troubleshooting

**"Worktree already exists" error:**
- The branch might already have a worktree
- Use `./scripts/worktree.sh list` to see all worktrees
- Remove the old worktree first if needed

**"Port already in use" error:**
- Another worktree is using that port
- Next.js should auto-increment, but you can manually set: `PORT=3002 npm run dev`

**"Branch diverged" warnings:**
- Each worktree can have different commits
- Sync with main regularly: `git pull origin main` (in each worktree)

---

## Tech Stack

**Frontend & Backend:**

- Next.js 14 with TypeScript
- React for UI components
- UI library: Tailwind

**Database:**

- Supabase (PostgreSQL)
- Handles authentication, data storage, real-time features

**Hosting & Deployment:**

- Vercel for production hosting
- Automatic deployments when main branch updates
- Preview deployments for every PR

**Connection Flow:**

```
GitHub (main) → Vercel (auto-deploy) → Supabase (database)
```

**Environment Variables (in Vercel):**

- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- `SUPABASE_SERVICE_ROLE_KEY`

---

## MCP Commands

**GitHub MCP:**

```
"Create a PR for this branch"
"Show me all open pull requests"
"Check PR status for [branch-name]"
"Merge this approved PR"
"What branches exist?"
```

**Supabase MCP:**

```
"Show database schema"
"Query [table-name] for [criteria]"
"Check database connection status"
"Show me the users table structure"
```

**General Claude Code Commands:**

```
"Pull the latest main into my branch"
"Commit these changes with message: [description]"
"Run the development server"
"Run tests"
"Check for TypeScript errors"
```

**Vercel CLI (use terminal commands):**

```bash
vercel              # Deploy to preview
vercel --prod       # Deploy to production
vercel logs         # View deployment logs
vercel ls           # List deployments
```

---

## Common Commands

**Starting Work:**

```bash
# Claude will do this for you, but these are the actual commands:
git checkout main
git pull origin main
git checkout -b feature/my-feature-name
```

**Development:**

```bash
npm run dev          # Start local development server
npm run build        # Test production build
npm run lint         # Check code quality
npm run type-check   # Check TypeScript errors
```

**Database:**

```bash
# Use Supabase MCP instead of raw SQL when possible
# Migrations should be created in Supabase dashboard first
```

---

## File Structure

**Key Directories:**

- `/app` - Next.js 14 app router pages and layouts
- `/components` - Reusable React components
- `/lib` - Utility functions and configurations
  - `/lib/supabase` - Supabase client setup
- `/types` - TypeScript type definitions
- `/public` - Static assets (images, fonts, etc.)

**Important Config Files:**

- `package.json` - Dependencies and scripts
- `tsconfig.json` - TypeScript configuration
- `.env.local` - Local environment variables (DO NOT COMMIT)
- `next.config.js` - Next.js configuration

**Component Organization:**

```
/components
  /ui          - Basic UI elements (buttons, inputs)
  /features    - Feature-specific components
  /layout      - Layout components (header, footer)
```

---

## Emergency Help

**Vercel Deployment Failed:**

1. Ask Claude: "Show me the Vercel deployment logs"
2. Check for build errors or missing environment variables
3. Verify env vars match Supabase project settings
4. If needed: "Help me fix this deployment error"

**Database Issues:**

1. Check Supabase status: status.supabase.com
2. Verify environment variables in Vercel
3. Ask Claude: "Test my Supabase connection"
4. Check if database migrations need to run

**Merge Conflicts:**

1. Ask Claude: "Help me resolve these merge conflicts"
2. Always pull latest main before creating PR
3. Review conflicted files carefully
4. Test after resolving conflicts

**Production Site Down:**

1. Check Vercel deployment status at https://vercel.com/dashboard
2. Check Supabase service status at https://status.supabase.com
3. Look at recent merges to main
4. Rollback: Redeploy previous version in Vercel dashboard
5. Contact: Check with your development partner or team lead

---

## Code Style Preferences

**TypeScript:**

- Use strict mode
- Define types for all function parameters and returns
- Use interfaces for object shapes

**React Components:**

- Functional components with hooks only
- Props interfaces defined above component
- Use descriptive component names (PascalCase)

**File Naming:**

- Components: `PascalCase.tsx`
- Utilities: `camelCase.ts`
- Pages: `kebab-case/page.tsx` (Next.js convention)

**Code Organization:**

- Keep components small and focused
- Extract reusable logic into custom hooks
- Use comments for complex business logic
- Write self-documenting variable names

---

## Notes for Claude Code

**When Creating Features:**

- Always ask about database schema changes before implementing
- Check if similar patterns exist in the codebase first
- Write TypeScript types for new data structures
- Consider mobile responsive design

**When Reviewing Code:**

- Check for TypeScript errors
- Verify environment variables are used correctly
- Look for security issues (exposed secrets, SQL injection)
- Test user-facing changes in browser

**When Handling Database:**

- Use Supabase Row Level Security (RLS) policies
- Never expose service role key in client code
- Create migrations for schema changes
- Test queries with different user permissions

**Before Merging:**

- Run build locally: `npm run build`
- Check TypeScript: `npm run type-check`
- Run linter: `npm run lint`
- Test key user flows manually

**After Committing Changes:**

⚠️ **IMPORTANT: NEVER automatically create a Pull Request without asking first!**

After committing changes to a feature branch, ALWAYS pause and ask the user:

- "Would you like to continue adding more features to this branch?"
- "Would you like to test the changes more thoroughly?"
- "Would you like to review everything yourself first?"
- "Or are you ready for me to create a PR?"

Only create a PR after the user explicitly confirms they're ready. The user may want to:

- Add more commits to the same branch
- Test locally first
- Review the changes themselves
- Make additional modifications

**Never assume the user is ready for a PR just because a commit was successful.**

---

## Automated Workflow Rules for Claude Code

### Custom Slash Commands

The project now has custom slash commands in `.claude/commands/` that provide streamlined workflows:

- **`/start-work`** - Complete workday setup workflow
- **`/finish-work`** - Commit, push, and optional PR creation
- **`/sync-main`** - Intelligent branch syncing with main
- **`/check-prs`** - Review and manage pull requests
- **`/cleanup`** - End-of-day workspace cleanup

These commands contain detailed instructions for handling each workflow scenario. **Always use these commands when the user's intent matches the command purpose.**

### Branch Protection Automation

**Automatic Branch Checks:**

When user starts work:

1. **ALWAYS** check current branch
2. **NEVER** let user work on main - if on main, immediately create feature branch
3. **ALWAYS** pull latest main before creating feature branch
4. **ALWAYS** suggest descriptive branch names based on task

**Branch Naming Intelligence:**

Automatically suggest branch names based on user's description:

- "Add search" → `feature/add-search`
- "Fix login bug" → `fix/login-bug`
- "Update docs" → `docs/update-documentation`

### Commit and Push Automation

**Pre-Commit Validation (Automatic):**

Before every commit:

1. Run `npm run type-check` (blocks if errors)
2. Run `npm run build` (blocks if fails)
3. Husky pre-commit hook auto-formats code
4. Generate meaningful commit message
5. **NEVER** commit if validation fails

**Commit Message Intelligence:**

Auto-generate commit messages following conventional commits:

- New features: `feat: description`
- Bug fixes: `fix: description`
- Documentation: `docs: description`
- Refactoring: `refactor: description`
- Tests: `test: description`

### Branch Sync Decision Logic

**When to Sync:**

Automatically detect when:

- Main is >3 commits ahead of current branch
- User tries to push but branch is behind
- User is about to create PR but branch is stale

**Merge vs Rebase Decision Tree:**

```
IF branch never pushed to remote:
    → USE REBASE (cleanest history)

ELSE IF branch pushed but no PR exists:
    → ASK user: "Rebase for clean history or merge for safety?"
    → DEFAULT: Rebase with --force-with-lease

ELSE IF PR is open:
    → USE MERGE (never rewrite published history)

ELSE IF unsure:
    → ASK user which strategy they prefer
```

**Conflict Resolution Intelligence:**

When conflicts occur:

1. **Explain** what conflicted in plain English
2. **Show** both versions side-by-side
3. **Suggest** which version to keep based on context
4. **Verify** resolution with type-check after resolving
5. **Never** resolve conflicts without user approval

### PR Management Automation

**PR Status Monitoring:**

Automatically check and report:

- PRs waiting for user's review (prioritize these!)
- PRs user created waiting for approval
- PRs with failing CI/CD checks
- Stale PRs (>7 days without activity)

**PR Creation Intelligence:**

When creating PR:

1. **ALWAYS** run full validation first
2. Auto-generate comprehensive PR description:
   - Summary of changes (bullet points)
   - Problem/motivation
   - Solution approach
   - Detailed test plan
   - Screenshots if UI changes
3. Request review from partner
4. Provide preview deployment URL

**PR Review Assistance:**

When helping review PRs:

1. Fetch and explain all changes in plain English
2. Highlight potential issues or risks
3. Provide testing checklist
4. Show CI/CD status and preview link
5. Guide approval/rejection process

### Stale Branch Detection

**Automatic Warnings:**

Alert user when:

- Branch is >7 days old without activity
- Branch is >10 commits behind main
- Branch has no PR but is pushed to remote

**Cleanup Suggestions:**

Proactively suggest:

- Deleting merged branches after PR merges
- Syncing stale branches before continuing work
- Creating PR for pushed branches without one

### Post-Merge Automation

**After PR Merges (Automatic via Hooks):**

The `.husky/post-merge` hook automatically:

- Runs `npm install` if `package-lock.json` changed
- Warns about `.env.local.example` changes
- Alerts about database schema changes
- Shows summary of what was merged

**Cleanup Recommendations:**

After user's PR merges, suggest:

```
"Your PR was merged! Would you like me to:
1. Clean up your local workspace (/cleanup)
2. Start working on the next feature
3. Review other open PRs"
```

### Environment Variable Validation

**Startup Checks:**

When user starts work, verify:

- `.env.local` exists
- Required variables present:
  - `NEXT_PUBLIC_SUPABASE_URL`
  - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
  - `SUPABASE_SERVICE_ROLE_KEY`

**Change Detection:**

Alert when `.env.local.example` changes:

```
"⚠️ Environment variables template updated!
Compare: diff .env.local.example .env.local
Would you like me to show you what changed?"
```

### Pre-Push Validation

**Automatic Checks (via .husky/pre-push):**

Before every push:

1. **BLOCK** if pushing to main branch
2. **WARN** if branch >10 commits behind main
3. **RUN** TypeScript type-check (block if errors)
4. **RUN** Production build test (block if fails)
5. **WARN** about console.log statements (don't block)
6. **BLOCK** if trying to commit `.env` or `.env.local`
7. **WARN** about TODO/FIXME comments (don't block)

### Deployment Status Monitoring

**After PR Merge:**

Automatically:

1. Monitor Vercel deployment status
2. Alert if deployment fails
3. Provide deployment logs if issues
4. Confirm when deployment succeeds
5. Provide production URL

**Preview Deployments:**

When PR created:

1. Mention Vercel will create preview
2. Check preview deployment status
3. Provide preview URL when ready
4. Alert if preview deployment fails

### Error Recovery Automation

**When Things Go Wrong:**

**Build Failures:**

```
1. Show the error clearly
2. Identify the likely cause
3. Suggest specific fixes
4. Offer to implement the fix
5. Re-run validation after fix
```

**Push Failures:**

```
1. Check if branch diverged
2. Offer to pull and rebase/merge
3. Handle conflicts if needed
4. Retry push
```

**Merge Conflicts:**

```
1. Identify all conflicted files
2. Explain each conflict
3. Suggest resolution
4. Apply user's choice
5. Verify with type-check
6. Complete merge/rebase
```

### Proactive Notifications

**Daily Start:**

- "You have 2 PRs waiting for your review"
- "Main branch has 5 new commits since yesterday"
- "Your open PR #15 was approved - ready to merge!"

**During Work:**

- "Your branch is getting behind main (5 commits). Sync soon?"
- "You have uncommitted changes. Want to save them?"
- "Type check found 3 errors. Should I show them?"

**End of Day:**

- "You have uncommitted changes. Commit before ending?"
- "Your PR #14 still needs review. Follow up tomorrow?"
- "Would you like to clean up merged branches?"

### Decision-Making Principles

**When to be Proactive:**

- Detecting stale branches
- Identifying PRs needing attention
- Catching validation errors early
- Preventing work on main branch

**When to Ask First:**

- Creating Pull Requests
- Deleting branches (except clearly merged ones)
- Force-pushing
- Discarding uncommitted changes
- Making architectural decisions

**When to Block/Prevent:**

- Pushing to main branch
- Committing with type errors
- Committing broken builds
- Committing secret files (.env)
- Creating PR with failing checks

### Git Hooks Reference

**Pre-commit (.husky/pre-commit):**

- Auto-formats code (Prettier)
- Auto-fixes lint issues (ESLint)
- Blocks unfixable errors

**Pre-push (.husky/pre-push):**

- Blocks main branch pushes
- Runs type-check
- Runs build test
- Warns about branch status

**Post-merge (.husky/post-merge):**

- Auto `npm install` if needed
- Warns about env changes
- Shows merge summary

### Slash Command Usage Priority

**Always suggest slash commands when appropriate:**

User says: "I'm starting work" → Suggest: `/start-work`
User says: "Save my work" → Suggest: `/finish-work`
User says: "Is my branch up to date?" → Suggest: `/sync-main`
User says: "What PRs need review?" → Suggest: `/check-prs`
User says: "I'm done for today" → Suggest: `/cleanup`

**Make these commands part of the normal workflow vocabulary.**
