# OpenIG on Kubernetes 

This sample demonstrates OpenIG running on Kubernetes, and is tested on minikube.

The sample deploys OpenIG and a sample application to demonstrate the following OpenIG features:
* Password replay to the sample application
* OpenID connect integration with Google 
* OpenIG throttling 


# Before You Start
    1. Make sure that you have built the OpenIG base image described in ../docker/sample1-base:
        $ docker images

       If the forgerock/openig-base image is not listed in the repositories,
       build the image as described in ../docker/sample1-base.

    2. Install the software required for this sample:
        * VirtualBox
        * minikube
        * kubectl

    3. Initialize your cluster

    Warren>>>Should we add specific info here rather than a link, in these steps:
    Warren>>>1. Shut down docker running locally
    Warren>>>2. Init the virtual machine
    Warren>>>3. Set env var for minikube
    Warren>>>4. Find IP of minikube and add to /etc/hosts
    Warren>>>5. test, kubectl get pods --all-namespaces

    For information about how to install the software and initialize your cluster, see
    https://wikis.forgerock.org/confluence/display/DC/Setting+up+a+Desktop+Kubernetes+Environment+using+minikube

    4. Create an ingress controller for minikube:
        $ create-ingress.sh.
       Ingress is not mandatory but makes it easier to create the callback URL for OpenID connect.

    Warren>>> Consider adding the script to create the ingress controller. It is not here but is in the other repo for kubernetes.


# Build the Docker Image for This Sample:
    1. Run the following command from this directory:
        ./build.sh

    2. Make sure the image is built:
        $ docker images

       The openig-k8s-sample1 image should be listed in the repositories.


# Create Secrets for OpenID Connect
Secrets are used in the Kubernetes sample to demonstrate OpenID Connect client and the use of keystore sign JWT session cookies.

    1. In env.sh, replace <your-client-ID> and <your-client-secret> with the
       values you created in ../docker/sample3-oidc.

    2. Create keystore secrets:
        $ ./create-ig-keystore-secret.sh

    3. Create OpenIG secrets:
        $ ./create-igsecrets.sh

    Warren>>>>Pls confirm that is what these scripts are doing. The files are not commented.


# Deploy the Example
    1. Run kubectl create -f openig.yaml
    2. Run kubectl create -f service.yaml
    3. kubectl create -f ingress.yaml
    4. kubectl create -f sample-app.yaml

    Warren>>>Consider adding a note for each of the above commands to say what it is doing.
             The yaml files are not commented.

# View the application
    1. View the status of the deployed applications:
        $ minikube dashboard

    2. In the dashboard, make sure you can see lines for openig and
       sample-app in the deployments, replica sets, and pods.

    3. Access the application at http://openig.test.com.




Notes:

Finding and Using the IP Address of Minikube
---

The IP address of minikube needs to be in your /etc/hosts. The sample assumes a fake FQDN of openig.test.com. You
can get the IP address by running ```minikube ip```.

For example:
    ```
    192.168.3.20  openig.test.com
    ```.


Viewing the Application Without an Ingress Controller
---
If you have an ingress controller, you can view the application at http://openig.test.com

If you do not have an ingress controller you will need to find the nodeport of openig:
    ```
    kubectl describe svc openig
    ```.

You can then use that ip: http://openig.test.com:30345/

Note that in the case of the OpenID connect example you will need to modify the call back url in the Google developer
console to match the nodeport above.  For example, register http://openig.test.com:30345/openid/callback

If you are using minikube, you can also find the IP and port of service by using the service sub-command. For example:
    ```
    minikube service openig
    ```.