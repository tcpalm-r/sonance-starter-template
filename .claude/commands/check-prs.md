# Check PRs

You are helping the user review and manage Pull Requests.

## Your Task

Execute the following workflow using the GitHub MCP:

### 1. Fetch All Open PRs

Use GitHub MCP to get all open pull requests:

- Get list of all open PRs
- Get PR details including: number, title, author, created date, status
- Get CI/CD check status for each PR
- Get review status (approved, changes requested, pending)

### 2. Categorize PRs

Organize PRs into categories:

**Your PRs (created by current user):**

- PRs waiting for review
- PRs with changes requested
- PRs approved and ready to merge

**Partner's PRs (created by others):**

- PRs waiting for your review
- PRs you've already reviewed
- PRs with failing checks

**Merged Recently:**

- Show last 3 merged PRs for context

### 3. Present Overview

Show a clear, organized summary:

```
📋 Pull Request Summary

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔍 NEEDS YOUR REVIEW
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PR #15 - Add employee search functionality
By: [Partner Name] | Created: 2 days ago
Status: ✅ All checks passing
Review: ⏳ Waiting for your review
Preview: [Vercel URL]
👉 This needs your attention!

PR #12 - Fix mobile navigation bug
By: [Partner Name] | Created: 5 days ago
Status: ⚠️ 1 check failing (type-check)
Review: ⏳ Waiting for your review
Note: Has failing checks - may need fixes first

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📝 YOUR OPEN PRs
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PR #14 - Update user profile page
Created: 1 day ago
Status: ✅ All checks passing
Review: ✔️ Approved by [Partner]
👉 Ready to merge!

PR #13 - Add dark mode toggle
Created: 3 days ago
Status: ✅ All checks passing
Review: 💬 Changes requested
Note: Address feedback before merging

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ RECENTLY MERGED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PR #11 - Fix database connection issue (merged 1 hour ago)
PR #10 - Update documentation (merged yesterday)
PR #9 - Add user authentication (merged 2 days ago)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Would you like to:
1. Review a specific PR
2. Merge one of your approved PRs
3. Check detailed status of a PR
4. See what changed in a specific PR
```

### 4. Provide Actionable Suggestions

Based on PR status, suggest actions:

**If there are PRs needing user's review:**

```
⚠️ ACTION NEEDED: You have 2 PRs waiting for your review.

Best practice: Review PRs within 24 hours to keep your partner unblocked.

Would you like me to help you review PR #15 first?
```

**If user has PRs ready to merge:**

```
✅ READY TO MERGE: PR #14 is approved and all checks passed!

Would you like me to merge it now?
```

**If user has PRs with requested changes:**

```
💬 FEEDBACK RECEIVED: PR #13 has change requests from your partner.

Would you like me to show you the feedback so you can address it?
```

**If all PRs have failing checks:**

```
⚠️ ATTENTION: Several PRs have failing checks.

Would you like me to help diagnose and fix the issues?
```

### 5. Handle User Actions

Based on user's choice:

#### Option: Review a PR

"Which PR would you like to review? (e.g., 'Review PR #15')"

- Fetch PR details and diff
- Show summary of changes in plain English
- Show files changed and key modifications
- Provide preview deployment link
- Explain what the PR does and why
- Ask: "Would you like to: (1) Approve, (2) Request changes, (3) Test it locally first?"

#### Option: Merge a PR

- Verify PR is approved and checks pass
- Show merge commit message preview
- Ask for confirmation: "Merge PR #14 into main?"
- Use GitHub MCP to merge
- Confirm successful merge
- Notify about automatic Vercel deployment
- Suggest running `/cleanup` to update local main

#### Option: Check Detailed Status

"Which PR? (e.g., 'Status of PR #12')"

- Show full PR details
- Show all CI/CD check results
- Show review history and comments
- Show deployment status
- Explain any failures

#### Option: View Changes

"Which PR? (e.g., 'Show changes in PR #15')"

- Fetch and display file diffs
- Summarize changes in plain English
- Highlight key modifications
- Point out any potential issues

### 6. Proactive Notifications

Automatically alert user if:

**Stale PRs:**

```
⏰ Heads up: PR #10 has been open for 7 days without review.

Long review delays can block progress. Would you like to review it now?
```

**Failed Deployments:**

```
❌ PR #15's preview deployment failed.

This might indicate build issues. Should we investigate?
```

**Conflicts Detected:**

```
⚠️ PR #14 has merge conflicts with main.

This needs to be resolved before merging. Would you like me to help?
```

