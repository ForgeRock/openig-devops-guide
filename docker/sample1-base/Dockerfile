# Build this image using docker build -t forgerock/openig-base .
FROM tomcat:8-jre8


ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Default home for OpenIG config. Override this to set a different location
ENV OPENIG_BASE /var/openig
WORKDIR $CATALINA_HOME

# Remove some of the stuff we don't need from tomcat
RUN rm -fr webapps/*

# Note: By default tomcat does NOT listen on 8443. You must add a custom server.xml file to change this
EXPOSE 8080 8443



# If you want to use your own custom IG war file, uncomment these lines
# and comment out the curl command below
#ADD openig.war webapps/ROOT.war
#ADD run-openig.sh /tmp/run-openig.sh

# otherwise, pull down OpenIG from the Maven repo
ENV MVN_REPO=https://maven.forgerock.org/repo/repo/org/forgerock/openig
ENV OPENIG_VERSION=5.0.0-SNAPSHOT

RUN curl $MVN_REPO/openig-war/$OPENIG_VERSION/openig-war-$OPENIG_VERSION.war \
     -o /tmp/openig.war \
 && unzip /tmp/openig.war -d /usr/local/tomcat/webapps/ROOT \
 && rm -f /tmp/*zip


CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
