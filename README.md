# Introduction

This docker container starts an nginx server that serves up the content of the /var/www directory. 

The server configuration changes dynamically based on the value of the `ENVIRON` environment variable. 

See below for details.

Published to Docker Hub under `icj217/hv-sysops-nginx:latest` [repository](https://hub.docker.com/repository/docker/icj217/hv-sysops-nginx)

Source code available [here](https://github.com/icj217/hv-sysops-nginx)

# Running

The docker image can be run using `docker run` or Docker Compose. 

Using Docker Compose can be helpful if you need to specify numerous environment variables/volume mounts and/or if you are using this container within a multi-service project.

## Environment

To run the image, pass an `ENVIRON` environment variable into the container, e.g. `docker run -e "ENVIRON=dev" icj217/hv-sysops-nginx:latest`

The following are valid `ENVIRON` values: `dev`, `prod`

There is no default value for this environment variable to limit the chance of accidental misconfiguration.

## Content

To override the default content served by nginx, simply mount a volume over the `/var/www/` directory, e.g. `docker run  --volume=/my/local/content:/var/www -e "ENVIRON=dev" icj217/hv-sysops-nginx:latest`