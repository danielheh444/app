FROM nginx:alpine

RUN addgroup -S nginxgroup && adduser -S nginxuser -G nginxgroup

RUN mkdir -p /var/cache/nginx && \
    chown -R nginxuser:nginxgroup /var/cache/nginx /var/run /var/log/nginx /etc/nginx /usr/share/nginx/html

COPY default.conf /etc/nginx/conf.d/default.conf

COPY ./html /usr/share/nginx/html

RUN touch /var/run/nginx.pid && \
    chown nginxuser:nginxgroup /var/run/nginx.pid

USER nginxuser

EXPOSE 80
