#!/bin/bash

cp -v /config-files/* keycloak/standalone/configuration/

exec /opt/jboss/docker-entrypoint.sh $@
