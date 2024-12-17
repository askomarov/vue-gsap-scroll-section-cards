FROM node:20-alpine as base

RUN apk add --no-cache nginx
COPY ./docker/nginx.conf /etc/nginx/nginx.conf

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/www

COPY ./src ./

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
