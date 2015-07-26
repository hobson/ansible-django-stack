
wget --referer=http://support.amd.com {{ url_opencl_driver }} -O {{ download_path }}/install_catalyst.zip
cd /tmp
unzip install_catalyst.zip
cd fglrx*
sudo chmod +x amd-driver-installer*.run
# For Ubuntu LightDM || Gnome GDM || Linux Mint MDM
sudo service lightdm stop || sudo service gdm stop || sudo service mdm stop
sudo ./amd-driver-installer*.run