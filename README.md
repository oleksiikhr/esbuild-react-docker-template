# Esbuild React Docker Template

Template for a quick setup of docker containers with React + esbuild.

## Commands

### Local Development

Using the `docker-compose.yml` file, run Node for build js and Nginx server to serve up the generated files.

```shell
# Run containers
$ docker-compose up -d

# Stop and delete containers
$ docker-compose down
```

Complete! Open [http://app.localhost/](http://app.localhost/).

### Production

Using the `Dockerfile`.

```shell
# Build image
$ docker build -t my_react .

# Create container
$ docker run -d --name my_react_1 -p 80:80 -p 443:443 my_react
```

Complete! Open [http://app.localhost/](http://app.localhost/).

## Config

### Domain

Find and change **server_name** value.

```shell
$ nano .docker/nginx/conf.d/app.conf
```
