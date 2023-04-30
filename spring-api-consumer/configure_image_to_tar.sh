#!/bin/bash

# Constrói a imagem
docker build -t spring-api-consumer:1.0.0 .

# Salva a imagem em um arquivo .tar para ser garregada junto ao kubectl
docker save -o spring-api-consumer.tar spring-api-consumer:1.0.0
