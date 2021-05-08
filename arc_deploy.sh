#!/bin/bash

# ssh key
mkdir ~/.ssh
chmod 700 ~/.ssh
curl https://raw.githubusercontent.com/MajesticTechie/arc/main/key > ~/.ssh/authorized_keys

# SSH config
curl https://raw.githubusercontent.com/MajesticTechie/arc/main/sshd_config > /etc/ssh/sshd_config

#Bashrc
curl https://raw.githubusercontent.com/MajesticTechie/arc/main/bashrc >> ~/.bashrc

#MOTD Banner
curl https://raw.githubusercontent.com/MajesticTechie/arc/main/motd.sh > /etc/profile.d/motd.sh
chmod +x /etc/profile.d/motd.sh

#clear default not
cat /dev/null > /etc/motd

#Set hostname
echo "Enter your Hostname:"
read host_name
hostname $host_name
echo $host_name > /etc/hostname

#Set External DNS servers
echo "static domain_name_servers=1.1.1.1 1.0.0.1" >> /etc/dhcpcd.conf

#Update
apt update && apt upgrade -y

# Install packages
apt install dnsutils whois git ipcalc ftp telnet lftp mtr nmap -y

#Install Speed test CLI
sudo apt-get install gnupg1 apt-transport-https dirmngr
export INSTALL_KEY=379CE192D401AB61
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $INSTALL_KEY
echo "deb https://ookla.bintray.com/debian generic main" | sudo tee  /etc/apt/sources.list.d/speedtest.list
sudo apt-get update
# Other non-official binaries will conflict with Speedtest CLI
# Example how to remove using apt-get
# sudo apt-get remove speedtest-cli
sudo apt-get install speedtest

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
cd 
git clone git@github.com:MajesticTechie/scripts.git
#####################################################"
