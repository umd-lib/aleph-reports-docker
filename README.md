# aleph-reports-docker

This repository includes the dockerfile as well as th encessary application files for creating the docker image for the Aleph Reports application.

To build the docker file for the Ezcfg application in k8s, run the following docker command:

docker build -t docker.lib.umd.edu/aleph-reports:<tag> . --platform linux/amd64

Make sure you have the "build" namespace.
