#!/bin/sh

kubectl apply -f ./namespace.yml

kubectl apply -f ./backend-deployment.yml

kubectl apply -f ./frontend-deployment.yml

kubectl apply -f ./hpa.yml

kubectl apply -f ./backend-service.yml

kubectl apply -f ./frontend-service.yml

kubectl apply -f ./ingress.yml
