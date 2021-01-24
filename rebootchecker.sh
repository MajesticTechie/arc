#!/bin/bash 
#Check if file exists 
if [ -f /var/run/reboot-required ]; then 
# If file is present schedule a reboot for early morning 
shutdown -r 06:45 
fi
