# Sample 2 demonstrating OpenID Connect


### Build the docker image

docker build -t openig-oidc .

### Create Google Credentials

export CLIENT_ID=xxxx
export CLIENT_SECRET=yyyy

###  Put your docker IP address in /etc/hosts

193.45.67.89 openig.test.com


### Run

docker run --env CLIENT_ID="${CLIENT_ID}" --env CLIENT_SECRET="${CLIENT_SECRET}" -it -p 18080:8080 openig-oidc
