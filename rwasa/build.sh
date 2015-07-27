#!/bin/sh

set -e
set -u

HEAVYTHING_DOWNLOAD_URL="https://2ton.com.au/HeavyThing-1.13.tar.gz"

TARGET_DIR=
APP_DIR=
EX_DIR=

while getopts 'a:e:t:' opt
do
    case $opt in
        t)
            TARGET_DIR="$OPTARG"
            ;;
        a)
            APP_NAME="$OPTARG"
            SRC_DIR=$APP_NAME
            ;;
        e)
            APP_NAME="$OPTARG"
            SRC_DIR=examples/$APP_NAME
            ;;
    esac
done
shift $(($OPTIND - 1))

mkdir -p $TARGET_DIR/code

if [ -n "$(ls -A $TARGET_DIR/code)" ]; then
    echo "==> Looks like there are stuff in $TARGET_DIR/code directory."
    echo "==> Continuing without downloading again."
else
    wget -O $TARGET_DIR/code/heavything.tar.gz "$HEAVYTHING_DOWNLOAD_URL"
    tar -xzf heavything.tar.gz -C $TARGET_DIR/code --strip-components=1
    rm $TARGET_DIR/code/heavything.tar.gz
fi

cd $TARGET_DIR/code/$SRC_DIR
fasm -m 262144 "${APP_NAME}.asm" && ld -o $APP_NAME "${APP_NAME}.o"

echo "==> Copying $APP_NAME binary to $TARGET_DIR"
cp  $APP_NAME "$TARGET_DIR"
