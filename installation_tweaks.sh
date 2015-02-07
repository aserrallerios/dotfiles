#!/usr/bin/env zsh

echo vm.swappiness = 10 | sudo tee -a /etc/sysctl.conf
# R
echo deb http://cran.r-project.org/bin/linux/ubuntu utopic/ | sudo tee -a /etc/apt/sources.list
# Docker
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sudo sh -c "echo deb https://get.docker.io/ubuntu docker main\
    > /etc/apt/sources.list.d/docker.list"
echo deb http://repository.spotify.com stable non-free | sudo tee -a /etc/apt/sources.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59
# mariaDB
sudo apt-get install software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
sudo add-apt-repository 'deb http://tedeco.fi.upm.es/mirror/mariadb/repo/10.1i/ubuntu trusty main'
# startup hidden applications
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop
