# Use Maven as the base image
FROM maven:openjdk as builder

# Copy the Maven project into the Docker image
COPY . .

# Run the build
RUN mvn package

FROM openjdk:11

ARG BUILD_NUM

#Copy Artifact .jar file from 1st build
COPY --from=builder /target/myapp-1.0.0.jar .

RUN mv myapp-1.0.0.jar myapp-1.0.$BUILD_NUM.jar
#CMD ls

CMD java -jar 'myapp-1.0.$BUILD_NUM.jar'

