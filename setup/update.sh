#!/bin/bash

# Get Ubuntu Updates, update NPM packages and dotfiles 
# Source: https://github.com/sapegin/dotfiles/blob/master/setup/update.sh

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

# Ruby gems
header "Updating Ruby gems..."
sudo -v
sudo gem update
echo

echo "Update successfully done!"

echo
echo -en $RED'-_-_-_-_-_-_-_'
echo -e $NOCOLOR$BOLD',------,'$NOCOLOR
echo -en $YELLOW'_-_-_-_-_-_-_-'
echo -e $NOCOLOR$BOLD'|   /\_/\\'$NOCOLOR
echo -en $GREEN'-_-_-_-_-_-_-'
echo -e $NOCOLOR$BOLD'~|__( ^ .^)'$NOCOLOR
echo -en $CYAN'-_-_-_-_-_-_-_-'
echo -e $NOCOLOR$BOLD'""  ""'$NOCOLOR
echo
