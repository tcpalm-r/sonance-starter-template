# Pull Request Workflow Guide

## For Non-Technical Collaborators Using Claude Code

This guide shows you how to manage Pull Requests (PRs) using **natural language** with Claude Code. You don't need to remember commands - just talk to Claude naturally!

---

## Table of Contents

1. [Creating Pull Requests](#creating-pull-requests)
2. [Viewing & Checking PRs](#viewing--checking-prs)
3. [Reviewing Pull Requests](#reviewing-pull-requests)
4. [Testing Someone's Code](#testing-someones-code)
5. [Commenting on PRs](#commenting-on-prs)
6. [Merging Pull Requests](#merging-pull-requests)
7. [Common Workflows](#common-workflows)

---

## Creating Pull Requests

### How to Ask Claude

**Simple:**

```
"Create a PR for this branch"
"Create a pull request"
"I'm ready to create a PR"
```

**With Details:**

```
"Create a PR titled 'Add user profile page' with a description of what I changed"
"Create a draft PR so I can get early feedback"
"Create a PR and assign it to Jorge for review"
```

### What Claude Does

Behind the scenes, Claude uses:

```bash
gh pr create --title "Your title" --body "Description"
```

---

## Viewing & Checking PRs

### How to Ask Claude

**List PRs:**

```
"Show me all open pull requests"
"What PRs do I have open?"
"List all PRs"
"Show me Jorge's PRs"
```

**Check Status:**

```
"What's the status of my PR?"
"Check the status of PR #5"
"Are the checks passing on my PR?"
"Show me detailed checks for this PR"
```

**View PR Details:**

```
"Show me the details of PR #5"
"What changed in this PR?"
"Show me the diff for my PR"
```

### What Claude Does

```bash
# List PRs
gh pr list
gh pr list --author "@me"

# Check status
gh pr status
gh pr checks 5

# View details
gh pr view 5
gh pr diff
```

---

## Reviewing Pull Requests

### How to Ask Claude

**Approve:**

```
"Approve PR #5"
"This PR looks good, approve it"
"Review and approve Jorge's PR"
```

**Request Changes:**

```
"Request changes on PR #5 - needs more tests"
"I reviewed PR #5 and it needs fixes before merging"
"Request changes: the styling needs work"
```

**General Comments:**

```
"Leave a review comment on PR #5"
"Add a comment to the review"
```

### What Claude Does

```bash
# Approve
gh pr review 5 --approve

# Request changes
gh pr review 5 --request-changes --body "Needs more tests"

# Comment
gh pr review 5 --comment --body "Overall looks good"
```

---

## Testing Someone's Code

When your partner creates a PR, you can test their code on your computer before approving!

### How to Ask Claude

```
"Check out Jorge's PR #5 so I can test it"
"I want to test PR #5 locally"
"Switch to the branch from PR #5"
```

### What Claude Does

```bash
gh pr checkout 5
```

### After Testing

```
"Go back to main branch"
"I'm done testing, switch back to my branch"
```

---

## Commenting on PRs

### How to Ask Claude

```
"Add a comment to PR #5: 'Great work on this feature!'"
"Comment on Jorge's PR that I found a bug in the login form"
"Leave feedback on PR #5"
```

### What Claude Does

```bash
gh pr comment 5 --body "Your comment here"
```

---

## Merging Pull Requests

### How to Ask Claude

**Simple Merge:**

```
"Merge my PR"
"Merge PR #5"
"This PR is approved, merge it"
```

**Specific Merge Strategy:**

```
"Squash and merge PR #5"
"Merge PR #5 with a merge commit"
"Rebase and merge my PR"
```

**Auto-merge (when checks pass):**

```
"Auto-merge PR #5 when all checks pass"
```

### What Claude Does

```bash
# Default merge
gh pr merge 5 --squash --delete-branch

# Different strategies
gh pr merge 5 --merge          # Merge commit
gh pr merge 5 --rebase         # Rebase
gh pr merge 5 --squash         # Squash commits

# Auto-merge
gh pr merge 5 --auto
```

---

## Common Workflows

### Workflow 1: Creating Your First PR

1. **You've been working on a feature:**

   ```
   "I'm ready to create a PR for my changes"
   ```

2. **Claude creates the PR and shows you the link**

3. **Ask your partner to review:**
   - Send them the PR link
   - Or they can ask: "Show me all open PRs"

4. **Wait for approval**

5. **After approval:**
   ```
   "Merge my PR"
   ```

---

### Workflow 2: Reviewing Your Partner's PR

1. **See what needs review:**

   ```
   "Show me all open PRs"
   ```

2. **Check the PR status:**

   ```
   "Check the status of PR #5"
   ```

3. **Test it locally (optional but recommended):**

   ```
   "Check out PR #5 so I can test it"
   "Run the development server"
   ```

   - Test the features in your browser
   - Make sure everything works

4. **Leave feedback:**

   **If it looks good:**

   ```
   "Approve PR #5"
   ```

   **If it needs changes:**

   ```
   "Request changes on PR #5 - the button styling doesn't match our design"
   ```

5. **Return to your work:**
   ```
   "Switch back to main branch"
   "Pull the latest changes from main"
   ```

---

### Workflow 3: Your PR Has Merge Conflicts

If your PR has conflicts with main:

1. **Update your branch:**

   ```
   "Pull the latest main into my branch"
   "Update my branch with main"
   ```

2. **Claude will help resolve conflicts**

3. **Test to make sure everything still works:**

   ```
   "Run the dev server"
   ```

4. **Push the updates:**
   ```
   "Push these changes"
   ```

---

### Workflow 4: Checking CI Status

All PRs must pass automated checks before merging:

1. **Check what's running:**

   ```
   "What's the status of checks on my PR?"
   "Show me the CI status"
   ```

2. **If checks fail:**
   ```
   "Show me why the build failed"
   "Help me fix the failing tests"
   ```

---

## Understanding PR States

### Draft PR

- Work in progress, not ready for review
- Good for getting early feedback
- Can't be merged until marked as "ready"

### Open PR

- Ready for review
- Your partner can review and approve
- Can be merged once checks pass and it's approved

### Approved PR

- Your partner reviewed and approved it
- CI checks must still pass
- Ready to merge!

### Merged PR

- Code is now in main branch
- Branch is automatically deleted
- Vercel deploys to production

---

## Vercel Preview Deployments

### What Happens Automatically

When you create or update a PR:

1. **Vercel builds a preview deployment**
2. **You get a unique URL to test**
3. **Check appears on your PR with the link**

### How to Access

```
"Show me the Vercel preview URL for my PR"
"What's the preview deployment link?"
```

### Why This is Useful

- Test your changes in a real environment
- Share with others to get feedback
- Make sure everything works before merging to production

---

## Important Reminders

### Before Creating a PR

✅ **Do:**

- Make sure your code works locally
- Test your changes thoroughly
- Write a clear PR title and description
- Let pre-commit hooks fix formatting automatically

❌ **Don't:**

- Create PRs with failing tests
- Skip testing your changes
- Use vague PR titles like "updates" or "fixes"

### When Reviewing a PR

✅ **Do:**

- Actually test the changes locally
- Check the Vercel preview
- Give constructive feedback
- Approve if everything looks good

❌ **Don't:**

- Approve without testing
- Leave vague feedback like "fix this"
- Let PRs sit for days without review

### After Merging

✅ **Do:**

- Pull the latest main
- Delete the old branch (Claude does this automatically)
- Start a new feature branch for your next task

❌ **Don't:**

- Keep working on the old branch
- Forget to pull latest main
- Create PRs from main branch

---

## Troubleshooting

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

---

## Quick Reference

| What You Want   | What to Say to Claude                   |
| --------------- | --------------------------------------- |
| Create PR       | "Create a PR for this branch"           |
| List PRs        | "Show me all open PRs"                  |
| Check status    | "What's the status of my PR?"           |
| Review checks   | "Show me the CI checks for PR #5"       |
| Approve         | "Approve PR #5"                         |
| Request changes | "Request changes on PR #5 - needs work" |
| Test locally    | "Check out PR #5 so I can test it"      |
| Comment         | "Add a comment to PR #5"                |
| Merge           | "Merge my PR"                           |
| Close           | "Close PR #5 without merging"           |

---

## Next Steps

1. **Practice** - Create a test PR to get comfortable
2. **Communicate** - Use PR descriptions and comments
3. **Review thoroughly** - Always test before approving
4. **Merge often** - Don't let PRs sit for days
5. **Stay synced** - Pull latest main regularly

Remember: **Claude Code handles all the complex git commands** - you just describe what you want in plain English!
