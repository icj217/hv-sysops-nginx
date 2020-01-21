#!/bin/bash

# Entrypoint script that bootstraps nginx configuration prior to starting server

# Check for ENVIRON environment variables
if [[ ! -v ENVIRON ]]; then
  echo "Environment variable `ENVIRON` was not provided. Please provide value before starting container." 1>&2
  exit 1
fi

# Load proper environment's values
export $(cat /bootstrap/${ENVIRON} | xargs)

# Bootstrap NGINX Configuration
# See here for source of printf logic: https://github.com/docker-library/docs/issues/496#issuecomment-287927576
envsubst "`printf '${%s} ' $(bash -c "compgen -A variable")`" < /bootstrap/nginx.template > /etc/nginx/nginx.conf

echo "Starting NGINX..."

exec "$@"