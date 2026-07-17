# Docker Compose for Dify

This repository was created to run tests for Dify. It's set up to easily launch different versions of Dify. The configuration file (.env) has been slightly modified, for example, changing the vector database to [Qdrant](https://qdrant.tech/).

- [Official Website](https://dify.ai⁠)
- [Official Docs](https://docs.dify.ai⁠)
- [GitHub](https://github.com/langgenius/dify) ([Releases](https://github.com/langgenius/dify/releases))
- [DockerHub](https://hub.docker.com/r/langgenius/dify-web)

## How to Use

Navigate to the directory for a specific version and start the Docker container. Modify the configuration file as needed. For example, execute the following command:

```sh
cd versions/1.15.0
docker compose up -d
```

## Upgrade Guide

Starting with version 1.10.1, you must pay attention to the permission settings for persistent volumes. For details, please refer to the upgrade guide below:

- [v1.10.1 – Multi-Database Era Begins: MySQL Joins the Family](https://github.com/langgenius/dify/releases/tag/1.10.1)

### Execution Procedure in Script

To execute this via script, run the following in the directory for each version:

```sh
/bin/bash _init.sh http://10.0.0.1
```

```sh
/bin/bash _init.sh https://10.0.0.1
```

This script also sets the following environment variables:

1. CONSOLE_API_URL
2. CONSOLE_WEB_URL
3. SERVICE_API_URL
4. PP_API_URL
5. APP_WEB_URL
6. FILES_URL

### Manual Execution Procedure

For example, first create a group and user with ID 1001.

```sh
groupadd -g 1001 dify && \
useradd dify -u 1001 -g 1001 -s /sbin/nologin
```

Next, change the owner of the Docker storage.

```sh
mkdir -p ./volumes/app/storage && \
chown -R dify:dify ./volumes/app/storage
```

## Pull the specified version

To pull a specific version from Dify's official website, execute the following:

```sh
git clone https://github.com/langgenius/dify.git --branch 1.16.0
```

## Customization

Navigate to the working directory.

```sh
cd versions/1.16.0
```

Prepare a script to change the owner of the persistent volume. After that, copy the configuration file while deleting comments using [uncmnt](https://github.com/sig9org/uncmnt), and modify its contents.

```sh
ln -s ../../_init.sh _init.sh && \
uncmnt .env.example > .env && \
sed -i "" -e "s/^LANG=en_US.UTF-8$/LANG=ja_JP.UTF-8/g" .env && \
sed -i "" -e "s/^LC_ALL=en_US.UTF-8$/LC_ALL=ja_JP.UTF-8/g" .env && \
sed -i "" -e "s/^LOG_TZ=UTC$/LOG_TZ=Asia\/Tokyo/g" .env && \
sed -i "" -e "s/^VECTOR_STORE=weaviate$/VECTOR_STORE=qdrant/g" .env && \
sed -i "" -e "s/^FORCE_VERIFYING_SIGNATURE=true$/FORCE_VERIFYING_SIGNATURE=false/g" .env
```

Confirm the changes to the settings.

```sh
grep \
  -e ^LANG= \
  -e ^LC_ALL= \
  -e ^LOG_TZ= \
  -e ^VECTOR_STORE= \
  -e ^FORCE_VERIFYING_SIGNATURE= \
  .env
```
