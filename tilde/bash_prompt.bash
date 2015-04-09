# Inspired by:
#   https://github.com/dreadatour/dotfiles/blob/master/.bash_profile

# Set user color
case `id -u` in
  0) USER_COLOR=$RED ;;
  *) USER_COLOR=$GREEN ;;
esac

# Some kind of optimization - check if git installed only on config load
PS1_GIT_BIN=$(which git 2>/dev/null)

function prompt_command {
  local PS1_GIT=
  local GIT_BRANCH=
  local GIT_DIRTY=
  local PWDNAME=$PWD

  # Beautify working directory name
  if [ $HOME == $PWD ]; then
    PWDNAME="~"
  elif [ $HOME == ${PWD:0:${#HOME}} ]; then
    PWDNAME="~${PWD:${#HOME}}"
  fi

  # Parse Git status and get Git variables
  if [[ ! -z $PS1_GIT_BIN ]]; then
    # Check we are in Git repo
    local CUR_DIR=$PWD
    while [[ ! -d "$CUR_DIR/.git" ]] && [[ ! "$CUR_DIR" == "/" ]] && [[ ! "$CUR_DIR" == "~" ]] && [[ ! "$CUR_DIR" == "" ]]; do CUR_DIR=${CUR_DIR%/*}; done
    if [[ -d "$CUR_DIR/.git" ]]; then
      # Git repo for dotfiles' fix: show git status only in home dir and other Git repos
      if [[ "${CUR_DIR}" != "${HOME}" ]] || [[ "${PWD}" == "${HOME}" ]]; then
        # Get Git branch
        GIT_BRANCH=$($PS1_GIT_BIN symbolic-ref HEAD 2>/dev/null)
        if [[ ! -z $GIT_BRANCH ]]; then
          GIT_BRANCH=${GIT_BRANCH#refs/heads/}

          # Get Git status
          local GIT_STATUS=$($PS1_GIT_BIN status --porcelain 2>/dev/null)
          [[ -n $GIT_STATUS ]] && GIT_DIRTY=1
        fi
      fi
    fi
  fi

  # Build B&W prompt for Git
  [[ ! -z $GIT_BRANCH ]] && PS1_GIT=" #${GIT_BRANCH}"

  # Calculate prompt length
  local PS1_length=$((${#USER}+${#HOSTNAME}+${#PWDNAME}+${#PS1_GIT}+3))
  local FILL=

  # Of length is greater, than terminal width
  if [[ $PS1_length -gt $COLUMNS ]]; then
    # strip working directory name
    PWDNAME="...${PWDNAME:$(($PS1_length-$COLUMNS+3))}"
  else
    # else calculate fillsize
    local fillsize=$(($COLUMNS-$PS1_length))
    FILL=$GRAY
    while [[ $fillsize -gt 0 ]]; do FILL="${FILL}─"; fillsize=$(($fillsize-1)); done
    FILL=$FILL$NOCOLOR
  fi

  # Git status for prompt
  if [ ! -z $GIT_BRANCH ]; then
    local BRANCH_COLOR=$GREEN
    [ ! -z $GIT_DIRTY ] && BRANCH_COLOR=$RED
    PS1_GIT=" #$BRANCH_COLOR$GIT_BRANCH$NOCOLOR"
  fi

  # Set new color prompt
  PS1="$USER_COLOR$USER$NOCOLOR@$YELLOW$HOSTNAME$NOCOLOR:$WHITE$PWDNAME$NOCOLOR$PS1_GIT $FILL\n→ "

  # Get cursor position and add new line if we're not in first column
  # cool'n'dirty trick (http://stackoverflow.com/a/2575525/1164595)
  # XXX FIXME: this hack broke ssh =(
  # exec < /dev/tty
  # local OLDSTTY=$(stty -g)
  # stty raw -echo min 0
  # echo -en "\033[6n" > /dev/tty && read -sdR CURPOS
  # stty $OLDSTTY
  echo -en "\033[6n" && read -sdR CURPOS
  [[ ${CURPOS##*;} -gt 1 ]] && echo "${color_error}●${color_error_off}"

  # Terminal title
  local TITLE=`basename ${PWDNAME}`
  [ $SHLVL -gt 1 ] && TITLE="${TITLE} — ${HOSTNAME}"
  echo -ne "\033]0;${TITLE}"; echo -ne "\007"
}

# Set prompt command (title update and color prompt)
PROMPT_COMMAND=prompt_command
# Set new B&W prompt (will be overwritten in `prompt_command` later with color prompt)
PS1='\u@\h:\w\$ '
