#!/bin/bash

# Get the directory of the script file
script_dir=$(dirname "$(realpath \"$0\")")

# Export nvim config home as the nvim directory
export XDG_CONFIG_HOME="$script_dir"
