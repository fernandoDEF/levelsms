FROM openjdk:8
FROM maven:latest
RUN mvn clean package
ADD target/user-levels.jar user-levels.jar
EXPOSE 9000
ENTRYPOINT ["java", "-jar", "user-levels.jar"]
