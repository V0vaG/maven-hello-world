# Hello, my name is Vladimir Glayzer
    At this project used :
    - Maven as a building tool for the java code
    
    - GitHub us a VCS 
    
    - Docker as a containerization tool
      - For the multi-staging Dockerfile I used the bases:
        - maven:openjdk       - First build stage  (include Maven for the build)
        - openjdk:17-jdk-slim - Second build stage (include Java 17 for running the .jar artifact)
        
    - GitHub Actions us a CI Server
      - I used the GitHub Actions plugins (actions):
        - checkout@v3            - This is an action that checks out your repository onto the runner, allowing you to run scripts or other actions against your code.
        - docker/login-action@v3 - Use this GitHub Action to log in to a private container registry.
        
# Ci/CD workflow (Push to the "master" branche at the GitHub Repository trigers the pipeline):
    - Update patch number 1.0.x -> 1.0.(x+1)
    - Build the Docker image from multy-stage Dockerfile
        - First stage: 
            - Build jar artifact from sorce code
        - Second stage: 
            - Copy only the jar artifact from the first stage
            - Tag thr jar artifact with the version number
            - Tdd new user "vavo-kepler"
            - Log-in to the new user
            - Run the jar artifact with java
            
    - Run the Docker image 
    - Login to DockerHub Registery 
    - Commit tags: latest, version numbers 1.0.x
    - Push to DockerHub

# To download and run the image, first you need to instal docker (https://docs.docker.com/engine/install/ubuntu/):

- Add Docker's official GPG key:
    - sudo apt-get update
    - sudo apt-get install ca-certificates curl
    - sudo install -m 0755 -d /etc/apt/keyrings
    - sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    - sudo chmod a+r /etc/apt/keyrings/docker.asc

- Add the repository to Apt sources:
    - echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    - sudo apt-get update

- To install the latest version, run:
    - sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    
# Link to my DockerHub Repository:
    - https://hub.docker.com/repository/docker/vova0911/hello/general

# To download the image & run the container, Run:
    - docker run vova0911/hello:latest

