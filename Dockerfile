# write your Docker file code here
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY . /app
RUN mvn clean package

# Run ther project
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar /app/app.jar
EXPOSE 8081
CMD ["java", "-jar", "/app/app.jar"]
