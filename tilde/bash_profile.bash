# Inspired by:
#   https://github.com/sapegin/dotfiles/blob/master/tilde/bash_profile.bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Prepend $PATH without duplicates
function _prepend_path() {
 if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
   PATH="$1:$PATH"
 fi
}

# Add custom bin path
[ -d /opt/lampp/ ] && _prepend_path /opt/lampp/
[ -d /opt/lampp/bin ] && _prepend_path /opt/lampp/bin
[ -d ~/Dotfiles/bin ] && _prepend_path ~/Dotfiles/bin

# don't put duplicate lines in the history
export HISTCONTROL=ignoreboth:erasedups

# Set history length
HISTFILESIZE=1000000000
HISTSIZE=1000000

# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize
# correct minor errors in the spelling of a directory component in a cd command
shopt -s cdspell
# save all lines of a multiple-line command in the same history entry (allows easy re-editing of multi-line commands)
shopt -s cmdhist

# Setup colors varibles
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  tput sgr0
  # Get color, if tput is available
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  MAGENTA="$(tput setaf 5)"
  CYAN="$(tput setaf 6)"
  WHITE="$(tput setaf 7)"
  GRAY="$(tput setaf 8)"
  BOLD="$(tput bold)"
  UNDERLINE="$(tput sgr 0 1)"
  INVERT="$(tput sgr 1 0)"
  NOCOLOR="$(tput sgr0)"
else
  # Colors ANSI escape fallback
  RED="\e[0;31m"
  GREEN="\e[0;32m"
  YELLOW="\e[0;33m"
  BLUE="\e[0;34m"
  MAGENTA="\e[0;35m"
  CYAN="\e[1;36m"
  WHITE="\e[1;37m"
  GRAY="\e[1;30m"
  BOLD="\e[1m"
  UNDERLINE="\e[4m"
  INVERT="\e[7m"
  NOCOLOR="\e[0m"
fi

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# WP-CLI
# bash completion for the `wp` command
_wp_complete() {
  local cur=${COMP_WORDS[COMP_CWORD]}

  IFS=$'\n';  # want to preserve spaces at the end
  local opts="$(wp cli completions --line="$COMP_LINE" --point="$COMP_POINT")"

  if [[ "$opts" =~ \<file\>\s* ]]
  then
    COMPREPLY=( $(compgen -f -- $cur) )
  elif [[ $opts = "" ]]
  then
    COMPREPLY=( $(compgen -f -- $cur) )
  else
    COMPREPLY=( ${opts[*]} )
  fi
}
complete -o nospace -F _wp_complete wp

# Grunt completions
# command -v grunt >/dev/null 2>&1 && eval "$(grunt --completion=bash)"

# Load ~/.bash_prompt, ~/.bash_aliases and ~/.bash_functions
# ~/.bash_extra can be used for settings you don’t want to commit
for file in ~/.bash_{aliases,extra,functions,prompt}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Custom dircolors
[ -e ~/.dircolors ] && DIR_COLORS=~/.dircolors
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# Nano is default editor
export EDITOR='nano'

# Tell ls to be colourful
export CLICOLOR=1

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
