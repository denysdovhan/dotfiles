#!/bin/bash

# Installs zsh and Oh My Zsh, registers zsh as a default shell

# Ask for password
sudo -v

# zsh
sudo apt-get install zsh
zsh_path=$(which zsh)
grep -Fxq "$zsh_path" /etc/shells || sudo bash -c "echo $zsh_path >> /etc/shells"
chsh -s "$zsh_path" $USER

# Oh My Zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
