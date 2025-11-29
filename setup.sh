#!/bin/bash

# setup.sh - Create symlinks for dotfiles

set -e  # Exit on any error

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Global variables
DRY_RUN=false

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

dry_run() {
    echo -e "${BLUE}[DRY-RUN]${NC} $1"
}

# Create symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"
    
    # Create target directory if it doesn't exist
    local target_dir="$(dirname "$target")"
    if [[ ! -d "$target_dir" ]]; then
        if [[ "$DRY_RUN" == "true" ]]; then
            dry_run "Would create directory: $target_dir"
        else
            mkdir -p "$target_dir"
            info "Created directory: $target_dir"
        fi
    fi
    
    # Handle existing files
    if [[ -e "$target" ]]; then
        if [[ -L "$target" ]]; then
            # It's already a symlink, remove it
            if [[ "$DRY_RUN" == "true" ]]; then
                dry_run "Would remove existing symlink: $target"
            else
                rm "$target"
                info "Removed existing symlink: $target"
            fi
        else
            # It's a regular file, backup it
            if [[ "$DRY_RUN" == "true" ]]; then
                dry_run "Would backup existing file: $target -> ${target}.backup"
            else
                mv "$target" "${target}.backup"
                warn "Backed up existing file: $target -> ${target}.backup"
            fi
        fi
    fi
    
    # Create the symlink
    if [[ "$DRY_RUN" == "true" ]]; then
        dry_run "Would create symlink: $source -> $target"
    else
        ln -s "$source" "$target"
        info "Created symlink: $source -> $target"
    fi
}

setup() {
    if [[ "$DRY_RUN" == "true" ]]; then
        info "DRY-RUN MODE: Showing what would be done without making changes"
    fi
    
    info "Setting up dotfiles from $SCRIPT_DIR"
    
    # Define file mappings (source -> target)
    local dotfiles=(
        "$SCRIPT_DIR/.gitconfig:$HOME/.gitconfig"
        "$SCRIPT_DIR/.gitignore:$HOME/.gitignore"
        "$SCRIPT_DIR/.golangci.yaml:$HOME/.golangci.yaml"
        "$SCRIPT_DIR/.config/fish:$HOME/.config/fish"
        "$SCRIPT_DIR/.config/gitui:$HOME/.config/gitui"
        "$SCRIPT_DIR/.config/k9s:$HOME/.config/k9s"
        "$SCRIPT_DIR/.config/nvim:$HOME/.config/nvim"
        "$SCRIPT_DIR/.config/starship:$HOME/.config/starship"
        "$SCRIPT_DIR/.config/task:$HOME/.config/task"
        "$SCRIPT_DIR/.config/tmux:$HOME/.config/tmux"
        "$SCRIPT_DIR/.config/wezterm:$HOME/.config/wezterm"
    )
    
    # Create symlinks
    for mapping in "${dotfiles[@]}"; do
        # Split on the first colon
        source="${mapping%%:*}"
        target="${mapping#*:}"
        
        if [[ -e "$source" ]]; then
            create_symlink "$source" "$target"
        else
            warn "Source file not found, skipping: $source"
        fi
    done
    
    if [[ "$DRY_RUN" == "true" ]]; then
        info "Dry-run complete! Use without --dry-run to apply changes."
    else
        info "Setup complete!"
        info "You may need to restart your shell or source your configuration files."
    fi
}

# Handle command line arguments
case "${1:-}" in
    -h|--help)
        echo "Usage: $0 [options]"
        echo "Options:"
        echo "  -h, --help      Show this help message"
        echo "  -n, --dry-run   Show what would be done without making changes"
        exit 0
        ;;
    -n|--dry-run)
        DRY_RUN=true
        ;;
    "")
        # No arguments provided, continue with setup
        ;;
    *)
        error "Unknown option: $1"
        echo "Use -h or --help for usage information."
        exit 1
        ;;
esac

setup
