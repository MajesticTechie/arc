#!/bin/bash 
#Check if file exists 
if [ -f /var/run/reboot-required ];  
# If file is present schedule a reboot for early morning 
then shutdown -r 06:45 
fi
