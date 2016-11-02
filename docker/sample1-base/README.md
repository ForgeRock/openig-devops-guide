The sample in this directory deploys the latest snapshot of OpenIG with Docker.

Before you start:
  <li>Read and follow the instructions in Chapter 1, "Before You Start" of the Deployment Guide. You should have Docker installed, the sample files downloaded, and the network configured.</li>
  <li>Make sure that port 8080 is not being used.</li>
  <li>Start Docker or make sure it is running.</li>

  1. Run the Docker instruction to build a Docker image called <i>forgerock/openig-base</i>:<br>
    $ docker build -t forgerock/openig-base .

  2. Check that the Forgerock base image is built:<br>
    $ docker images<br>

  3. Run the Docker image on port 8080:<br>
    $ docker run -p 8080:8080 forgerock/openig-base
  
  4. Go to http://openig.example.com:8080 to view the OpenIG welcome page and confirm that your OpenIG image is running.
  
  5. In the terminal that is running the Docker image, press CTRL-C to stop the image.

