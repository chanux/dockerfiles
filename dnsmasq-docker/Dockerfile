FROM debian:wheezy

RUN apt-get update \
    # Install dnsmasq
    && DEBIAN_FRONTEND=noninteractive apt-get -y install dnsmasq \
    && apt-get clean

RUN echo "addn-hosts=/etc/addnhosts" >> /etc/dnsmasq.conf

EXPOSE 53

CMD ["/usr/sbin/dnsmasq","-d"]
