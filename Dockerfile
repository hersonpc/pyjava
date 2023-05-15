# GitHub: https://github.com/hersonpc/pyjava


# Imagem intermediária para compilar os pacotes
FROM python:3.11.3-slim AS builder

WORKDIR /build

COPY ./requirements.txt .

RUN python -m pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Imagem final
FROM python:3.11.3-slim

LABEL maintainer="Herson Melo <hersonpc@gmail.com>" \
    name="pyjava" \
    version="0.0.1"

COPY --from=openjdk:21-jdk-slim /usr/local/openjdk-21 /usr/local/openjdk-21
ENV JAVA_HOME /usr/local/openjdk-21
RUN update-alternatives --install /usr/bin/java java /usr/local/openjdk-21/bin/java 1

WORKDIR /app
RUN adduser --system --group user \
    && chown user:user /app

COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
# COPY . .

USER user

