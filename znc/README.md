# Docker - znc

znc is an irc proxy http://wiki.znc.in/ZNC

Build the image and run it as follows

    docker build -t chanux/znc .

First run

    docker run -v /host/dir/path:/znc -it chanux/znc znc --datadir=/znc --makeconf

Afterwards

    docker run -v /host/dir/path:/znc -p 6667:6667 --name znc -d chanux/znc
