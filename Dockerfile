FROM ubuntu:latest

RUN apt-get update && apt-get install -y --no-install-recommends curl unzip ca-certificates

WORKDIR /pharo

COPY build.st run.st ./

RUN curl https://zn.stfx.eu/random

RUN curl get.pharo.org | bash

RUN ./pharo Pharo.image st --save --quit build.st

CMD ./pharo Pharo.image st --no-quit run.st
