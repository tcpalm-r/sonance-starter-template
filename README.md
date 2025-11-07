# Ari and Jorge Starter

Next.js 14 collaborative development starter with full AI integration through Claude Code.

---

## 📚 Documentation

**Quick Reference:**

- 🔧 **[MCP_SETUP.md](./MCP_SETUP.md)** - MCP server setup and troubleshooting
- 📘 **[CLAUDE.md](./CLAUDE.md)** - Complete technical guide, automated workflows, coding standards

---

## Quick Start (New Team Member)

### Prerequisites

- **Cursor IDE** installed (or any IDE with Claude Code support)
- **Node.js 18+** installed
- Access to **GitHub repo and Supabase** (Vercel optional)

### Setup Steps

#### 1. **Clone the repository**

```bash
git clone https://github.com/tcpalm-r/ari-jorge-collab.git
cd ari-jorge-collab
```

#### 2. **Set Up MCP Servers (5 minutes)**

MCP servers enable Claude Code to interact with GitHub and Supabase using natural language.

```bash
./setup-mcp.sh
```

You'll be prompted for two API credentials:

- GitHub Personal Access Token
- Supabase Project Reference ID

**📖 Detailed instructions:** See [MCP_SETUP.md](./MCP_SETUP.md)

#### 3. **Set up environment variables**

```bash
cp .env.local.example .env.local
```

Then edit `.env.local` with your Supabase credentials (get from team lead)

#### 4. **Install dependencies**

```bash
npm install
```

#### 5. **Start development server**

```bash
npm run dev
```

#### 6. **Open your browser**

Navigate to http://localhost:3000 - you should see the app running!

#### 7. **Test Claude Code + MCP**

In Cursor, try asking Claude:

- "Show me recent commits"
- "Show me the Supabase database schema"
- "What's on the employee directory page?"

---

## 🔗 Important Links

- **GitHub Repo:** https://github.com/tcpalm-r/ari-jorge-collab
- **GitHub Actions (CI/CD):** https://github.com/tcpalm-r/ari-jorge-collab/actions
- **Production Site:** https://ari-jorge-collab.vercel.app
- **Supabase Dashboard:** https://app.supabase.com/project/kjfizpagyleefuucsdbu
- **Vercel Dashboard:** https://vercel.com/dashboard

---

## Repository Status

- **Workflow:** Direct-to-main development
  - All work happens directly on `main` branch
  - AI commits automatically after completing work units
  - User pushes manually when ready to deploy
  - GitHub Actions auto-deploys on push to main
- **Pre-commit Hooks:** ✅ Automatic code quality checks
  - Prettier auto-formats code (spacing, quotes, etc.)
  - ESLint auto-fixes code style issues
  - TypeScript type checking catches errors early
  - Prevents broken code from reaching GitHub
  - No manual intervention needed - fixes happen automatically!

---

## Key Commands

```bash
npm run dev          # Start development server
npm run build        # Create production build
npm run lint         # Run linter
npm run type-check   # Check TypeScript errors
```

---

## ⚡ Custom Slash Commands

Work faster with Claude Code using these commands:

```bash
/start-work    # Start your workday with fresh code (ensures on main, pulls latest)
/finish-work   # Commit changes and prepare for push
/cleanup       # Clean up workspace at end of day
```

See [CLAUDE.md](./CLAUDE.md) for complete workflow instructions.

---

## Workflow & Documentation

**Golden Rule:** Work directly on the `main` branch. AI commits automatically, you push manually when ready to deploy.

**Automated Workflows:**

- Use `/start-work` to begin your workday (AI ensures on main, pulls latest)
- Use `/finish-work` to commit changes and prepare for push
- Use `/cleanup` to clean up workspace

See [CLAUDE.md](./CLAUDE.md) for complete workflow instructions.

---

## Getting Help

1. **Ask Claude Code** - Your AI pair programmer (works best with MCP enabled!)
2. **Check [CLAUDE.md](./CLAUDE.md)** - Comprehensive technical guide
3. **Check [MCP_SETUP.md](./MCP_SETUP.md)** - If having issues with GitHub/Supabase commands

---

## Tech Stack

- **Framework:** Next.js 14 with TypeScript
- **Database:** Supabase (PostgreSQL)
- **Hosting:** Vercel (deployed via GitHub Actions)
- **Styling:** Tailwind CSS (with custom dark mode)
- **AI Integration:** Claude Code with MCP servers for GitHub and Supabase

---

## Current Features

### Employee Directory

- Dark mode UI with Supabase-style design (`#1c1c1c` background, `#3ECF8E` accents)
- Scrollable table container with fixed viewport height
- Displays employee data from Supabase `employees` table
- Responsive design with truncated text for long values
- Real-time data fetching using Next.js 14 Server Components

**Location:** `/app/page.tsx`

---

## MCP-Enabled Commands

Once MCP is set up, you can ask Claude Code natural language questions:

**GitHub:**

- "Show me recent commits"
- "What files changed in the last commit?"
- "Show me the commit history"

**Supabase:**

- "Show me the database schema"
- "Query the employees table"
- "Check database connection status"
- "What tables exist in the database?"

**Deployment:**

- GitHub Actions automatically deploys when you push to main
- Check deployment status in GitHub Actions dashboard

---

## 📜 License

This is a private project. All rights reserved.
