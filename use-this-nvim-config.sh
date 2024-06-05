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

# Install node version manager since that is required by CoC
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install --lts # install lts node version
nvm use --lts # use lts node version

# Add nvim to PATH
export PATH="$PATH:/opt/nvim-linux64/bin"

# Get the directory of the script file
script_dir=$(dirname "$(realpath "$0")")

# Export nvim config home as the nvim directory
export XDG_CONFIG_HOME="$script_dir"
