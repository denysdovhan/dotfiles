#!/bin/bash

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
sudo add-apt-repository -y ppa:tualatrix/ppa
sudo add-apt-repository -y ppa:ricotz/docky
sudo add-apt-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo add-apt-repository -y ppa:kazam-team/unstable-series
sudo add-apt-repository -y ppa:atareao/atareao
sudo add-apt-repository -y ppa:skype-wrapper/ppa
sudo add-apt-repository -y ppa:rpeshkov/ppa
sudo add-apt-repository -y ppa:noobslab/apps
sudo add-apt-repository -y ppa:webupd8team/atom

# Add keys for repos
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com `apt-get update 2>&1 | grep -o '[0-9A-Z]\{16\}$' | xargs`

# Update information about packages
sudo apt-get update

# List of packages
PACKAGES='
    ubuntu-tweak dconf-tools unity-tweak-tool compizconfig-settings-manager\
    synaptic p7zip-rar p7zip-full unace unrar zip unzip sharutils rar\
    uudeview mpack arj cabextract file-roller plank numix-gtk-theme\
    numix-icon-theme-circle gitk caffeine-plus grub-customizer\
    kazam python3-cairo python3-xlib my-weather-indicator skype sni-qt:i386\
    gtk2-engines-murrine:i386 gtk2-engines-pixbuf:i386 skype-wrapper\
    sni-qt curl ruby-full atom'

# Install all packages from $PACKAGES
sudo apt-get -y --force-yes install $PACKAGES

# Clean system
sudo apt-get autoclean
sudo apt-get autoremove
