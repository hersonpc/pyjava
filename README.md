# **Python container in Docker**

These are my Docker images, for deploying and distributing apps with Python based code.

[https://hub.docker.com/r/hersonpc/python](https://hub.docker.com/r/hersonpc/python)

## Deploy an image

```shell
cd 3.10/oracle
docker buildx build --platform linux/amd64,linux/arm64/v8 --push -t hersonpc/python:3.10-oracle -f Dockerfile .
```

## Get started

To get the image from Docker Hub to your machine:

```shell
docker pull hersonpc/python:<version>
```

To choose a version, check the options below.

## Container versions

### for Python 3.10

- [3.10-slim](3.10/slim/Dockerfile)
- [3.10-oracle](3.10/oracle/Dockerfile) with OJDBC to connect to Oracle databases

### for Python 3.11

- [3.11-slim](3.11/slim/Dockerfile)
- [3.11-oracle](3.11/oracle/Dockerfile) with OJDBC to connect to Oracle databases
- [3.11-django-4](3.11/django-4/Dockerfile) with Django 4.2 pre-installed
