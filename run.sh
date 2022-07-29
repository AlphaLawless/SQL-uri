#!/bin/bash

cd ./docker-config
docker-compose up -d
if [ $? -eq  0 ]; then
  sleep 5
  docker exec -it postgresql-uri psql -h localhost -U docker-uri
fi
