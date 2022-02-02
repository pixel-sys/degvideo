#!/bin/bash
#install-certbot + DHparam

sudo snap install core; 
sudo snap refresh core;

sudo apt-get remove certbot -y;
sudo snap install --classic certbot;
sudo ln -s /snap/bin/certbot /usr/bin/certbot;

sudo certbot certonly --nginx;
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048;

sudo reboot;

