#!/bin/bash

echo "=== 1. Removing Unnecessary Packages and Dependencies ==="
sudo apt-get autoremove

echo "=== 2. Removing orphaned libraries ==="
apt-get remove --purge "$(deborphan)"

# echo "=== Thumbnail Cache Size ==="
# du -sh ~/.cache/thumbnails
echo "=== 3. Cleaning Thumbnail Cache ==="
sudo rm -rf ~/.cache/thumbnails/*

echo "=== 4. Current AptCache size ==="
sudo du -sh /var/cache/apt
echo "=== 4. Removing AptCache ==="
sudo apt-get clean

echo "=== 5. Removing Old Kernels ==="
dpkg -l linux-{image,headers}-* | awk '/^ii/{print $2}' | egrep '[0-9]+\.[0-9]+\.[0-9]+' | grep -v $(uname -r | cut -d- -f-2) | xargs sudo apt-get -y purge

echo "=== 6. Removing outdated snap packages ==="
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
while read snapname revision; do
    snap remove "$snapname" --revision="$revision"
done;
