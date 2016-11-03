#!/bin/bash
# Creates a keystore that is used by OpenIG for jwt session signing.
# Multiple OpenIG can share the same keystore by mounting it on each pod

rm -f /tmp/keystore.jks
keytool -genkeypair -alias ig-jwt-keypair -storepass changeit -storetype jks \
	-keystore /tmp/keystore.jks -keyalg  RSA \
	 -dname "CN=Mickey Mouse, OU=Acme, O=Acme, L=Calgary, ST=AB, C=CA" -keypass changeit 

keytool -list -keystore /tmp/keystore.jks -storepass changeit -v


kubectl delete secret ig-keystore

kubectl create secret generic ig-keystore --from-file=/tmp/keystore.jks


