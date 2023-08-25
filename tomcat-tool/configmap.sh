#!/bin/bash

kubectl create configmap tomcat-server-cust-config --from-file=./server.xml
