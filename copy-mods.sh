#!/bin/bash

echo "Copying mods from /starbound/steamapps/workshop/content/211820/ to /starbound/mods/"
rsync -a --info=progress2 /starbound/steamapps/workshop/content/211820/ /starbound/mods/
echo "Finished"