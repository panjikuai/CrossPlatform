#!/usr/bin/env bash

export TARGET_USER=vagrant
export PATH=/home/esp/xtensa-esp32-elf/bin:$PATH
export TARGET_HOME_DIR=/home/$TARGET_USER
export IDF_PATH=/vagrant/workspace/esp-idf
export TARGET_PDK_DIR=/$TARGET_USER/workspace



# sudo apt-get update
# sudo apt-get -y install git build-essential dos2unix libxml2 libxml2-dev expect openssl doxygen ranger ntp
# sudo apt-get -y dist-upgrade

sudo apt-get update
sudo apt-get -y install git wget make libncurses-dev dos2unix flex bison gperf python python-serial
sudo apt-get -y dist-upgrade
# some general OS configuration
# sudo timedatectl set-timezone Europe/Berlin

# checkout SDK from git
# dos2unix  $SOURCE_DIR/netrc
# cp -f $SOURCE_DIR/netrc $TARGET_HOME_DIR/.netrc
# cp -f $SOURCE_DIR/netrc /root/.netrc

# set environment
if [ -f $TARGET_PDK_DIR/set_env ]; then
	dos2unix  $TARGET_PDK_DIR/set_env
	cp -f $TARGET_PDK_DIR/set_env $TARGET_HOME_DIR/.bash_aliases
	. $TARGET_HOME_DIR/.bash_aliases
fi

if [ ! -f $TARGET_PDK_DIR/.firstrun ]; then
	# get toolchain
	wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-61-gab8375a-5.2.0.tar.gz
	mkdir -p /home/esp
	cd /home/esp
	tar -xzf $TARGET_HOME_DIR/xtensa-esp32-elf-linux64-1.22.0-61-gab8375a-5.2.0.tar.gz
	 
	# download sdk
	cd /$TARGET_USER
	if [ ! -d /$TARGET_USER/workspace ]; then
			mkdir -p /$TARGET_USER/workspace
	fi
	
	cd $TARGET_PDK_DIR
	
	git clone https://github.com/espressif/esp-idf.git esp-idf-v2.1
	cd esp-idf-v2.1/
	git checkout v2.1
	git submodule update --init --recursive
	
    touch $TARGET_PDK_DIR/.firstrun
fi

# set ownership 
sudo chown $TARGET_USER:$TARGET_USER -R $TARGET_HOME_DIR/
