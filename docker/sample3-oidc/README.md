# Sample 3

### Before you start:
Build the base image from the ../sample1_base directory.

### 1. Create Google Credentials
export CLIENT_ID=xxxx
export CLIENT_SECRET=yyyy

### 2. Add Google Credentials to the Dockerfile

### 3. Review and if necessary edit the OpenIG configuration file
in  /custom-config/config/routes/sample2-oidc.json.

### 4. From this directory, build the docker image
docker build -t sample2-oidc .

### 5. Run the docker image
docker run -p 8080:8080 sample2-oidc

### 6. Test that OpenIG is running on http://openig.example.com:8080/openid.
The Google account page is displayed.
The OpenIG OIDC Test Page is displayed, showing user information and the hostname.


