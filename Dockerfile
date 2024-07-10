# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install Maven
RUN apt-get update && apt-get install -y maven

# Package the application
RUN mvn clean package

# Expose the port the app runs on
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "target/docker-java-app-example.jar"]
