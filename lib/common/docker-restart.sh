#!/bin/bash

docker-compose stop 
docker-compose rm -vf $@
docker-compose build
docker-compose up -d
