# Sample 2 - Deploying OpenIG With a Basic Configuration in Docker

### Before you start:
*Build the base image from the ../sample1_base directory.<br>
*Review the OpenIG configuration file in `/custom-config/config/routes/01-hello.json`
  
### 1. From this directory, build the docker image
$ `docker build -t sample2-config .`

### 2. Run the docker image
$ `docker run -p 8080:8080 sample2-config`

### 3. Test that OpenIG is running on http://openig.example.com:8080/hello. 
A page displaying the "Hello World" statement is displayed.
### 4. In the terminal that is running the Docker image, press `CTRL-C` to stop the image.
