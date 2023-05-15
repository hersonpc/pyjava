# Build for multiple architectures

Ref: <https://www.thorsten-hans.com/how-to-build-multi-arch-docker-images-with-ease/>

To build multi-arch Docker Images with docker buildx, we need a builder. The builder is responsible for building our Docker Images for the desired architectures. We can easily create and bootstrap a new builder, as shown here:

```shell
# Create a new builder
docker buildx create --name mybuilder --bootstrap --use
```

Optionally, we can specify which platforms we want our builder to support using the --platform flag. If we omit the platform flag - as we did in the example above - we will get a builder to build Docker Images for all supported platforms. We can inspect existing builders to get a list of the supported platforms:

```shell
# List existing builders
docker buildx ls 

# Inspect our custom builder
docker buildx inspect mybuilder

Name:   mybuilder
Driver: docker-container

Nodes:
Name:      mybuilder0
Endpoint:  desktop-linux
Status:    running
Buildkit:  v0.11.6
Platforms: linux/arm64, linux/amd64, linux/amd64/v2, linux/riscv64, linux/ppc64le, linux/s390x, linux/386, linux/mips64le, linux/mips64, linux/arm/v7, linux/arm/v6
```

Having the builder in place and knowing all supported platforms, we can use docker buildx build to build our Docker Image for the architectures we’re interested in. For now, let’s build our Docker Images for linux/arm64/v8 and linux/amd64:

```shell
# Build for multiple architectures
cd 3.10/slim
docker buildx build --platform linux/arm64/v8,linux/amd64 -t hersonpc/python:3.10-slim .
```
