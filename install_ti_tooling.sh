#!/usr/bin/env bash
set -e 

apt-get install -y wget

echo "Installing CCS dependencies"
apt-get install -y libc6:i386

if [ ! -f /tmp/CCS7.3.0.00019_linux-x64.tar.gz ]; then
	echo "Downloading Code Composer 7 to /tmp, may take a while..... (~800MB)"
	wget --quiet -P /tmp/ http://software-dl.ti.com/ccs/esd/CCSv7/CCS_7_3_0/exports/CCS7.3.0.00019_linux-x64.tar.gz
else
    echo "Using previous donwloaded CCS tar in /tmp"
fi

rm -rf /tmp/CCS7.3.0.00019_linux-x64

echo "Unpacking Code Composer 7"
tar -xzvf /tmp/CCS7.3.0.00019_linux-x64.tar.gz -C /tmp

# To generate a new options file use:
# /tmp/CCS7.3.0.00019_linux-x64/ccs_setup_linux64_7.3.0.00019.bin  --save-response-file /vagrant/my_install_options.txt --skip-install true
echo "Installing Code Composer 7"
/tmp/CCS7.3.0.00019_linux-x64/ccs_setup_linux64_7.3.0.00019.bin --response-file /vagrant/ccsv7_install_options.txt

echo "Installing drivers"
/opt/ti/ccsv7/install_scripts/install_drivers.sh
