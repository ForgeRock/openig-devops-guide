# OpenIG Sample on Kubernetes 

This sample demonstrates OpenIG running on Kubernetes. It has been
tested on minikube. 

The sample deploys OpenIG and a sample application. It is configured 
to demonstrate a few OpenIG features, including:

* password replay to the sample application
* OpenID connect integration with Google 
* OpenIG throttling 

# Preparing 

You must have a Kubernetes environment running and the kubectl
client connected to your cluster.  A Kubernetes ingress should
also be created in order to easily demonstrate OpendID connect.
This is not mandatory, but will make it easier to create the
callback URL for OpenID connect.

# Building the docker image:

The image requires the base image that you built as part of the docker
tutorial.  If you have not built that image, do so now:

```
docker build -t forgerock/openig-base ../docker/sample1-base
```

To build the image for this demo:


```
./build.sh
```

# Creating  secrets 

The sample demonstrates using Kubernetes secrets for the OpenID Connect 
client credentials, and for the keystore used by OpenIG to sign JWT
signing keys. This is a best practice. 

There are two shell scripts provided that will create the 
secrets needed for the demo. 

Take the OpenID connect credentials that you created for the 
docker demo, and put them in a file named env.sh

```

CLIENT_ID=your_google_client_id
CLIENT_SECRET=your_google_client_secret


```

Run the following:

```
./create-ig-keystore.secret.sh
./create-igsecrets.sh
```


# Deploy the example


```
kubectl create -f openig.yaml
kubectl create -f service.yaml
kubectl create -f ingress.yaml
kubectl create -f sample-app.yaml
```

# View the application

Run ```minikube dashboard``` to view the status of the deployed 
applications. 


The IP address minikube should be put in /etc/hosts. You 
can get the IP address by running ```minikube ip```

```
192.168.3.20  openig.test.com
```

If you have an ingress controller, you can view the application
at http://openig.test.com 

If you do not have an ingress controller you will need to find the
nodeport of openig:

```
kubectl describe svc openig 
```


You can then use that ip:

http://openig.test.com:30345/ 

Note that in the case of the OpenID connect example you will
need to modify the call back url in the Google developer console
to match the nodeport above.  For example, register
http://openig.test.com:30345/openid/callback 










