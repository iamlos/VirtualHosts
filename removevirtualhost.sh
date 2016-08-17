#!/bin/bash

echo "Please enter host name, you want to remove, it looks like brazzers.com"

while [[ $hostname = "" ]]; do
    read hostname
done

sudo a2dissite $hostname
sudo rm -rf /var/www/$hostname
sudo rm -f /etc/nginx/sites-available/$hostname.conf
sudo sed -i "/$hostname/d" /etc/hosts
sudo service nginx restart

echo "Your host $hostname has been successfully removed, you can type $hostname in browser and check this"
