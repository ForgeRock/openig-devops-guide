FROM forgerock/openig-base:latest

#  Replace <your-client-ID> and <your-client-secret> with your own values.
ENV CLIENT_ID     <your-client-ID>
ENV CLIENT_SECRET <your-client-secret>
#  These environment variables are referenced in the openid.json config file.
#  To override these values, pass them as environment variables in the docker run command.

ADD custom-config /var/openig
