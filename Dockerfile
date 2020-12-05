FROM openjdk:8
FROM maven:latest
COPY pom.xml /tmp/pom.xml
RUN mvn -B -f /tmp/pom.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve
RUN mvn clean install
RUN mvn clean package
ADD target/user-levels.jar user-levels.jar
EXPOSE 9000
ENTRYPOINT ["java", "-jar", "user-levels.jar"]
