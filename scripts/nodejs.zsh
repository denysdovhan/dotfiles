#!/usr/bin/env zsh

set -e
trap on_error SIGKILL SIGTERM

e='\033'
RESET="${e}[0m"
BOLD="${e}[1m"
CYAN="${e}[0;96m"
RED="${e}[0;91m"
YELLOW="${e}[0;93m"
GREEN="${e}[0;92m"

# Success reporter
info() {
  echo -e "${CYAN}${*}${RESET}"
}

ask() {
  printf "${YELLOW}${*}${RESET}"
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

on_start() {
  info '     _   __            __            _       '
  info '    / | / /____   ____/ /___        (_)_____ '
  info '   /  |/ // __ \ / __  // _ \      / // ___/ '
  info '  / /|  // /_/ // /_/ //  __/_    / /(__  )  '
  info ' /_/ |_/ \____/ \__,_/ \___/(_)__/ //____/   '
  info '                              /___/          '
  info '                                             '
  info "This script will guide you through installing Node.js, nvm, etc."
  echo
  ask "Do you want to proceed with installation?" && read answer
  echo
  if [[ "${answer}" != "y" ]]; then
    exit 1
  fi
}

install_node() {
  info "Installing Node.js..."

  if [[ "$(uname)" == 'Darwin' ]]; then
    brew install node
  else
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    sudo apt-get install -y nodejs build-essential
  fi

  finish
}

install_nvm() {
  # Install nvm
  info "Installing nvm..."

  mkdir $HOME/.nvm
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

  finish
}

configure_npm_init() {
  # Ask required parameters
  info "Configure npm init..."

  # Defaults
  local name="Denys Dovhan"
  local email="denysdovhan@gmail.com"
  local website="http://denysdovhan.com/"

  ask "What is your name? ($name): " && read NAME
  ask "What is your email? ($email): " && read EMAIL
  ask "What is your website? ($website): " && read WEBSITE

  # If required parameters are not entered, set them default values
  : ${NAME:="$name"}
  : ${EMAIL:="$email"}
  : ${WEBSITE:="$website"}

  echo "Author name set as: $NAME"
  npm set init.author.name "$NAME"
  echo "Author email set as: $EMAIL"
  npm set init.author.email "$EMAIL"
  echo "Author website set as: $WEBSITE"
  npm set init.author.url "$WEBSITE"
  echo

  finish
}

fix_npm_perm() {
  # Fixing npm permissions
  info "Fixing npm permissions..."

  NPM_PREFIX="$(npm config get prefix)"
  if [[ "${NPM_PREFIX}" = '/usr/local' ]]; then
    sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}
  elif [ ! "$NPM_PREFIX" = '/usr' ]; then
    [ ! -d ~/.npm-global ] && mkdir ~/.npm-global
    npm config set prefix '~/.npm-global'
  fi

  finish
}

on_finish() {
  success "Done!"
  success "Node.js is installed!"
  echo
}

on_error() {
  error "Wow... Something serious happened!"
  error "Though, I don't know what really happened :("
  exit 1
}

main() {
  on_start "$*"
  install_node "$*"
  install_nvm "$*"
  configure_npm_init "$*"
  fix_npm_perm "$*"
}

main "$*"
