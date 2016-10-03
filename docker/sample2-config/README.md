# Sample 2 

### Build the base image for Sample 1.

### Add OpenIG configuration:
Rename /custom-config/config/routes/01-hello.json.tutorial 
to     /custom-config/config/routes/01-hello.json.  
 
### Build the docker image
docker build -t sample2-config

### Run the docker image
docker run -p 8080:8080 sample2-config

### Test that OpenIG is running on http://openig.example.com:8080/hello. 
A page displaying the "Hello World" statement is displayed.
