FROM daggerok/jboss-eap-7.2
USER root
RUN mkdir -p /opt/jboss
ADD ./jboss-eap-7.2.0.zip /opt/jboss
WORKDIR /opt/jboss
RUN unzip ./jboss-eap-7.2.0.zip
ENV JBOSS_HOME /opt/jboss/jboss-eap-7.2
RUN $JBOSS_HOME/bin/add-user.sh admin redhat123 --silent
EXPOSE 8080 9990 9999
CMD ["$JBOSS_HOME/bin/standalone.sh", "-Djboss.bind.address.management=0.0.0.0", "-Djboss.bind.address=0.0.0.0"]
