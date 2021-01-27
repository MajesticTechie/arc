!/bin/bash
read one five fifteen rest < /proc/loadavg
upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"

#Checks if reboot is required
if [ -f /var/run/reboot-required ];
then reboot="$(tput setaf 3)Yes!"
else
reboot="No"
fi
printf "$(tput setaf 3)
                           $(date +"%A, %d.%m.%Y, %R:%S")
        `'::.              $(uname -srmo)$(tput setaf 1)
    _________H ,%%&%,      Uptime...............: $(printf "%d days, %02d:%02d:%02d" "$((${upSeconds}/86400))" "$((${upSeconds}/3600%24))" "$((${upSeconds}/60%60))" "$((${upSeconds}%60))")
   /\     _   \%&&%%&%     Memory...............: $(($(cat /proc/meminfo | grep MemAvailable | awk {'print $2'}) / 1024))M (Available) / $(($(cat /proc/meminfo | grep MemTotal | awk {'print $2'}) / 1024))M (Total)
  /  \___/^\___\%&%%&&     Free Disk Space......: $(df -h | grep -E '^/dev/root' | awk '{ print $4 }') on /dev/root
  |  | []   [] |%\Y&%'     Public IP Address....: $(dig +short myip.opendns.com @resolver1.opendns.com)
  |  |   .-.   | ||        Load Averages........: ${one}, ${five}, ${fifteen}
~@._|@@_|||_@@|~||~~~~~~   Temperature..........: $(/opt/vc/bin/vcgencmd measure_temp | cut -c "6-9")  C
     `""") )"""`           Reboot Required......: $reboot
\n$(tput sgr0)"
