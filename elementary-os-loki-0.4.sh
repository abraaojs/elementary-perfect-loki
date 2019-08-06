#!/bin/sh
# Created by Abraao Silva
# Date 08-12-2018

# $os=$(lsb_release -i | awk -F"\t" '{print $2}')
# echo $os
# update the system first

# Download Elementary OS from here: 
# https://elementary.io/
# Automatic installation script for elementary-os
# Author Abraão Silva

#Download Elementary OS from here: 
#https://elementary.io/

echo "Let us check if your computer is up-to-date and upgrade"

#First you update your system
sudo apt-get update && sudo apt-get dist-upgrade -y

sudo apt-get install aptitude -y

#Install Google Chrome
#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo aptitude update
sudo aptitude install google-chrome-stable -y

# Install Firefox 
sudo aptitude install firefox -y

#Clean-up System
sudo aptitude purge midori-granite -y
sudo aptitude purge bluez -y
sudo aptitude autoremove -y
sudo aptitude autoclean -y

#Remove some Switchboard Plug's
sudo rm -rf /usr/lib/plugs/GnomeCC/gnomecc-bluetooth.plug
sudo rm -rf /usr/lib/plugs/GnomeCC/gnomecc-wacom.plug

#Install File Compression Libs
sudo aptitude install unace unrar zip unzip xz-utils p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller -y

#Install Ubuntu Restricted Extras
sudo aptitude install ubuntu-restricted-extras -y

#Enable all Startup Applications
cd /etc/xdg/autostart
sudo sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop

#Install a Firewall Application
# sudo aptitude install gufw

# mvn
wget -N http://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
sudo tar -zxf apache-maven-3.3.9-bin.tar.gz -C /opt
printf "export M2_HOME=/opt/apache-maven-3.3.9\nexport PATH=\$PATH:\$M2_HOME/bin" >> /$HOME/.bash_profile
sudo rm -rf apache-maven-3.3.9-bin.tar.gz

#Install Gimp
sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y
sudo aptitude update 
sudo aptitude install gimp gimp-data gimp-plugin-registry gimp-data-extras -y

#Install Elementary OS extras
sudo -E  add-apt-repository ppa:mpstark/elementary-tweaks-daily -y
sudo aptitude update
sudo aptitude install elementary-tweaks -y

# Numix theme
sudo -E add-apt-repository ppa:numix/ppa -y
sudo aptitude update 
sudo apt install numix-icon-theme-circle -y

#Install Java 8
sudo aptitude install -y python-software-properties debconf-utils -y
sudo -E add-apt-repository -y ppa:webupd8team/java -y
sudo aptitude update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo aptitude install -y oracle-java8-installer -y

#Install the latest git Version
sudo -E add-apt-repository ppa:git-core/ppa -y
sudo aptitude update
sudo aptitude install git -y
sudo aptitude install gitk -y

#Install SmartGit
wget -q http://www.syntevo.com/downloads/smartgit/smartgit-7_0_2.deb 
sudo dpkg -i smartgit-7_0_2.deb
rm smartgit-7_0_2.deb

#if not installed 
#Install the Dynamic Kernel Module Support Framework
sudo aptitude install dkms -y


#Install the latest Version of VirtualBox
# wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
# sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list.d/virtualbox.list'
# sudo aptitude update
# sudo aptitude install virtualbox-5.1 -y

#Install fish shell
# sudo aptitude install fish
# chsh -s /usr/bin/fish

#Install ibus-unikey
sudo aptitude install ibus ibus-unikey ibus-qt4 -y
#Fix chrome duplicate plank
sudo sed -i "s/\/usr\/bin\/google-chrome-stable/\/usr\/bin\/google-chrome/g" /usr/share/applications/google-chrome.desktop
sudo sed -i "s/StartupWMClass=Google-chrome-stable//g" /usr/share/applications/google-chrome.desktop

#Dropbox
# git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox
# bash /tmp/elementary-dropbox/install.sh

#Mailnag
sudo -E add-apt-repository ppa:pulb/mailnag -y
sudo aptitude update
sudo aptitude install mailnag -y

#Sublime3
sudo -E add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo aptitude update
sudo aptitude install sublime-text-installer -y

#Install Vim
sudo aptitude install vim -y

#Install more packages
# sudo aptitude install vim aptitude shutter tomboy -y

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
# sudo apt-add-repositories ppa:maarten-baert/simplescreenrecorder -y && sudo aptitude update
# sudo aptitude install vim aptitude apt-file qbittorrent quiterss dconf-editor gnome-system-monitor simplescreenrecorder quassel-qt4 bleachbit kid3-qt calibre pinta unetbootin gnome-disk-utility vlc browser-plugin-vlc -y

#Install Thunderbird
#if you want install Thunderbird instead of Geary Mail
#first remove Geary Mail
sudo aptitude purge geary -y

sudo -E add-apt-repository ppa:ubuntu-mozilla-security/ppa -y
sudo aptitude update
sudo aptitude install thunderbird -y

# latest kernel check the following url
# http://kernel.ubuntu.com/~kernel-ppa/mainline/
# at the moment you can have kernel 4.4.0
echo "Let us check if your computer is up-to-date"

wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.8.9/linux-headers-4.8.9-040809_4.8.9-040809.201611180631_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.8.9/linux-headers-4.8.9-040809-generic_4.8.9-040809.201611180631_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.8.9/linux-image-4.8.9-040809-generic_4.8.9-040809.201611180631_amd64.deb

sudo dpkg -i linux*

rm linux-*

echo "Kernel is installed"
echo "Download files have been deleted"

# Ending
sudo aptitude -y update
sudo aptitude -f -y install
sudo aptitude -y upgrade

sudo aptitude -y autoremove
sudo aptitude -y autoclean