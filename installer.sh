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

# Success reporter
info() {
  echo ; echo "${CYAN}${BOLD}${*}${RESET}" ; echo
}

# Error reporter
error() {
  echo ; echo "${RED}${BOLD}${*}${RESET}" ; echo
}

# Success reporter
success() {
  echo ; echo "${GREEN}${BOLD}${*}${RESET}" ; echo
}

# Set directory
export DOTFILES=${1:-"$HOME/Dotfiles"}

# Ask for password
sudo -v

# Preinstall
if ! hash git 2>/dev/null ; then
  if [ `uname` == 'Darwin' ]; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
info "Path to Zsh: $zsh_path. Enter your password to change default shell:"
grep -Fxq "$zsh_path" /etc/shells || sudo bash -c "echo $zsh_path >> /etc/shells"
chsh -s "$zsh_path" $USER || error "Error: Cannot set zsh as default shell!"

# Installing Zgen
[ -d ~/.zgen ] || git clone https://github.com/tarjoilija/zgen.git ~/.zgen

# Clone dotfiles and make symlinks
info "Installing dotfiles..."

if [ ! -d $DOTFILES ]; then
  git clone https://github.com/denysdovhan/dotfiles.git $DOTFILES
  if [ -d $DOTFILES ]; then
    cd $DOTFILES && ./sync.py && cd -
  else
    error "Error: Dotfiles weren't installed into $DOTFILES."
    exit
  fi
fi

# Problem with not interactive shell
# http://askubuntu.com/a/77053
PS1='$>'
if [ -d $DOTFILES ]; then
  success "Dotfiles installed successfully!"
else
  error "Error: Dotfiles didn't installed!"
  exit 1
fi

# Copy path to clipboard with pbcopy and xclip
echo -n "$DOTFILES/setup/bootstrap.sh" | pbcopy 2>/dev/null
echo -n "$DOTFILES/setup/bootstrap.sh" | xclip -selection clipboard 2>/dev/null

info "Path to bootstrap script copied to clipboard."

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
