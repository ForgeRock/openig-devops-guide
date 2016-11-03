# Build the Docker image using the forgerock/openig-base image created in sample1-base.
FROM forgerock/openig-base:latest

#  Replace <your-client-ID> and <your-client-secret> with your own values.
ENV CLIENT_ID     <your-client-ID>
ENV CLIENT_SECRET <your-client-secret>
#  These environment variables are referenced in the openid.json config file.
#  To override these values, pass them as environment variables in the docker run command.

# Add OpenIG configuration from /var/openig.
ADD custom-config /var/openig
