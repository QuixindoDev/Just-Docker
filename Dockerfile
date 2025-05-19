FROM maven:3.8.4-jdk-8 AS build

COPY src /app/src
COPY pom.xml /app

WORKDIR /app

RUN mvn clean install

FROM openjdk:17-jre-alpine

COPY --from=build /app/target/docker-0.0.1-SNAPSHOT.jar /app/app.jar

LABEL authors="eufrasio"
EXPOSE 8080
ENTRYPOINT ["top", "-b"]