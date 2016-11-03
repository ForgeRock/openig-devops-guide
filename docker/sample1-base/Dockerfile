# Build the Docker image using the command "docker build -t forgerock/openig-base ."
FROM tomcat:8.5-jre8


ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH


# The default home for OpenIG config. To set a different location, override these values.
ENV OPENIG_BASE /var/openig
WORKDIR $CATALINA_HOME


# Remove unecessary information from Tomcat
RUN rm -fr webapps/*


# Note: By default Tomcat does NOT listen on 8443. Add a custom server.xml file to change this.
EXPOSE 8080 8443


# To use your own custom IG war file, uncomment the following line and comment out the curl command below
#ADD openig.war webapps/ROOT.war


# Alternatively, pull OpenIG from the Maven repo
ENV MVN_REPO=https://maven.forgerock.org/repo/repo/org/forgerock/openig
ENV OPENIG_VERSION=5.0.0-SNAPSHOT


RUN curl $MVN_REPO/openig-war/$OPENIG_VERSION/openig-war-$OPENIG_VERSION.war \
     -o /tmp/openig.war \
 && unzip /tmp/openig.war -d /usr/local/tomcat/webapps/ROOT \
 && rm -f /tmp/*zip
