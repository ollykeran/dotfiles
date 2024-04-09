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
create_symlink_with_backup ".bashrc" "$HOME/.bashrc"

# Create .config directory if it doesn't exist
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/nvim"
ln -sf "$HOME/.config/nvim" nvim/

if [ "$(id -u)" -e 0 ]; then
    # install nvim
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    rm nvim-linux64.tar.gz

    ./install_packages.sh
elif 
    echo "Not sudo'd cant install packages" 
fi
