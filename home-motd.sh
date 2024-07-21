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
   .~ .~~~..~.    Load Averages........: ${one}, ${five}, ${fifteen}
  : .~.'~'.~. :   Memory...............: $(($(cat /proc/meminfo | grep MemAvailable | awk {'print $2'}) / 1024))M (Available) / $(($(cat /proc/meminfo | grep MemTotal | awk {'print $2'}) / 1024))M (Total)
 ~ (   ) (   ) ~  Uptime...............: $(printf "%d days, %02d:%02d:%02d" "$((${upSeconds}/86400))" "$((${upSeconds}/3600%24))" "$((${upSeconds}/60%60))" "$((${upSeconds}%60))")
( : '~'.~.'~' : ) Root - Disk Free.....: $(df -h | grep -E 'mmcblk0p2' | awk '{ print $4 }') on /dev/root
 ~ .~ (   ) ~. ~  Raid - Disk Free.....: $(df -h | grep -E '^/dev/sda1' | awk '{ print $4 }') on /dev/sdd1
  (  : '~' :  )   Running Processes....: $(ps ax | wc -l | tr -d " ")
   '~ .~~~. ~'    Temperature..........: $(/usr/bin/vcgencmd measure_temp)
       '~'        Reboot Required......: $reboot
\n$(tput sgr0)"
