# [Project Name]

## Project Overview

# [describe what your app does and its business purpose]

---

## Golden Rules

**NEVER work directly on main branch**

All changes must:
1. Be made on a feature branch
2. Have a Pull Request (PR) created
3. Be reviewed by the other person
4. Get explicit approval before merging
5. Be merged through GitHub (not locally)

**Daily Workflow:**
- Start day: Pull latest main
- Create feature branch for your work
- Make changes and commit regularly
- Push and create PR when ready
- Review partner's PRs within 24 hours
- After merge: Pull latest main again

**Branch Naming:**
- `feature/description` - new functionality
- `fix/description` - bug fixes
- `docs/description` - documentation updates

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
- [Add any other env vars]

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

**Vercel MCP:**
```
"Check deployment status"
"Show latest deployment logs"
"What's the production URL?"
"Are there any failed deployments?"
"Show me preview deployment for this PR"
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
1. Check Vercel deployment status
2. Check Supabase service status
3. Look at recent merges to main
4. Rollback: Redeploy previous version in Vercel dashboard


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
