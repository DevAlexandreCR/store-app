FROM node:10-alpine

RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

RUN npm install

RUN set -x \
	&& apk add --no-cache --virtual .build-deps \
		autoconf \
        file \
        musl \
        zlib-dev \
        automake \
        build-base \
        libpng-dev \
        nasm \
	&& npm install --global sass imagemin-cli grunt-cli --unsafe-perm=true --allow-root \
	&& apk del .build-deps

USER node

COPY --chown=node:node . .

EXPOSE 8080

CMD tail -f /dev/null
