#!/bin/bash

# Install aaPanel
wget -O install.sh http://www.aapanel.com/script/install_6.0_en.sh
bash install.sh

# Install Nginx
apt-get install -y nginx

# Install PHP 7.3, 7.4, and 8.0
apt-get install -y software-properties-common

# Add PHP repositories and install the versions
add-apt-repository -y ppa:ondrej/php
apt-get update

# Install PHP versions
apt-get install -y php7.3 php7.3-fpm php7.3-mysql
apt-get install -y php7.4 php7.4-fpm php7.4-mysql
apt-get install -y php8.0 php8.0-fpm php8.0-mysql

# Install MySQL (MariaDB) 10.3.24
apt-get install -y software-properties-common
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xF1656F24C74CD1D8
add-apt-repository 'deb [arch=amd64] http://mirror.zol.co.zw/mariadb/repo/10.3/ubuntu bionic main'

apt-get update
apt-get install -y mariadb-server=10.3.24

# Install Redis 7.2.4
add-apt-repository ppa:redislabs/redis
apt-get update
apt-get install -y redis-server=7.2.4

# Install IP Setup Tool 1.2 (assuming it's available via a repository or URL)
# If you have a specific download location or repository, replace the following commands
wget http://example.com/path-to-ip-setup-tool-1.2.deb
dpkg -i ip-setup-tool-1.2.deb

# Install FFmpeg and FFmpeg Manager 1.0 (Assuming it’s available via package manager or URL)
apt-get install -y ffmpeg
# FFmpeg Manager might need specific installation steps. Modify as needed:
wget http://example.com/path-to-ffmpeg-manager-1.0.deb
dpkg -i ffmpeg-manager-1.0.deb

# Install a mail server (Postfix as an example)
apt-get install -y postfix mailutils

# Start all necessary services
service nginx start
service php7.3-fpm start
service php7.4-fpm start
service php8.0-fpm start
service mysql start
service redis-server start
service postfix start

echo "Installation complete. aaPanel is installed with Nginx, PHP 7.3, 7.4, 8.0, MariaDB 10.3.24, Redis 7.2.4, IP Setup Tool 1.2, FFmpeg Manager 1.0, and a Mail Server."

