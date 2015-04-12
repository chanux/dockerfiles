from    debian:jessie

# Install dependencies and setup locales
run     useradd znc \
        && apt-get update -q \
        && apt-get install -y \
        --no-install-recommends \
        znc \
        sudo \
        openssl \
        ca-certificates

volume /znc

copy    entrypoint.sh /entrypoint.sh
entrypoint ["/entrypoint.sh"]

expose  6667
cmd ["znc", "--datadir=/znc", "--foreground"]
