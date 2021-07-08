#!/usr/bin/env zsh

# Bootstrap script for installing applications and tools

# Ask for the administrator password upfront
sudo -v

export DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

# Go to dotfiles directory
cd $DOTFILES/scripts

# Homebrew Bundle
brew bundle

# Install Node.js
source ./nodejs.zsh

# Get back to previous directory
cd -
