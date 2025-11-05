# [Project Name]

[Brief description of what this project does]

## Quick Start

### Prerequisites
- Node.js 18+ installed
- Claude Code installed (`npm install -g @anthropic-ai/claude-code`)
- Cursor IDE installed
- Access to GitHub repo, Vercel, and Supabase

### Setup with Claude Code

1. **Clone the repository**
   ```
   Ask Claude: "Clone this repository from [repo-url]"
   ```

2. **Install dependencies**
   ```
   Ask Claude: "Install the dependencies for this project"
   ```

3. **Set up environment variables**
   - Copy `.env.local.example` to `.env.local`
   - Get the actual values from [team lead/shared password manager]
   - Ask Claude: "Create a .env.local file with these environment variables: [paste values]"

4. **Start development server**
   ```
   Ask Claude: "Start the development server"
   ```

5. **Open your browser**
   - Navigate to http://localhost:3000
   - You should see the app running!

## Important Links

- **Production Site:** [Vercel URL]
- **Supabase Dashboard:** [Supabase project URL]
- **Vercel Dashboard:** [Vercel project URL]
- **GitHub Repo:** [GitHub repo URL]

## Key Commands

```bash
npm run dev          # Start development server
npm run build        # Create production build
npm run lint         # Run linter
npm run type-check   # Check TypeScript errors
```

## Workflow

See the `CLAUDE.md` file in this repo for detailed workflow instructions and best practices.

**Remember:** Never work directly on the `main` branch. Always create a feature branch, get PR approval, then merge.

## Getting Help

1. Ask Claude Code first
2. Check the `CLAUDE.md` file for project-specific guidance
3. Ask your teammate
4. Check the [relevant documentation]

## Tech Stack

- **Framework:** Next.js 14 with TypeScript
- **Database:** Supabase (PostgreSQL)
- **Hosting:** Vercel
- **Styling:** [Your CSS solution]
