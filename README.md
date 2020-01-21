# Introduction

This docker container starts an nginx server that serves up the content of the /var/www directory (which is the `/html` directory in the repository)

Published to Docker Hub under `icj217/hv-sysops-nginx:latest` [repository](https://hub.docker.com/repository/docker/icj217/hv-sysops-nginx)

# Functionality

This container dynamically changes the configuration of the nginx server upon startup, based on the value of the `ENVIRON` environment variable. 

Depending on the value, it will load the appropriate environment file from the `/bootstrap/env/` directory, replace the placeholders in the `/bootstrap/nginx.template` file using the `envsubst` utility, and pass the configuration to nginx.

Adding a new environment is as simple as:
1. Add a new file to `/bootstrap/env/` matching the environment name
2. Pass the `ENVIRON` environment variable w/the new environment name as the value when starting the container, e.g. `docker run -e "ENVIRON=foo" icj217/hv-sysops-nginx:latest`

# Building

To build the container, run `make build`.

# Running

To run the container, run `make run-dev` or `make run-prod` depending on the environment.

If having issues with variable substitution, be mindful of how you format your nginx configuration: https://github.com/docker-library/docs/issues/496