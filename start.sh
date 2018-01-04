#!/bin/bash
echo 'GlassAware
Nico Maas (2017 & 2018)
https://github.com/nmaas87/GlassAware'
PWD=`pwd`
# get WIPHY interface
WIPHY=`sudo iw dev wlan0 info | grep wiphy | cut -c8-`
#echo $WIPHY 
# setup mon0 interface
sudo iw phy phy$WIPHY interface add mon0 type monitor
# start mon0 interface
sudo ifconfig mon0 up
# start sniffer
sudo python $PWD/sniff.py
