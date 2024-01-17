FROM redis:7-alpine
ARG redis_password

RUN \
  echo "requirepass ${redis_password}" >> /etc/redis.conf
CMD [ "redis-server", "/etc/redis.conf" ]
