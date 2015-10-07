from    debian:wheezy

run     apt-get update -q

# Install required stuff
run     apt-get install -y nginx-extras liblua5.1-socket2

# Copy custom config.
copy    root /

run     rm /etc/nginx/sites-enabled/default
run     ln -s /etc/nginx/sites-available/proxy.conf  /etc/nginx/sites-enabled/proxy.conf

# Install redis-lua
run     mkdir -p /usr/share/lua/5.1
add     https://raw.githubusercontent.com/nrk/redis-lua/version-2.0/src/redis.lua /usr/share/lua/5.1/redis.lua
run     chmod 644 /usr/share/lua/5.1/redis.lua

expose  80

entrypoint ["/usr/sbin/nginx"]
cmd ["-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]
