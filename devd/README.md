# Docker: devd

*[devd](https://github.com/cortesi/devd): A http daemon for local development.*

[The resulting container is under 13MB]

Devd is a web server designed specifically for development. It Does live reload
by just passing a command line argument. You are hooked but read the rest [here](http://corte.si/posts/devd/intro/index.html)

Devd is developed by Aldo [Cortesi](https://twitter.com/cortesi)

# Running

Run the container mounting a directory with content from host to /www

    docker run -d --name devd -v /path/to/content/dir:/data -p 8080:8080 chanux/devd -p 8080

Note: The host/container ports for devd should be the same as in the example

# Building

Add the devd binary here and..
    
    docker build -t chanux/devd .
