
spaceship-loader() {
  local spaceship_project="$HOME/Projects/Repos/spaceship/spaceship-prompt"
  local spaceship_entry_file="spaceship.zsh"

  if [[ -d "$spaceship_project" ]]; then
    source "$spaceship_project/$spaceship_entry_file"
    return 0
  fi

  source "$1/$spaceship_entry_file"
}
