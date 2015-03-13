# Docker: muhttpd

*[uhttpd](https://github.com/nesv/uhttpd): A laughably-small HTTP server .*

[The resulting container is under 5MB]

Even though the project I use here is named uhttpd, I'm namig the container as muhttpd to avoid confusion
with the other [uhttpd](http://wiki.openwrt.org/doc/howto/http.uhttpd). That uhttpd is also put on docker
by @finchol and it's found [here](https://github.com/fnichol/docker-uhttpd).

# Running

Run the container mounting a directory with content from host to /www

    sudo docker run -d -v /path/to/content/dir:/www --name muhttpd chanux/muhttpd

To check whether it worked, find the IP of the container and browse to it.

    sudo docker inspect --format='{{.NetworkSettings.IPAddress}}' thttpd

It'd be more useful to bind the container to a port on host

    sudo docker run -d -v /path/to/content/dir:/www -p 8000:80 --name muhttpd chanux/muhttpd


# Building

To achieve the small size I'm just adding the statically linked uhttpd binary on docker scratch image.
Following are the steps to  build uhttpd.

Run golang docker container so we can build nesv/uhttpd inside it. (Assuming you don't have go setup on your machine)
Mounting the bin directory for copying over the resulting binary there.

    sudo docker run -it --rm -v $PWD/bin:/out -w /out --entrypoint /bin/bash google/golang -i

In the prompt you get run
    CGO_ENABLED=0 go get -a -ldflags '-s' github.com/nesv/uhttpd

Now copy over the binary
    cp /gopath/bin/uhttpd .

Exit the container with ctrl+d

Now build the muhttpd image

    sudo docker build -t chanux/muhttpd .

More on building these super tiny docker images can be found on [this awesome article](http://blog.xebia.com/2014/07/04/create-the-smallest-possible-docker-container/) by Adriaan de jonge.
