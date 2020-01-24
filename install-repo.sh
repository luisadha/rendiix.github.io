#!/data/data/com.termux/files/usr/bin/bash
# File       : install-repo.sh
# Author     : rendiix <vanzdobz@gmail.com>
# Create date:  5-Jul-2019 16:11
# Get some needed tools. coreutils for mkdir command, gnugp for the signing key, and apt-transport-https to actually connect to the repo
apt-get update
apt-get  --assume-yes upgrade 
apt-get  --assume-yes install coreutils gnupg wget 
# Make the sources.list.d directory
[ ! -d $PREFIX/etc/apt/sources.list.d ] && mkdir $PREFIX/etc/apt/sources.list.d
# Write the needed source file
if [ ! -f "$PREFIX/etc/apt/sources.list.d/rendiix.list" ]; then
echo -e "deb https://rendiix.github.io android-tools termux" > $PREFIX/etc/apt/sources.list.d/rendiix.list
wget https://rendiix.github.io/rendiix.gpg
apt-key add rendiix.gpg
apt update
else
echo "repo already installed"
fi
