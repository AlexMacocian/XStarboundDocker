#!/bin/bash

cd /starbound/server
chmod +x xserver.sh
./xserver.sh

while :
do
	echo "Press [CTRL+C] to stop.."
	sleep 1
done