## Reviewing a PR (Detailed Workflow)

When user chooses to review a specific PR:

### 1. Fetch PR Information

- Get PR title, description, and metadata
- Get list of changed files
- Get diff for all changes
- Get CI/CD check results
- Get existing comments and reviews

### 2. Analyze Changes

Provide a clear explanation:

```
📝 PR #15: Add employee search functionality

What this PR does:
- Adds a search bar to the employee directory page
- Filters employees by name, department, and location
- Uses real-time client-side filtering
- Adds loading state while filtering

Files changed:
- app/employees/page.tsx (modified) - Added search UI and logic
- components/SearchBar.tsx (new) - New reusable search component
- types/employee.ts (modified) - Added search filter types
- lib/utils/search.ts (new) - Search utility functions

Checks:
✅ Lint and type-check passed
✅ Build successful
✅ No security vulnerabilities detected
✅ Preview deployment ready

Preview: [Vercel URL]
```

### 3. Highlight Important Areas

```
🔍 Things to pay attention to:

1. Search performance: The search happens on every keystroke.
   With 1000+ employees, this might be slow. Test with large datasets.

2. Empty state handling: Check what happens when search returns no results.

3. Mobile experience: Make sure search bar works well on mobile devices.

4. Accessibility: Verify the search is keyboard navigable.
```

### 4. Provide Testing Checklist

```
✅ Test Plan:

Try these scenarios:
- [ ] Search for a common name (e.g., "Smith")
- [ ] Search for a department (e.g., "Engineering")
- [ ] Search with no results (e.g., "zzzzz")
- [ ] Clear the search and verify all employees return
- [ ] Test on mobile/tablet screen sizes
- [ ] Use keyboard only (Tab + Enter navigation)
- [ ] Test with 100+ employees in the database
```

### 5. Ask for Review Decision

```
What's your review decision?

1. ✅ Approve - Looks good, ready to merge
2. 💬 Request changes - Needs modifications
3. 💭 Comment only - Provide feedback without blocking
4. 🧪 Test locally first - Check out the branch and try it
5. ⏸️ Review later - Come back to this

What would you like to do?
```

### 6. Execute Review Decision

**If Approve:**

- Use GitHub MCP to submit approval
- Ask if they want to merge immediately or let author merge
- Confirm approval submitted

**If Request Changes:**

- Ask: "What changes are needed? Describe the issues."
- Use GitHub MCP to submit review with change requests
- Confirm review submitted
- Notify user that PR author will be notified

**If Comment:**

- Ask: "What comments would you like to leave?"
- Use GitHub MCP to add comments
- Confirm comments added

**If Test Locally:**

- Fetch branch name from PR
- `git fetch origin [branch]`
- `git checkout [branch]`
- Run `npm install` if needed
- `npm run dev`
- Provide localhost URL
- After testing: ask for review decision

## Important Rules

- **ALWAYS** use GitHub MCP for fetching PR data
- **ALWAYS** show CI/CD check status
- **ALWAYS** provide preview deployment links (Vercel)
- **ALWAYS** highlight PRs needing urgent attention
- **PRIORITIZE** showing PRs that need user's review first
- **EXPLAIN** changes in plain English, not just git diffs
- **WARN** about stale PRs (> 7 days old)
- **VERIFY** checks pass before suggesting merge
- **PROVIDE** actionable next steps

## Error Handling

### If GitHub MCP fails:

```
⚠️ Couldn't fetch PRs from GitHub.

This might be because:
- GitHub API is temporarily unavailable
- MCP authentication needs refresh
- Network connectivity issue

You can check PRs manually at:
[GitHub repo URL]/pulls
```

### If no open PRs:

```
✅ No open pull requests!

Your team is all caught up. Great work!

When you create your next PR, run `/check-prs` to track its status.
```

### If PR has conflicts:

```
⚠️ PR #15 has merge conflicts!

Before this can be merged:
1. The author needs to sync with main
2. Resolve the conflicts
3. Push the updated branch

Would you like me to help [Author Name] with this?
(You can share the /sync-main command with them)
```

## Success Criteria

You've successfully completed this command when:

- ✅ User sees a clear overview of all open PRs
- ✅ PRs are categorized by urgency and ownership
- ✅ User knows exactly what action to take next
- ✅ CI/CD status is clearly shown for each PR
- ✅ User can easily review, approve, or merge PRs
- ✅ Stale or problematic PRs are highlighted
