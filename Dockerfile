FROM eclipse-temurin:21-jdk as base
ENV CATALINA_HOME=/opt/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH
ENV TOMCAT_VERSION=10.1.43
RUN mkdir -p $CATALINA_HOME \
&& curl -fsSL https://downloads.apache.org/tomcat/tomcat-10/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz \
   | tar -xz -C $CATALINA_HOME --strip-components=1 \
&& rm -rf $CATALINA_HOME/webapps/*
COPY ROOT.war $CATALINA_HOME/webapps/ROOT.war
COPY powerbi.war $CATALINA_HOME/webapps/powerbi.war
EXPOSE 8080
CMD ["catalina.sh", "run"]

