#!/bin/sh

# Bootstrap script for installing applications and tools

# Ask for the administrator password upfront
sudo -v

cd ~/Dotfiles/setup
. ./apps.sh
. ./nodejs.sh
. ./atom.sh
cd -
