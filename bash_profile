# Inspired by:
#   https://github.com/sapegin/dotfiles/blob/master/tilde/bash_profile.bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# Add custom bin path
[ -d /opt/lampp/ ] && PATH=/opt/lampp/:$PATH
[ -d /opt/lampp/bin ] && PATH=/opt/lampp/bin:$PATH

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


# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Bash aliases and prompt
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_prompt ] && source ~/.bash_prompt

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Nano is default editor
export EDITOR='nano'

# Tell ls to be colourful
export CLICOLOR=1

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
