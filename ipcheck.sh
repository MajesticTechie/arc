#!/bin/bash
host_name=`hostname`
domain=`dig +short $host_name @1.1.1.1`
ip=`dig +short myip.opendns.com @resolver1.opendns.com`

if [ "$domain" != "$ip" ]; then
echo "Your New IP:" $ip
else
echo "The IP matches"
fi
