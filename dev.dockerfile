FROM node:lts-alpine

WORKDIR /web

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

EXPOSE 80

CMD yarn start
