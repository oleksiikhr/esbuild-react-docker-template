# NODE section
ARG DOCKER_NODE_VERSION=15.7.0-alpine
FROM node:$DOCKER_NODE_VERSION AS prepare

WORKDIR /usr/src

COPY package.json yarn.lock ./
RUN yarn --pure-lockfile --force

COPY . .
RUN yarn build


# NGINX section
ARG DOCKER_NGINX_VERSION=1.19.6-alpine
FROM nginx:$DOCKER_NGINX_VERSION AS build

WORKDIR /usr/share/nginx/app

COPY ./.docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./.docker/nginx/conf.d /etc/nginx/conf.d
COPY --from=0 /usr/src/build /usr/share/nginx/app

EXPOSE 80 443
