#!/bin/sh

# Dotfiles and bootstrap installer
# Installs git, clones repository and symlinks dotfiles to your home directory

if [ ! command -v git >/dev/null 2>&1 ]; then
  if [ `uname` == 'Darwin' ]; then
    # Install Homebrew
    ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
    # Install Git
    brew install git
  elif [ `uname` == 'Linux' ]; then
    # Install Git with apt-get
    sudo apt-get install git
  else
    echo "Error: Git is required."
    exit
  fi
fi

# Clone dotfiles and make symlinks
echo "Installing dotfiles..."
git clone git@github.com:denysdovhan/dotfiles.git ~/Dotfiles && cd ~/Dotfiles && ./sync.py && cd -
source ~/.bashrc
echo "Dotfiles installed successfully!"

# Copy path to clipboard
echo -n "~/dotfiles/setup/bootstrap.sh" | pbcopy
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
