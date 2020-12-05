FROM openjdk:8
RUN mvn clean package
ADD target/user-levels.jar user-levels.jar
EXPOSE 9000
ENTRYPOINT ["java", "-jar", "user-levels.jar"]
