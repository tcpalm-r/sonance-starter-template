# Ari and Jorge Starter

Next.js 14 collaborative development starter with full AI integration through Claude Code.

---

## 📚 Documentation

**START HERE:**

- 👤 **[USER_GUIDE.md](./USER_GUIDE.md)** - **Non-technical users start here!** Complete guide for working with Claude Code, GitHub, and PRs without knowing Git commands.
- 📊 **[WORKFLOW_DIAGRAM.md](./WORKFLOW_DIAGRAM.md)** - Visual workflow diagrams and decision trees
- 🔧 **[MCP_SETUP.md](./MCP_SETUP.md)** - MCP server setup and troubleshooting
- 📋 **[EXECUTIVE_SUMMARY.md](./EXECUTIVE_SUMMARY.md)** - Project overview and summary

**For Developers:**

- 📘 **[CLAUDE.md](../CLAUDE.md)** - Complete technical guide, automated workflows, coding standards
- 🎯 **[AGENTS.md](../AGENTS.md)** - Agent configuration reference

---

## Quick Start (New Team Member)

### Prerequisites

- **Cursor IDE** installed (or any IDE with Claude Code support)
- **Node.js 18+** installed
- Access to **GitHub repo and Supabase** (Vercel optional)

### Setup Steps

#### 1. **Set Up MCP Servers (5 minutes)**

MCP servers enable Claude Code to interact with GitHub, Vercel, and Supabase using natural language.

```bash
./setup-mcp.sh
```

You'll be prompted for two API credentials:

- GitHub Personal Access Token
- Supabase Project Reference ID

**📖 Detailed instructions:** See `MCP_SETUP.md`

#### 2. **Set up environment variables**

```bash
cp .env.local.example .env.local
```

Then edit `.env.local` with your Supabase credentials (get from team lead)

#### 3. **Install dependencies**

```bash
npm install
```

#### 4. **Start development server**

```bash
npm run dev
```

#### 5. **Open your browser**

Navigate to http://localhost:3000 - you should see the app running!

#### 6. **Test Claude Code + MCP**

In Cursor, try asking Claude:

- "Show me all open pull requests"
- "Show me the Supabase database schema"
- "What's on the employee directory page?"

## Important Links

- **GitHub Repo:** https://github.com/tcpalm-r/ari-jorge-collab
- **GitHub Actions (CI):** https://github.com/tcpalm-r/ari-jorge-collab/actions
- **Production Site:** https://ari-jorge-collab.vercel.app
- **Supabase Dashboard:** https://app.supabase.com/project/kjfizpagyleefuucsdbu
- **Vercel Dashboard:** https://vercel.com/dashboard

## Repository Status

- **Visibility:** Public (enables free branch protection)
- **Branch Protection:** ✅ Enabled on `main`
  - Direct pushes to `main` are blocked
  - All changes require Pull Requests with 1 approval
  - CI checks must pass before merging
  - Protection enforced for all team members (including admins)
- **Pre-commit Hooks:** ✅ Automatic code quality checks
  - Prettier auto-formats code (spacing, quotes, etc.)
  - ESLint auto-fixes code style issues
  - TypeScript type checking catches errors early
  - Prevents broken code from reaching GitHub
  - No manual intervention needed - fixes happen automatically!

## Key Commands

```bash
npm run dev          # Start development server
npm run build        # Create production build
npm run lint         # Run linter
npm run type-check   # Check TypeScript errors
```

## Workflow & Documentation

**See the comprehensive [Documentation section](#-documentation) at the top of this README.**

**Golden Rule:** Never work directly on the `main` branch. Always create a feature branch, get PR approval, then merge.

**Automated Workflows:**

- Use `/start-work` to begin your workday
- Use `/finish-work` to save and optionally create PR
- Use `/sync-main` to keep branch up-to-date
- Use `/check-prs` to review pull requests
- Use `/cleanup` to clean up workspace

See [USER_GUIDE.md](./USER_GUIDE.md) for complete workflow instructions.

## Getting Help

1. **Ask Claude Code** - Your AI pair programmer (works best with MCP enabled!)
2. **Check [USER_GUIDE.md](./USER_GUIDE.md)** - Non-technical user guide
3. **Check [CLAUDE.md](../CLAUDE.md)** - Comprehensive technical guide
4. **Check [MCP_SETUP.md](./MCP_SETUP.md)** - If having issues with GitHub/Vercel/Supabase commands
5. **Ask your teammate** - Collaboration is key!

## Tech Stack

- **Framework:** Next.js 14 with TypeScript
- **Database:** Supabase (PostgreSQL)
- **Hosting:** Vercel (auto-deploy from main branch)
- **Styling:** Tailwind CSS (with custom dark mode)
- **AI Integration:** Claude Code with MCP servers for GitHub and Supabase

## Current Features

### Employee Directory

- Dark mode UI with Supabase-style design (`#1c1c1c` background, `#3ECF8E` accents)
- Scrollable table container with fixed viewport height
- Displays employee data from Supabase `employees` table
- Responsive design with truncated text for long values
- Real-time data fetching using Next.js 14 Server Components

**Location:** `/app/page.tsx`

## MCP-Enabled Commands

Once MCP is set up, you can ask Claude Code natural language questions:

**GitHub:**

- "Show me all open pull requests"
- "Create a new branch called feature/my-feature"
- "What files changed in the last commit?"
- "Create a PR for this branch"

**Supabase:**

- "Show me the database schema"
- "Query the employees table"
- "Check database connection status"
- "What tables exist in the database?"

**Vercel (Use CLI or Dashboard):**

- Terminal: `vercel` - Deploy preview
- Terminal: `vercel --prod` - Deploy to production
- Terminal: `vercel logs` - View logs
- Or ask Claude: "Help me check Vercel deployment status"
