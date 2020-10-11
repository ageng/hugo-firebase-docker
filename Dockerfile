FROM node:12-alpine

# labels
LABEL maintainer="me@ageng.my.id"

# variables versi hugo latest
ENV HUGO_VERSION=0.76.3

# install hugo and firebase
RUN set -x && \
    apk add --update --upgrade --no-cache wget ca-certificates && \
    update-ca-certificates && \
    cd /tmp &&\
    wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -O hugo.tar.gz && \
    tar xzf hugo.tar.gz && \
    mv hugo /usr/bin/hugo && \
    rm -r * && \
    apk del --purge wget && \
    hugo version && \
    node -v && \
    npm -v && \
    npm install -g firebase-tools@latest --unsafe-perm