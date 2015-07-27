# Docker: rwasa

*[rwasa](https://2ton.com.au/rwasa/) is a full-featured, high performance, 
scalable web server. It's written in x86_64 with no external library dependencies.*

Run the container mounting a directory with content to host at /var/www

    sudo docker run -d -v /path/to/content/dir:/var/www --name rwasa chanux/rwasa

To check whether it worked, find the IP of the container and browse to it.

    sudo docker inspect --format='{{.NetworkSettings.IPAddress}}' rwasa

Other fancy docker stuff like binding the container IP to a host IP are left out of this doc :)


# Building

Even though heavything provides compiled binaries, let's compile it ourselves.

Dockerfile.build builds a docker container that will build rwasa (Bonus: it can build anything HeavyThing)

First build the heavything-build container

    sudo docker build -f Dockerfile.build -t chanux/ht-build .

*Note: Named dockerfiles are possible from 1.5 up*

Run the ht-build container mounting bin directory at /target

    sudo docker run -it --rm -v $PWD/bin:/target chanux/ht-build -a rwasa -t /target

*This will give you a look at what's going on with the build*

When done you can check inside bin directory whether the binary is available.
If things looks good, go ahead and build rwasa image.

    sudo docker build -t chanux/rwasa .
