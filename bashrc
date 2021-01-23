
# My Aliases
alias update='apt-get update && apt-get dist-upgrade -y && apt-get autoremove'
alias c='clear'
alias mx='dig +short mx'
alias w='whois -H'
alias a='dig +short'
alias ns='nslookup'
alias m='nslookup -querytype=MX'
alias txt='dig +short txt'
alias clamav='freshclam && clamscan -r --remove /'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias temp='/opt/vc/bin/vcgencmd measure_temp'
alias trim='fstrim -v /'
alias hosts='nmap -sn 192.168.0.0/24'
alias p='ping'
alias m='nslookup -querytype=MX'

### Login stuff ### 

### Banner Logo
echo "$(tput setaf 2)
   .~~.   .~~.
  '. \ ' ' / .'$(tput setaf 1)
   .~ .~~~..~.
  : .~.'~'.~. :
 ~ (   ) (   ) ~
( : '~'.~.'~' : )
 ~ .~ (   ) ~. ~
  (  : '~' :  ) 
   '~ .~~~. ~'
       '~'
$(tput sgr0)"


# shows users, uptime and load Averages 
uptime 
#shows temp 
/opt/vc/bin/vcgencmd measure_temp 
#checks if reboot is required 
if [ -f /var/run/reboot-required ]; then 
  echo '### !! reboot required !! ###'
