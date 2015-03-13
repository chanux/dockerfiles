# Docker: thttpd

*[thttpd](http://acme.com/software/thttpd/) is a simple, small, portable, fast, and secure HTTP server.*

Run the container mounting a directory with content to host at /var/www

    sudo docker run -d -v /path/to/content/dir:/var/www --name thttpd chanux/thttpd

To check whether it worked, find the IP of the container and browse to it.

    sudo docker inspect --format='{{.NetworkSettings.IPAddress}}' thttpd

Other fancy docker stuff like binding the container IP to a host IP are left out of this doc :)


# Building

I have put the process of compiling thttpd in to a separate Dockerfile (Dockerfile.build).
All the trouble to save a few MBs.

First build the thttpd-build container

    sudo docker build -f Dockerfile.build -t chanux/thttpd-build .

*Note: Named dockerfiles are possible from 1.5 up*

Run the thttpd-build container mounting bin directory at /target

    sudo docker run -it --rm -v $PWD/bin:/target chanux/thttpd-build

*This will give you a look at what's going on with the build*

When done you can check inside bin directory whether the binary is available.
If things looks good, go ahead and build thttpd image.

    sudo docker build -t chanux/thttpd .
