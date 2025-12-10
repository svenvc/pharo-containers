FROM ubuntu:latest AS builder

RUN apt-get update && apt-get install -y --no-install-recommends curl unzip ca-certificates

WORKDIR /pharo

COPY build.st run.st ./

RUN curl get.pharo.org | bash

RUN ./pharo Pharo.image st --save --quit build.st

RUN ./pharo Pharo.image clean --production
RUN ./pharo Pharo.iamge st --save --quit remove.st
RUN ./pharo Pharo.image eval --save NoPharoFilesOpener install


FROM ubuntu:latest AS final

WORKDIR /pharo

COPY run.st ./
COPY --from=builder /pharo/pharo ./
COPY --from=builder /pharo/pharo-vm ./
COPY --from=builder /pharo/Pharo.image ./

CMD ./pharo Pharo.image st --no-quit run.st
