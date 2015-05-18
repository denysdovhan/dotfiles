#!/bin/bash

# Dotfiles and bootstrap installer
# Installs git, clones repository and symlinks dotfiles to your home directory

if ! hash git 2>/dev/null ; then
  if [ `uname` == 'Darwin' ]; then
    # Install Homebrew
    ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
    # Install Git
    brew install git
  elif [ `uname` == 'Linux' ]; then
    # Install Git with apt-get
    sudo apt-get install git xclip
  else
    echo "Error: Git is required."
    exit
  fi;
fi;

# Clone dotfiles and make symlinks
echo "Installing dotfiles..."
git clone git@github.com:denysdovhan/dotfiles.git ~/Dotfiles && cd ~/Dotfiles && ./sync.py && cd -

# Problem with not interactive shell
# http://askubuntu.com/a/77053
PS1='$>'
[ ! -d ~/Dotfiles ] && echo -e "${RED}Dotfiles didn't installed!${NOCOLOR}" && exit 1
source ~/.bashrc
echo "${GREEN}Dotfiles installed successfully!${NOCOLOR}"

# Copy path to clipboard with pbcopy and xclip
echo -n "~/Dotfiles/setup/bootstrap.sh" | pbcopy 2>/dev/null
echo -n "~/Dotfiles/setup/bootstrap.sh" | xclip -selection clipboard 2>/dev/null
echo
echo "Path to bootstrap script copied to clipboard."

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

# Reload bash
exec bash
