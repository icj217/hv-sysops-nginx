# Introduction

The following information is useful if you are changing the base image.

# Functionality

The bulk of the logic for this image lives in the `entrypoint.sh` script that is executed before starting the nginx container.

This entrypoint allows us to inspect environment variables at runtime and bootstrap the nginx configuration appropriately.

If having issues with variable substitution, be mindful of how you format your nginx configuration and perform the replacement. Useful links:
* https://github.com/docker-library/docs/issues/496
* https://github.com/docker-library/docs/issues/496#issuecomment-287927576

# Adding New Environment

Adding a new environment to make available to end-users is as simple as:
1. Add a new file to `/bootstrap/env/` matching the environment name
2. Pass the `ENVIRON` environment variable w/the new environment name as the value when starting the container, e.g. `docker run -e "ENVIRON=foo" icj217/hv-sysops-nginx:latest`
3. Update the README documentation

# Building

To build the container locally, run `make build`

# Running

To run the container locally, run `make run-dev` or `make run-prod` depending on the environment.