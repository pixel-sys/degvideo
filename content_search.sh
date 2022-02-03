#!/bin/bash
#script to run in CRON to find all .MPD files in folder and create simple list in html 

URL_prefix="https://degvideo.feit.uniza.sk/"

find /usr/share/nginx/ -name "*.mpd" | sed -e 's!/usr/share/nginx/data/!!' | sed -e "s/^/\<p\>${URL_prefix}/" -e "s/$/\<\/p\>/" > /usr/share/nginx/list/manifestList.html
