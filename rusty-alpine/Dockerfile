from alpine:3.2

run apk add --update nginx-lua lua5.1-socket \
    && rm -rf /var/cache/apk/*

copy root /

# just use lua-redis package when it's available for alpine 3.2. Until then..
add https://raw.githubusercontent.com/nrk/redis-lua/version-2.0/src/redis.lua /usr/share/lua/5.1/redis.lua
run chmod 644 /usr/share/lua/5.1/redis.lua

expose 80

cmd ["nginx", "-g", "daemon off;"]
