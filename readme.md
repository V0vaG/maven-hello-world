  This project used :
    - Maven as a building tool for the java code
    
    - GitHub us a VCS 
    
    - Docker as a containerization tool
      - For the multi-staging Dockerfile I used the bases:
        - maven:openjdk       - First & Second build stages  (include Maven for the build)
        - openjdk:17-jdk-slim - Second build stage (include Java 17 for running the .jar artifact)
        
    - GitHub Actions us a CI Server
      - I used the GitHub Actions plugins (actions):
        - checkout@v3            - This is an action that checks out your repository onto the runner, allowing you to run scripts or other actions against your code.
        - docker/login-action@v3 - Use this GitHub Action to log in to a private container registry.
        
        
# Ci/CD workflow (Push to the "master" branch at the GitHub Repository triggers the pipeline):
    - Build the Docker image from a multi-stage Dockerfile
        - First stage:
            - Update patch number 1.0.x -> 1.0.(x+1)
        - Second stage: 
            - Build jar artifact from source code
        - Third stage: 
            - Copy only the jar artifact from the first stage
            - Tag the jar artifact with the version number
            - Tdd new user "vavo-kepler"
            - Log in to the new user
            - Run the jar artifact with java
    - Run the Docker image 
    - Login to DockerHub Registery 
    - Commit tags: latest, version numbers 1.0.x
    - Push to DockerHub

# To download and run the image, first you need to install docker.
    - https://www.docker.com/
    
# Link to my DockerHub Repository:
    - https://hub.docker.com/repository/docker/vova0911/hello/general

# To download the image & run the container, Run:
    - docker run vova0911/hello:latest

