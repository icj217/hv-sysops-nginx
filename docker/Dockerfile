FROM nginx:latest

LABEL maintainer="Craig Burdulis"
LABEL version="0.0.0"
LABEL repository="https://github.com/icj217/hv-sysops-nginx"
LABEL description="Docker image for nginx server that loads different nginx config based on value of the `ENVIRON` environment variable"

COPY docker docker

# NGINX Configuration
COPY nginx.template /bootstrap/
COPY env /bootstrap/

# HTML content
COPY html /var/www/

ENTRYPOINT [ "docker/entrypoint.sh" ]

CMD ["nginx", "-g daemon off;"]