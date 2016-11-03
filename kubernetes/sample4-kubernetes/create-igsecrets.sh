#!/usr/bin/env bash
# This creates secrets for the OpenIG ODIC example.
# These secrets will be available to the pod as environment variables.

source env.sh

kubectl delete secret generic ig-secrets

kubectl create secret generic ig-secrets \
      --from-literal=client-id=${CLIENT_ID} \
      --from-literal=client-secret=${CLIENT_SECRET}


kubectl describe secret ig-secrets

