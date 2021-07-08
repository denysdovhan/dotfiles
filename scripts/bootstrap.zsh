#!/usr/bin/env zsh

# Bootstrap script for installing applications and tools

# Ask for the administrator password upfront
sudo -v

_exists() {
  command -v $1 > /dev/null 2>&1
}

export DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

# Go to dotfiles directory
cd $DOTFILES/scripts

# Homebrew Bundle
if _exists brew; then
  brew bundle
fi

# Get back to previous directory
cd -
