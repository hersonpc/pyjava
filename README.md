# Docker Container for **Python + Java**

This is a Docker Image for deploy code base on Python and Java

https://hub.docker.com/r/hersonpc/pyjava

## Docker commands

To download the image from Docker Hub:  

```shell
docker pull hersonpc/pyjava:latest
```

To build manually a local docker image, without downloading it from Docker Hub, you can use:

```shell
docker build -t hersonpc/pyjava:latest .
```

## Atualizando container no Docker Hub

Para definir uma nova versão do container

```shell
# definir uma nova versão
docker tag hersonpc/pyjava:3.11.3-arm hersonpc/pyjava:latest

# enviar a versão para o hub
docker push hersonpc/pyjava:latest
```
