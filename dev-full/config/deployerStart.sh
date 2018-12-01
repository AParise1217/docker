#!/bin/bash

# Validate Environment Variables are set properly
if [ -z "${JAVA_HOME}" ]; then
    echo "'JAVA_HOME' environment variable was not set. Please check your Dockerfile to verify it was properly configured."
    exit 1
fi
if [ -z "${DEPLOYER_HOME}" ]; then
    echo "'DEPLOYER_HOME' environment variable was not set. Please check your Dockerfile to verify it was properly configured."
    exit 1
fi

/usr/bin/jsvc -home ${JAVA_HOME} -server -outfile ${DEPLOYER_HOME}/std.out -errfile err.out  -cp ${DEPLOYER_HOME}/conf:/${DEPLOYER_HOME} -cwd ${DEPLOYER_HOME} -pidfile ${DEPLOYER_HOME}/deployer.pid -Djava.ext.dirs=${DEPLOYER_HOME} org.craftercms.cstudio.publishing.PublishingReceiverMainDeamon
