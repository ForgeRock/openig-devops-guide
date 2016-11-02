# Sample 3 - Deploying OpenIG With OpenID Connect 1.0 in Docker

### Before you start:
*Build the base image from the ../sample1_base directory<br>
*Review the OpenIG configuration file in `/custom-config/config/routes/sample2-oidc.json`

### 1. Create Google Credentials.
`export CLIENT_ID=xxxx`
`export CLIENT_SECRET=yyyy`

### 2. Add Google Credentials to the Dockerfile.

### 3. Build the docker image.
$ `docker build -t sample2-oidc .`

### 4. Run the docker image.
$ `docker run -p 8080:8080 sample2-oidc`

### 5. Test that OpenIG is running on http://openig.example.com:8080/openid.
The Google account page is displayed.
The OpenIG OIDC Test Page is displayed, showing user information and the hostname.

### 6. In the terminal that is running the Docker image, press `CTRL-C` to stop the image.
