#!/bin/bash

# Constrói a imagem
docker build -t spring-api-worker:1.0.0 .

# Salva a imagem em um arquivo .tar para ser garregada junto ao kubectl
docker save -o spring-api-worker.tar spring-api-worker:1.0.0
