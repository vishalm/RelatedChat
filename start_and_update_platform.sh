#!/bin/bash

# Start Docker services
docker-compose up -d
sleep 60
# Update platform for each service
services=("relatedchat_api" "relatedchat_web" "gqlserver" "gqlserver_admin" "pg" "rd" "minio")
for service in "${services[@]}"
do
    docker container update --platform linux/amd64 "$service"
    sleep 20
done
