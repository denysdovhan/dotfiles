# Enable aliases to be sudo’ed
#   http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

# Avoid stupidity
#   -I instead of -i, because it less intrusive than -i, while still giving
#   protection against most mistakes.
alias rm='rm -I'

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
alias pjs='cd ~/Dropbox/Projects/_Sites'
alias pl='cd ~/Dropbox/Projects/_Playground/'

# Always use color output for `ls`
alias ls="ls --color"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Clipboard tools
# pbcopy / pbpaste aliases like OS X
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
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
