#!/bin/bash

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
