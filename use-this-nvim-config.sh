#!/bin/bash

# Install latest nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# Install ripgrep
sudo apt-get update
sudo apt-get install ripgrep

# Install rust tools and build system
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"

# Add nvim to PATH
export PATH="$PATH:/opt/nvim-linux64/bin"

# Get the directory of the script file
script_dir=$(dirname "$(realpath \"$0\")")

# Export nvim config home as the nvim directory
export XDG_CONFIG_HOME="$script_dir"
