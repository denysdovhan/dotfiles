# Enable aliases to be sudo’ed
#   http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

# Avoid stupidity
#   -I instead of -i, because it less intrusive than -i, while still giving
#   protection against most mistakes.
alias rm='rm -I'

# Just bcoz clr shorter than clear
alias clr='clear'

# Easiest navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'
alias -- -='cd -'

# Folders Shortcuts
alias dr='cd ~/Dropbox'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias pj='cd ~/Projects'
alias pjr='cd ~/Projects/_Repos'
alias pjf='cd ~/Projects/_Forks'
alias pjs='cd ~/Projects/_Sites'
alias pl='cd ~/Projects/_Playground/'

# Commands Shortcuts
alias e='nano'
alias +x='chmod +x'
alias x+='chmod +x'

# Always use color output for `ls`
alias ls='ls --color'
alias ді='ls'

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Clipboard tools
alias xcopy='xclip -selection clipboard'
alias xpaste='xclip -selection clipboard -o'

# Color conversion
alias hex2hsl='color.js $1 $2'
alias hex2rgb='color.js --rgb $1 $2'

# Virtualenv
alias venv='test -d venv && source ./venv/bin/activate || echo "No Virtualenv in the current folder."'
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
alias update='source ~/Dotfiles/setup/update.sh'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Password generator
# Generate random password, copies it into clipboard and outputs it to terminal
alias password='openssl rand -base64 ${1:-9} | pbcopy ; echo `pbpaste`'

# Show $PATH in readable view
alias path='echo -e ${PATH//:/\\n}'

# Update dotfiles
alias dotfiles='cd "$HOME/dotfiles" && git pull && ./sync.py && cd - > /dev/null 2>&1 && nyan'

# Git root
# Change directory to root of git repository
alias gr='git rev-parse 2>/dev/null && cd "./$(git rev-parse --show-cdup)"'

# Download web page with all assets
alias getpage='wget --no-clobber --page-requisites --html-extension --convert-links --no-host-directories'
