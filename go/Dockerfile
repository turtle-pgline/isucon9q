FROM golang:1.13-alpine

WORKDIR /src
ENV GOMODULE=on
EXPOSE 8080

RUN apk add --no-cache \
        alpine-sdk \
        git \
    && go get github.com/pilu/fresh

CMD ["fresh"]