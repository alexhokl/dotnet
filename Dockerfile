FROM microsoft/dotnet:2.1-runtime-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache curl

RUN addgroup -S app && adduser -S -G app app
ENV HOME=/home/app
WORKDIR $HOME

USER app
