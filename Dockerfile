FROM maven:3.6.0-jdk-11-slim AS build
RUN mvn clean package

FROM openjdk:8
ADD target/user-levels.jar user-levels.jar
EXPOSE 9000
ENTRYPOINT ["java", "-jar", "user-levels.jar"]
