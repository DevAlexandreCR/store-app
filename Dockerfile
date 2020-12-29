FROM node:10-alpine

RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

RUN npm install

RUN npm install -g sass --unsafe-perm

RUN npm install -g less --unsafe-perm

USER node

COPY --chown=node:node . .

EXPOSE 8080

CMD tail -f /dev/null
