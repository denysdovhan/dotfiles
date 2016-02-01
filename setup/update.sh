#!/bin/sh

# Get Ubuntu Updates, update NPM packages and dotfiles
# Source: https://github.com/sapegin/dotfiles/blob/master/setup/update.sh

e='\033'
RESET="${e}[0m"
BOLD="${e}[1m"
CYAN="${e}[0;96m"
RED="${e}[0;91m"
YELLOW="${e}[0;93m"
GREEN="${e}[0;92m"

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
sudo apt-get upgrade -y
echo

# NPM
header "Updating NPM..."
sudo npm install npm -g
sudo ncu -g
echo

# Ruby gems
header "Updating Ruby gems..."
sudo -v
sudo gem update
echo

echo "Update successfully done!"

echo
echo -en $RED'-_-_-_-_-_-_-_'
echo -e $RESET$BOLD',------,'$RESET
echo -en $YELLOW'_-_-_-_-_-_-_-'
echo -e $RESET$BOLD'|   /\_/\\'$RESET
echo -en $GREEN'-_-_-_-_-_-_-'
echo -e $RESET$BOLD'~|__( ^ .^)'$RESET
echo -en $CYAN'-_-_-_-_-_-_-_-'
echo -e $RESET$BOLD'""  ""'$RESET
echo
