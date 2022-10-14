FROM public.ecr.aws/docker/library/node:lts-alpine3.16

# labels
LABEL maintainer="mail@seni.one"

# variables versi hugo latest
ENV HUGO_VERSION=0.104.1

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
