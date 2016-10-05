FROM forgerock/openig-base:latest


# Put your Google Client id / secret here
# These env vars are referenced in the 07-openid.json config file
# You can override these if you wish by passing env vars in the docker run command
ENV CLIENT_ID    your-client-id
ENV CLIENT_SECRET your-secret

ADD custom-config /var/openig
