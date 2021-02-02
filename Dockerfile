ARG DOCKER_NODE_VERSION=15.7.0-alpine
ARG DOCKER_NGINX_VERSION=1.19.6-alpine


# NODE section
FROM node:$DOCKER_NODE_VERSION AS build-stage

WORKDIR /usr/src

COPY package.json yarn.lock ./
RUN yarn --pure-lockfile --force

COPY . .
RUN yarn build


# NGINX section
FROM nginx:$DOCKER_NGINX_VERSION AS export-stage

WORKDIR /usr/share/nginx/app

COPY ./.docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./.docker/nginx/conf.d /etc/nginx/conf.d
COPY --from=build-stage /usr/src/build /usr/share/nginx/app

EXPOSE 80 443
