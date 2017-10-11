# load zgen
source "$HOME/.zgen/zgen.zsh"

if ! zgen saved; then
  echo "Creating a zgen save..."

  # Use Oh-My-Zsh
  zgen oh-my-zsh

  # Load Oh-My-Zsh plugins
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/node
  zgen oh-my-zsh plugins/npm
  zgen oh-my-zsh plugins/nvm
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/web-search
  zgen oh-my-zsh plugins/vagrant
  zgen oh-my-zsh plugins/yarn
  zgen oh-my-zsh plugins/heroku
  # TODO: Use extract plugin
  zgen oh-my-zsh plugins/themes
  zgen oh-my-zsh plugins/rbenv

  # Load external plugins
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load hlissner/zsh-autopair
  # zgen load lukechilds/zsh-better-npm-completion
  zgen load akoenig/gulp.plugin.zsh
  zgen load denysdovhan/gitio-zsh

  # Load theme
  # zgen load denysdovhan/spaceship-zsh-theme spaceship
  zgen load $HOME/Projects/Repos/spaceship-zsh-theme

  # Automaticaly refresh ~/.zshrc and ~/.zshlocal
  if [[ -f "$HOME/.zshlocal" ]]; then
    ZGEN_RESET_ON_CHANGE=("$HOME/.zshrc" "$HOME/.zshlocal")
  else
    ZGEN_RESET_ON_CHANGE=("$HOME/.zshrc")
  fi

  # save all to init script
  zgen save
fi