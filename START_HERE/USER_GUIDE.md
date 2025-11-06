# Non-Technical User Guide

### Working with Claude Code + GitHub MCP

**Last Updated:** 2025-11-06

---

## Introduction

Welcome! This guide is designed for **non-technical users** who want to contribute to the project using only Claude Code. You don't need to know Git commands, terminal commands, or how to code. Claude Code will handle all the technical details for you.

**What you can do with just Claude Code:**

- Add new features to the application
- Fix bugs and make improvements
- Review and approve your partner's work
- Deploy changes to production
- Never worry about breaking the main branch

**You'll never have to:**

- Type Git commands manually
- Remember branch names
- Worry about merge conflicts
- Know how to use the terminal
- Understand complex Git workflows

---

## Quick Start (First Time Setup)

### Prerequisites

1. Claude Code installed with GitHub MCP configured
2. This repository cloned to your computer
3. Access to the GitHub repository

### Verify You're Ready

Just ask Claude Code:

```
"Am I set up correctly? Check my Git status, Node version, and environment variables."
```

Claude will verify everything and tell you if anything needs fixing.

---

## Daily Workflow (The Golden Path)

### 1. Starting Your Workday

**Just say to Claude Code:**

```
"I'm starting work today. Get me set up with the latest code."
```

**Or use the shortcut command:**

```
/start-work
```

**What Claude Code will do automatically:**

- ✅ Check if you're on the main branch
- ✅ Pull the latest changes from GitHub
- ✅ Create a new feature branch with a good name
- ✅ Verify your environment is ready
- ✅ Tell you you're ready to start

**Why this matters:** You'll always start with the freshest code, and you'll never accidentally work on the main branch (which is protected).

---

### 2. Making Changes

**Just describe what you want in plain English:**

```
"I want to add a new button to the employee directory that sorts by department."
```

```
"The login page should have a 'Remember Me' checkbox."
```

```
"Fix the bug where the date picker doesn't work on mobile."
```

**Claude Code will:**

- ✅ Understand what you want
- ✅ Ask clarifying questions if needed
- ✅ Make the code changes
- ✅ Test that everything still works
- ✅ Show you what was changed

**You can make multiple changes** before moving to the next step. Claude will keep track of everything.

---

### 3. Saving Your Work

When you're ready to save your progress:

```
"I'm happy with these changes. Save my work."
```

**Or use the shortcut:**

```
/finish-work
```

**Claude Code will:**

- ✅ Create a commit with a clear description
- ✅ Push your changes to GitHub
- ✅ Ask if you want to create a Pull Request (PR)

**Important:** Claude will ALWAYS ask before creating a PR. You might want to:

- Make more changes first
- Test the feature yourself
- Review the changes one more time
- Sleep on it and create the PR tomorrow

---

### 4. Creating a Pull Request (PR)

When you're ready for your partner to review:

**Simple commands:**

```
"Create a PR for this branch"
"Create a pull request"
"I'm ready to create a PR"
```

**With details:**

```
"Create a PR titled 'Add user profile page' with a description of what I changed"
"Create a draft PR so I can get early feedback"
"Create a PR and assign it to Jorge for review"
```

**Claude Code will:**

- ✅ Create a PR with a detailed summary
- ✅ Include a test plan
- ✅ Provide you with the PR link
- ✅ Tell you it's ready for review

**What happens next:**

- Vercel automatically creates a preview deployment
- GitHub runs automated tests
- Your partner gets notified to review
- You wait for their approval

---

### 5. Reviewing Your Partner's Work

**Check what needs your review:**

```
"Show me any PRs that need my review."
"Show me all open pull requests"
"What PRs do I have open?"
"Show me Jorge's PRs"
```

**Or use the shortcut:**

```
/check-prs
```

**Check PR status:**

```
"What's the status of my PR?"
"Check the status of PR #5"
"Are the checks passing on my PR?"
"Show me detailed checks for this PR"
```

**View PR details:**

```
"Show me the details of PR #5"
"What changed in this PR?"
"Show me the diff for my PR"
```

**Claude Code will:**

- ✅ List all open PRs
- ✅ Show which ones need your approval
- ✅ Explain what each PR does
- ✅ Provide links to preview deployments

