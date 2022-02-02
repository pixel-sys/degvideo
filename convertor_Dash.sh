#!/bin/bash
for file in /home/fvideo/Upload_Video/*.mp4
do
fullfile=$file
fname=$(basename $fullfile)
fbname=${fname%.*}
echo $fbname

VIDEO_IN="/home/fvideo/Upload_Video/$fbname.mp4"
mkdir -p "/usr/share/nginx/data/$fbname"
VIDEO_OUT=master
VIDEO_OUT_manifest="/usr/share/nginx/data/$fbname/manifest.mpd"


HLS_TIME=4
FPS=25
GOP_SIZE=100
PRESET_P=fast
V_SIZE_144=256x144
V_SIZE_240=426x240
V_SIZE_360=640x360
V_SIZE_720=1280x720
V_SIZE_1080=1920x1080



# DASH
ffmpeg -i $VIDEO_IN -y \
    -preset $PRESET_P -keyint_min $GOP_SIZE -g $GOP_SIZE -sc_threshold 0 -r $FPS -c:v libx264 -pix_fmt yuv420p -c:a aac -b:a 192k -ac 2 -ar 44100 \
    -map v:0 -s:0 $V_SIZE_1080  -b:v:0 4M   -maxrate:0 4.5M    -bufsize:0 5.5M \
    -map v:0 -s:1 $V_SIZE_144   -b:v:1 90k  -maxrate:1 100k     -bufsize:1 160k \
    -map v:0 -s:2 $V_SIZE_240   -b:v:2 250k -maxrate:2 280k     -bufsize:2 400k \
    -map v:0 -s:3 $V_SIZE_360   -b:v:3 500k -maxrate:3 680k     -bufsize:3 920k \
    -map v:0 -s:4 $V_SIZE_720   -b:v:4 2M   -maxrate:4 2.15M    -bufsize:4 3M \
    -map 0:a \
    -init_seg_name init\$RepresentationID\$.\$ext\$ -media_seg_name chunk\$RepresentationID\$-\$Number%05d\$.\$ext\$ \
    -use_template 1 -use_timeline 1  \
    -seg_duration 4 -adaptation_sets "id=0,streams=v id=1,streams=a" \
    -f dash $VIDEO_OUT_manifest
rm "/home/fvideo/Upload_Video/$fbname.mp4"

echo "$fbname/manifest.mpd" 
echo "done"
done

##############FFmpeg################

