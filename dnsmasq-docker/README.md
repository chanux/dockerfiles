#Docker: dnsmasq

*Simple dnsmaq container*

Run the container mounting your hosts files directory to /etc/addnhosts

    sudo docker run -d -v /path/to/hosts/dir:/etc/addnhosts --name dnsmasq chanux/dnsmasq

To use this as the DNS server for another container, pass it's IP with --dns option

    sudo docker inspect --format='{{.NetworkSettings.IPAddress}}' dnsmasq

    sudo docker run -d --dns <IP from previous step> docker/image

That's about it
