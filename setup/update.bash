#!/usr/bin/env bash

# Get System Updates, update NPM packages and dotfiles
# Source: https://github.com/sapegin/dotfiles/blob/master/setup/update.sh

WHITE="$(tput setaf 7)"
BOLD="$(tput bold)"
CYAN="$(tput setaf 6)"
RED="$(tput setaf 1)"
YELLOW="$(tput setaf 3)"
GREEN="$(tput setaf 2)"

# Function for pretty headers
function header() {
  echo -e "$(tput sgr 0 1)$(tput setaf 6)$1$(tput sgr0)"
}

# Function for pretty wargnings
function warn() {
  echo -e "$(tput setaf 3)$1$(tput sgr0)"
}

# Sudo for gems and other
sudo -v

# Dotfiles
header "Updating dotfiles..."
cd $DOTFILES
git pull
./sync.py
source ~/.zshrc
cd - > /dev/null 2>&1
echo

# Homebrew
command -v brew >/dev/null 2>&1 && {
  header "Updating Homebrew..."
  brew update
  brew upgrade --all
  brew cleanup
  echo
}

# Ubuntu
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

  NPM_PERMS="$(ls -l $(npm config get prefix)/bin \
    | awk 'NR>1{print $3}' \
    | uniq)"

  if [[ "$NPM_PERMS" == "$(whoami)" ]]; then
    warn "Permissions are fixed. Updating without sudo..."
    npm install npm npm-check-updates -g
    ncu -g
  else
    warn "Permissions needed!"
    warn "Better to fix your permissions. Read more:"
    warn "\t <https://docs.npmjs.com/getting-started/fixing-npm-permissions>"
    sudo npm install npm npm-check-updates -g
    sudo ncu -g
  fi

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
  apm update --no-confirm
  echo
}

echo "Update successfully done!"

echo
echo -en $RED'-_-_-_-_-_-_-_'
echo -e  $WHITE$BOLD',------,'$WHITE
echo -en $YELLOW'_-_-_-_-_-_-_-'
echo -e  $WHITE$BOLD'|   /\_/\\'$WHITE
echo -en $GREEN'-_-_-_-_-_-_-'
echo -e  $WHITE$BOLD'~|__( ^ .^)'$WHITE
echo -en $CYAN'-_-_-_-_-_-_-_-'
echo -e  $WHITE$BOLD'""  ""'$WHITE
echo
