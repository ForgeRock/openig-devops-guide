# OpenIG on Kubernetes 

This sample demonstrates OpenIG running on Kubernetes, and is tested on minikube.

The sample deploys OpenIG and a sample application to demonstrate the following OpenIG features:
* Password replay to the sample application
* OpenID connect integration with Google 
* OpenIG throttling 

# Software Versions
This sample is tested on the following software:
* Docker 1.12
* minikube 0.12.2
* kubectl / kubernetes 1.4.3


# Before You Start
1. Install the software required for this sample:
    * docker client
    * minikube.  See https://github.com/kubernetes/minikube 
    * kubectl.  On Mac OS you can install with homebrew
    
    For information, see 'Install Software' on
    https://wikis.forgerock.org/confluence/display/DC/Setting+up+a+Desktop+Kubernetes+Environment+using+minikube

2. Initialize your cluster
    * Make sure minikube is running successfully. Try some of the Kubernetes examples before proceeding.
    * If you are using docker locally, shut it down. You want to use minikube's docker
    * Run  ```eval $(minikube docker-env)``` to connect your docker client to minikube
    * Run ```minikube ip``` to get the IP of the minikube VM
    * Add the IP to `/etc/hosts`:  ```xx.xx.xx.xx openig.test.com```  (where xx is the IP from the previous step)
  
    For information, see 'Set Up Minikube' on  
    https://wikis.forgerock.org/confluence/display/DC/Setting+up+a+Desktop+Kubernetes+Environment+using+minikube
    
3. Check that the `forgerock/openig-base` image is available:<br>
    $ `docker images`

    If the forgerock/openig-base image is not listed in the repositories,
    build the image as described in `../docker/sample1-base`.
    
    If you previously used the docker machine instead of minikube you might  
    need to build the images again because you are using a different docker environment.
    
4. Make a note of the Client ID and Client Secret you created in `../docker/sample3-oidc`, or create new values.    

5. Create an Ingress controller for minikube.<br>
   
    An Ingress controller is not mandatory but makes it easier to create the callback URL for OpenID Connect.
  
    Track this issue https://github.com/kubernetes/minikube/issues/611 for an update on when the Ingres controller
    will come out of the box on minikube


# Build the Docker Image for This Sample:
1. Run the following command from this directory:<br>
    $ `./build.sh`

2. Make sure the image is built:<br>
    $ `docker images`

    The `openig-k8s-sample1` image should be listed in the repositories.


# Create Secrets for OpenID Connect
Secrets are used in the Kubernetes sample to demonstrate OpenID Connect client and the use of keystore sign JWT session cookies.

1. Copy `env.sh.template` to  `env.sh`, and replace `<your-client-ID>` and `<your-client-secret>` with the values you created in `../docker/sample3-oidc`.

2. Create keystore secrets:<br>
    $ `./create-ig-keystore-secret.sh`

3. Create OpenIG secrets:<br>
    $ `./create-igsecrets.sh`



# Deploy the Example
1. Create the deployment for OpenIG:<br>
 $ `kubectl create -f openig.yaml`

2. Create services to expose OpenIG inside the cluster:<br>
 $ `kubectl create -f service.yaml`

3. Use Ingress to expose OpenIG outside of minikube:<br>
 $ `kubectl create -f ingress.yaml`<br>
 If you do not have an ingress controller, this command wont do anything.

4. Deploy the sample application:<br>
 $ `kubectl create -f sample-app.yaml`



# View the application
1. View the status of the deployed applications:<br>
    $ `minikube dashboard`

2. In the dashboard, make sure you can see lines for openig and sample-app in the deployments, replica sets, and pods.

3. Access the application at http://openig.test.com.


# Notes

Finding and Using the IP Address of Minikube
---
The IP address of minikube needs to be in your `/etc/hosts`. The sample assumes a fake FQDN of openig.test.com. You
can get the IP address by running ```minikube ip```.

For example, `192.168.3.20  openig.test.com`.


Viewing the Application Without an Ingress Controller
---
If you have an Ingress controller, you can view the application at http://openig.test.com.

If you don't have an Ingress controller you will need to find the nodeport of OpenIG:
$ `kubectl describe svc openig`.

You can then use that ip: http://openig.test.com:30345/

For the OpenID connect example, you need to modify the call back URL in the Google developer
console to match the node port above. For example, register http://openig.test.com:30345/openid/callback

If you are using minikube, you can find the IP and port of service by using the service sub-command. For example,
`minikube service openig`.
