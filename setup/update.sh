#!/bin/bash
# Source: https://github.com/sapegin/dotfiles/blob/master/setup/update.sh

# Get Ubuntu Updates, update NPM packages and dotfiles 

# Function for pretty headers
function header() {
  echo -e "$(tput sgr 0 1)$(tput setaf 6)$1$(tput sgr0)"
}

# Ask for the administrator password upfront
sudo -v

# Dotfiles
header "Updating dotfiles..."
cd ~/Dotfiles
git pull
./sync.py
source ~/.bashrc
cd - > /dev/null 2>&1
echo

# System
header "Updating Ubuntu and installed packages..."
sudo apt-get update
sudo apt-get upgrade
echo

# NPM
header "Updating NPM..."
sudo npm update npm -g
sudo npm update -g
echo

echo "Update successfully done!"
nyan
