# Sample 2 - Deploying IG With a Basic Configuration in Docker

### Before you start:
* Build the base image from the `../sample1_base` directory.<br>
* Review the IG configuration file in `/custom-config/config/routes/01-hello.json`.
  
### Running the Sample

1. From the `sample2-config` directory, build the docker image:<br>
$ `docker build -t sample2-config .`

2. Run the docker image:<br>
$ `docker run -p 8080:8080 sample2-config`

3. Test that IG is running on http://openig.example.com:8080/hello.<br> 
A page displaying the "Hello World" statement is displayed.

When you have finished, in the terminal that is running the Docker image press `CTRL-C` to stop the image.
