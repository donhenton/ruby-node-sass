FROM node:10-alpine

RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

RUN apk update

RUN apk add --no-cache git ruby python

RUN npm install node-sass

