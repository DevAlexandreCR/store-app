FROM node:10-alpine

RUN apk --no-cache add \
	file \
	libpng

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

RUN npm install

RUN npm install -g sass less --unsafe-perm=true --allow-root

RUN set -x \
	&& apk add --no-cache --virtual .build-deps \
		autoconf \
		automake \
		build-base \
		libpng-dev \
		nasm \
	&& npm install --global imagemin-cli \
	&& apk del .build-deps

USER node

COPY --chown=node:node . .

EXPOSE 8080

CMD tail -f /dev/null
