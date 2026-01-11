#!/bin/bash

if [ $# -eq 1 ]; then
    sed -i -e "s/^CONSOLE_API_URL=$/CONSOLE_API_URL=${1}/g" .env
    sed -i -e "s/^CONSOLE_WEB_URL=$/CONSOLE_WEB_URL=${1}/g" .env
    sed -i -e "s/^SERVICE_API_URL=$/SERVICE_API_URL=${1}/g" .env
    sed -i -e "s/^APP_API_URL=$/APP_API_URL=${1}/g" .env
    sed -i -e "s/^APP_WEB_URL=$/APP_WEB_URL=${1}/g" .env
    sed -i -e "s/^FILES_URL=$/FILES_URL=${1}/g" .env
fi

DIFY_USER="1001"

if ! id "$DIFY_USER" >/dev/null 2>&1; then
    # No groups or users exist.
    groupadd -g 1001 dify
    useradd dify -u 1001 -g 1001 -s /sbin/nologin
fi

# Change the directory owner.
# If the directory does not exist, create it.
mkdir -p ./volumes/app/storage
chown -R dify:dify ./volumes/app/storage
