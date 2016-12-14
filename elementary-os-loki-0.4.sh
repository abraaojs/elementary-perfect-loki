#!/bin/bash

# Download Elementary OS from here: 
# https://elementary.io/
# Automatic installation script for elementary-os
# Author Abraão Silva


#Clean-up System
sudo apt-get purge midori-granite -y
sudo apt-get purge yelp -y
sudo apt-get purge evince -y
sudo apt-get purge gnome-orca -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y

#First you update your system
sudo apt-get update && sudo apt-get dist-upgrade -y

#Install Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get install google-chrome-stable -y

# Install Firefox 
sudo apt-get install firefox

#Install screenfetch (my elementary-OS special Version)
mkdir screenfetch
cd screenfetch
wget https://raw.github.com/memoryleakx/screenFetch/master/screenfetch-dev
sudo mv screenfetch-dev /usr/bin/screenfetch
cd ..
rm -rf screenfetch

#make it readable and executable
sudo chmod +rx /usr/bin/screenfetch

##setup .bashrc for auto screenfetch
# gedit ~/.bashrc
###put this on the last line
# screenfetch -D "Abraão Silva"


#Install File Compression Libs
sudo apt-get install unace unrar zip unzip xz-utils p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller -y

#Install Ubuntu Restricted Extras
sudo apt-add-repository ppa:mc3man/trusty-media ppa:gnome3-team/gnome3 -y
sudo apt-get update
sudo apt-get install ubuntu-restricted-extras ubuntu-restricted-addons ffmpeg gstreamer0.10-plugins-ugly libavcodec-extra-54 libvdpau-va-gl1 libmad0 mpg321 gstreamer1.0-libav gdebi curl flashplugin-installer dconf-editor gnome-system-monitor -y

#Install Ubuntu Restricted Extras
sudo apt-get install ubuntu-restricted-extras -y

#Enable DVD Playback
sudo /usr/share/doc/libdvdread4/install-css.sh

#Enable all Startup Applications
cd /etc/xdg/autostart
sudo sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop

#Install Elementary OS extras
sudo add-apt-repository ppa:mpstark/elementary-tweaks-daily -y
sudo apt-get update
sudo apt-get install elementary-desktop elementary-tweaks -y

sudo add-apt-repository ppa:cybre/elementaryplus
sudo apt-get update
sudo apt-get upgrade && sudo apt-get install elementaryplus

#Install Java 8
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install oracle-java8-installer -y

#Install Java 7
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer -y

#Install Skype
# sudo apt-add-repository "deb http://archive.canonical.com/ubuntu/ trusty partner" -y
# sudo apt-get update && sudo apt-get install skype -y
# sudo apt-get install gtk2-engines-murrine:i386 gtk2-engines-pixbuf:i386 -y

#Install the latest git Version
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git -y

#Install SmartGit
wget -q http://www.syntevo.com/downloads/smartgit/smartgit-7_0_2.deb 
sudo dpkg -i smartgit-7_0_2.deb
rm smartgit-7_0_2.deb

#Install Apparmor 2.8
sudo add-apt-repository ppa:apparmor-upload/apparmor-2.8 -y
sudo apt-get update && sudo apt-get dist-upgrade -y

#Install PlayonLinux
#Run Windows Applications and Games on Linux
wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
sudo wget http://deb.playonlinux.com/playonlinux_precise.list -O /etc/apt/sources.list.d/playonlinux.list
sudo apt-get update
sudo apt-get install playonlinux -y

#if not installed 
#Install the Dynamic Kernel Module Support Framework
sudo apt-get install dkms -y


#Install the latest Version of VirtualBox
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian precise contrib" >> /etc/apt/sources.list.d/virtualbox.list'
sudo apt-get update
sudo apt-get install virtualbox-5.1 -y

#Install fish shell
# sudo apt-get install zsh git-core -y
# wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
# chsh -s `which zsh`


#Install ibus-unikey
sudo apt-get install ibus ibus-unikey ibus-qt4

#Fix chrome duplicate plank
sudo sed -i "s/\/usr\/bin\/google-chrome-stable/\/usr\/bin\/google-chrome/g" /usr/share/applications/google-chrome.desktop
sudo sed -i "s/StartupWMClass=Google-chrome-stable//g" /usr/share/applications/google-chrome.desktop
#Dropbox
git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox
bash /tmp/elementary-dropbox/install.sh

#Mailnag
sudo add-apt-repository ppa:pulb/mailnag -y
sudo apt-get update
sudo apt-get install mailnag -y

#Sublime3
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo apt-get update
sudo apt-get install sublime-text-installer -y

#Install more packages
sudo apt-add-repositories ppa:maarten-baert/simplescreenrecorder -y && sudo apt-get update
sudo apt-get install vim aptitude apt-file qbittorrent quiterss dconf-editor gnome-system-monitor simplescreenrecorder quassel-qt4 bleachbit kid3-qt calibre pinta unetbootin gnome-disk-utility vlc browser-plugin-vlc -y

#Install Indicators
sudo add-apt-repository ppa:atareao/atareao -y
sudo apt-get update
sudo apt-get install my-weather-indicator -y

#Install indicator-multiload 
sudo apt-add-repository ppa:indicator-multiload/stable-daily -y
sudo apt-get update && sudo apt-get install indicator-multiload -y

#Install clipboard-manager
sudo apt-add-repository ppa:diodon-team/stable -y
sudo apt-get update && sudo apt-get install diodon

#Install tlp laptop power saver optimization
sudo apt-add-repository ppa:linrunner/tlp
sudo apt-get update && sudo apt-get install tlp
sudo tlp start

#Install Pulseaudio Eq
sudo add-apt-repository ppa:webupd8team/pulseaudio-eq
sudo apt-get update && sudo apt-get install python-dbus python-qt4 python-qt4-dbus pulseaudio-utils
pulseaudio -k && pulseaudio &
# MANUAL INSTRUCTION 
#Alacarte: add qpaeq
sudo echo "
### Load the integrated pulseaudio equalizer and dbus modules
load-module module-equalizer-sink
load-module module-dbus-protocol
" >> /etc/pulse/default.pa

#Install TeamViewer
wget -q http://download.teamviewer.com/download/teamviewer_i386.deb
sudo dpkg -i teamviewer_i386.deb
rm teamviewer_i386.deb

# Numix theme
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-icon-theme-circle numix-folders

#Paper GTK Theme
sudo add-apt-repository ppa:snwh/pulp
sudo apt-get install paper-gtk-theme

#Xenite Theme
curl https://raw.githubusercontent.com/eOS-themes/Xenite/master/setup/install.sh > install.sh
chmod +x install.sh
sudo install.sh
rm install.sh

#Themes and Conky
sudo apt-add-repository ppa:teejee2008/ppa -y
sudo apt-add-repository  ppa:yunnxx/elementary -y
sudo apt-get update
sudo apt-get install faba-icon-theme moka-icon-theme faba-mono-icons elementary-transparent-theme conky-manager


#Install Thunderbird
#if you want install Thunderbird instead of Geary Mail
#first remove Geary Mail
sudo apt-get purge geary

sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
sudo apt-get update
sudo apt-get install thunderbird -y




