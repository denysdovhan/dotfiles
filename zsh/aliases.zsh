#
# Aliases
#

# Enable aliases to be sudo’ed
#   http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

# Avoid stupidity with trash-cli:
# 	https://github.com/sindresorhus/trash-cli
# or use default rm -i
if type trash &>/dev/null; then
	alias rm='trash'
else
	alias rm='rm -i'
fi

# Just bcoz clr shorter than clear
alias clr='clear'

# Go to the /home/$USER (~) directory and clears window of your terminal
alias q="~ && clear"

# Folders Shortcuts
[ -d ~/Dropbox ]              && alias dr='cd ~/Dropbox'
[ -d ~/Downloads ]            && alias dl='cd ~/Downloads'
[ -d ~/Desktop ]              && alias dt='cd ~/Desktop'
[ -d ~/Projects ]             && alias pj='cd ~/Projects'
[ -d ~/Projects/_Repos ]      && alias pjr='cd ~/Projects/_Repos'
[ -d ~/Projects/Repos ]       && alias pjr='cd ~/Projects/Repos'
[ -d ~/Projects/Forks ]       && alias pjf='cd ~/Projects/Forks'
[ -d ~/Projects/_Forks ]      && alias pjf='cd ~/Projects/_Forks'
[ -d ~/Projects/Playground ]  && alias pl='cd ~/Projects/Playground'
[ -d ~/Projects/_Playground ] && alias pl='cd ~/Projects/_Playground'
[ -d ~/Projects/Job ]         && alias pjj='cd ~/Projects/Job'
[ -d ~/Projects/_Job ]        && alias pjj='cd ~/Projects/_Job'

# Commands Shortcuts
alias e="$EDITOR"
alias -- +x='chmod +x'
alias x+='chmod +x'

# Open aliases
alias open='open_command'
alias o='open'
alias oo='open .'

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Clipboard tools
if [ command -v xclip >/dev/null 2>&1 ]; then
	alias xcopy='xclip -selection clipboard'
	alias xpaste='xclip -selection clipboard -o'
fi

# Color conversion
alias hex2hsl='color.js $1 $2'
alias hex2rgb='color.js --rgb $1 $2'

# Virtualenv
alias venv='test -d venv && export VIRTUAL_ENV_DISABLE_PROMPT=1 && source ./venv/bin/activate || echo "No Virtualenv in the current folder."'
alias venv-init3='test -d venv && echo "Virtualenv already exists." || virtualenv --no-site-packages -p python3 venv; venv'
alias venv-init2='test -d venv && echo "Virtualenv already exists." || virtualenv --no-site-packages venv; venv'
alias venv-init='venv-init3'
alias venv-stop='deactivate'

# Django
alias djm="python manage.py"
alias djs="python manage.py runserver"
alias djm3="python3 manage.py"
alias djs3="python3 manage.py runserver"

# Get Ubuntu Updates, and update npm and its installed packages
alias update="source $DOTFILES/setup/update.bash"

# Add an "alert" alias for long running commands.
# Use like so:
#   sleep 10; alert
if [ command -v notify-send >/dev/null 2>&1 ]; then
	alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
fi

# My IP
alias myip='curl -s https://4.ifcfg.me/'
alias mylocalip='ifconfig | sed -En "s/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p"'

# Password generator
# Gemnerate random password, copies it into clipboard and outputs it to terminal
if [ command -v pbcopy >/dev/null 2>&1 ]; then
	alias password='openssl rand -base64 ${1:-9} | pbcopy ; echo "$(pbpaste)"'
fi
if [ command -v xcopy >/dev/null 2>&1 ]; then
	alias password='openssl rand -base64 ${1:-9} | xcopy ; echo "$(xpaste)"'
fi

# Show $PATH in readable view
alias path='echo -e ${PATH//:/\\n}'

# Git root
# Change directory to root of git repository
alias gr='git rev-parse 2>/dev/null && cd "./$(git rev-parse --show-cdup)"'

# Download web page with all assets
alias getpage='wget --no-clobber --page-requisites --html-extension --convert-links --no-host-directories'

# Download file with original filename
alias get="curl -O -L"
