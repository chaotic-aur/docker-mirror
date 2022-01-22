# Chaotic-AUR mirror Docker setup
This repo provides an easy to way to setup a new Chaotic-AUR mirror. This will deploy Syncthing for syncing the repo and Nginx as webserver.
The following steps need to be taken:
```
sudo pacman -Syu docker docker-compose
git clone https://github.com/chaotic-aur/docker-mirror.git
cd docker-mirror
sudo ./run
```
You will be asked for:
- A domain that will serve the mirror (needs to be setup prior to starting the process)
- Email address for obtaining a SSL certificate
After that, docker-compose will fetch the needed containers. Syncthing will be available at port 8384 while the mirror can be reached using the domain name. 
Syncthing devices need to be confirmed by us, so it might take some time for syncing to actually start. 
Then, create a new issue at the [packages repo](https://github.com/chaotic-aur/packages/issues/new/choose) to have the mirror added to mirrorlist and geo-mirror. 
Questions left? Feel free to create an issue or join the Telegram group to ask them! :)  
