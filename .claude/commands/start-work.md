# Start Work

You are helping the user start their workday with a fresh, safe development environment.

## Your Task

Execute the following workflow automatically and safely:

### 1. Check Current Status

- Check which branch the user is currently on
- Check if there are any uncommitted changes
- Check git status to understand current state

### 2. Handle Uncommitted Changes (if any)

If the user has uncommitted changes:

- Ask: "You have uncommitted changes. Would you like to: (1) Commit them first, (2) Discard them, or (3) Stash them for later?"
- Wait for their response and handle accordingly
- Only proceed after changes are handled

### 3. Switch to Main Branch

- If not already on main: `git checkout main`
- Confirm you're on the main branch

### 4. Pull Latest Changes

- Execute: `git pull origin main`
- If there are errors (e.g., conflicts), explain them clearly and ask how to proceed
- Show the user a summary of what new changes were pulled

### 5. Check for Updates

- If `package-lock.json` was updated: run `npm install`
- If `.env.local.example` was updated: warn user to check their `.env.local` file
- If there are new dependencies or environment changes, explain them

### 6. Create Feature Branch

- Ask the user: "What feature are you working on?" (for branch naming)
- Suggest a branch name based on their description (e.g., `feature/add-search-bar`)
- Create and switch to the new branch: `git checkout -b [branch-name]`

### 7. Verify Environment

- Check that `.env.local` exists and has required variables
- Run `npm run type-check` to ensure no TypeScript errors exist
- Confirm everything is ready

### 8. Confirm Ready State

Tell the user:

```
✅ You're all set up and ready to work!

Current branch: [branch-name]
Status: Clean working directory
Environment: Verified
Latest changes: [summary of what was pulled]

You can now start making changes. Just tell me what you'd like to build!
```

## Important Rules

- **NEVER** let the user work directly on main branch
- **ALWAYS** pull latest changes before creating a new branch
- **ALWAYS** create a descriptive feature branch name
- **ALWAYS** verify environment is ready before saying "you're ready"
- If anything fails, explain clearly and suggest solutions
- Use the GitHub MCP if you need to check remote branch status

## Error Handling

### If pull fails due to conflicts:

"There are conflicts on the main branch. This is unusual. Let me help you resolve this safely."

### If npm install fails:

"Dependencies failed to install. Let me check the error and help you fix it."

### If .env.local is missing:

"Your .env.local file is missing. Let me help you set it up using .env.local.example as a template."

### If already on a feature branch with changes:

"You're already on a feature branch with changes. Would you like to: (1) Continue working on this branch, (2) Finish this work first, or (3) Switch to a new feature?"

## Success Criteria

You've successfully completed this command when:

- ✅ User is on a new feature branch (not main)
- ✅ Branch is up-to-date with latest main
- ✅ Working directory is clean
- ✅ Environment is verified and ready
- ✅ User knows they can start working
