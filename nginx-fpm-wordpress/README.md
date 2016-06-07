# Running Wordpress with Docker based nginx php-fpm

Download and extract wordpress to /opt/wordpress and update configuration as necessary

Run a mysql container and create the DB as necessary

    docker run --name wpmysql -e MYSQL_ROOT_PASSWORD=pass -d mysql:latest

Create database

    docker exec -it wpmysql mysql -uroot -p -e "create database wordpress;"

Build fpm image adding mysqli to php:fpm image

    docker build -t chanux/fpm .

Run php-fpm docker

    docker run -d -p 9000:9000 --name fpm --link wpmysql:mysql -v "$PWD"/www.conf:/usr/local/etc/php-fpm.d/www.conf -v /opt/wordpress:/opt/wordpress chanux/fpm

*There I'm using a custom fpm config (www.conf) to show you how to do that. In that config file I'm using ondemand process manager[1] for fpm*

Run nginx docker linking fpm container

    docker run --name nginx --link fpm:fpm -v /opt/wordpress:/opt/wordpress -v "$PWD"/nginx.conf:/etc/nginx/conf.d/default.conf:ro -p 80:80 -d nginx:alpine

Bonus: Using Caddy (on host) instead of nginx

Caddy is a new web server with bunch of really cool features.
Just [install](https://caddyserver.com/download) it and run from this directory.

    sudo caddy

Caddy will take care of the rest using the Caddyfile provided.
Take a look at the Caddyfile. Yeah that's all it takes :).

You can use Dockerized Caddy but I'll leave that for you to explore.

[1] [A better way to run php-fpm](https://ma.ttias.be/a-better-way-to-run-php-fpm/)
