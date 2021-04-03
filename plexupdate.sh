#!/bin/bash

echo "###################################################################
#~~~~~~~~~~~~~ Enter in URL for latest Plex Package ~~~~~~~~~~~~~~#
#You can get this from https://www.plex.tv/media-server-downloads/#
###################################################################
Enter URL"

read update_url

TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" $update_url &&
sudo dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"
