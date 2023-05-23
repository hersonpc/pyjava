# GitHub: https://github.com/hersonpc/python
# Docker Hub: https://hub.docker.com/r/hersonpc/python
# Maintainer: Herson Melo <hersonpc@gmailcom>

# To get this image:
# docker pull hersonpc/python:3.11-oracle

# To create a new version:
# docker buildx build --platform linux/amd64,linux/arm64/v8 --push -t hersonpc/python:3.11-oracle -f Dockerfile .
# docker push hersonpc/python:3.11-oracle

# To run this image:
# docker run -it --rm --name python hersonpc/python:3.11-oracle



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

# instalar o jdk do java
COPY --from=openjdk:21-jdk-slim /usr/local/openjdk-21 /usr/local/openjdk-21
ENV JAVA_HOME /usr/local/openjdk-21
RUN update-alternatives --install /usr/bin/java java /usr/local/openjdk-21/bin/java 1

# instala o driver para acesso ao banco de dados oracle
COPY ./driver/ojdbc8.jar /opt/jdbc/drivers/ojdbc8.jar
RUN chown -R user:user /opt/jdbc/

# criando variáveis de ambiente para o driver do oracle
ENV ORACLE_DRIVER_CLASSNAME=oracle.jdbc.driver.OracleDriver
ENV ORACLE_DRIVER_JAR=/opt/jdbc/drivers/ojdbc8.jar

# baixar privilégios
USER user
