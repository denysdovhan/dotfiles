#
# ~/.zshrc
#

# Export path to root of dotfiles repo
export DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

# Source zplug manager (https://github.com/zplug/zplug)
source "$DOTFILES/modules/zplug/init.zsh"

# Let zplug manage itself like other packages
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Oh-My-Zsh core
zplug "lib/*", from:oh-my-zsh

# Oh-My-Zsh plugins
zplug "plugins/history-substring-search", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/yarn", from:oh-my-zsh
zplug "plugins/nvm", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/gpg-agent", from:oh-my-zsh

# Zsh improvements
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "hlissner/zsh-autopair", defer:2

# Extra
zplug "lukechilds/zsh-better-npm-completion", defer:2
zplug "denysdovhan/gitio-zsh", as:command, use:"gitio.zsh"

# Spaceship ZSH
if [[ -d "$HOME/Projects/Repos/spaceship-prompt" ]]; then
  zplug "$HOME/Projects/Repos/spaceship-prompt", from:local, as:theme, use:"spaceship.zsh"
else
  zplug "denysdovhan/spaceship-prompt", as:theme, use:"spaceship.zsh"
fi

# Dotfiles
zplug "$DOTFILES/lib", from:local

# Custom local overridings
zplug "~/.zshlocal", from:local, if:"[[ -f ~/.zshlocal ]]"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load
