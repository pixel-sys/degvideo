#!/bin/bash
#script to run in CRON to find insert stats of traffic control into index html web page 

TC_value="$(tc qdisc show dev ens18)"

sed "s/qdisc.*/$TC_value/" /usr/share/nginx/html/index.html > /usr/share/nginx/html/tmp
cp /usr/share/nginx/html/tmp  /usr/share/nginx/html/index.html
rm /usr/share/nginx/html/tmp