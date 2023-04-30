#!/bin/bash

chmod +x /spring-api-worker/configure_image_to_tar.sh
chmod +x /spring-api-consumer/configure_image_to_tar.sh

./spring-api-worker/configure_image_to_tar.sh
./spring-api-consumer/configure_image_to_tar.sh

# Builda toda aplicação
sudo docker build -t api-spring-local .

# Run da aplicação
sudo docker run -it api-spring-local
