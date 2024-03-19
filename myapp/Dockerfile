# Use Maven as the base image
FROM maven:openjdk as builder

# Copy the Maven project into the Docker image
COPY . .

# Run the build
RUN mvn package

# Use Java 17 as the base for the 2nd stage build
FROM openjdk:17-jdk-slim

# Pass the build num argument from the workflow to the dockerfile
ARG BUILD_NUM

# Copy Artifact .jar file from 1st build
COPY --from=builder /target/myapp-1.0.$BUILD_NUM.jar .

# Add new user
RUN adduser vova-kepler

# Set the non-root user as the default user
USER vova-kepler

# Run the .jar file
CMD java -jar 'myapp-1.0.$BUILD_NUM.jar'

