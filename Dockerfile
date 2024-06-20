FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/ecommerce-0.0.1-SNAPSHOT.war /app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "ecommerce-0.0.1-SNAPSHOT.war"]