**To review a PR:**

```
"Help me review PR #12."
```

**Claude will:**

- ✅ Show you what changed
- ✅ Explain the changes in plain English
- ✅ Point out anything that looks risky
- ✅ Show you the preview deployment link
- ✅ Ask if you want to approve it

**To approve a PR:**

```
"Approve PR #5"
"This PR looks good, approve it"
"Review and approve Jorge's PR"
```

**To request changes:**

```
"Request changes on PR #5 - needs more tests"
"I reviewed PR #5 and it needs fixes before merging"
"Request changes: the styling needs work"
```

**To add a comment:**

```
"Add a comment to PR #5: 'Great work on this feature!'"
"Comment on Jorge's PR that I found a bug in the login form"
"Leave feedback on PR #5"
```

**To merge a PR:**

```
"Merge my PR"
"Merge PR #5"
"This PR is approved, merge it"
"Squash and merge PR #5"
```

---

### 6. Ending Your Workday

**Wrap up for the day:**

```
"I'm done for today. Clean up my workspace."
```

**Or use the shortcut:**

```
/cleanup
```

**Claude Code will:**

- ✅ Make sure all your work is saved
- ✅ Tell you what PRs are waiting
- ✅ Clean up any old branches
- ✅ Prepare you for tomorrow

---

## Automated Safety Features

### You're Protected By:

#### 1. Branch Protection (AUTOMATIC)

- ❌ **You cannot push to main** - GitHub will block it
- ✅ **You always work on feature branches** - Claude creates them automatically
- ✅ **All changes need PR approval** - Your partner must review

#### 2. Code Quality Checks (AUTOMATIC)

Every time you commit, the system automatically:

- ✅ Fixes code formatting (spacing, quotes, semicolons)
- ✅ Catches common errors
- ✅ Ensures TypeScript types are correct
- ✅ Blocks bad code from being committed

#### 3. Branch Sync Detection (AUTOMATIC)

Claude Code automatically knows when:

- 🔍 Your branch is behind main
- 🔍 Your branch might have conflicts
- 🔍 Main has new features you need

**Claude will suggest:**

```
"Main branch has new changes. Would you like me to sync your branch?"
```

Just say yes, and Claude handles it safely.

#### 4. Merge vs Rebase (AUTOMATIC)

**Claude Code chooses the right strategy:**

- **Rebase:** For feature branches with clean history
- **Merge:** For branches that are already pushed and shared

You don't need to know the difference. Claude picks correctly.

#### 5. Stale Branch Warnings (AUTOMATIC)

If your branch is:

- More than 7 days old
- More than 10 commits behind main

Claude will warn you:

```
"This branch is getting stale. Consider syncing with main or creating a fresh branch."
```

#### 6. Pre-PR Validation (AUTOMATIC)

Before suggesting a PR, Claude always:

- ✅ Runs the full build
- ✅ Checks for TypeScript errors
- ✅ Verifies all tests pass
- ✅ Scans for common mistakes

**You'll never create a broken PR.**

#### 7. Post-Merge Cleanup (AUTOMATIC)

After a PR merges, Claude automatically:

- ✅ Deletes your old feature branch
- ✅ Switches you back to main
- ✅ Pulls the latest code
- ✅ Runs `npm install` if needed
- ✅ Alerts you to any environment changes

---

## Common Tasks (Copy & Paste These)

### Starting Work

```
"I'm starting work today. Get me set up with the latest code."
```

or

```
/start-work
```

### Making a Simple Change

```
"Change the header text from 'Welcome' to 'Welcome Back'."
```

### Adding a New Feature

```
"Add a search bar to the top of the employee directory page."
```

### Fixing a Bug

```
"The login button doesn't work on iPhone. Fix it."
```

### Checking Your Status

```
"Where am I? What branch am I on? What changes have I made?"
```

### Saving Progress

```
"Save my work with the message: Added search functionality"
```

### Syncing with Main

```
"Is my branch up to date? If not, sync it with main."
```

or

```
/sync-main
```

### Creating a PR

```
"Create a pull request for this feature."
```

