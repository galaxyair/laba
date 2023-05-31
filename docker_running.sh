#!/bin/bash
sudo docker build -t web
sudo docker images
sudo docker run -dit -p 81:80 web:latest
sudo docker run -d --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower