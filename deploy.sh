#!/bin/bash

# ssh key
mkdir ~/.ssh
chmod 700 ~/.ssh
curl https://stuff.hostinguk.net/adg/pi/arc/key.txt > ~/.ssh/authorized_keys

# SSH to keys only and port 343
curl https://stuff.hostinguk.net/adg/pi/arc/sshd_config > /etc/ssh/sshd_config

#Bashrc
curl https://stuff.hostinguk.net/adg/pi/arc/bashrc >> ~/.bashrc

# Install packages
apt install dnsutils whois ipcalc -y

#Set hostname
hostname arc.ioserver.co.uk

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
