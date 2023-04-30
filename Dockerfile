# Usa a imagem Ubuntu
FROM ubuntu

# Cria o diretório de trabalho e copia o código-fonte para dentro do container
WORKDIR /app
COPY . .

USER root

# Copia o arquivo deployment.yaml para dentro do container
COPY my-app-k8s/deployment.yaml /app/deployment.yaml

RUN apt-get update -y
RUN apt-get install -y curl

RUN apt-get install -y docker

# Instala o kubectl do container
RUN apt-get install curl docker
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm kubectl

# Instalar Docker manualmente
RUN curl https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz | tar xvz -C /tmp/ && mv /tmp/docker/docker /usr/bin/docker


# Cria o diretório de destino para os arquivos tar
RUN mkdir -p /spring-api-consumer
RUN mkdir -p /spring-api-worker

# Copia o arquivo .tar para dentro da imagem
COPY ../spring-api-consumer/spring-api-consumer.tar /spring-api-consumer/spring-api-consumer.tar
COPY ../spring-api-worker/spring-api-worker.tar /spring-api-worker/spring-api-worker.tar
#COPY spring-api-consumer.tar /spring-api-consumer/spring-api-consumer.tar
#COPY spring-api-worker.tar   /spring-api-worker/spring-api-worker.tar


RUN pwd && ls -la && echo "Conteúdo do diretório atual" && ls -la ../ && echo "Conteúdo do diretório pai" && ls -la ../spring-api-consumer && echo "Conteúdo do diretório do arquivo" && ls -la /spring-api-consumer && echo "Extraindo arquivo..." && cd ../spring-api-consumer && tar -xvf /spring-api-consumer.tar --strip-components=1 && rm ../spring-api-consumer.tar


# Extrai o arquivo .tar e remove o arquivo original
RUN /spring-api-consumer \
    && tar -xvf /spring-api-consumer.tar --strip-components=1 \
    && rm ../spring-api-consumer.tar
RUN /spring-api-worker \
    && tar -xvf ../spring-api-worker.tar --strip-components=1 \
    && rm ../spring-api-worker.tar

# Executa o comando kubectl apply para aplicar o deployment.yaml
CMD ["kubectl", "apply", "-f", "deployment.yaml"]
