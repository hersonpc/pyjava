# GitHub: https://github.com/hersonpc/python
# Docker Hub: https://hub.docker.com/r/hersonpc/python
# Maintainer: Herson Melo <hersonpc@gmailcom>

# To get this image:
# docker pull hersonpc/python:3.11-slim

# To create a new version:
# docker buildx build --platform linux/amd64,linux/arm64 --push -t hersonpc/python:3.11-slim -f Dockerfile .
# docker push hersonpc/python:3.11-slim

# To run this image:
# docker run -it --rm --name python hersonpc/python:3.11-slim



# Imagem intermediária para compilar os pacotes
FROM python:3.11.3-slim AS builder

WORKDIR /build

RUN apt-get update && apt install gcc python3-dev -y

RUN python -m pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt



# Imagem final
FROM python:3.11.3-slim

WORKDIR /app
RUN adduser --system --group user \
    && chown user:user /app

COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages

USER user

