#!/bin/sh

# If it is Mac, exit
if [ `uname` == 'Darwin' ]; then
  echo "Applications installer only for Ubuntu based systems."
  exit
fi

# Ask for the administrator password upfront
sudo -v

# System upgrade
sudo apt-get update
sudo apt-get -y --force-yes dist-upgrade

# Repo's list
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo add-apt-repository -y ppa:atareao/atareao
sudo add-apt-repository -y ppa:noobslab/apps
sudo add-apt-repository -y ppa:webupd8team/atom

# Add keys for repos
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com `apt-get update 2>&1 | grep -o '[0-9A-Z]\{16\}$' | xargs`

# Update information about packages
sudo apt-get update

# List of packages
PACKAGES='
    p7zip-rar p7zip-full unace unrar zip unzip sharutils rar \
    uudeview mpack arj cabextract file-roller \
    caffeine-plus \
    grub-customizer \
    python3-cairo python3-xlib \
    gitk curl ruby-full atom'

# Install all packages from $PACKAGES
sudo apt-get -y --force-yes install $PACKAGES

# Clean system
sudo apt-get autoclean
sudo apt-get autoremove
