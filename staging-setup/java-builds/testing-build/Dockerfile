# Dockerfile
FROM amazoncorretto:8-alpine-jdk

# Copy your JAR file into the image and rename it
COPY testing*.jar /app/testing.jar

# Set the command to run the JAR file
CMD ["java", "-jar", "/app/testing.jar"]

# create a docker image

# docker build -t testing-build -f testing-build/Dockerfile .

# if docker file is in my directory

# docker build -t testing-build .


# Run the docker image

# docker run -it --rm testing-build

# export the port to run the docker image

# docker run -it --rm -p 8080:8080 testing-build

# docker tag
#docker tag testing-build helloardanish/testing-build:latest

# docker push
#docker push helloardanish/testing-build:latest
