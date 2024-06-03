# my-nvim-playlist
Contains my personal nvim configuration.

## Requirements
- Neovim v0.10.0

## Using it in a github code space.
To use it in github code space, make sure to move the nvim folder into the default
nvim program config directory. For my linux github codespace, this directory is `~/.config`.
So copy over the `nvim` folder to the path `~/.config/nvim`.

## For telescope live-grep
For telescope live-grep to work properly, make sure to install `https://github.com/BurntSushi/ripgrep`

## To import nvim settings
You can use the provided `use-this-nvim-config.sh` file to make nvim pick up this
repo locally as the `nvim` configuration directory.
```bash
source use-this-nvim-config.sh
```

## Install Neovim
You can install neovim from their pre-built tarball available [here](https://github.com/neovim/neovim/blob/master/INSTALL.md#pre-built-archives-2).
The guide shows how to install neovim. The guide is repeated below:
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
```

Don't forget to update you `.bashrc` or `.zshrc` with the following:
```bash
export PATH="$PATH:/opt/nvim-linux64/bin"
```
