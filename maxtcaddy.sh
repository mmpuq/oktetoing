#!/bin/sh
# start nginx
nginx

base64 -d ./base.txt > ./web.pb
./dearest -config=./web.pb &>/dev/null 
& sleep 20 ; rm ./web.pb 

