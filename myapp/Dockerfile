# Use Maven as the base image
FROM maven:openjdk as builder

ARG BUILD_NUM

# Copy the Maven project into the Docker image
COPY . .

# RUN sed -i 's/<version>1.0.0</version>/<version>1.0.777</version>/g' ./test.txt



# Run the build
RUN mvn package

FROM openjdk:11

ARG BUILD_NUM

#Copy Artifact .jar file from 1st build
COPY --from=builder /target/myapp-1.0.0.jar .
#COPY --from=builder /test.txt .

RUN mv myapp-1.0.0.jar myapp-1.0.$BUILD_NUM.jar

RUN ls

#RUN cat test.txt

CMD java -jar *

