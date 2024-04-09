#!/bin/bash

# Function to create symlink with backup
create_symlink_with_backup() {
    local source_file=$1
    local target_file=$2

    if [ -e "$target_file" ]; then
        echo "File $target_file already exists. Creating a backup..."
        mv "$target_file" "$target_file.bak"
    fi

    ln -s "$source_file" "$target_file"
    echo "Symlink created: $source_file -> $target_file"
}

# Symlink .bashrc, .bash_profile, .profile
create_symlink_with_backup "$(pwd)/.bashrc" "$HOME/.bashrc"
create_symlink_with_backup "$(pwd)/.vimrc" "$HOME/.vimrc "


# Create .config directory if it doesn't exist
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/nvim"
ln -sf "$(pwd)/nvim" "$HOME/.config/nvim"