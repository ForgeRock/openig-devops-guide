# Sample 2

### Before you start:
Build the base image from the ../sample1_base directory.

### 1. Review and if necessary edit the OpenIG configuration file
in  /custom-config/config/routes/01-hello.json.
 
### 2. From this directory, build the docker image
docker build -t sample2-config .

### 3. Run the docker image
docker run -p 8080:8080 sample2-config

### 4. Test that OpenIG is running on http://openig.example.com:8080/hello. 
A page displaying the "Hello World" statement is displayed.
