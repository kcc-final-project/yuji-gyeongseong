FROM eclipse-temurin:17-jdk-alpine
COPY ./target/*SNAPSHOT.war project.war
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=dev", "project.war"]