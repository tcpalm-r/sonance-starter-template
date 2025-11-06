# Finish Work

You are helping the user save their work and optionally create a Pull Request.

## Your Task

Execute the following workflow automatically and safely:

### 1. Check Current Status

- Check which branch the user is on
- Verify they're NOT on main branch (if they are, warn them and stop)
- Check what files have been modified: `git status`
- Show the user a summary of what changed

### 2. Review Changes with User

- Show a summary of modified files
- Ask: "I see changes to these files. Are you ready to save all of this work?"
- If user wants to review: show diffs of key changes
- If user wants to exclude some files: handle that

### 3. Run Pre-Commit Validation

Before committing:

- Run `npm run type-check` to catch TypeScript errors
- Run `npm run build` to ensure production build works
- If either fails, explain the errors and offer to fix them
- Do NOT proceed with commit if validation fails

### 4. Stage and Commit Changes

- Stage all relevant files: `git add .` (or specific files if user requested)
- Generate a clear, descriptive commit message based on the changes
- Follow conventional commit format: `feat:`, `fix:`, `docs:`, `refactor:`, etc.
- Show the user the proposed commit message
- Ask: "Does this commit message accurately describe your changes?"
- If approved, commit: `git commit -m "[message]"`

### 5. Push to Remote

- Push changes to the remote branch: `git push origin [branch-name]`
- If this is the first push: `git push -u origin [branch-name]`
- Confirm push was successful
- Provide the GitHub branch URL

### 6. Ask About Pull Request

**IMPORTANT:** Do NOT automatically create a PR. Always ask first:

"Your changes have been pushed to GitHub successfully!

Would you like to:

1. **Create a Pull Request now** - Ready for review
2. **Continue working on this branch** - Add more changes later
3. **Test it yourself first** - Review locally before PR
4. **Wait until tomorrow** - Sleep on it

What would you like to do?"

### 7. If User Chooses to Create PR

Only if user explicitly confirms:

- Use GitHub MCP to create a PR
- Generate a comprehensive PR description including:
  - Summary of changes (bullet points)
  - What problem this solves
  - Test plan (how to verify it works)
  - Screenshots/videos if UI changes
- Set base branch to `main`
- Request review from the other team member
- Provide the PR URL
- Remind user about automatic Vercel preview deployment

### 8. Confirm Completion

Tell the user:

```
✅ Work saved successfully!

Branch: [branch-name]
Commit: [commit-hash] - [commit-message]
Status: Pushed to GitHub
[If PR created: Pull Request: [PR-URL]]
[If PR created: Preview deployment will be ready in ~2 minutes]

[Next steps based on their choice]
```

## Important Rules

- **NEVER** commit directly to main branch
- **NEVER** create a PR without asking the user first
- **ALWAYS** run type-check and build before committing
- **ALWAYS** generate meaningful commit messages
- **ALWAYS** push before offering to create a PR
- If pre-commit hooks modify files (Prettier, ESLint), include those changes automatically
- If validation fails, help fix issues before proceeding

## Error Handling

### If on main branch:

"⚠️ You're on the main branch! We should never commit directly to main. Let me create a feature branch for you first."

### If no changes to commit:

"It looks like there are no changes to save. Everything is already committed. Would you like to push your existing commits or create a PR?"

### If type-check fails:

"There are TypeScript errors that need to be fixed before committing:
[show errors]

Would you like me to fix these errors first?"

### If build fails:

"The production build is failing. This would break the deployment:
[show error]

Would you like me to help fix this?"

### If push fails (e.g., branch diverged):

"The push failed because the remote branch has changes you don't have locally. This can happen if:

- You're working from multiple computers
- Someone else pushed to your branch
- The branch was updated on GitHub directly

Would you like me to pull the remote changes and retry?"

### If PR creation fails:

"I couldn't create the PR automatically. This might be because:

- GitHub API is temporarily unavailable
- There's already a PR for this branch
- Authentication needs to be refreshed

You can create the PR manually at: [provide URL to compare page]"

## Commit Message Guidelines

Generate commit messages following this format:

**For new features:**

```
feat: add search functionality to employee directory

Implements a search bar that filters employees by name,
department, and location in real-time.
```

**For bug fixes:**

```
fix: resolve mobile date picker issue

The date picker was not displaying correctly on iOS devices.
Updated to use native input type for better compatibility.
```

**For documentation:**

```
docs: update USER_GUIDE with PR workflow

Added section explaining how to review and approve PRs
for non-technical users.
```

**For refactoring:**

```
refactor: extract employee card into reusable component

Separated employee card logic into standalone component
for better reusability and testing.
```

**For tests:**

```
test: add unit tests for authentication flow

Added tests covering login, logout, and session validation.
```

## PR Description Template

When creating a PR, use this template:

```markdown
## Summary

[2-3 bullet points explaining what changed]

## Problem / Motivation

[Why was this change needed?]

## Solution

[How does this PR solve the problem?]

## Test Plan

- [ ] Tested locally in development mode
- [ ] Verified production build works
- [ ] Tested on mobile devices (if UI changes)
- [ ] Verified database queries work (if DB changes)
- [ ] Checked for console errors
- [ ] [Add specific test cases based on changes]

## Screenshots / Video

[If UI changes, include visual evidence]

## Deployment Notes

[Any special considerations for deployment]
[Any environment variable changes needed]

---

🤖 Generated with [Claude Code](https://claude.com/claude-code)
```

## Success Criteria

You've successfully completed this command when:

- ✅ Changes are validated (type-check and build pass)
- ✅ Changes are committed with a clear message
- ✅ Changes are pushed to GitHub
- ✅ User has made an informed decision about PR creation
- ✅ If PR created: PR is open with comprehensive description
- ✅ User knows what their next steps are
