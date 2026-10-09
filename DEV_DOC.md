# Inception — User Documentation
*This activity has been created as part of the 42 curriculum by ehazizi.*

## What do you need installed? 

All thats need to launch the service is docker and make

Which can be installed by the commands:
1. Linux(Fedora)
    - `sudo dnf install docker make`
2. Windows
    - 
## What files do you need to create before running?

You need to create all files that hold credentials like:
1. .env file
    - DOMAIN_NAME, 
    - mariadb database_name, user
    - wordpress admin, admin_email, user, user email, database_host
2. Dockersecrets folder in the format secrets/*
    - Hold all passwords needed
    - db_password.txt, db_root_password.txt
    - wp_admin_pass.txt, wp_user_pass.txt

## How do you build and run? 
- Run the command `make` or `make all` , They must be runned using sudo so it can create the folder inside the home

- Note fedora runs using Selinux Security-Enhanced linux so u have to either disable Selinux [not recemned] or u will have to give contex to the files so the Selinux will recognise them 
- `chcon -Rt svirt_sandbox_file_t secrets/` 

## What commands manage containers?

    docker compose down
    docker compose up
    docker logs
    More can be found with docker --help

## Where is data stored?

- All data is stored inside /home/login/data
    - data/db for MariaDB data
    - data/wordpress for Wordpress files