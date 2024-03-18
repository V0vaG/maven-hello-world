# Use Maven as the base image
FROM maven:openjdk as builder

# Copy the Maven project into the Docker image
COPY . .

# Run the build
RUN mvn package

FROM openjdk:11

#Copy Artifact .jar file from 1st build
COPY --from=builder /target/myapp-1.0.0.jar .

#CMD ls
CMD java -jar myapp-1.0.0.jar

#

