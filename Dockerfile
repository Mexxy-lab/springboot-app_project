FROM eclipse-temurin:17-jdk-jammy
#eclipse-temurin:17.0.7_7-jre-jammy is another choice for your base image

WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY target/spring-petclinic-3.1.0-SNAPSHOT.jar /app
COPY src ./src
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic-3.1.0-SNAPSHOT.jar"]