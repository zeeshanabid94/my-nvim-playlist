#!/bin/bash
# Append a line to the file given by the filepath

append_line_to_file() {
    local line=$1
    local filepath=$2
    
    # Expand the tilde to the full path
    filepath="${filepath/#\~/$HOME}"

    echo "Editing $filepath to add $line"

    # Check if the file exists
    if [[ ! -f "$filepath" ]]; then
        echo "File does not exist: $filepath"
        return 1
    fi

    # Check if the line already exists in the file
    if grep -Fxq "$line" "$filepath"; then
        echo "Line already exists in the file: $line"
    else
        # Append the line to the file
        echo "$line" >> "$filepath"
        echo "Line appended to file: $line"
    fi
}


# Install latest nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# Install ripgrep for telescope
sudo apt-get update
sudo apt-get install ripgrep

# Install fd for telescope
sudo apt-get install fd-find

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

append_line_to_file "export PATH=\"/opt/nvim-linux64/bin:\$PATH\"" "~/.zshrc"
append_line_to_file "export XDG_CONFIG_HOME=$script_dir" "~/.zshrc"