### Checking PRs

```
"Show me all open pull requests."
```

or

```
/check-prs
```

### Reviewing a Specific PR

```
"Help me review PR #15."
```

### Approving a PR

```
"Approve PR #15 and merge it."
```

### Testing Locally

```
"Start the development server so I can test this."
```

### Checking Deployment Status

```
"Did my changes deploy successfully?"
```

### Emergency Help

```
"Something is broken. Help me figure out what happened."
```

---

## Pull Request Workflow Details

### Understanding PR States

**Draft PR:**

- Work in progress, not ready for review
- Good for getting early feedback
- Can't be merged until marked as "ready"

**Open PR:**

- Ready for review
- Your partner can review and approve
- Can be merged once checks pass and it's approved

**Approved PR:**

- Your partner reviewed and approved it
- CI checks must still pass
- Ready to merge!

**Merged PR:**

- Code is now in main branch
- Branch is automatically deleted
- Vercel deploys to production

### Vercel Preview Deployments

**What Happens Automatically:**
When you create or update a PR:

1. **Vercel builds a preview deployment**
2. **You get a unique URL to test**
3. **Check appears on your PR with the link**

**How to Access:**

```
"Show me the Vercel preview URL for my PR"
"What's the preview deployment link?"
```

**Why This is Useful:**

- Test your changes in a real environment
- Share with others to get feedback
- Make sure everything works before merging to production

### Important PR Reminders

**Before Creating a PR:**
✅ **Do:**

- Make sure your code works locally
- Test your changes thoroughly
- Write a clear PR title and description
- Let pre-commit hooks fix formatting automatically

❌ **Don't:**

- Create PRs with failing tests
- Skip testing your changes
- Use vague PR titles like "updates" or "fixes"

**When Reviewing a PR:**
✅ **Do:**

- Actually test the changes locally
- Check the Vercel preview
- Give constructive feedback
- Approve if everything looks good

❌ **Don't:**

- Approve without testing
- Leave vague feedback like "fix this"
- Let PRs sit for days without review

**After Merging:**
✅ **Do:**

- Pull the latest main
- Delete the old branch (Claude does this automatically)
- Start a new feature branch for your next task

❌ **Don't:**

- Keep working on the old branch
- Forget to pull latest main
- Create PRs from main branch

### Common PR Workflows

**Workflow 1: Creating Your First PR**

1. You've been working on a feature
2. Say: "I'm ready to create a PR for my changes"
3. Claude creates the PR and shows you the link
4. Ask your partner to review (send them the PR link or they can ask: "Show me all open PRs")
5. Wait for approval
6. After approval: "Merge my PR"

**Workflow 2: Reviewing Your Partner's PR**

1. See what needs review: "Show me all open PRs"
2. Check the PR status: "Check the status of PR #5"
3. Test it locally (optional but recommended):
   - "Check out PR #5 so I can test it"
   - "Run the development server"
   - Test the features in your browser
4. Leave feedback:
   - If it looks good: "Approve PR #5"
   - If it needs changes: "Request changes on PR #5 - the button styling doesn't match our design"
5. Return to your work: "Switch back to main branch" then "Pull the latest changes from main"

**Workflow 3: Your PR Has Merge Conflicts**
If your PR has conflicts with main:

1. Update your branch: "Pull the latest main into my branch" or "Update my branch with main"
2. Claude will help resolve conflicts
3. Test to make sure everything still works: "Run the dev server"
4. Push the updates: "Push these changes"

**Workflow 4: Checking CI Status**
All PRs must pass automated checks before merging:

1. Check what's running: "What's the status of checks on my PR?" or "Show me the CI status"
2. If checks fail: "Show me why the build failed" or "Help me fix the failing tests"

---

## Understanding the Workflow

### Visual Workflow

```
START YOUR DAY
    ↓
[Pull Latest Main]
    ↓
[Create Feature Branch] ← You're here
    ↓
[Make Changes] ← Claude helps
    ↓
[Commit & Push] ← Automatic checks run
    ↓
[Create PR] ← You decide when
    ↓
[Partner Reviews] ← They test it
    ↓
[PR Approved] ← They approve
    ↓
[Merge to Main] ← Goes live!
    ↓
[Vercel Deploys] ← Automatic
    ↓
[Cleanup Branch] ← Claude does this
    ↓
READY FOR NEXT FEATURE
```

