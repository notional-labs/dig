FROM golang:1.16-buster AS build

RUN apt-get update && \
  apt-get install --no-install-recommends --assume-yes curl unzip && \
  apt-get clean

FROM build AS aws

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip -d /usr/src

FROM build AS project

ARG PROJECT=dig
ARG PROJECT_BIN=digd
ARG REPOSITORY=https://github.com/faddat/dig

# Clone and build project
WORKDIR /data
RUN wget https://github.com/faddat/dig/releases/download/latest/dig_latest_linux_amd64.tar.gz
RUN gunzip dig_latest_linux_amd64.tar.gz
RUN tar -xvf dig_latest_linux_amd64.tar
RUN mv digd /usr/bin 

FROM debian:buster

RUN apt-get update && \
  apt-get install --no-install-recommends --assume-yes ca-certificates curl wget file unzip gnupg2 jq && \
  apt-get clean

ARG PROJECT=dig
ARG PROJECT_BIN=digd
ARG PROJECT_DIR=.dig
ARG WASMVM_VERSION=main
ARG REPOSITORY=https://github.com/faddat/dig
ARG NAMESPACE

ENV PROJECT=$PROJECT
ENV PROJECT_BIN=$PROJECT_BIN
ENV PROJECT_DIR=$PROJECT_DIR
ENV REPOSITORY=$REPOSITORY
ENV NAMESPACE=$NAMESPACE

ENV MONIKER=my-omnibus-node

EXPOSE 26656 \
       26657 \
       1317  \
       9090  \
       8080

COPY --from=project /usr/bin/digd /usr/bin/digd
COPY --from=aws /usr/src/aws /usr/src/aws
RUN /usr/src/aws/install --bin-dir /usr/bin
ADD https://raw.githubusercontent.com/CosmWasm/wasmvm/$WASMVM_VERSION/api/libwasmvm.so /lib/libwasmvm.so

COPY run.sh /usr/bin/
RUN chmod +x /usr/bin/run.sh
ENTRYPOINT ["run.sh"]

CMD $PROJECT_BIN start
