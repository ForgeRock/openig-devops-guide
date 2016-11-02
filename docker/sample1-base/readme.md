# Sample 1 - Deploying an OpenIG Base Image in Docker

### Before you start:
*Read and follow the instructions in Chapter 1, <i>Before You Start</i> of the Deployment Guide. You should have Docker installed, the sample files downloaded, and the network configured.<br>
*Make sure that port 8080 is not being used.<br>
*Start Docker or make sure it is running.

### 1. Run the Docker instruction to build a Docker image called `forgerock/openig-base`:
$ `docker build -t forgerock/openig-base .`
 
### 2. Check that the Forgerock base image is built:
$ `docker images`

### 3. Run the docker image
$ `docker run -p 8080:8080 forgerock/openig-base`

### 4. Test that OpenIG is running on http://openig.example.com:8080. 
The OpenIG welcome page of is displayed. 
  
### 5. In the terminal that is running the Docker image, press `CTRL-C` to stop the image.

