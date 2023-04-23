# k8s-tool
docker image for kubernetes troubleshooting

# Quick Start

## Set Proxy (Optional)

- Allow Connection from LAN
- Set proxy for docker daemon

For docker version equal or higher than 17, set proxy like below.

~/.docker/config.json

~~~
{
 "proxies":
 {
   "default":
   {
     "httpProxy": "http://<VM Route Gateway>:<host port>",
     "httpsProxy": "http://<VM Route Gateway>:<host port>",
     "noProxy": "localhost,127.0.0.1"
   }
 }
}
~~~

For docker version lower than 17, set proxy like below.

/etc/systemd/system/docker.service.d/http-proxy.conf
~~~
[Service]
Environment="HTTP_PROXY=http://<VM Route Gateway>:<host port>/"
Environment="HTTPS_PROXY=http://<VM Route Gateway>:<host port>/"
Environment="NO_PROXY=localhost,127.0.0.1"
~~~

## Switch to Minikube Docker Engine

Point your terminal's docker-cli to the Docker Engine inside minikube

~~~
minikube docker-env
eval $(minikube -p minikube docker-env)
~~~

## Build Docker Image

~~~
cd debug-tool
docker build .
docker tag <image id> debug-tool:v1.0.0
~~~

## Create Debugging Session

create an interactive debugging session in pod named <pod name> with a debug container named <ephemeral container name> and run <command> within debugger container

~~~
kubectl debug <pod name> -c <ephemeral container name, a.k.s utility contianer> --image=debug-tool:v1.0.0 -it -- /bin/bash
~~~

Examples
~~~
kubectl debug prometheus-alertmanager-0 -c debugger --image=debug-tool:v1.0.0 -it -- /bin/bash
~~~

