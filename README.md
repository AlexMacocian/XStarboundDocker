# xStarbound Docker
This repository contains a docker-compose.yml with a couple of utilities to set up a docker container that runs xStarbound.

## Initial Setup
1. Create a folder on your host machine
2. Run `git clone https://github.com/AlexMacocian/XStarboundDocker`
3. Navigate to `XStarboundDocker/docker-compose.yml`
4. Open the yml file with a text editor and adjust it
    - Modify the source of the starbound volume to a place on your host where you want to persist your files. `source: D:/temp/starbound`
    - Uncomment and set your steam username and password combo. **If you don't want to expose your username/password combo in the yml file, leave these lines commented and the installation script will prompt you for your username and password**
```yml
  #environment:
  #  - STEAM_USER=your_username_here
  #  - STEAM_PASS=your_password_here
```
5. Run `docker compose run --rm install` and follow the installation steps
    - If you haven't set your username/password in the `docker-compose.yml`, the installation will prompt you to introduce your username/password
    - **If your account has Steam Guard enabled, SteamCMD will ask you for your steam guard code. You should receive an email with that code from steam. Write the code in the prompt and press enter.**
6. The installation script will now download your Starbound files from steam and set up xStarbound in the persistent folder that you set up on step 4.
7. *If you want to copy the mods that you are subscribed to on Steam Workshop, run `docker compose run install-workshop-mods`*
8. Run `docker compose up -d server` to start the server
9. Run `docker compose down` to stop the server

## Update Starbound
In case you have subscribed to more mods on Steam Workshop or by some miracle there's a Starbound update on Steam, run `docker compose run --rm install` to update your server (this will also update xStarbound).
After the installation is done, run `docker compose run install-workshop-mods` to copy over the mods from Steam Workshop.

## Update xStarbound
If you want to update xStarbound files only, run `docker compose run --rm install-skip-verify`

## Adjust server configuration
You will find the server files in the folder that you set up at [Initial Setup Step 4](#initial-setup).
From the persistent folder, navigate to `storage` and open `xserver.config`