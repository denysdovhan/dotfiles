source "$DOTFILES/modules/zplug/init.zsh"

zplug "$HOME/Projects/Repos/spaceship-zsh-theme", from:local, as:theme, use:"spaceship.zsh"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose