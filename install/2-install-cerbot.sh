#!/bin/bash
#install-certbot

sudo snap install core; 
sudo snap refresh core;

sudo apt-get remove certbot -y;
sudo snap install --classic certbot -y;
sudo ln -s /snap/bin/certbot /usr/bin/certbot;

sudo certbot certonly --nginx;

sudo reboot;

