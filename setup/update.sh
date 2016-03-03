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
cd $DOTFILES
git pull
./sync.py
source ~/.zshrc
cd - > /dev/null 2>&1
echo

# System
command -v apt-get >/dev/null 2>&1 && {
  header "Updating Ubuntu and installed packages..."
  sudo apt-get update
  sudo apt-get upgrade -y
  sudo apt-get autoremove -y
  sudo apt-get autoclean -y
  echo
}

# NPM
command -v npm >/dev/null 2>&1 && {
  header "Updating NPM..."
  sudo npm install npm npm-check-updates -g
  sudo ncu -g
  echo
}

# Ruby gems
command -v gem >/dev/null 2>&1 && {
  header "Updating Ruby gems..."
  sudo -v
  sudo gem update
  echo
}

# Atom packages
command -v apm >/dev/null 2>&1 && {
  header "Updating Atom packages..."
  sudo -v
  sudo apm upgrade
  echo
}

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
