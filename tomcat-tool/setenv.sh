#!/usr/bin/env bash

CATALINA_OPTS="-Dcom.sun.management.jmxremote.port=8099 -Dcom.sun.management.jmxremote.rmi.port=8099 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.local.only=false -Djava.rmi.server.hostname=127.0.0.1 -Dcom.sun.management.jmxremote.authenticate=true -Dcom.sun.management.jmxremote.password.file=/usr/local/tomcat/conf/jmxremote.password -Dcom.sun.management.jmxremote.access.file=/usr/local/tomcat/conf/jmxremote.access"

