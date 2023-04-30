## Iniciando aplicação

Primeiro passo e fazer build para criar a imagem

``sudo docker build -t spring-api-local .``

Agora bastar executar imagem para roda:

``sudo docker run -it meu-vim``

## Como instalar o kubectl

``curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"``

``chmod +x kubectl``

``sudo mv kubectl /usr/local/bin/``

``kubectl version``
