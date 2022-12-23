FROM node:16-alpine

RUN apk add --no-cache git

RUN npm install -g pm2

RUN mkdir -p /usr/src/app && chown -R node:node /usr/src/app

WORKDIR /usr/src/app

COPY package.json yarn.lock ./

USER node

RUN yarn install --pure-lockfile --ignore-scripts

COPY --chown=node:node . .

EXPOSE 3000

CMD ["node", "dist/main"]