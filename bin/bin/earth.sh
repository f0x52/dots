#!/bin/bash
while :
do
	wget http://rammb.cira.colostate.edu/ramsdis/online/images/latest_hi_res/himawari-8/full_disk_ahi_true_color.jpg -O /home/f0x/pictures/earth.jpg
	convert /home/f0x/pictures/earth.jpg -resize 1050x1050 -gravity South -background black -extent 1065x1065 /home/f0x/pictures/earth_logo.png
	rm /home/f0x/pictures/earth.jpg
	composite -gravity SouthWest /home/f0x/pictures/black.png /home/f0x/pictures/earth_logo.png /home/f0x/pictures/earth.png
	mv /home/f0x/pictures/earth_logo.png /home/f0x/hdd/pictures/earth-$(date +%s).png
	feh --bg-max /home/f0x/pictures/earth.png
	echo ran >> /home/f0x/pictures/log.txt
	sleep 10m
done
