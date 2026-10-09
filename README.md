*This activity has been created as part of the 42 curriculum by ehazizi.*

## Description

- The main goal of this activity was the usage and the process of learning docker and its inner working, together with mariadb and nginx 

- The exersice consist of the creation of a docker network with 3 containers:
    1. Nginx container  -> the only container with a expose real port
    2. Worpress container
    3. Database (mariadb) container

- The nginx and wordpress container share one volume while the database has its own volume

## Instructions
You need to create all files that hold credentials like:
1. .env file
    - DOMAIN_NAME, 
    - mariadb database_name, user
    - wordpress admin, admin_email, user, user email, database_host
2. Dockersecrets folder in the format secrets/*
    - Hold all passwords needed
    - db_password.txt, db_root_password.txt
    - wp_admin_pass.txt, wp_user_pass.txt

- Run the command `make` or `make all` , They must be runned using sudo so it can create the folder inside the home

- Note fedora runs using Selinux Security-Enhanced linux so u have to either disable Selinux [not recemned] or u will have to give contex to the files so the Selinux will recognise them 
- `chcon -Rt svirt_sandbox_file_t secrets/` 

## Resources
- Docker documantations -> https://docs.docker.com/
- Claude Ai -> for in depth explaning of inner workings of the docker and nginx 
- Wordpress documenation 

## Project description
1. Virtual Machines vs Docker
    - Virtual machines virtualize hardware includeing a full os; Vms being more isolated , secure and have stronger OS-level control 
    - Docker virtualizes the os sharing the host kernel; Docker offers superior perforamce speed
2. Secrets vs Environment Variables
    - Secrets are a Docker feature for sensitive data that are are managed by docker 
    - Env vars is a file which can be used to hold non-sensitive configuration
3. Docker Network vs Host Network
    - Docker Network is an option in the docker compose that allows containers to be connected with eachother in the same virtual network
    - Host Network is a connection of the container with the host network
4. Docker Volumes vs Bind Mounts
    - Docker Volumes: Managed entirely by Docker. These are the best way to persist data (like databases) because they are isolated from the host's file system structure and are easier to back up.
    - Bind Mounts: Maps a specific path on the host machine to the container. These are typically used during development to reflect code changes in real-time without rebuilding the image.