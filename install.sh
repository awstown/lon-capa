#!/bin/bash

sudo ufw default deny
sudo ufw allow ssh
sudo ufw allow www
sudo ufw allow https
sudo ufw enable
sudo apt update
sudo apt upgrade --yes
# sudo shutdown -r now
sudo apt install --yes postfix 
sudo apt install --yes python-software-properties
sudo apt-add-repository 'deb http://install.loncapa.org/ubuntu xenial main'
wget http://install.loncapa.org/versions/ubuntu/APT-GPG-KEY-loncapa.asc
sudo apt-key add APT-GPG-KEY-loncapa.asc
sudo apt update
sudo apt install --yes loncapa-prerequisites
sudo a2dismod mpm_event
sudo a2enmod mpm_prefork
sudo a2enmod cgi
sudo a2enmod dav
sudo a2enmod dav_fs
sudo service apache2 restart
wget http://install.loncapa.org/linux/install.tar
tar xf install.tar 
ls
cd installation/
sudo ./install.pl 
sudo -i