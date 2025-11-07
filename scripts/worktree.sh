#!/bin/bash

# Git Worktree Management Script
# Helps manage multiple working directories for parallel agent work

set -e

WORKTREES_DIR="worktrees"
REPO_ROOT="$(git rev-parse --show-toplevel)"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print colored output
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

# Function to show usage
show_usage() {
    cat << EOF
Git Worktree Manager

Usage: ./scripts/worktree.sh <command> [options]

Commands:
  create <branch-name>    Create a new worktree for a branch
  list                    List all existing worktrees
  remove <branch-name>    Remove a worktree
  prune                   Remove stale worktree references
  help                    Show this help message

Examples:
  ./scripts/worktree.sh create feature/new-feature
  ./scripts/worktree.sh list
  ./scripts/worktree.sh remove feature/old-feature

Notes:
  - Worktrees are created in the 'worktrees/' directory
  - Each worktree can run independently (different branches, different agents)
  - Always create feature branches from main, not from other worktrees
EOF
}

# Function to create a worktree
create_worktree() {
    local branch_name=$1
    
    if [ -z "$branch_name" ]; then
        print_error "Branch name is required"
        echo "Usage: ./scripts/worktree.sh create <branch-name>"
        exit 1
    fi
    
    # Check if branch already exists
    if git show-ref --verify --quiet refs/heads/"$branch_name"; then
        print_warning "Branch '$branch_name' already exists locally"
        read -p "Create worktree for existing branch? (y/n) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_info "Cancelled"
            exit 0
        fi
    else
        # Create branch from main
        print_info "Creating branch '$branch_name' from main..."
        git fetch origin main:main 2>/dev/null || true
        git checkout -b "$branch_name" main
        git checkout -  # Switch back to previous branch
    fi
    
    # Create worktree directory
    local worktree_path="$REPO_ROOT/$WORKTREES_DIR/$branch_name"
    
    if [ -d "$worktree_path" ]; then
        print_error "Worktree directory already exists: $worktree_path"
        exit 1
    fi
    
    print_info "Creating worktree at: $worktree_path"
    git worktree add "$worktree_path" "$branch_name"
    
    # Create .env.local symlink if it exists in main repo
    if [ -f "$REPO_ROOT/.env.local" ]; then
        print_info "Creating symlink for .env.local"
        ln -s "$REPO_ROOT/.env.local" "$worktree_path/.env.local"
    fi
    
    # Create .cursor/.env.mcp symlink if it exists in main repo
    if [ -f "$REPO_ROOT/.cursor/.env.mcp" ]; then
        print_info "Creating symlink for .cursor/.env.mcp"
        mkdir -p "$worktree_path/.cursor"
        ln -s "$REPO_ROOT/.cursor/.env.mcp" "$worktree_path/.cursor/.env.mcp"
    fi
    
    print_success "Worktree created successfully!"
    echo ""
    echo "To use this worktree:"
    echo "  cd $worktree_path"
    echo "  npm install  # Run this the first time"
    echo "  npm run dev  # Start development server"
    echo ""
    echo "You can now open this directory in a separate Cursor/VS Code window"
    echo "and run a different agent instance there!"
}

# Function to list worktrees
list_worktrees() {
    print_info "Current worktrees:"
    echo ""
    git worktree list
    echo ""
    
    # Count worktrees
    local count=$(git worktree list | wc -l | tr -d ' ')
    print_info "Total worktrees: $count"
}

# Function to remove a worktree
remove_worktree() {
    local branch_name=$1
    
    if [ -z "$branch_name" ]; then
        print_error "Branch name is required"
        echo "Usage: ./scripts/worktree.sh remove <branch-name>"
        exit 1
    fi
    
    local worktree_path="$REPO_ROOT/$WORKTREES_DIR/$branch_name"
    
    if [ ! -d "$worktree_path" ]; then
        print_error "Worktree not found: $worktree_path"
        exit 1
    fi
    
    print_warning "This will remove the worktree at: $worktree_path"
    print_warning "The branch '$branch_name' will NOT be deleted"
    read -p "Continue? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Cancelled"
        exit 0
    fi
    
    print_info "Removing worktree..."
    git worktree remove "$worktree_path"
    
    print_success "Worktree removed successfully!"
    print_info "Branch '$branch_name' still exists. Delete it with: git branch -d $branch_name"
}

# Function to prune stale worktrees
prune_worktrees() {
    print_info "Pruning stale worktree references..."
    git worktree prune
    print_success "Pruning complete!"
}

# Main command handler
case "$1" in
    create)
        create_worktree "$2"
        ;;
    list)
        list_worktrees
        ;;
    remove)
        remove_worktree "$2"
        ;;
    prune)
        prune_worktrees
        ;;
    help|--help|-h)
        show_usage
        ;;
    *)
        print_error "Unknown command: $1"
        echo ""
        show_usage
        exit 1
        ;;
esac

