#!/usr/bin/env zsh

# Bootstrap script for installing applications and tools

# Ask for the administrator password upfront
sudo -v

# iterm
# chrome
# 

cd ~/Dotfiles/setup
. ./brew.zsh
. ./nodejs.zsh
cd -
