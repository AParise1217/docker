#!/usr/bin/env bash

export JAVA_OPTS=" -XX:MaxPermSize=512m \
                    -Xms512m \
                    -Xmx4096m \
                    -XX:-DisableExplicitGC \
                    -Djava.awt.headless=true \
                    -server \
                    -Dcom.sun.management.jmxremote \
                    -XX:+AggressiveOpts \
                    -XX:+OptimizeStringConcat \
                    -XX:MinHeapFreeRatio=40 \
                    -XX:MaxPermSize=128m \
                    -XX:+UseG1GC $JAVA_OPTS"
