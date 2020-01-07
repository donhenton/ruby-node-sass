FROM node:10.18.0-alpine3.9

RUN apk add --no-cache git ruby python


ENV SASS_BINARY_VERSION 4.9.0
RUN apk add --no-cache --virtual .build-deps-node-sass curl \
   && mkdir -p /node-sass \
   && cd /node-sass \
   && curl -fSLO --compressed "https://github.com/sass/node-sass/releases/download/v$SASS_BINARY_VERSION/linux_musl-x64-57_binding.node" \
   && apk del .build-deps-node-sass

ENV SASS_BINARY_PATH /node-sass/linux_musl-x64-57_binding.node

RUN yarn global add node-sass

CMD ["node"]