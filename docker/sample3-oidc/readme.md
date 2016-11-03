# Sample 3 - Deploying OpenIG With OpenID Connect 1.0 in Docker

### Before you start:
* Build the base image from `../sample1-base directory`
* Review the OpenIG configuration file in `/custom-config/config/routes/sample2-oidc.json`

### Running the Sample
1. In https://console.cloud.google.com/apis/credentials, create credentials for an OAuth 2.0 client ID with the following options:
  * Application type: Web application
  * Authorized redirect URI: http://openig.example.com:8080/openid/callback

  A client ID and a client secret are created. Make a note of their values or keep the site open for the next step.

2. Add Google Credentials to the Dockerfile, as indicated in the Dockerfile.

3. Build the docker image:<br>
$ `docker build -t sample3-oidc .`

4. Run the docker image:<br>
$ `docker run -p 8080:8080 sample3-oidc`

5. Test that OpenIG is running on http://openig.example.com:8080/openid.<br>
  Depending on whether you logged out of Google, you might need to authenticate.<br>
  The Google login is used to give you access to the OIDC test page, and you are asked to allow access. The OIDC test page is then displayed.

When you have finished, in the terminal that is running the Docker image press `CTRL-C` to stop the image.
