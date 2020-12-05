FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:8
ADD target/user-levels.jar user-levels.jar
EXPOSE 9000
ENTRYPOINT ["java", "-jar", "user-levels.jar"]
