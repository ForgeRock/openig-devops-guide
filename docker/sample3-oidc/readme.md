# Sample 3 - Deploying OpenIG With OpenID Connect 1.0 in Docker

### Before you start:
* Build the base image from `../sample1_base directory`
* Review the OpenIG configuration file in `/custom-config/config/routes/sample2-oidc.json`

### Running the Sample
1. Create Google Credentials:<br>
`export CLIENT_ID=xxxx`
`export CLIENT_SECRET=yyyy`

2. Add Google Credentials to the Dockerfile.

3. Build the docker image:<br>
$ `docker build -t sample2-oidc .`

4. Run the docker image:<br>
$ `docker run -p 8080:8080 sample2-oidc`

5. Test that OpenIG is running on http://openig.example.com:8080/openid.
The Google account page is displayed.
The OpenIG OIDC Test Page is displayed, showing user information and the hostname.

When you have finished, in the terminal that is running the Docker image press `CTRL-C` to stop the image.
