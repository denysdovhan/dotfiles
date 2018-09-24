#!/usr/bin/env bash

# Dotfiles and bootstrap installer
# Installs git, clones repository and symlinks dotfiles to your home directory

set -e
trap on_error SIGKILL SIGTERM

e='\033'
RESET="${e}[0m"
BOLD="${e}[1m"
CYAN="${e}[0;96m"
RED="${e}[0;91m"
YELLOW="${e}[0;93m"
GREEN="${e}[0;92m"

_exists() {
  command -v $1 > /dev/null 2>&1
}

# Success reporter
info() {
  echo -e "${CYAN}${*}${RESET}"
}

# Error reporter
error() {
  echo -e "${RED}${*}${RESET}"
}

# Success reporter
success() {
  echo -e "${GREEN}${*}${RESET}"
}

# End section
finish() {
  success "Done!"
  echo
  sleep 1
}

# Set directory
export DOTFILES=${1:-"$HOME/.dotfiles"}
GITHUB_REPO_URL_BASE="https://github.com/denysdovhan/dotfiles"
HOMEBREW_INSTALLER_URL="https://raw.githubusercontent.com/Homebrew/install/master/install"

on_start() {
  info "           __        __   ____ _  __           "
  info "      ____/ /____   / /_ / __/(_)/ /___   _____"
  info "     / __  // __ \ / __// /_ / // // _ \ / ___/"
  info "  _ / /_/ // /_/ // /_ / __// // //  __/(__  ) "
  info " (_)\__,_/ \____/ \__//_/  /_//_/ \___//____/  "
  info "                                               "
  info "              by @denysdovhan                  "
  info "                                               "

  info "This script will guide you through installing git, zsh and dofiles itself."
  echo "It will not install anything without your direct agreement!"
  echo
  read -p "Do you want to proceed with installation? [y/N] " -n 1 answer
  echo
  if [ ${answer} != "y" ]; then
    exit 1
  fi
}

install_cli_tools() {
  # There's not need to install XCode tools on Linux
  if [ `uname` == 'Linux' ]; then
    return
  fi

  info "Trying to detect installed Command Line Tools..."

  if ! [ $(xcode-select -p) ]; then
    echo "You don't have Command Line Tools installed!"
    read -p "Do you agree to install Command Line Tools? [y/N] " -n 1 answer
    echo
    if [ ${answer} != "y" ]; then
      exit 1
    fi

    info "Installing Command Line Tools..."
    echo "Please, wait until Command Line Tools will be installed, before continue."

    xcode-select --install
  else
    success "Seems like you have installed Command Line Tools. Skipping..."
  fi

  finish
}

install_homebrew() {
  # There's not need to install Homebrew on Linux
  if [ `uname` != 'Darwin' ]; then
    return
  fi

  info "Trying to detect installed Homebrew..."

  if ! _exists brew; then
    echo "Seems like you don't have Homebrew installed!"
    read -p "Do you agree to proceed with Homebrew installation? [y/N] " -n 1 answer
    echo
    if [ ${answer} != "y" ]; then
      exit 1
    fi

    info "Installing Homebrew..."
    ruby -e "$(curl -fsSL ${HOMEBREW_INSTALLER_URL})"
    brew update
    brew upgrade
  else
    success "You already have Homebrew installed. Skipping..."
  fi

  finish
}

install_git() {
  info "Trying to detect installed Git..."

  if ! _exists git; then
    echo "Seems like you don't have Git installed!"
    read -p "Do you agree to proceed with Git installation? [y/N] " -n 1 answer
    echo
    if [ ${answer} != "y" ]; then
      exit 1
    fi

    info "Installing Git..."

    if [ `uname` == 'Darwin' ]; then
      brew install git
    elif [ `uname` == 'Linux' ]; then
      sudo apt-get install git
    else
      error "Error: Failed to install Git!"
      exit 1
    fi
  else
    success "You already have Git installed. Skipping..."
  fi

  finish
}

install_zsh() {
  info "Trying to detect installed Zsh..."

  if ! _exists zsh; then
    echo "Seems like you don't have Zsh installed!"
    read -p "Do you agree to proceed with Zsh installation? [y/N] " -n 1 answer
    echo
    if [ ${answer} != "y" ]; then
      exit 1
    fi

    info "Installing Git..."

    if [ `uname` == 'Darwin' ]; then
      brew install zsh zsh-completions
    elif [ `uname` == 'Linux' ]; then
      sudo apt-get install zsh
    else
      error "Error: Failed to install Zsh!"
      exit 1
    fi
  else
    success "You already have Zsh installed. Skipping..."
  fi

  if _exists zsh; then
    info "Setting up Zsh as default shell..."

    echo "The script will ask you the password for sudo 2 times:"
    echo
    echo "1) When adding fish shell into /etc/shells via tee"
    echo "2) When changing your default shell via chsh -s"
    echo

    echo "$(command -v zsh)" | sudo tee -a /etc/shells
    chsh -s "$(command -v zsh)" || error "Error: Cannot set Zsh as default shell!"
  fi

  finish
}

install_dotfiles() {
  info "Trying to detect installed dotfiles in $DOTFILES..."

  if [ ! -d $DOTFILES ]; then
    echo "Seems like you don't have dotfiles installed!"
    read -p "Do you agree to proceed with dotfiles installation? [y/N] " -n 1 answer
    echo
    if [ ${answer} != "y" ]; then
      exit 1
    fi

    git clone --recursive "$GITHUB_REPO_URL_BASE.git" $DOTFILES
    cd $DOTFILES && ./sync.py && cd -
  else
    success "You already have dotfiles installed. Skipping..."
  fi

  info "Linking dotfiles..."
  cd $DOTFILES && ./sync.py && cd -

  finish
}

bootstrap() {
  read -p "Would you like to bootstrap your environment? [y/N] " -n 1 answer
  echo
  if [ ${answer} != "y" ]; then
    return
  fi

  $DOTFILES/scripts/bootstrap.zsh

  finish
}

on_finish() {
  echo
  success "Setup was successfully done!"
  success "Happy Coding!"
  echo
  echo -ne $RED'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e  $RESET$BOLD',------,'$RESET
  echo -ne $YELLOW'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e  $RESET$BOLD'|   /\_/\\'$RESET
  echo -ne $GREEN'-_-_-_-_-_-_-_-_-_-_-_-_-_-'
  echo -e  $RESET$BOLD'~|__( ^ .^)'$RESET
  echo -ne $CYAN'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e  $RESET$BOLD'""  ""'$RESET
  echo
  info "P.S: Don't forget to restart a terminal :)"
  echo
}

on_error() {
  echo
  error "Wow... Something serious happened!"
  error "Though, I don't know what really happened :("
  error "In case, you want to help me fix this problem, raise an issue -> ${CYAN}${GITHUB_REPO_URL_BASE}issues/new${RESET}"
  echo
  exit 1
}

main() {
  on_start "$*"
  install_cli_tools "$*"
  install_homebrew "$*"
  install_git "$*"
  install_zsh "$*"
  install_dotfiles "$*"
  bootstrap "$*"
  on_finish "$*"
}

main "$*"
