FROM craftercms/prod-authoring:update-docker-images

ENV BUILD_ON=201602111545crt

# Cleanup base image
RUN rm /etc/apache2/sites-enabled/*
RUN rm /etc/apache2/sslcerts/*
RUN rm ${CATALINA_HOME}/webapps/studio.war
RUN rm -rf ${CATALINA_HOME}/shared/classes/crafter/cstudio
RUN rm ${CATALINA_HOME}/shared/classes/crafter/engine/extension/*

# Add Crafter Engine Configuration
ADD ./config/engine/server-config.properties ${CATALINA_HOME}/shared/classes/crafter/engine/extension/
ADD ./config/engine/rendering-context.xml ${CATALINA_HOME}/shared/classes/crafter/engine/extension/
ADD ./config/engine/services-context.xml ${CATALINA_HOME}/shared/classes/crafter/engine/extension/

# Add Crafter Deployer Configuration
ADD ./config/deployer/sample-target-context.xml /opt/craftercms/deployer/conf
ADD ./config/deployer/preview-target-context.xml /opt/craftercms/deployer/conf

# Replace the Default Apache Configuration
RUN a2enmod expires
RUN adduser www-data root
ADD ./config/common-settings /etc/apache2/
ADD ./config/common-security /etc/apache2/
ADD ./config/common-mounts /etc/apache2/
ADD ./config/crafterCmsDeliverySSl.crt /etc/apache2/sslcerts/
ADD ./config/crafterCmsDeliverySSl.key /etc/apache2/sslcerts/
ADD ./config/deliveryCrafter.conf /etc/apache2/sites-enabled/

RUN apachectl configtest