FROM ubuntu:latest AS build

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

COPY --from=builder /app/pharo /app/pharo-vm /app/Pharo.image ./

CMD ./pharo Pharo.image st --no-quit run.st
