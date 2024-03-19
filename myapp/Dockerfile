# Use ubuntu as the base image
FROM alpine:latest as patch

# Pass the build num argument from the workflow to the dockerfile
ARG BUILD_NUM

# Copy the Maven project into the Docker image
COPY . .

# Run script to set the version number to the pom.xml
RUN bash update_patch.sh 1 0 $BUILD_NUM

# Use Maven as the base image
FROM maven:openjdk as builder

# Copy the Maven project into the Docker image
COPY --from=patch /target/myapp-1.0.$BUILD_NUM.jar .

# Run script to set the version number to the pom.xml
#RUN bash update_patch.sh 1 0 $BUILD_NUM

# Run the build
RUN mvn package

# Use Java 17 as the base for the 2nd stage build
FROM openjdk:17-jdk-slim

# Pass the build num argument from the workflow to the dockerfile
ARG BUILD_NUM

# Copy Artifact .jar file from 1st build
COPY --from=builder . .

# Add new user
RUN adduser vova-kepler

# Set the non-root user as the default user
USER vova-kepler

# Run the .jar file
CMD java -jar *.jar

