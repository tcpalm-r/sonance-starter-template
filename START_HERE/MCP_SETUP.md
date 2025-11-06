# MCP Server Setup Guide

## What is MCP?

Model Context Protocol (MCP) allows Claude Code to interact with external services like GitHub and Supabase using natural language commands.

**Instead of running technical commands, you can just ask:**

- "Show me all open pull requests"
- "Query the users table in Supabase"
- "Create a new branch for my feature"

---

## Quick Setup (3 Minutes)

### Prerequisites

Before you start, you'll need:

1. **Cursor IDE** installed and open with this project
2. **Two API credentials** (instructions below on how to get them)

### Step 1: Get Your API Tokens

#### GitHub Personal Access Token

1. Go to: https://github.com/settings/tokens
2. Click **"Generate new token"** → **"Generate new token (classic)"**
3. Give it a name like "MCP Server"
4. Select these scopes:
   - ✅ `repo` (Full control of private repositories)
   - ✅ `workflow` (Update GitHub Action workflows)
   - ✅ `read:org` (Read org and team membership)
5. Click **"Generate token"** at the bottom
6. **Copy the token** (you won't see it again!)

#### Supabase Project Reference ID

1. Go to: https://app.supabase.com
2. Select your **"Ari and Jorge starter"** project
3. Click **Settings** (gear icon) → **General**
4. Copy the **"Reference ID"** (looks like: `kjfizpagyleefuucsdbu`)

### Step 2: Run the Setup Script

Open a terminal in this project directory and run:

```bash
./setup-mcp.sh
```

The script will prompt you for:

1. GitHub Personal Access Token
2. Supabase Project Reference ID

Just paste them in when asked.

### Step 3: Restart Cursor

After the script completes:

1. **Quit Cursor completely** (Cmd+Q on Mac)
2. **Reopen Cursor**
3. **Open this project**

### Step 4: Test It!

Try asking Claude Code:

- "Show me all open pull requests on GitHub"
- "Show me the database tables in Supabase"
- "Create a new feature branch"

---

## What Gets Installed?

The project includes two MCP servers (both hosted remotely):

### 1. **GitHub MCP** (Remote)

- **URL:** `https://api.githubcopilot.com/mcp/`
- **Purpose:** Manages repositories, pull requests, issues, and workflows
- **Authentication:** Your GitHub Personal Access Token
- **Example commands:** "Show me all open PRs", "Create a feature branch"

### 2. **Supabase MCP** (Remote)

- **URL:** `https://mcp.supabase.com/mcp`
- **Purpose:** Query database, manage tables, check auth status
- **Authentication:** Your project reference ID
- **Example commands:** "Show database schema", "Query the employees table"

### Note on Vercel

Vercel MCP has been intentionally excluded due to security concerns (API tokens provide excessive permissions). Use the Vercel CLI (`vercel` command) or Vercel dashboard for deployment operations instead.

---

## Configuration Files

Your MCP setup consists of:

- **`.cursor/mcp.json`** - MCP server configuration (committed to git)
- **`.cursor/.env.mcp`** - Your API tokens (NOT committed, git-ignored)
- **`setup-mcp.sh`** - Easy setup script (committed to git)

Only your tokens are kept private. Everything else is shared with the team.

---

## Troubleshooting

### "MCP servers not showing up"

1. Make sure you ran `./setup-mcp.sh` successfully
2. Check that `.cursor/.env.mcp` exists with your tokens
3. Restart Cursor completely (Cmd+Q, then reopen)

### "GitHub/Supabase commands not working"

- Verify your API credentials are correct in `.cursor/.env.mcp`
- Check GitHub token hasn't expired (tokens can expire)
- Ensure GitHub token has the right scopes: `repo`, `workflow`, `read:org`
- Verify Supabase project reference ID matches your project

### "Permission denied" when running setup script

Run: `chmod +x setup-mcp.sh`

---

## Security Notes

**Your API tokens:**

- ✅ Stored locally in `.cursor/.env.mcp`
- ✅ Protected by `.gitignore` (never committed)
- ✅ Only accessible to you on your machine
- ❌ Never shared in the repository
- ❌ Not visible to others

**Best practices:**

- Don't share your `.cursor/.env.mcp` file
- Rotate tokens regularly (every 90 days)
- Use tokens with minimum required permissions
- If a token is compromised, revoke it immediately

---

## For Team Members

When a new person joins:

1. **Clone the repository** (MCP config is already included)
2. **Run `./setup-mcp.sh`** with their own API tokens
3. **Restart Cursor**
4. **Start collaborating!**

Each person uses their own API tokens - never share tokens between team members.

---

## Advanced: Manual Configuration

If you prefer to configure manually without the script:

1. Copy `.cursor/.env.mcp.example` to `.cursor/.env.mcp`
2. Edit `.cursor/.env.mcp` and add your two credentials:
   - `GITHUB_PERSONAL_ACCESS_TOKEN`
   - `SUPABASE_PROJECT_REF`
3. Restart Cursor

---

## Need Help?

- Check the `CLAUDE.md` file for workflow guidelines
- Ask Claude Code: "Help me troubleshoot MCP setup"
- Review Cursor MCP docs: https://docs.cursor.com/context/model-context-protocol