### Branch Lifecycle

```
main (protected)
  ├── feature/add-search ← You work here
  │   └── changes saved ← Regular commits
  │   └── pushed to GitHub ← Your changes backed up
  │   └── PR created ← Ready for review
  │   └── approved ← Partner says yes
  │   └── merged → main ← Feature is live!
  │   └── deleted ← Branch cleanup
  └── feature/next-thing ← Start fresh
```

---

## Troubleshooting

### "I'm not sure what branch I'm on"

**Ask Claude:**

```
"What branch am I on? Show me my git status."
```

### "I made changes but don't want them anymore"

**Ask Claude:**

```
"I want to undo my recent changes and start over."
```

Claude will safely discard changes or help you start a new branch.

### "My partner merged their PR, now my branch has conflicts"

**Ask Claude:**

```
"My branch has conflicts with main. Help me fix them."
```

Claude will:

1. Explain what conflicted
2. Show you both versions
3. Ask which you want to keep
4. Fix it safely

### "The Vercel deployment failed"

**Ask Claude:**

```
"Show me the Vercel deployment logs and help me fix the error."
```

Claude will:

1. Fetch the logs
2. Explain the error
3. Suggest a fix
4. Implement it if you approve

### "I accidentally committed something I shouldn't have"

**Ask Claude:**

```
"I committed something by mistake. Can we undo the last commit?"
```

Claude will safely undo the commit if it hasn't been pushed yet.

### "I want to test my partner's PR before approving"

**Ask Claude:**

```
"Check out PR #15 locally so I can test it"
"I want to test PR #5 locally"
"Switch to the branch from PR #5"
```

Claude will:

1. Switch to their branch
2. Pull their changes
3. Start the dev server
4. Let you test it
5. Switch you back when done

**After testing:**

```
"Go back to main branch"
"I'm done testing, switch back to my branch"
```

### "My PR can't be merged"

**Possible reasons:**

1. **CI checks failing** → "Show me why the checks failed"
2. **Merge conflicts** → "Update my branch with main"
3. **Needs approval** → Ask your partner to review
4. **Stale branch** → "Update my branch with latest main"

### "I pushed to my branch but Vercel didn't deploy"

This is **expected behavior**! Vercel only deploys:

- Commits to **main** branch (production)
- Commits in an **active PR** (preview)

Feature branch pushes **without a PR** are intentionally ignored.

### "I want to cancel my PR"

```
"Close PR #5 without merging"
"I don't want to merge this PR, close it"
```

### "I merged by accident!"

```
"Revert PR #5"
"Undo the merge of PR #5"
```

### "I'm stuck and don't know what to do"

**Just ask:**

```
"I'm stuck. Can you explain what state I'm in and what my options are?"
```

Claude will explain everything clearly and suggest next steps.

---

## Quick Reference Card

### Custom Commands (Shortcuts)

| Command        | What It Does                                             |
| -------------- | -------------------------------------------------------- |
| `/start-work`  | Pull main, create feature branch, get ready to work      |
| `/finish-work` | Commit, push, offer PR creation                          |
| `/sync-main`   | Sync your branch with latest main changes                |
| `/check-prs`   | Show all open PRs and which need review                  |
| `/cleanup`     | End-of-day cleanup (delete merged branches, update main) |

### Git Status Meanings

| Status                       | What It Means           | What To Do                            |
| ---------------------------- | ----------------------- | ------------------------------------- |
| On branch main               | ⚠️ Don't work here!     | Ask Claude to create a feature branch |
| On branch feature/xyz        | ✅ Safe to work         | Make your changes                     |
| Your branch is up to date    | ✅ Good                 | Continue working                      |
| Your branch is behind        | ⚠️ Main has new stuff   | Run `/sync-main`                      |
| Your branch is ahead         | ✅ You have new changes | Ready to push                         |
| You have uncommitted changes | 💾 Save your work       | Ask Claude to commit                  |

### PR Status Meanings

