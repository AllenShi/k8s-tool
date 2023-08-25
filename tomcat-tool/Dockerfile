FROM alpine:latest as unzipper
RUN apk add unzip 
COPY arthas-bin.zip /tmp/
RUN mkdir -p /opt/tools/arthas && unzip /tmp/arthas-bin.zip -d /opt/tools/arthas/ && rm /tmp/arthas-bin.zip
COPY setenv.sh /tmp/
RUN chmod 755 /tmp/setenv.sh
COPY jmxremote.access /tmp/
COPY jmxremote.password /tmp/
RUN mkdir -p /usr/local/tomcat/conf && chmod 600 /tmp/jmxremote.*  && cp -r /tmp/jmxremote.* /usr/local/tomcat/conf/ && rm /tmp/jmxremote.*


FROM tomcat:9.0
MAINTAINER allenshi

COPY sample.war /usr/local/tomcat/webapps/
COPY --from=unzipper /tmp/setenv.sh /usr/local/tomcat/bin/
COPY --from=unzipper /usr/local/tomcat/conf/ /usr/local/tomcat/conf/
COPY --from=unzipper /opt/ /opt/
RUN apt update && apt install -y \
    strace net-tools netcat dnsutils ethtool lsof \
    linux-tools-generic tcpdump \
    && rm -rf /var/lib/apt/lists/*
