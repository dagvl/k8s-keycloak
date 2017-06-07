FROM jboss/keycloak-ha-postgres:3.1.0.Final

MAINTAINER Dag Viggo Lokoeen <dag.viggo@lokoen.org>

USER root
RUN mkdir /config-files

ADD run.sh /opt/jboss/
RUN chmod a+x /opt/jboss/run.sh && touch /config-files/dummy
USER jboss


ENTRYPOINT [ "/opt/jboss/run.sh" ]

