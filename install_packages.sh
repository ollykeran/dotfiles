#!/bin/bash
if [ "$(id -u)" == 0 ]; then

    # Detect package manager
    if command -v yum &>/dev/null; then
        packageManager="yum"
    elif command -v apt &>/dev/null; then
        packageManager="apt"
    else
        echo "Neither YUM nor APT package manager found."
        exit 1
    fi

    echo "Detected package manager: $packageManager"

    # Read package names from file
    packages_file="packages.list"

    if [ ! -f "$packages_file" ]; then
        echo "Error: Packages file '$packages_file' not found."
        exit 1
    fi

    # Install packages
    echo "Installing packages using $packageManager..."

    while IFS= read -r package; do
        echo "Installing package: $package"
        sudo "$packageManager" install -y "$package"
    done < "$packages_file"


    # install nvim
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    rm nvim-linux64.tar.gz

    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf /tmp/lazygit.tar.gz /tmp/lazygit
    sudo install /tmp/lazygit /usr/local/bin
    echo "Lazygit installed from src" 
    rm -rf /tmp/lazygit* 

    echo "Package installation completed."
else 
    echo "Not sudo'd cant install packages" 
fi