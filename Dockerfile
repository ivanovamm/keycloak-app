FROM jboss/wildfly

ADD --chown=jboss:jboss "https://github.com/keycloak/keycloak/releases/download/15.0.1/keycloak-oidc-wildfly-adapter-15.0.1.tar.gz" ${JBOSS_HOME}

RUN tar xvf ${JBOSS_HOME}/keycloak-wildfly-adapter-dist-11.0.3.tar.gz -C ${JBOSS_HOME}
RUN rm -rf ${JBOSS_HOME}/keycloak-wildfly-adapter-dist-11.0.3.tar.gz
RUN chown jboss ${JBOSS_HOME} -R
RUN ${JBOSS_HOME}/bin/jboss-cli.sh --file=${JBOSS_HOME}/bin/adapter-elytron-install-offline.cli

RUN rm -rf ${JBOSS_HOME}/standalone/configuration/standalone_xml_history