# Git Worktrees Directory

This directory contains additional working directories for parallel development.

## What are Git Worktrees?

Git worktrees allow you to check out multiple branches of the same repository in separate directories. This enables:

- **Parallel development**: Work on multiple features simultaneously
- **Multiple agents**: Run different AI agents in separate workspaces
- **Independent dev servers**: Each worktree can run its own `npm run dev`

## Usage

See `CLAUDE.md` → "Git Worktrees (Parallel Agent Work)" section for complete documentation.

### Quick Commands

```bash
# Create a new worktree
./scripts/worktree.sh create feature/my-feature

# List all worktrees
./scripts/worktree.sh list

# Remove a worktree
./scripts/worktree.sh remove feature/my-feature
```

## Directory Structure

Each worktree is created as a subdirectory here:

```
worktrees/
  feature/my-feature/
    (full project files, node_modules, etc.)
  feature/another-feature/
    (full project files, node_modules, etc.)
```

## Notes

- Each worktree shares the same `.git` directory (from main repo)
- `.env.local` is symlinked from the main repository
- `node_modules/` are created per worktree (not shared)
- All worktrees follow the same Golden Rules (feature branches, PRs, etc.)

