#!/bin/sh

set -e
set -u

THTTPD_DOWNLOAD_URL="http://acme.com/software/thttpd/thttpd-2.26.tar.gz"

TARGET_DIR=

while getopts 't:' opt
do
    case $opt in
        t)
            TARGET_DIR="$OPTARG"
            ;;
    esac
done
shift $(($OPTIND - 1))

mkdir -p /code
cd /code
wget -O thttpd.tar.gz "$THTTPD_DOWNLOAD_URL"
tar -xzf thttpd.tar.gz --strip-components=1
rm thttpd.tar.gz
./configure
make
echo "==> Copying thttpd binary to $TARGET_DIR"
cp thttpd "$TARGET_DIR"
