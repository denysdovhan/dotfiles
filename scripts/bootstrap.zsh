#!/usr/bin/env zsh

# Bootstrap script for installing applications and tools

# Ask for the administrator password upfront
sudo -v

export DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

cd $DOTFILES/scripts
. ./brew.zsh
. ./nodejs.zsh
cd -
