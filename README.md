# Ari and Jorge Starter

Next.js 14 collaborative development starter with full AI integration through Claude Code.

## Quick Start (New Team Member)

### Prerequisites
- **Cursor IDE** installed
- **Node.js 18+** installed
- Access to **GitHub repo, Vercel, and Supabase**

### Setup Steps

#### 1. **Set Up MCP Servers (5 minutes)**

   MCP servers enable Claude Code to interact with GitHub, Vercel, and Supabase using natural language.

   ```bash
   ./setup-mcp.sh
   ```

   You'll be prompted for three API tokens:
   - GitHub Personal Access Token
   - Supabase Project Reference ID
   - Vercel API Token

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
   - "What's the latest Vercel deployment status?"
   - "Show me the Supabase database schema"

## Important Links

- **GitHub Repo:** https://github.com/tcpalm-r/ari-jorge-collab
- **GitHub Actions (CI):** https://github.com/tcpalm-r/ari-jorge-collab/actions
- **Production Site:** https://ari-jorge-collab.vercel.app (or your Vercel URL)
- **Supabase Dashboard:** https://app.supabase.com (Project: Ari and Jorge starter)
- **Vercel Dashboard:** https://vercel.com/dashboard

## Key Commands

```bash
npm run dev          # Start development server
npm run build        # Create production build
npm run lint         # Run linter
npm run type-check   # Check TypeScript errors
```

## Workflow & Documentation

**For Developers:**
- 📘 **`CLAUDE.md`** - Complete workflow guide, coding standards, and best practices
- 🔧 **`MCP_SETUP.md`** - Detailed MCP server setup and troubleshooting

**Golden Rule:** Never work directly on the `main` branch. Always create a feature branch, get PR approval, then merge.

## Getting Help

1. **Ask Claude Code** - Your AI pair programmer (works best with MCP enabled!)
2. **Check `CLAUDE.md`** - Comprehensive project guide
3. **Check `MCP_SETUP.md`** - If having issues with GitHub/Vercel/Supabase commands
4. **Ask your teammate** - Collaboration is key!

## Tech Stack

- **Framework:** Next.js 14 with TypeScript
- **Database:** Supabase (PostgreSQL)
- **Hosting:** Vercel (auto-deploy from main branch)
- **Styling:** Tailwind CSS
- **AI Integration:** Claude Code with MCP servers for GitHub, Vercel, and Supabase

## MCP-Enabled Commands

Once MCP is set up, you can ask Claude Code natural language questions:

**GitHub:**
- "Show me all open pull requests"
- "Create a new branch called feature/my-feature"
- "What files changed in the last commit?"

**Vercel:**
- "What's the deployment status?"
- "Show me the latest deployment logs"
- "List all my Vercel projects"

**Supabase:**
- "Show me the database schema"
- "Query all users from the database"
- "Check if authentication is working"
