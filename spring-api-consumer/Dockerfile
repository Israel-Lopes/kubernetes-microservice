# Usa a imagem oficial do Maven como base
FROM maven:3.8.4-openjdk-17-slim AS build

# Copia o código fonte para o diretório de trabalho
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Compila o código, executa os testes e gera o arquivo JAR
RUN mvn package

# Usa a imagem oficial do OpenJDK como base
FROM openjdk:17-jdk-alpine

# Copia o arquivo JAR da compilação anterior para a imagem
COPY --from=build /app/target/*.jar /app/app.jar

# Expõe a porta 8080 do container
EXPOSE 8090

# Inicia a aplicação com o arquivo JAR incluído na imagem
CMD ["java", "-jar", "/app/app.jar"]
