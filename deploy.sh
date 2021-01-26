#!/bin/bash

# Install packages
apt install dnsutils whois git ipcalc -y

# ssh key
mkdir ~/.ssh
chmod 700 ~/.ssh
curl https://raw.githubusercontent.com/MajesticTechie/arc/main/key > ~/.ssh/authorized_keys

# SSH config
curl https://raw.githubusercontent.com/MajesticTechie/arc/main/sshd_config > /etc/ssh/sshd_config

#Bashrc
curl https://raw.githubusercontent.com/MajesticTechie/arc/main/bashrc >> ~/.bashrc

#MOTD Banner
wget -q -O /etc/profile.d/motd.sh https://raw.githubusercontent.com/MajesticTechie/arc/main/motd.sh
chmod +x /etc/profile.d/motd.sh

#Set hostname
hostname arc
echo "arc" > /etc/hostname

#rc.local with disabled power management
curl https://raw.githubusercontent.com/MajesticTechie/arc/main/rc.local > /etc/rc.local

#Deletes Pi User
userdel -r -f pi

## Manual things
echo "
#####################################################
!!!!!!!!!!!! Automated install finished !!!!!!!!!!!!!
Additional Steps required
1. Github repo: (ssh keys required)
cd /
git clone https://github.com/MajesticTechie/scripts.git
#####################################################
