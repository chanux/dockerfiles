from    debian:jessie

# Install dependencies and setup locales
run     apt-get update -q \
        && apt-get install -y \
        --no-install-recommends \
        git-core \
        openssh-server \
        locales \
        && dpkg-reconfigure locales \
        && locale-gen C.UTF-8 \
        && /usr/sbin/update-locale LANG=C.UTF-8 \
        && echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen \
        && locale-gen

# Set default locale for the environment
env LC_ALL=C.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

# Setup gitreceive
add     https://raw.github.com/progrium/gitreceive/master/gitreceive /usr/local/bin/
add     receiver /home/git/receiver
run     chmod 755 /usr/local/bin/gitreceive /home/git/receiver \
        usr/local/bin/gitreceive \
        && mkdir /var/run/sshd

run     /usr/local/bin/gitreceive init

add     sshkey.pub /root/.ssh/authorized_keys
run     chown root:root /root/.ssh/authorized_keys

volume /home/git

expose  22

entrypoint ["/usr/sbin/sshd", "-D"]
