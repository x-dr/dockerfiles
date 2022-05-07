#!/bin/sh

# Set ARG
PLATFORM=$1
TAG=$2
if [ -z "$PLATFORM" ]; then
    ARCH="64"
else
    case "$PLATFORM" in
        linux/386)
            ARCH="32"
            ;;
        linux/amd64)
            ARCH="64"
            ;;
        linux/arm/v6)
            ARCH="arm32-v6"
            ;;
        linux/arm/v7)
            ARCH="arm32-v7a"
            ;;
        linux/arm64|linux/arm64/v8)
            ARCH="arm64-v8a"
            ;;
        *)
            ARCH=""
            ;;
    esac
fi
[ -z "${ARCH}" ] && echo "Error: Not supported OS Architecture" && exit 1

# Download files
PROXY_FILE="proxy-linux-${ARCH}.tar.gz"
echo "Downloading binary file: ${PROXY_FILE}"

#https://github.com/snail007/goproxy/releases/download/v11.8/proxy-linux-amd64.tar.gz
wget -O ${PWD}/proxy.zip https://github.com/snail007/goproxy/releases/download/v${TAG}/${PROXY_FILE} > /dev/null 2>&1


if [ $? -ne 0 ]; then
    echo "Error: Failed to download binary file: ${PROXY_FILE} " && exit 1
fi
echo "Download binary file: ${PROXY_FILE}  completed"



# Prepare
echo "Prepare to use"
tar -xvf proxy.zip


# Clean
rm -rf proxy.zip
ls
echo "Done"