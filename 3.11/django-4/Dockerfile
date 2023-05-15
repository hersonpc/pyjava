# GitHub: https://github.com/hersonpc/python
# Docker Hub: https://hub.docker.com/r/hersonpc/python
# Maintainer: Herson Melo <hersonpc@gmailcom>

# To get this image:
# docker pull hersonpc/python:3.11-django-4

# To create a new version:
# docker buildx build --platform linux/amd64,linux/arm64 --push -t hersonpc/python:3.11-django-4 -f Dockerfile .
# docker push hersonpc/python:3.11-django-4

# To run this image:
# docker run -it --rm --name python hersonpc/python:3.11-django-4


# Imagem intermediária para compilar os pacotes
FROM hersonpc/python:3.11-slim AS builder

WORKDIR /build

# elevar privilégios temporariramente, para instalar as dependências
USER root

RUN apt-get update && apt install gcc g++ python3-dev -y

RUN python -m pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt



# Imagem final
FROM hersonpc/python:3.11-slim

# elevar privilégios temporariramente, para instalar as dependências
USER root

# copiar os pacotes instalados na imagem intermediária
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages

# baixar privilégios
USER user
