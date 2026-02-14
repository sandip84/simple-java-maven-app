FROM eclipse-temurin:17-jre
#FROM docker.io/library/eclipse-temurin:17-jre

WORKDIR /app

# Copy the JAR produced by Maven
COPY target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/app.jar"]
