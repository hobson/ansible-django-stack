#!/usr/bin/env bash
# install ATI+AMD Catalyst SDK and Video Card Drivers

DOWNLOAD_URL="$1"
DOWNLOAD_PATH="$2"
# {{ ansible_distribution }}  # e.g. "Ubuntu"
DISTRO=$(cat /etc/debian_version)
# {{ ansible_distribution_release }}  # e.g. "precise"
DISTRO=${ver##*/}

echo "DOWNLOAD_URL=$DOWNLOAD_URL"
echo "DOWNLOAD_PATH=$DOWNLOAD_PATH"
echo "DISTRO=$DISTRO"

cd /tmp
# without referrer, wget will fail
# wget --referer=http://support.amd.com http://www2.ati.com/drivers/linux-amd-14.41rc1-opencl2-sep19.zip -O install_opencl_amd_driver.zip
wget --referer=http://support.amd.com -O "$DOWNLOAD_PATH"/install_catalyst.zip -c "$DOWNLOAD_URL"
unzip -o install_catalyst.zip
cd fglrx*
sudo chmod +x amd-driver-installer*.run
# For Ubuntu LightDM || Gnome GDM || Linux Mint MDM
sudo service lightdm stop || sudo service gdm stop || sudo service mdm stop
sudo sh /amd-driver-installer*.run --buildpkg Debian/$DISTRO
