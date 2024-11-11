#!/bin/bash

cd /starbound/steamapps/common/Starbound/server
chmod +x xserver.sh
./xserver.sh

while :
do
	echo "Press [CTRL+C] to stop.."
	sleep 1
done