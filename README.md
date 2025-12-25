# Docker Compose for Dify

This repository was created to run tests for Dify. It's set up to easily launch different versions of Dify. The configuration file (.env) has been slightly modified, for example, changing the vector database to [Qdrant](https://qdrant.tech/).

- [Official Website](https://dify.ai⁠)
- [Official Docs](https://docs.dify.ai⁠)
- [GitHub](https://github.com/langgenius/dify) ([Releases](https://github.com/langgenius/dify/releases))
- [DockerHub](https://hub.docker.com/r/langgenius/dify-web)

## How to Use

Navigate to the directory for a specific version and start the Docker container. Modify the configuration file as needed. For example, to use 1.10.1-fix.1, execute the following command:

```sh
cd versions/1.11.2
docker compose up -d
```

## Upgrade Guide

Starting with version 1.10.1, you must pay attention to the permission settings for persistent volumes. For details, please refer to the upgrade guide below:

- [v1.10.1 – Multi-Database Era Begins: MySQL Joins the Family](https://github.com/langgenius/dify/releases/tag/1.10.1)

### Execution Procedure in Script

To execute this via script, run the following in the directory for each version:

```sh
/bin/bash _change-volume-owner.sh
```

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
git clone https://github.com/langgenius/dify.git --branch 1.11.2
```

## Customization

Navigate to the working directory.

```sh
cd versions/1.11.2
```

Prepare a script to change the owner of the persistent volume. After that, copy the configuration file while deleting comments using [uncmnt](https://github.com/sig9org/uncmnt), and modify its contents.

```sh
ln -s ../_change-volume-owner.sh _change-volume-owner.sh && \
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
  .env
```

## Dify Releases

- [1.11.2](https://github.com/langgenius/dify/releases/tag/1.11.2) (2025/12/25)
    - Welcome to version 1.11.2! This release sees a significant number of improvements, especially around testing, fixes, and new integrations to enhance the robustness and flexibility of the platform.
- [1.11.1](https://github.com/langgenius/dify/releases/tag/1.11.1) (2025/12/13)
    - This version contains very important security updates, and we recommend that all users upgrade to this version as soon as possible.
    - **React and Next.js Security Upgrades:** We've bumped up `react` and `react-dom` to 19.2.3 to fix some CVE vulnerabilities. Next.js also got a security update, courtesy of [@douxc](https://github.com/douxc) (PRs [#29532](https://github.com/langgenius/dify/pull/29532) and [#29545](https://github.com/langgenius/dify/pull/29545)).
- [1.11.0](https://github.com/langgenius/dify/releases/tag/1.11.0) (2025/12/10)
- [1.10.1-fix.1](https://github.com/langgenius/dify/releases/tag/1.10.1) (2025/12/05)
    - [React Server Components are Vulnerable to RCE](https://github.com/advisories/GHSA-fv66-9v8q-g76r)
- [1.10.1](https://github.com/langgenius/dify/releases/tag/1.10.1) (2025/11/26)
- [1.10.0](https://github.com/langgenius/dify/releases/tag/1.10.0) (2025/11/13)
- [1.10.0-rc1](https://github.com/langgenius/dify/releases/tag/1.10.0-rc1) (2025/10/31)
- [1.9.2](https://github.com/langgenius/dify/releases/tag/1.9.2) (2025/10/29)
- [1.9.1](https://github.com/langgenius/dify/releases/tag/1.9.1) (2025/09/29)
- [1.9.0](https://github.com/langgenius/dify/releases/tag/1.9.0) (2025/09/23)
- [2.0.0-beta.2](https://github.com/langgenius/dify/releases/tag/2.0.0-beta.2) (2025/09/08)
- [2.0.0-beta.1](https://github.com/langgenius/dify/releases/tag/2.0.0-beta.1) (2025/09/04)
- [1.8.1](https://github.com/langgenius/dify/releases/tag/1.8.1) (2025/09/03)
- [1.8.0](https://github.com/langgenius/dify/releases/tag/1.8.0) (2025/08/27)
- [1.7.2](https://github.com/langgenius/dify/releases/tag/1.7.2) (2025/08/11)
- [1.7.1](https://github.com/langgenius/dify/releases/tag/1.7.1) (2025/07/28)
- [1.7.0](https://github.com/langgenius/dify/releases/tag/1.7.0) (2025/07/23)
- [1.6.0](https://github.com/langgenius/dify/releases/tag/1.6.0) (2025/07/10)
- [1.5.1](https://github.com/langgenius/dify/releases/tag/1.5.1) (2025/07/02)
- [1.5.0](https://github.com/langgenius/dify/releases/tag/1.5.0) (2025/06/25)
- [1.4.3](https://github.com/langgenius/dify/releases/tag/1.4.3) (2025/06/16)
- [1.4.2](https://github.com/langgenius/dify/releases/tag/1.4.2) (2025/06/11)
- [0.15.8](https://github.com/langgenius/dify/releases/tag/0.15.8) (2025/05/30)
- [1.4.1](https://github.com/langgenius/dify/releases/tag/1.4.1) (2025/05/27)
- [1.4.0](https://github.com/langgenius/dify/releases/tag/1.4.0) (2025/05/15)
- [1.3.1](https://github.com/langgenius/dify/releases/tag/1.3.1)
- [0.15.7](https://github.com/langgenius/dify/releases/tag/0.15.7)
- [1.3.0](https://github.com/langgenius/dify/releases/tag/1.3.0)
- [0.15.6](https://github.com/langgenius/dify/releases/tag/0.15.6)
- [1.2.0](https://github.com/langgenius/dify/releases/tag/1.2.0)
- [1.1.3](https://github.com/langgenius/dify/releases/tag/1.1.3)
- [0.15.6-alpha.1](https://github.com/langgenius/dify/releases/tag/0.15.6-alpha.1)
- [0.15.5](https://github.com/langgenius/dify/releases/tag/0.15.5)
- [1.1.2](https://github.com/langgenius/dify/releases/tag/1.1.2)
- [0.15.4](https://github.com/langgenius/dify/releases/tag/0.15.4)
- [1.1.1](https://github.com/langgenius/dify/releases/tag/1.1.1)
- [1.1.0](https://github.com/langgenius/dify/releases/tag/1.1.0)
- [1.0.1](https://github.com/langgenius/dify/releases/tag/1.0.1)
- [1.0.0](https://github.com/langgenius/dify/releases/tag/1.0.0)
- [0.15.3](https://github.com/langgenius/dify/releases/tag/0.15.3)
- [0.15.2](https://github.com/langgenius/dify/releases/tag/0.15.2)
- [0.15.1](https://github.com/langgenius/dify/releases/tag/0.15.1)
- [1.0.0-beta.1](https://github.com/langgenius/dify/releases/tag/1.0.0-beta.1)
- [0.15.0](https://github.com/langgenius/dify/releases/tag/0.15.0)
- [0.14.2](https://github.com/langgenius/dify/releases/tag/0.14.2)
- [0.14.1](https://github.com/langgenius/dify/releases/tag/0.14.1)
- [v0.8.3-fix1](https://github.com/langgenius/dify/releases/tag/v0.8.3-fix1)
- [0.14.0](https://github.com/langgenius/dify/releases/tag/0.14.0)
- [0.13.2](https://github.com/langgenius/dify/releases/tag/0.13.2)
- [0.13.1](https://github.com/langgenius/dify/releases/tag/0.13.1)
- [0.13.0](https://github.com/langgenius/dify/releases/tag/0.13.0)
- [0.12.1](https://github.com/langgenius/dify/releases/tag/0.12.1)
- [0.12.0](https://github.com/langgenius/dify/releases/tag/0.12.0)
- [0.11.2](https://github.com/langgenius/dify/releases/tag/0.11.2)
- [0.11.1](https://github.com/langgenius/dify/releases/tag/0.11.1)
- [0.10.2-fix1](https://github.com/langgenius/dify/releases/tag/0.10.2-fix1)
- [0.11.0](https://github.com/langgenius/dify/releases/tag/0.11.0)
- [0.10.2](https://github.com/langgenius/dify/releases/tag/0.10.2)
- [0.10.1](https://github.com/langgenius/dify/releases/tag/0.10.1)
- [0.10.0](https://github.com/langgenius/dify/releases/tag/0.10.0)
- [0.10.0-beta3](https://github.com/langgenius/dify/releases/tag/0.10.0-beta3)
- [0.9.2](https://github.com/langgenius/dify/releases/tag/0.9.2)
- [0.9.1-fix1](https://github.com/langgenius/dify/releases/tag/0.9.1-fix1)
- [0.10.0-beta2](https://github.com/langgenius/dify/releases/tag/0.10.0-beta2)
- [0.10.0-beta1](https://github.com/langgenius/dify/releases/tag/0.10.0-beta1)
- [0.9.1](https://github.com/langgenius/dify/releases/tag/0.9.1)
- [0.9.0](https://github.com/langgenius/dify/releases/tag/0.9.0)
- [0.8.3](https://github.com/langgenius/dify/releases/tag/0.8.3)
- [0.8.2](https://github.com/langgenius/dify/releases/tag/0.8.2)
- [0.8.1](https://github.com/langgenius/dify/releases/tag/0.8.1)
- [0.8.0](https://github.com/langgenius/dify/releases/tag/0.8.0)
- [0.8.0-beta1](https://github.com/langgenius/dify/releases/tag/0.8.0-beta1)
- [0.7.3](https://github.com/langgenius/dify/releases/tag/0.7.3)
- [0.7.2](https://github.com/langgenius/dify/releases/tag/0.7.2)
- [0.7.1](https://github.com/langgenius/dify/releases/tag/0.7.1)
- [0.7.0](https://github.com/langgenius/dify/releases/tag/0.7.0)
- [0.6.16](https://github.com/langgenius/dify/releases/tag/0.6.16)
- [0.6.15](https://github.com/langgenius/dify/releases/tag/0.6.15)
- [0.6.14](https://github.com/langgenius/dify/releases/tag/0.6.14)
- [0.6.13](https://github.com/langgenius/dify/releases/tag/0.6.13)
- [0.6.12-fix1](https://github.com/langgenius/dify/releases/tag/0.6.12-fix1)
- [0.6.12](https://github.com/langgenius/dify/releases/tag/0.6.12)
- [0.6.11](https://github.com/langgenius/dify/releases/tag/0.6.11)
- [0.6.10](https://github.com/langgenius/dify/releases/tag/0.6.10)
- [0.6.9](https://github.com/langgenius/dify/releases/tag/0.6.9)
- [0.6.8](https://github.com/langgenius/dify/releases/tag/0.6.8)
- [0.6.7](https://github.com/langgenius/dify/releases/tag/0.6.7)
- [0.6.6](https://github.com/langgenius/dify/releases/tag/0.6.6)
- [0.6.5](https://github.com/langgenius/dify/releases/tag/0.6.5)
- [0.6.4](https://github.com/langgenius/dify/releases/tag/0.6.4)
- [0.6.3](https://github.com/langgenius/dify/releases/tag/0.6.3)
- [0.6.2](https://github.com/langgenius/dify/releases/tag/0.6.2)
- [0.6.1](https://github.com/langgenius/dify/releases/tag/0.6.1)
- [0.6.0](https://github.com/langgenius/dify/releases/tag/0.6.0)
- [0.6.0-fix1](https://github.com/langgenius/dify/releases/tag/0.6.0-fix1)
- [0.6.0-preview-workflow.2](https://github.com/langgenius/dify/releases/tag/0.6.0-preview-workflow.2)
- [0.5.11-fix1](https://github.com/langgenius/dify/releases/tag/0.5.11-fix1)
- [0.5.11](https://github.com/langgenius/dify/releases/tag/0.5.11)
- [0.6.0-preview-workflow.1](https://github.com/langgenius/dify/releases/tag/0.6.0-preview-workflow.1)
- [0.5.10](https://github.com/langgenius/dify/releases/tag/0.5.10)
- [0.5.9](https://github.com/langgenius/dify/releases/tag/0.5.9)
- [0.5.8](https://github.com/langgenius/dify/releases/tag/0.5.8)
- [0.5.7](https://github.com/langgenius/dify/releases/tag/0.5.7)
- [0.5.6](https://github.com/langgenius/dify/releases/tag/0.5.6)
- [0.5.5](https://github.com/langgenius/dify/releases/tag/0.5.5)
- [0.5.4](https://github.com/langgenius/dify/releases/tag/0.5.4)
- [0.5.3](https://github.com/langgenius/dify/releases/tag/0.5.3)
- [0.5.2](https://github.com/langgenius/dify/releases/tag/0.5.2)
- [0.5.1](https://github.com/langgenius/dify/releases/tag/0.5.1)
- [0.5.0](https://github.com/langgenius/dify/releases/tag/0.5.0)
- [0.4.9](https://github.com/langgenius/dify/releases/tag/0.4.9)
- [0.4.8](https://github.com/langgenius/dify/releases/tag/0.4.8)
- [0.4.7](https://github.com/langgenius/dify/releases/tag/0.4.7)
- [0.4.6](https://github.com/langgenius/dify/releases/tag/0.4.6)
- [0.4.5](https://github.com/langgenius/dify/releases/tag/0.4.5)
- [0.4.4](https://github.com/langgenius/dify/releases/tag/0.4.4)
- [0.4.3](https://github.com/langgenius/dify/releases/tag/0.4.3)
- [0.4.2](https://github.com/langgenius/dify/releases/tag/0.4.2)
- [0.4.1](https://github.com/langgenius/dify/releases/tag/0.4.1)
- [0.4.0](https://github.com/langgenius/dify/releases/tag/0.4.0)
- [0.3.34](https://github.com/langgenius/dify/releases/tag/0.3.34)
- [0.3.33](https://github.com/langgenius/dify/releases/tag/0.3.33)
- [0.3.32](https://github.com/langgenius/dify/releases/tag/0.3.32)
- [0.3.31-fix3](https://github.com/langgenius/dify/releases/tag/0.3.31-fix3)
- [0.3.31](https://github.com/langgenius/dify/releases/tag/0.3.31)
- [0.3.31-fix2](https://github.com/langgenius/dify/releases/tag/0.3.31-fix2)
- [0.3.31-fix1](https://github.com/langgenius/dify/releases/tag/0.3.31-fix1)
- [0.3.30](https://github.com/langgenius/dify/releases/tag/0.3.30)
- [0.3.29](https://github.com/langgenius/dify/releases/tag/0.3.29)
- [0.3.28](https://github.com/langgenius/dify/releases/tag/0.3.28)
- [0.3.27](https://github.com/langgenius/dify/releases/tag/0.3.27)
- [0.3.26](https://github.com/langgenius/dify/releases/tag/0.3.26)
- [0.3.25](https://github.com/langgenius/dify/releases/tag/0.3.25)
- [0.3.24](https://github.com/langgenius/dify/releases/tag/0.3.24)
- [0.3.23](https://github.com/langgenius/dify/releases/tag/0.3.23)
- [0.3.22](https://github.com/langgenius/dify/releases/tag/0.3.22)
- [0.3.21](https://github.com/langgenius/dify/releases/tag/0.3.21)
- [0.3.20](https://github.com/langgenius/dify/releases/tag/0.3.20)
- [0.3.19](https://github.com/langgenius/dify/releases/tag/0.3.19)
- [0.3.18](https://github.com/langgenius/dify/releases/tag/0.3.18)
- [0.3.17](https://github.com/langgenius/dify/releases/tag/0.3.17)
- [0.3.16](https://github.com/langgenius/dify/releases/tag/0.3.16)
- [0.3.15](https://github.com/langgenius/dify/releases/tag/0.3.15)
- [0.3.14](https://github.com/langgenius/dify/releases/tag/0.3.14)
- [0.3.13](https://github.com/langgenius/dify/releases/tag/0.3.13)
- [0.3.12](https://github.com/langgenius/dify/releases/tag/0.3.12)
- [0.3.11](https://github.com/langgenius/dify/releases/tag/0.3.11)
- [0.3.10](https://github.com/langgenius/dify/releases/tag/0.3.10)
- [0.3.9](https://github.com/langgenius/dify/releases/tag/0.3.9)
- [0.3.8](https://github.com/langgenius/dify/releases/tag/0.3.8)
- [0.3.7](https://github.com/langgenius/dify/releases/tag/0.3.7)
- [0.3.6](https://github.com/langgenius/dify/releases/tag/0.3.6)
- [0.3.5](https://github.com/langgenius/dify/releases/tag/0.3.5)
- [0.3.4](https://github.com/langgenius/dify/releases/tag/0.3.4)
- [0.3.3](https://github.com/langgenius/dify/releases/tag/0.3.3)
- [0.3.2](https://github.com/langgenius/dify/releases/tag/0.3.2)
- [0.3.1](https://github.com/langgenius/dify/releases/tag/0.3.1)
- [0.3.0](https://github.com/langgenius/dify/releases/tag/0.3.0)
- [0.2.2](https://github.com/langgenius/dify/releases/tag/0.2.2)
- [0.2.1](https://github.com/langgenius/dify/releases/tag/0.2.1) (2025/05/15)
