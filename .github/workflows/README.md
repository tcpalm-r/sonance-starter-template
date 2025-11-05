# GitHub Actions CI/CD

## What This Does

Every time code is pushed to `main` or a Pull Request is created, GitHub automatically runs these checks:

### 1. **Lint & Type Check** (~30 seconds)
- **ESLint**: Checks code quality and style
- **TypeScript**: Verifies all types are correct

### 2. **Build** (~50 seconds)
- Builds the Next.js application
- Ensures the app compiles successfully
- Catches build errors before deployment

### 3. **CI Summary** (~3 seconds)
- Reports overall pass/fail status
- All checks must pass before PR can be merged

---

## How to View CI Results

### On Pull Requests

When you create a PR, you'll see status checks at the bottom:

```
✅ CI / Lint & Type Check
✅ CI / Build
✅ CI / CI Summary
```

**If all green checkmarks:**
- Code is ready to merge!
- Click "Merge pull request"

**If red X appears:**
- Click "Details" to see what failed
- Fix the errors
- Push new commits to the same branch
- CI will automatically re-run

### On GitHub Actions Tab

1. Go to: https://github.com/tcpalm-r/ari-jorge-collab/actions
2. See all workflow runs
3. Click any run to see detailed logs

---

## Common CI Failures & How to Fix

### ❌ ESLint Failed

**Error message:** "Expected indentation of X spaces"

**How to fix:**
```bash
npm run lint
```
Fix the issues shown, then commit again.

**Or ask Claude:**
"Fix all the linting errors"

---

### ❌ TypeScript Type Check Failed

**Error message:** "Type 'string' is not assignable to type 'number'"

**How to fix:**
```bash
npm run type-check
```
Review the errors and fix type issues.

**Or ask Claude:**
"Fix these TypeScript errors"

---

### ❌ Build Failed

**Error message:** Various - could be missing imports, syntax errors, etc.

**How to fix:**
```bash
npm run build
```
This runs the same check locally so you can debug.

**Or ask Claude:**
"The build is failing, help me fix it"

---

## For Non-Technical Users

### What You Need to Know:

**Green checkmarks = Good!** ✅
- Your code works
- Safe to merge

**Red X = Needs fixing** ❌
- Something is broken
- Ask Claude Code to help fix it
- Can't merge until fixed

### How to Check Your PR:

1. Create your PR (via Claude or GitHub)
2. Wait 1-2 minutes for CI to run
3. Scroll to bottom of PR page
4. Look for checkmarks or X's
5. If ❌, click "Details" → copy error message → ask Claude to fix

### Example Conversation:

```
User: "My PR has a red X"

Claude: "Let me check the CI logs..."
[Reads the error]
"It looks like there's a linting error on line 25.
Let me fix that for you."
[Fixes the code]
"Fixed! Push these changes and CI will re-run."
```

---

## CI Configuration

The CI workflow is defined in `.github/workflows/ci.yml`

**Runs on:**
- Every push to `main` branch
- Every PR to `main` branch

**Jobs:**
1. Lint and type check (parallel)
2. Build (parallel)
3. Summary (runs after both complete)

**Node version:** 18.x
**OS:** Ubuntu Latest

---

## Benefits for Your Team

### Catches Issues Early
- TypeScript errors caught before merge
- Build failures detected immediately
- Code quality maintained automatically

### Prevents Broken Main Branch
- Can't merge PRs with failing CI
- Main branch always deployable
- Production stays stable

### Learning Tool
- Clear error messages
- Links to specific problems
- Helps non-technical users learn

### Safety Net
- Automated verification
- No need to remember manual checks
- Confidence when merging

---

## Advanced: Adding More Checks

Want to add tests, security scans, or other checks?

**Ask Claude:**
"Add unit tests to the CI workflow"
"Add a security scan to CI"
"Add code coverage reporting to CI"

Claude Code can modify `.github/workflows/ci.yml` to add more checks!

---

## Viewing This CI Run

Current run: https://github.com/tcpalm-r/ari-jorge-collab/actions/runs/19114168942

**Status:** ✅ Passed
**Duration:** ~1 minute 23 seconds
**Jobs:** All completed successfully
