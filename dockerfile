FROM node:alpine AS builder

WORKDIR /web

COPY package.json yarn.lock ./
RUN yarn install --production

COPY . .

RUN yarn build

FROM nginx:alpine as prod

COPY --from=builder /web/build /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
