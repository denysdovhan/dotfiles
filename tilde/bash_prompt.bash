# Inspired by:
#   https://github.com/dreadatour/dotfiles/blob/master/.bash_profile

# Set user color
case `id -u` in
  0) USER_COLOR=$RED ;;
  *) USER_COLOR=$YELLOW ;;
esac

# Some kind of optimization - check if git installed only on config load
PS1_GIT_BIN=$(which git 2>/dev/null)

# Function that gets information about Git repository.
function prompt_git {
  local s=''
  local GIT_BRANCH=''

  # Check if the current directory is in a Git repository.
  if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

    # check if the current directory is in .git before running git checks
    if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

      # Ensure the index is up to date.
      git update-index --really-refresh -q &>/dev/null

      # Check for uncommitted changes in the index.
      if ! $(git diff --quiet --ignore-submodules --cached); then
        s+='+'
      fi;

      # Check for unstaged changes.
      if ! $(git diff-files --quiet --ignore-submodules --); then
        s+='!'
      fi;

      # Check for untracked files.
      if [ -n "$(git ls-files --others --exclude-standard)" ]; then
        s+='?'
      fi;

      # Check for stashed files.
      if $(git rev-parse --verify refs/stash &>/dev/null); then
        s+='$'
      fi;

    fi;

    # Get the short symbolic ref.
    # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
    # Otherwise, just give up.
    GIT_BRANCH="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
      git rev-parse --short HEAD 2> /dev/null || \
      echo '(unknown)')";

    [ -n "${s}" ] && s=" [${s}]";

    echo -e "${1}${GIT_BRANCH}${RED}${s}";
  else
    return
  fi;
}

# Function that will be called just before Bash displays a prompt.
function prompt_command {
  local PWDNAME=$PWD

  # Beautify working directory name
  if [ $HOME == $PWD ]; then
    PWDNAME="~"
  elif [ $HOME == ${PWD:0:${#HOME}} ]; then
    PWDNAME="~${PWD:${#HOME}}"
  fi;

  # Highlight the hostname when connected via SSH.
  if [[ "${SSH_TTY}" ]]; then
    HOST_STYLE="${BOLD}${RED}"
  else
    HOST_STYLE="${GREEN}"
  fi;

  # Set PS1 - default interaction prompt
  PS1="\[${BOLD}\]" # bold style
  PS1+="\[${USER_COLOR}\]\u" # username
  PS1+="\[${WHITE}\] at " # white 'at'
  PS1+="\[${HOST_STYLE}\]\h" # host
  PS1+="\[${WHITE}\] in " # white 'in'
  PS1+="\[${BLUE}\]\w" # working directory
  PS1+="\$(prompt_git \"${WHITE} on ${MAGENTA}\")" # Git repository details
  PS1+="\n" # new line
  PS1+="\[${WHITE}\]\$ \[${NOCOLOR}\]" # `$` (and reset color)

  # Set PS2 - continuation interactive prompt
  PS2="\[${YELLOW}\]"
  PS2+="\[${BOLD}\]→ "
  PS2+="\[${NOCOLOR}\]"

  # Get cursor position and add new line if we're not in first column
  # cool'n'dirty trick (http://stackoverflow.com/a/2575525/1164595)
  # XXX FIXME: this hack broke ssh =(
  exec < /dev/tty
  local OLDSTTY=$(stty -g)
  stty raw -echo min 0
  echo -en "\033[6n" > /dev/tty && read -sdR CURPOS
  stty $OLDSTTY
  [[ ${CURPOS##*;} -gt 1 ]] && echo "${RED}↵${NOCOLOR}"

  # Terminal title
  local TITLE=`basename ${PWDNAME}`
  [ $SHLVL -gt 1 ] && TITLE="${TITLE} — ${HOSTNAME}"
  echo -ne "\033]0;${TITLE}"; echo -ne "\007"
}

# Set prompt command (title update and color prompt)
PROMPT_COMMAND=prompt_command
# Set new B&W prompt (will be overwritten in `prompt_command` later with color prompt)
PS1='\u@\h:\w\$ '
