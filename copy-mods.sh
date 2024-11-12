#!/bin/bash

echo "Copying mods from /starbound/steamapps/workshop/content/211820/ to /starbound/mods/"
# Loop through each mod directory and copy the contents.pak file, renaming it to mod_id.pak
for mod_dir in /starbound/steamapps/workshop/content/211820/*; do
    if [ -d "$mod_dir" ]; then
        mod_id=$(basename "$mod_dir")
        echo Installing $mod_id
        rsync -a "$mod_dir/contents.pak" "/starbound/mods/${mod_id}.pak"
    fi
done
echo "Finished"