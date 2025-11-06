# GitHub Actions Deployment Setup

This project uses GitHub Actions to deploy to Vercel, giving us full control over when and how deployments happen.

## Why GitHub Actions Instead of Vercel Git Integration?

✅ **No timing issues** - GitHub Actions knows immediately if it's a PR or push to main
✅ **Deployments run after CI passes** - Only deploy if tests/lints succeed
✅ **All logic in your repo** - No configuration hidden in Vercel dashboard
✅ **Easy to customize** - Add manual approvals, staging environments, etc.
✅ **Reliable and predictable** - No race conditions with GitHub metadata

## Setup Instructions

### 1. Get Vercel Credentials

You need three pieces of information from Vercel:

#### A. Vercel Token

1. Go to https://vercel.com/account/tokens
2. Click "Create Token"
3. Name it: `GitHub Actions - [Your Project Name]`
4. Set scope: `Full Account`
5. Copy the token (you'll only see it once!)

#### B. Vercel Org ID

1. Go to your Vercel project settings
2. Click on your project → **Settings** → **General**
3. Scroll to "Project ID" section
4. Copy your **Org ID** (also called Team ID)

#### C. Vercel Project ID

1. In the same location as above
2. Copy the **Project ID**

### 2. Add Secrets to GitHub

1. Go to your GitHub repository
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret** and add each of these:

| Secret Name         | Value                         |
| ------------------- | ----------------------------- |
| `VERCEL_TOKEN`      | The token from step 1A        |
| `VERCEL_ORG_ID`     | Your org/team ID from step 1B |
| `VERCEL_PROJECT_ID` | Your project ID from step 1C  |

### 3. Disable Automatic Vercel Deployments

Since GitHub Actions now handles deployments, disable Vercel's automatic Git integration:

**Option A: Remove Git Connection (Recommended)**

1. Go to Vercel project → **Settings** → **Git**
2. Click **Disconnect** next to your GitHub repository
3. Confirm disconnection

**Option B: Configure Ignored Build Step**

1. Go to Vercel project → **Settings** → **Git**
2. Scroll to **Ignored Build Step**
3. Select **Custom**
4. Enter: `exit 0` (this skips all builds)

**Note:** After this, Vercel will only deploy when triggered by GitHub Actions.

### 4. Test the Setup

After configuration, test both deployment types:

#### Test Preview Deployment

1. Create a test branch: `git checkout -b test/github-actions-deploy`
2. Make a small change (e.g., add a comment)
3. Commit and push: `git push -u origin test/github-actions-deploy`
4. Create a PR
5. Watch GitHub Actions run and deploy preview
6. Check PR for Vercel preview URL

#### Test Production Deployment

1. Merge the test PR to main
2. Watch GitHub Actions run and deploy production
3. Verify production site updates

## How It Works

### Workflow Logic

```
┌─────────────────────────────────────────────────────────┐
│  Pull Request Created/Updated                           │
└──────────────────┬──────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────────────────┐
│  GitHub Actions CI Runs                                 │
│  ├─ Lint & Type Check                                   │
│  ├─ Secret Scanning                                     │
│  ├─ Build                                               │
│  └─ Summary                                             │
└──────────────────┬──────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────────────────┐
│  Deploy Preview Job (if PR)                             │
│  ✅ Deploys to Vercel preview environment               │
│  ✅ URL posted as comment on PR                         │
└─────────────────────────────────────────────────────────┘
```

```
┌─────────────────────────────────────────────────────────┐
│  Push to Main Branch                                    │
└──────────────────┬──────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────────────────┐
│  GitHub Actions CI Runs                                 │
│  ├─ Lint & Type Check                                   │
│  ├─ Secret Scanning                                     │
│  ├─ Build                                               │
│  └─ Summary                                             │
└──────────────────┬──────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────────────────┐
│  Deploy Production Job (if main branch)                 │
│  ✅ Deploys to Vercel production                        │
│  ✅ Updates live site                                   │
└─────────────────────────────────────────────────────────┘
```

### Key Points

- **Preview deployments** run only for pull requests
- **Production deployments** run only for pushes to main
- **Regular branch pushes** (without PR) don't trigger any deployment
- **Deployments only run if CI passes** - failed tests block deployment
- **Deployment runs after all other jobs** - ensures code quality first

## Workflow File

The deployment logic is in `.github/workflows/ci.yml`:

```yaml
deploy-preview:
  name: Deploy Preview (Vercel)
  runs-on: ubuntu-latest
  needs: [summary]
  if: github.event_name == 'pull_request'
  # ... deploys preview

deploy-production:
  name: Deploy Production (Vercel)
  runs-on: ubuntu-latest
  needs: [summary]
  if: github.event_name == 'push' && github.ref == 'refs/heads/main'
  # ... deploys production
```

## Troubleshooting

### Issue: Deployments not running

**Check:**

1. GitHub secrets are set correctly (VERCEL_TOKEN, VERCEL_ORG_ID, VERCEL_PROJECT_ID)
2. CI checks passed (deployments won't run if CI fails)
3. Automatic Vercel deployments are disabled
4. Check GitHub Actions logs for error messages

### Issue: "Invalid token" error

**Solution:**

1. Generate a new Vercel token (old one may have expired)
2. Update VERCEL_TOKEN secret in GitHub
3. Re-run the workflow

### Issue: "Project not found" error

**Solution:**

1. Verify VERCEL_ORG_ID and VERCEL_PROJECT_ID are correct
2. Check that the token has access to the project
3. Ensure the project exists in your Vercel account

### Issue: Preview URL not appearing in PR

**Solution:**

The Vercel GitHub Action should automatically comment on the PR with the preview URL. If not:

1. Check the GitHub Actions logs for the deployment URL
2. Go to Vercel dashboard → Deployments to find the preview URL
3. Manually post it in the PR if needed

## Advanced Customization

### Add Manual Approval for Production

Add an environment protection rule:

1. Go to GitHub repo → **Settings** → **Environments**
2. Create environment named `production`
3. Enable **Required reviewers**
4. Update workflow to use environment:

```yaml
deploy-production:
  name: Deploy Production (Vercel)
  runs-on: ubuntu-latest
  needs: [summary]
  if: github.event_name == 'push' && github.ref == 'refs/heads/main'
  environment: production # Add this line
```

### Add Deployment Notifications

Add a step to notify Slack, Discord, etc.:

```yaml
- name: Notify deployment
  run: |
    curl -X POST $WEBHOOK_URL \
      -d "Deployed to production! 🚀"
```

### Run E2E Tests Before Production

Add a test job that runs after preview deployment:

```yaml
e2e-tests:
  needs: [deploy-preview]
  runs-on: ubuntu-latest
  steps:
    - name: Run E2E tests
      run: npm run test:e2e
```

## Migration Notes

### Old Approach (Deprecated)

Previously used:

- Vercel's Ignored Build Step with custom script
- `vercel-build-ignore.sh` to check `VERCEL_ENV`
- Configuration in Vercel dashboard

**Issues:**

- Timing race conditions on PR creation
- Configuration split between repo and Vercel
- Less control over deployment flow

### New Approach (Current)

Now using:

- GitHub Actions to trigger all deployments
- Vercel GitHub Action (`amondnet/vercel-action`)
- All configuration in `.github/workflows/ci.yml`

**Benefits:**

- No timing issues
- Deployments run after CI passes
- Full control in repository
- Easy to audit and modify

## Related Files

- `.github/workflows/ci.yml` - Main CI/CD workflow with deployment jobs
- `vercel-build-ignore.sh` - **(Deprecated)** Old approach, no longer used
- `VERCEL_DEPLOYMENT_SETUP.md` - **(Deprecated)** Old setup guide
