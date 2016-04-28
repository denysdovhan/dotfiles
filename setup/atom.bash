#!/usr/bin/env bash

# Setup atom settings and install all stared packages

# Change dir to Dotfiles
cd "$HOME/Dotfiles"

# Make syblinks for confiles inside ../atom
./sync.py ./atom "$HOME/.atom"
# Install packages
apm stars --install --user "$ATOM_USER"

# Come back to previous dir
cd -
