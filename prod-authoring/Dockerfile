FROM craftercms/dev-full:update-docker-images

ENV BUILD_ON=201602101530crt

# Download and Install Apache
RUN apt-get update
RUN apt-get install -y --force-yes --no-install-recommends apache2
RUN echo >> /etc/apache2/apache2.conf
RUN a2enmod cgid headers proxy proxy_http proxy_ajp reqtimeout rewrite ssl  socache_shmcb expires
ADD https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb /opt/ext/mod-pagespeed-stable_current_amd64.deb
RUN dpkg -i /opt/ext/mod-pagespeed-stable_current_amd64.deb

# Create Crafter Web Directories
RUN mkdir -p /opt/craftercms/www
RUN mkdir -p /opt/craftercms/logs/
RUN mkdir -p /etc/apache2/sslcerts/

# Replace the Default Apache Configuration
RUN rm /etc/apache2/sites-enabled/000-default.conf
ADD ./config/common-settings /etc/apache2/
ADD ./config/authoringcrafter.conf /etc/apache2/sites-enabled/
ADD ./config/crafterCmsAuthoringSSl.crt /etc/apache2/sslcerts/
ADD ./config/crafterCmsAuthoringSSl.key /etc/apache2/sslcerts/
ADD ./config/deployer/sample-target-context.xml /opt/craftercms/deployer/conf
ADD ./config/deployer/preview-target-context.xml /opt/craftercms/deployer/conf
RUN apachectl configtest

# Expose HTTP Port
EXPOSE 80

# Expose HTTPS Port
EXPOSE 443

VOLUME /etc/apache2/sslcerts/
VOLUME /opt/craftercms/www/
VOLUME /opt/craftercms/logs/

# Add Crafter Startup Script to the Container
ADD ./config/dockerStartup.sh /opt/craftercms
RUN chmod +x dockerStartup.sh

# Add the Tomcat Startup Environment Variables
ADD ./config/setenv.sh  ${CATALINA_HOME}/bin/
RUN chmod +x ${CATALINA_HOME}/bin/setenv.sh

# Execute Crafter Startuo Script on Container Start
CMD ["./dockerStartup.sh"]