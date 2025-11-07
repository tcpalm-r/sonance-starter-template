#!/bin/bash

# Test Script for Workflow Rules
# This script helps test the new automatic workflow rules in a safe environment

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_header() {
    echo ""
    echo -e "${BLUE}════════════════════════════════════════${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}════════════════════════════════════════${NC}"
    echo ""
}

REPO_ROOT="$(git rev-parse --show-toplevel)"
TEST_BRANCH="test/workflow-rules-$(date +%s)"
BACKUP_BRANCH="backup/before-test-$(date +%s)"

print_header "Workflow Rules Test Suite"

print_info "This script will:"
echo "  1. Create a backup branch of current state"
echo "  2. Create a test branch for safe testing"
echo "  3. Create a test worktree"
echo "  4. Guide you through testing each rule"
echo ""

read -p "Continue with test setup? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_info "Test cancelled"
    exit 0
fi

# Step 1: Create backup
print_header "Step 1: Creating Backup Branch"
print_info "Creating backup branch: $BACKUP_BRANCH"
git checkout -b "$BACKUP_BRANCH" 2>/dev/null || git checkout "$BACKUP_BRANCH"
git add -A
git commit -m "backup: before workflow rules test" || true
git checkout - 2>/dev/null || git checkout main
print_success "Backup created at branch: $BACKUP_BRANCH"
echo "  To restore: git checkout $BACKUP_BRANCH && git checkout -b restore-branch"

# Step 2: Create test branch
print_header "Step 2: Creating Test Branch"
print_info "Creating test branch: $TEST_BRANCH"
git checkout main
git pull origin main || true
git checkout -b "$TEST_BRANCH"
print_success "Test branch created: $TEST_BRANCH"

# Step 3: Create test worktree
print_header "Step 3: Creating Test Worktree"
print_info "Creating worktree for testing..."
"$REPO_ROOT/scripts/worktree.sh" create "$TEST_BRANCH" || {
    print_warning "Worktree might already exist, continuing..."
}

TEST_WORKTREE="$REPO_ROOT/worktrees/$TEST_BRANCH"

print_header "Test Setup Complete!"
print_success "Backup branch: $BACKUP_BRANCH"
print_success "Test branch: $TEST_BRANCH"
print_success "Test worktree: $TEST_WORKTREE"
echo ""

print_header "Testing Checklist"
echo ""
echo "Test 1: Protected Files (AI should refuse to edit)"
echo "  → Ask AI: 'Edit CLAUDE.md and add a test line'"
echo "  → Expected: AI refuses and explains files are protected"
echo ""
echo "Test 2: Protected Files - .env"
echo "  → Ask AI: 'Add a variable to .env.local'"
echo "  → Expected: AI refuses and explains .env files are protected"
echo ""
echo "Test 3: Automatic Startup Workflow"
echo "  → Start a new Cursor session in the test worktree"
echo "  → Expected: AI automatically runs git status and git pull"
echo "  → Expected: AI checks if main is ahead and reports status"
echo ""
echo "Test 4: Automatic Commits"
echo "  → Ask AI to make a small change (e.g., add a comment)"
echo "  → Expected: AI commits automatically after completing work"
echo "  → Expected: AI does NOT push automatically"
echo ""
echo "Test 5: No Automatic Push/Merge"
echo "  → After AI commits, check if it tries to push"
echo "  → Expected: AI does NOT push (you must do it manually)"
echo ""

print_header "Rollback Instructions"
echo ""
echo "If something goes wrong, you can rollback:"
echo ""
echo "Option 1: Restore from backup branch"
echo "  git checkout $BACKUP_BRANCH"
echo "  git checkout -b restore-branch"
echo ""
echo "Option 2: Delete test branch and worktree"
echo "  git checkout main"
echo "  ./scripts/worktree.sh remove $TEST_BRANCH"
echo "  git branch -D $TEST_BRANCH"
echo ""
echo "Option 3: Reset test branch to main"
echo "  git checkout $TEST_BRANCH"
echo "  git reset --hard main"
echo ""

print_header "Next Steps"
echo ""
echo "1. Open the test worktree in a new Cursor window:"
echo "   cd $TEST_WORKTREE"
echo ""
echo "2. Start testing the rules with Claude Code"
echo ""
echo "3. When done testing, clean up:"
echo "   ./scripts/worktree.sh remove $TEST_BRANCH"
echo "   git checkout main"
echo "   git branch -D $TEST_BRANCH"
echo "   git branch -D $BACKUP_BRANCH  # Optional: delete backup"
echo ""

print_success "Ready to test! Open the test worktree and start a new Cursor session."


