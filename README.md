# Chaotic-AUR mirror Docker setup
This repo provides an easy to way to set up a new Chaotic-AUR mirror. This will deploy Syncthing for syncing the repo and Nginx as webserver.
The following steps need to be taken:
```
sudo pacman -Syu docker docker-compose
git clone https://github.com/chaotic-aur/docker-mirror.git
cd docker-mirror
sudo mirrorctl run
```
You will be asked for:
- Cloudflared or normal, direct connection usage. We STRONGLY prefer it when mirrors have open ports directly without cloudflared.
- A domain that will serve the mirror (needs to be setup PRIOR to starting the process when not using cloudflared. Make sure the ports are already open and domain fully configured.)
- Email address for obtaining a SSL certificate

After that, docker compose will fetch the needed containers. Syncthing will be available at port 8384 locally only, while the mirror can be reached using the domain name. 
Syncthing devices need to be confirmed by us. YOU WILL NOT BE CONFIRMED WITHOUT GETTING IN TOUCH WITH US FIRST!!
Then, create a new issue or get in touch on telegram at the [packages repo](https://github.com/chaotic-aur/packages/issues/new/choose) to have the mirror added to mirrorlist and geo-mirror. 

Questions left? Feel free to create an issue or join the Telegram group to ask them! :)  
