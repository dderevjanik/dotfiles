#!/bin/bash

echo "=== Remove Unnecessary Packages and Dependencies ==="
sudo apt-get autoremove

echo "=== Remove orphaned libraries ==="
apt-get remove --purge "$(deborphan)"

# echo "=== Thumbnail Cache Size ==="
# du -sh ~/.cache/thumbnails
echo "=== Clean Thumbnail Cache ==="
sudo rm -rf ~/.cache/thumbnails/*

echo "=== AptCache size ==="
sudo du -sh /var/cache/apt
echo "=== Remove AptCache ==="
sudo apt-get clean

echo "=== Remove Old Kernels ==="
dpkg -l linux-{image,headers}-* | awk '/^ii/{print $2}' | egrep '[0-9]+\.[0-9]+\.[0-9]+' | grep -v $(uname -r | cut -d- -f-2) | xargs sudo apt-get -y purge

echo "=== Remove all outdated snap packages ==="
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
while read snapname revision; do
    snap remove "$snapname" --revision="$revision"
done;
