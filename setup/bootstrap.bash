#!/usr/bin/env bash

# Bootstrap script for installing applications and tools

# Ask for the administrator password upfront
sudo -v

cd ~/Dotfiles/setup
. ./nodejs.bash
. ./npm.bash
. ./atom.bash
cd -
