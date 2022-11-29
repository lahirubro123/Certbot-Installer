#!/usr/bin/env bash


# Install  packages
echo script from Bunny_LK
apt-get update
apt-get upgrade
apt install python3-pip

sudo apt install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get install certbot
# install certificate
echo Hello, what is your e mail address ?
read email
echo what is your doamin ?
read domain
sudo certbot certonly --standalone --preferred-challenges http --agree-tos --email $email -d $domain 
(crontab -l; echo "30 0 * * * 0 12 * * * /etc/certbot renew --quiet") | sort -u | crontab -
