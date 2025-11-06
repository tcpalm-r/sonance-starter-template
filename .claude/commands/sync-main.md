# Sync Main

You are helping the user sync their feature branch with the latest changes from main.

## Your Task

Execute the following workflow automatically and intelligently:

### 1. Check Current Status

- Check which branch the user is currently on
- Verify they're on a feature branch (NOT main)
- Check if there are uncommitted changes
- Check current branch status: `git status`

### 2. Handle Uncommitted Changes (if any)

If there are uncommitted changes:

- Ask: "You have uncommitted changes. Would you like to: (1) Commit them first, (2) Stash them temporarily, or (3) Cancel sync?"
- If commit: follow commit workflow
- If stash: `git stash push -m "Auto-stash before sync"`
- Only proceed after changes are handled

### 3. Fetch Latest from Remote

- Fetch all remote updates: `git fetch origin`
- Check if main branch has new commits
- Check if current feature branch has been updated remotely

### 4. Determine Branch Status

Check the relationship between current branch and main:

- How many commits is main ahead?
- How many commits is the current branch ahead?
- Are there any commits that exist in both (potential conflicts)?

### 5. Decide: Merge vs Rebase

**Use REBASE when:**

- Feature branch has NOT been pushed to remote yet (local only)
- Feature branch has clean, unpublished history
- User is working alone on this branch
- Gives cleanest history

**Use MERGE when:**

- Feature branch HAS been pushed to remote
- Feature branch might be shared with others
- Branch has a PR already open
- Safer for published branches

**Decision Logic:**

```
if branch not pushed to remote:
    use REBASE (cleaner history)
else if branch pushed but no PR yet:
    use REBASE with force-push (but ask user first)
else if PR is open:
    use MERGE (safer, no history rewrite)
```

### 6. Execute Sync Strategy

**If using REBASE:**

```bash
git rebase origin/main
```

- If conflicts occur, help user resolve them (see conflict resolution below)
- After rebase: `git push --force-with-lease origin [branch-name]` (if branch was pushed before)
- Explain: "I used rebase to keep your history clean. Your changes are now on top of the latest main."

**If using MERGE:**

```bash
git merge origin/main
```

- If conflicts occur, help user resolve them (see conflict resolution below)
- After merge: `git push origin [branch-name]`
- Explain: "I used merge to safely sync with main. Your branch now includes all the latest changes."

### 7. Post-Sync Actions

After successful sync:

- If `package-lock.json` changed: run `npm install`
- If `.env.local.example` changed: warn user to check their `.env.local`
- Run `npm run type-check` to ensure no new TypeScript errors
- If there are type errors, explain them and offer to help fix

### 8. Restore Stashed Changes (if applicable)

If changes were stashed in step 2:

- `git stash pop`
- Check if there are conflicts between stashed changes and synced code
- Help resolve any conflicts

### 9. Confirm Completion

Tell the user:

```
✅ Branch synced successfully!

Strategy used: [Rebase/Merge]
Main commits pulled: [X commits]
Current branch: [branch-name]
Status: Up-to-date with main

[If packages changed: Dependencies updated]
[If env changed: ⚠️ Check your .env.local file]
[If type errors: ⚠️ There are TypeScript errors to fix]

You can continue working with the latest code from main!
```

## Conflict Resolution

When conflicts occur during merge or rebase:

### 1. Explain the Conflict Clearly

```
⚠️ Merge conflict detected!

The same files were changed in both your branch and main:
- [list conflicted files]

This happens when you and your partner edited the same code.
Let me show you the conflicts and help you resolve them.
```

### 2. Show Conflict Details

For each conflicted file:

- Show the conflicted sections
- Explain what changed in main
- Explain what changed in the feature branch
- Ask which version to keep or how to combine them

### 3. Resolve Conflicts

For each conflict:

- Ask user: "For [file:line], would you like to: (1) Keep your changes, (2) Keep main's changes, (3) Keep both, or (4) Let me see the code to decide?"
- Edit the file to resolve the conflict
- Remove conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)
- Ensure the code is syntactically correct

### 4. Complete the Sync

After all conflicts resolved:

- Stage resolved files: `git add [files]`
- If rebase: `git rebase --continue`
- If merge: `git commit -m "Merge main into [branch-name]"`
- Run `npm run type-check` to verify everything still works

### 5. Handle Rebase Conflicts

If conflicts during rebase:

- Resolve each commit one at a time
- After resolving: `git rebase --continue`
- If user wants to abort: `git rebase --abort`

## Edge Cases

### If already up-to-date:

```
✅ Your branch is already up-to-date with main!

No sync needed. You have all the latest changes.
```

### If main is behind current branch:

```
✅ Your branch is ahead of main!

Main doesn't have any new changes. Your branch is current.
Once your PR merges, main will catch up.
```

### If user is on main branch:

```
You're on the main branch. Let me:
1. Pull the latest main: `git pull origin main`
2. Create a feature branch for you: [if they want to work]
```

### If sync fails critically:

```
⚠️ Sync failed and needs manual intervention.

Current state: [explain state]
Options:
1. Abort the sync: `git [rebase/merge] --abort`
2. Get help resolving the issue
3. Create a fresh branch from main

What would you like to do?
```

### If force-push is needed:

```
⚠️ Force-push required

Because we rebased, we need to force-push to update your remote branch.
This is safe in this case because:
- You're the only one working on this branch
- No PR has been merged yet

I'll use `git push --force-with-lease` which is the safe version.
Proceed?
```

## Important Rules

- **ALWAYS** fetch before checking status
- **NEVER** sync if there are uncommitted changes (handle them first)
- **CHOOSE** rebase vs merge intelligently based on branch state
- **EXPLAIN** which strategy you're using and why
- **HELP** resolve conflicts step-by-step with user
- **VERIFY** everything works after sync (type-check, build if needed)
- **USE** `--force-with-lease` instead of `--force` for safer force-pushing
- If uncertain about conflicts, ask user instead of guessing

## Success Criteria

You've successfully completed this command when:

- ✅ Feature branch has all commits from main
- ✅ No conflicts remain unresolved
- ✅ Working directory is clean
- ✅ TypeScript checks pass (or issues are known)
- ✅ Dependencies are updated if needed
- ✅ User understands what was synced and can continue working
