#!/bin/sh

# $os=$(lsb_release -i | awk -F"\t" '{print $2}')
# echo $os
# update the system first

# Download Elementary OS from here: 
# https://elementary.io/
# Automatic installation script for elementary-os
# Author Abraão Silva

#Download Elementary OS from here: 
#https://elementary.io/

#First you update your system
sudo apt-get update && sudo apt-get dist-upgrade -y

#Install Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get install google-chrome-stable -y

# Install Firefox 
sudo apt-get install firefox -y

#Clean-up System
sudo apt-get purge midori-granite
sudo apt-get purge bluez
sudo apt-get autoremove
sudo apt-get autoclean

#Remove some Switchboard Plug's
sudo rm -rf /usr/lib/plugs/GnomeCC/gnomecc-bluetooth.plug
sudo rm -rf /usr/lib/plugs/GnomeCC/gnomecc-wacom.plug

#Install File Compression Libs
sudo apt-get install unace unrar zip unzip xz-utils p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller -y

#Install Ubuntu Restricted Extras
sudo apt-get install ubuntu-restricted-extras -y

#Enable all Startup Applications
cd /etc/xdg/autostart
sudo sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop

#Install a Firewall Application
# sudo apt-get install gufw

#Install Gimp
sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y
sudo apt-get update
sudo apt-get install gimp gimp-data gimp-plugin-registry gimp-data-extras -y

#Install Elementary OS extras
sudo add-apt-repository ppa:mpstark/elementary-tweaks-daily -y
sudo apt-get update
sudo apt-get install elementary-desktop elementary-tweaks -y

# Numix theme
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-icon-theme-circle numix-folders

#Themes and Conky
sudo apt-add-repository ppa:teejee2008/ppa -y
sudo apt-add-repository  ppa:yunnxx/elementary -y
sudo apt-get update
sudo apt-get install faba-icon-theme moka-icon-theme faba-mono-icons elementary-transparent-theme conky-manager

#Install Java 8
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install oracle-java8-installer -y

#Install Skype
# sudo apt-add-repository "deb http://archive.canonical.com/ubuntu/ trusty partner"
# sudo apt-get update && sudo apt-get install skype
# sudo apt-get install gtk2-engines-murrine:i386 gtk2-engines-pixbuf:i386


#Install the latest git Version
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git -y

#Install the latest git Version
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git -y

sudo apt-get install gitk -y

#Install SmartGit
wget -q http://www.syntevo.com/downloads/smartgit/smartgit-7_0_2.deb 
sudo dpkg -i smartgit-7_0_2.deb
rm smartgit-7_0_2.deb

#if not installed 
#Install the Dynamic Kernel Module Support Framework
sudo apt-get install dkms -y


#Install the latest Version of VirtualBox
# wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
# sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list.d/virtualbox.list'
# sudo apt-get update
# sudo apt-get install virtualbox-5.1 -y

#Install fish shell
# sudo apt-get install fish
# chsh -s /usr/bin/fish

#Install ibus-unikey
sudo apt-get install ibus ibus-unikey ibus-qt4

#Fix chrome duplicate plank
sudo sed -i "s/\/usr\/bin\/google-chrome-stable/\/usr\/bin\/google-chrome/g" /usr/share/applications/google-chrome.desktop
sudo sed -i "s/StartupWMClass=Google-chrome-stable//g" /usr/share/applications/google-chrome.desktop

#Dropbox
# git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox
# bash /tmp/elementary-dropbox/install.sh

#Mailnag
sudo add-apt-repository ppa:pulb/mailnag
sudo apt-get update
sudo apt-get install mailnag

#Sublime3
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo apt-get update
sudo apt-get install sublime-text-installer -y

#Install Vim and aptitude

sudo apt-get install aptitude && sudo apt-get install vim -y

#Install more packages
sudo apt-get install vim aptitude shutter tomboy

#Install screenfetch (my elementary-OS special Version)
# mkdir screenfetch
# cd screenfetch
# wget https://raw.github.com/memoryleakx/screenFetch/master/screenfetch-dev
# sudo mv screenfetch-dev /usr/bin/screenfetch
# cd ..
# rm -rf screenfetch

#make it readable and executable
# sudo chmod +rx /usr/bin/screenfetch

##setup .bashrc for auto screenfetch
# gedit ~/.bashrc
###put this on the last line
# screenfetch -D "Abraão Silva"

#Install more packages
# sudo apt-add-repositories ppa:maarten-baert/simplescreenrecorder -y && sudo apt-get update
# sudo apt-get install vim aptitude apt-file qbittorrent quiterss dconf-editor gnome-system-monitor simplescreenrecorder quassel-qt4 bleachbit kid3-qt calibre pinta unetbootin gnome-disk-utility vlc browser-plugin-vlc -y



#Install Thunderbird
#if you want install Thunderbird instead of Geary Mail
#first remove Geary Mail
sudo apt-get purge geary

sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa -y
sudo apt-get update
sudo apt-get install thunderbird -y




