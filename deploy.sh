#!/bin/bash

# Install packages
apt install dnsutils whois ipcalc -y

# ssh key
mkdir ~/.ssh
chmod 700 ~/.ssh
curl https://raw.githubusercontent.com/MajesticTechie/arc/main/key.txt > ~/.ssh/authorized_keys

# SSH to keys only and port 343
curl https://raw.githubusercontent.com/MajesticTechie/arc/main/sshd_config > /etc/ssh/sshd_config

#Bashrc
curl https://raw.githubusercontent.com/MajesticTechie/arc/main/bashrc >> ~/.bashrc

#Set hostname
hostname arc.ioserver.co.uk

#Hosts
curl https://raw.githubusercontent.com/MajesticTechie/arc/main/hosts >> /etc/hosts

curl https://raw.githubusercontent.com/MajesticTechie/arc/main/rc.local >> /etc/rc.local

#Deletes Pi User
userdel -r -f pi

## Manual things
echo "
#####################################################
!!!!!!!!!!!! Automated install finished !!!!!!!!!!!!!
Additional Steps required
1. Github repo: (ssh keys required)
cd /
git clone https://github.com/MajesticTechie/CloudflareDynamicDNS.git
#####################################################
