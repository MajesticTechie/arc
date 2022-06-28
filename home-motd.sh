#!/bin/bash
read one five fifteen rest < /proc/loadavg
upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"

#Checks if reboot is required
if [ -f /var/run/reboot-required ];
then reboot="$(tput setaf 3)Yes!"
else
reboot="No"
fi

printf "$(tput setaf 2)
   .~~.   .~~.    $(date +"%A, %d.%m.%Y, %R:%S")
  '. \ ' ' / .'   $(uname -srmo)$(tput setaf 1)
   .~ .~~~..~.    Hostname.............: $(hostname)
  : .~.'~'.~. :   Uptime...............: $(printf "%d days, %02d:%02d:%02d" "$((${upSeconds}/86400))" "$((${upSeconds}/3600%24))" "$((${upSeconds}/60%60))" "$((${upSeconds}%60))")
 ~ (   ) (   ) ~  Memory...............: $(($(cat /proc/meminfo | grep MemAvailable | awk {'print $2'}) / 1024))M (Available) / $(($(cat /proc/meminfo | grep MemTotal | awk {'print $2'}) / 1024))M (Total)
( : '~'.~.'~' : ) Root -  Disk Free....: $(df -h | grep -E '^/dev/root' | awk '{ print $4 }') on /dev/root
 ~ .~ (   ) ~. ~  USB - Disk Free......: $(df -h | grep -E '^/dev/sda1' | awk '{ print $4 }') on /dev/sda1
  (  : '~' :  )   Load Averages........: ${one}, ${five}, ${fifteen}
   '~ .~~~. ~'    Temperature..........: $(/opt/vc/bin/vcgencmd measure_temp | cut -c "6-9")  C
       '~'        Reboot Required......: $reboot
\n$(tput sgr0)"
