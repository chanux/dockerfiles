from    debian:wheezy

#run groupadd -r www-data && useradd -r -g www-data www-data

add bin/thttpd /usr/local/bin/
copy conf /etc/thttpd

#volume /var/www

expose 80

entrypoint ["/usr/local/bin/thttpd"]
cmd ["-D", "-C", "/etc/thttpd/thttpd.conf"]
