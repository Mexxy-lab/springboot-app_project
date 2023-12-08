FROM eclipse-temurin:17.0.7_7-jre-jammy
#eclipse-temurin:17.0.7_7-jre-jammy is another choice for your base image

WORKDIR /app
COPY spring-petclinic/.mvn .mvn
COPY spring-petclinic/mvnw pom.xml ./
COPY spring-petclinic/target/spring-petclinic-3.2.0-SNAPSHOT.jar /app
COPY spring-petclinic/src ./src
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic-3.2.0-SNAPSHOT.jar"]