| Status                | What It Means               |
| --------------------- | --------------------------- |
| ✅ All checks passed  | Code looks good             |
| ❌ Some checks failed | Need to fix something       |
| 💬 Changes requested  | Partner wants modifications |
| ✔️ Approved           | Ready to merge!             |
| 🔄 Merged             | Live in production!         |

---

## Best Practices

### DO:

- ✅ Start every day with `/start-work`
- ✅ Commit often (every meaningful change)
- ✅ Review partner PRs within 24 hours
- ✅ Test changes before creating PR
- ✅ Ask Claude questions when unsure
- ✅ Use clear, descriptive feature names
- ✅ Read PR descriptions before reviewing

### DON'T:

- ❌ Work directly on main (GitHub blocks this anyway)
- ❌ Skip PR reviews (always review partner's work)
- ❌ Approve PRs without testing them
- ❌ Let PRs sit for days without response
- ❌ Force-push without asking Claude first
- ❌ Panic when you see errors (ask Claude to help)

---

## Understanding What Claude Code Does

### When You Ask Claude to Start Work:

```bash
# Behind the scenes (you don't need to know this):
git checkout main
git pull origin main
git checkout -b feature/your-feature-name
```

### When You Ask Claude to Save Work:

```bash
# Behind the scenes:
git add .
git commit -m "Clear description of changes"
git push origin feature/your-feature-name
```

### When You Ask Claude to Create a PR:

Claude uses the GitHub MCP to:

1. Create a PR via GitHub API
2. Add detailed description
3. Link to related issues
4. Request review from your partner

### When You Ask Claude to Sync with Main:

Claude intelligently chooses:

```bash
# Option 1: Rebase (for clean history)
git fetch origin
git rebase origin/main

# Option 2: Merge (if already pushed)
git fetch origin
git merge origin/main
```

**You don't need to remember any of this.** Claude handles it all.

---

## Advanced Scenarios

### Working on Multiple Features

**Ask Claude:**

```
"I want to pause work on this feature and start a different one."
```

Claude will:

1. Commit your current work
2. Push it to GitHub (so it's safe)
3. Switch back to main
4. Create a new feature branch
5. You can come back anytime

### Coming Back to an Old Feature

**Ask Claude:**

```
"I want to continue working on the search feature from last week."
```

Claude will:

1. Find your old feature branch
2. Switch to it
3. Sync it with main if needed
4. Let you continue working

### Handling Urgent Fixes

**Ask Claude:**

```
"There's a bug in production. I need to fix it urgently."
```

Claude will:

1. Save your current work
2. Create a hotfix branch from main
3. Help you fix the bug
4. Fast-track the PR process
5. Return you to your previous work

---

## Getting Help

### From Claude Code:

```
"I need help with [describe your situation]"
```

Claude will:

- Explain your current state
- Suggest next steps
- Handle technical details
- Guide you through the solution

### From Your Partner:

- Slack/Email them about the PR
- Schedule a quick call to discuss
- Share your screen if confused

### From Documentation:

- **This guide:** Day-to-day workflow and PR management
- **[CLAUDE.md](../CLAUDE.md):** Technical details (for Claude)
- **[README.md](./README.md):** Initial setup and overview

---

## Conclusion

With Claude Code + GitHub MCP, you can contribute to the project without knowing Git, terminal commands, or complex workflows. Claude Code handles all the technical details automatically.

**Remember:**

1. Start every day with `/start-work`
2. Make changes in plain English
3. Save work with `/finish-work`
4. Review partner PRs with `/check-prs`
5. Ask Claude when unsure

**You're protected by:**

- Branch protection (can't break main)
- Automatic code quality checks
- Automatic sync detection
- Automatic PR validation
- Automatic deployment

**Happy coding! 🚀**

---

## Quick Help

**Stuck?** Ask Claude: `"I'm stuck. Help me understand where I am."`

**Lost?** Ask Claude: `"Show me my git status and explain what it means."`

**Confused?** Ask Claude: `"Explain [anything] to me in simple terms."`

**Broken?** Ask Claude: `"Something is wrong. Help me troubleshoot."`

Claude Code is here to help you every step of the way.
