#!/usr/bin/env zsh

# lower swappiness
echo vm.swappiness = 1 | sudo tee -a /etc/sysctl.conf
# startup hidden applications
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop
