#!/usr/bin/env zsh

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
  printf "${YELLOW}${*} [y/N]: ${RESET}"
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

link_to() {
  local extension=$1
  echo "https://marketplace.visualstudio.com/items?itemName=$extension"
}

on_start() {
  info '                                 __     '
  info '  _   __ _____ _____ ____   ____/ /___  '
  info ' | | / // ___// ___// __ \ / __  // _ \ '
  info ' | |/ /(__  )/ /__ / /_/ // /_/ //  __/ '
  info ' |___//____/ \___/ \____/ \__,_/ \___/  '
  info '                                        '
  info "This script will guide you through setting up VSCode."
  echo "It will not install anything without your direct agreement!"
  echo
  ask "Do you want to proceed with installation?" && read answer
  echo
  if [[ "${answer}" != "y" ]]; then
    exit 1
  fi
}

check_code() {
  info "Checking if VSCode is installed in PATH..."

  if ! [ $(which code) ]; then
    error "VSCode command is not installed in PATH!"
    echo
    echo "Please, perform following actions:"
    echo "  1) Open VSCode"
    echo "  2) Open Command Palette (View->Command Palette)"
    echo "  3) Run 'Install code command in PATH'"
    echo "  4) Run this script again"
    echo
    exit 1
  fi

  finish
}

sync_code() {
  local src="$DOTFILES/vscode/User"

  ask "Would you like to sync VSCode settings?" && read answer
  if [[ ${answer} != "y" ]]; then
    success "Skipping..."
    return
  fi

  if [[ "$(uname)" == 'Darwin' ]]; then
    local dest="$HOME/Library/Application Support/Code/User"
  elif [[ "$(uname)" == 'Linux' ]]; then
    local dest="$HOME/.config/Code/User"
  else
    error "Error: Failed to find VSCode user folder!"
    exit 1
  fi

  info "VSCode user folder is: $dest"

  info "Deleting $dest..."
  if [ -d "$dest" ]; then
    rm -rf "$dest" && success "Deleted!"
  fi

  info "Linking $dest to $src..."
  ln -s "$src" "$dest" && success "Linked!"

  finish
}

code_install() {
  local extension=$1

  info "We are going to install $extension."
  echo "Link: $(link_to $extension)"
  ask "Do you agree to install $(info $extension)?" && read answer
  if [[ ${answer} != "y" ]]; then
    success "Skipping..."
    echo
    return
  fi

  code --install-extension $extension

  finish
}

on_finish() {
  echo
  success "VSCode successfully configured!"
  echo
}

on_error() {
  echo
  error "Wow... Something serious happened!"
  error "Though, I don't know what really happened :("
  echo
  exit 1
}

main() {
  # Start
  on_start
  # Check 'code' in PATH
  check_code
  # Sync settings
  sync_code
  # Extensions
  code_install EditorConfig.EditorConfig
  code_install akamud.vscode-theme-onelight
  code_install atian25.copy-syntax
  code_install streetsidesoftware.code-spell-checker
  code_install streetsidesoftware.code-spell-checker-ukrainian
  code_install cdsama.shell-snippets
  code_install christian-kohler.npm-intellisense
  code_install christian-kohler.path-intellisense
  code_install CoenraadS.bracket-pair-colorizer
  code_install cssho.vscode-svgviewer
  code_install dbaeumer.vscode-eslint
  code_install eg2.tslint
  code_install dunstontc.viml
  code_install esbenp.prettier-vscode
  code_install formulahendry.auto-rename-tag
  code_install jpoissonnier.vscode-styled-components
  code_install kumar-harsh.graphql-for-vscode
  code_install msjsdiag.debugger-for-chrome
  code_install Orta.vscode-jest
  code_install patbenatar.advanced-new-file
  code_install robertohuertasm.vscode-icons
  code_install sidneys1.gitconfig
  code_install wix.vscode-import-cost
  code_install zhuangtongfa.Material-theme
  # Finish
  on_finish
}

main "$*"
