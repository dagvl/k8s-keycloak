FROM jboss/keycloak-ha-postgres:3.1.0.Final

MAINTAINER Dag Viggo Lokoeen <dag.viggo@lokoen.org>

USER root
RUN mkdir /config-files

ADD run.sh /opt/jboss/
ADD https://s3.eu-central-1.amazonaws.com/vimondops-files/vimond-keycloak-spi/vimond-spi-1.0-SNAPSHOT.jar /opt/jboss/keycloak/standalone/deployments/
RUN chmod a+x /opt/jboss/run.sh \
    && chown jboss:jboss /opt/jboss/keycloak/standalone/deployments/vimond-spi-1.0-SNAPSHOT.jar  && \
    touch /config-files/dummy
USER jboss



ENTRYPOINT [ "/opt/jboss/run.sh" ]

