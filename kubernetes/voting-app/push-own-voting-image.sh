#!/bin/sh

git clone https://github.com/Azure-Samples/azure-voting-app-redis.git azure-voting-app-redis
cd azure-voting-app-redis/azure-vote

docker build -t azure-vote-front:v1 .
docker tag azure-vote-front:v1 codehunterstrainingacr.azurecr.io/azure-vote-front:v1
az acr login -n codehunterstrainingacr
docker push codehunterstrainingacr.azurecr.io/azure-vote-front:v1

cd ..
rm -rf ./azure-voting-app-redis
