#!/bin/bash

cp -v /config-files/* keycloak/standalone/configuration/

exec /opt/jboss/docker-entrypoint.sh -b 0.0.0.0 --server-config standalone-ha.xml
