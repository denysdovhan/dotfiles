#!/bin/sh

# Dotfiles and bootstrap installer
# Installs git, clones repository and symlinks dotfiles to your home directory

e='\033'
RESET="${e}[0m"
BOLD="${e}[1m"
CYAN="${e}[0;96m"
RED="${e}[0;91m"
YELLOW="${e}[0;93m"
GREEN="${e}[0;92m"

# Error reporter
error() { echo ; echo "${RED}${BOLD}${*}${RESET}" ; echo }

# Success reporter
success() { echo ; echo "${GREEN}${BOLD}${*}${RESET}" ; echo }

# Ask for password
sudo -v

# Preinstall
if ! hash git 2>/dev/null ; then
  if [ `uname` == 'Darwin' ]; then
    # Install Homebrew
    ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
    # Install Git
    brew install git
    brew install zsh
  elif [ `uname` == 'Linux' ]; then
    # Install Git with apt-get
    sudo apt-get install git zsh xclip
  else
    error "Error: Git and Zsh are required."
    exit
  fi
fi

# Registers zsh as a default shell
zsh_path=$(which zsh)
grep -Fxq "$zsh_path" /etc/shells || sudo bash -c "echo $zsh_path >> /etc/shells"
chsh -s "$zsh_path" $USER
# Installing Oh My Zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Clone dotfiles and make symlinks
echo "Installing dotfiles..."
git clone https://github.com/denysdovhan/dotfiles.git ~/Dotfiles #&& {
  cd ~/Dotfiles && ./sync.py && cd -
} || {
  error "Error: Cannot clone dotfiles."
  exit
}

# Problem with not interactive shell
# http://askubuntu.com/a/77053
PS1='$>'
[ -d ~/Dotfiles ] && {
  success "Dotfiles installed successfully!"
} || {
  error "Error: Dotfiles didn't installed!"
  exit 1
}

# Copy path to clipboard with pbcopy and xclip
echo -n "~/Dotfiles/setup/bootstrap.sh" | pbcopy 2>/dev/null
echo -n "~/Dotfiles/setup/bootstrap.sh" | xclip -selection clipboard 2>/dev/null
echo
echo "Path to bootstrap script copied to clipboard."

success "Please restart your terminal!"

echo
echo -n $RED'-_-_-_-_-_-_-_'
echo    $RESET$BOLD',------,'$RESET
echo -n $YELLOW'_-_-_-_-_-_-_-'
echo    $RESET$BOLD'|   /\_/\\'$RESET
echo -n $GREEN'-_-_-_-_-_-_-'
echo    $RESET$BOLD'~|__( ^ .^)'$RESET
echo -n $CYAN'-_-_-_-_-_-_-_-'
echo    $RESET$BOLD'""  ""'$RESET
echo
