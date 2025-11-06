# Cleanup

You are helping the user clean up their workspace at the end of the workday or after completing work.

## Your Task

Execute the following workflow to ensure a clean workspace:

### 1. Check Current Status

- Check which branch the user is currently on
- Check for uncommitted changes
- Check git status to understand current state
- Use GitHub MCP to check for recently merged PRs

### 2. Handle Uncommitted Changes (if any)

If there are uncommitted changes:

```
⚠️ You have uncommitted changes!

Would you like to:
1. Commit and save them first
2. Keep working on them (skip cleanup)
3. Discard them (⚠️ this cannot be undone!)

What would you like to do?
```

Wait for user response and handle accordingly.

### 3. Identify Merged Branches

Check for branches that have been merged:

- Use GitHub MCP to find recently merged PRs
- Get list of all local branches: `git branch`
- Identify which local branches correspond to merged PRs
- Identify stale branches (> 7 days since last commit)

### 4. Confirm Branch Deletion

Show user what will be cleaned up:

```
🧹 Cleanup Summary

Merged branches (safe to delete):
- feature/add-search (merged 2 hours ago in PR #15)
- feature/fix-mobile-nav (merged yesterday in PR #12)

Stale branches (no activity for 7+ days):
- feature/old-experiment (last activity: 10 days ago)
  ⚠️ Not merged - may contain work you want to keep

Current branch: feature/current-work
This branch will be kept (you're working on it)

Delete merged branches automatically? (y/n)
For stale branches, I'll ask you individually.
```

### 5. Delete Merged Branches

For each merged branch:

- Verify it's not the current branch
- Verify it's fully merged to main
- Delete local branch: `git branch -d [branch-name]`
- Delete remote branch: `git push origin --delete [branch-name]` (optional, ask first)

For stale branches:

```
Branch: feature/old-experiment
Last commit: 10 days ago
Status: Not merged to main

Would you like to:
1. Keep it (might have work you need)
2. Delete it (⚠️ work will be lost unless pushed)
3. Show me what's in it first

What would you like to do?
```

### 6. Update Main Branch

Switch to and update main:

- `git checkout main`
- `git pull origin main`
- Show summary of what was pulled

If `package-lock.json` changed:

- Run `npm install`
- Confirm dependencies updated

If `.env.local.example` changed:

```
⚠️ Environment variables template was updated!

You may need to update your .env.local file.
Would you like me to show you what changed?
```

### 7. Check for Pending Work

Provide a summary of remaining work:

- Open PRs waiting for review (use GitHub MCP)
- Open PRs user created that aren't merged yet
- Any remote branches that still exist

```
📊 Workspace Status

✅ Cleaned up:
- Deleted 2 merged branches
- Updated main branch
- Installed latest dependencies

📋 Remaining work:
- 1 open PR waiting for your review (PR #16)
- 1 open PR from you waiting for approval (PR #14)

💾 Saved branches:
- feature/in-progress-feature (kept, has uncommitted work)

You're all set for next time!
```

### 8. Optional: Create Backup

Offer to create a backup of uncommitted work:

```
Would you like me to create a backup of any uncommitted work?

I can:
1. Stash changes with a clear label
2. Create a WIP (work-in-progress) commit
3. Skip backup

What would you like?
```

## Advanced Cleanup Actions

### Prune Remote Tracking Branches

```
🧹 Deep Clean Option

I can also clean up references to deleted remote branches.
This is safe and just removes outdated local references.

Run: git remote prune origin

Would you like me to do this?
```

### Clear Node Modules (if needed)

```
💾 Space-Saving Option

If you're running low on disk space, I can safely remove
and reinstall node_modules. This can save several GB.

This involves:
1. rm -rf node_modules
2. npm install (fresh install)

Only do this if you're having issues or need space.
Do you want to do this?
```

### Verify Working Tree is Clean

At the end, confirm:

```bash
git status
```

Should show: "working tree clean"

## Important Rules

- **NEVER** delete the main branch
- **NEVER** delete the current working branch
- **NEVER** force-delete branches with unmerged changes (without user confirmation)
- **ALWAYS** confirm before deleting stale branches that aren't merged
- **ALWAYS** switch to main before deleting current branch
- **ALWAYS** pull latest main before finishing
- **WARN** about unmerged branches before deletion
- **ASK** before deleting remote branches (some teams keep them)

## Error Handling

### If can't switch to main (uncommitted changes):

```
⚠️ Can't switch to main - you have uncommitted changes.

Would you like me to:
1. Commit them first
2. Stash them temporarily
3. Show me what changed

What would you like?
```

### If branch deletion fails:

```
⚠️ Couldn't delete branch: feature/xyz

This might be because:
- The branch has unmerged changes
- The branch is currently checked out
- Git is protecting the branch

Would you like me to:
1. Force delete (⚠️ lose unmerged changes)
2. Keep the branch
3. Show me what's different in this branch

What would you like?
```

### If pull fails (conflicts):

```
⚠️ Pulling main resulted in conflicts!

This is unusual for main branch. It might mean:
- Someone force-pushed to main (bad practice)
- Local main has commits it shouldn't

Would you like me to:
1. Reset main to match remote (safe if you didn't commit to main)
2. Help resolve conflicts
3. Investigate what happened

What would you like?
```

### If npm install fails:

```
⚠️ Dependencies failed to install!

Error: [show error]

This might be because:
- package-lock.json is corrupted
- Network issues
- Incompatible Node version

Would you like me to:
1. Try again
2. Clear cache and retry (npm clean-install)
3. Show me the full error to diagnose

What would you like?
```

## Cleanup Checklist

After successful cleanup, all of these should be true:

- ✅ Uncommitted changes handled (committed, stashed, or intentionally discarded)
- ✅ Merged branches deleted
- ✅ Currently on main branch
- ✅ Main branch is up-to-date with remote
- ✅ Dependencies are current (npm install ran if needed)
- ✅ Working directory is clean
- ✅ User knows status of remaining PRs
- ✅ No orphaned remote tracking branches

## Timing Recommendations

Suggest cleanup when:

- **End of day:** User says "I'm done for today"
- **After PR merge:** "Your PR was just merged - run `/cleanup` to update main"
- **Before starting new work:** `/start-work` can include mini-cleanup
- **Weekly:** "It's been a week - let's clean up old branches"

## Success Message

End with a positive confirmation:

```
✨ Workspace cleaned up successfully!

Your local repository is now:
- Up-to-date with the latest main
- Free of merged branches
- Clean and organized

Next time you work, just run `/start-work` to begin!

[If pending PRs: Don't forget to review PR #16!]

Have a great rest of your day! 🎉
```

## Success Criteria

You've successfully completed this command when:

- ✅ All merged branches are deleted (with user approval)
- ✅ User is on main branch with latest changes
- ✅ Working directory is clean (or user chose to keep changes)
- ✅ Dependencies are up-to-date
- ✅ User has a clear summary of remaining work
- ✅ User feels confident the workspace is organized
