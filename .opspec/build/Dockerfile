FROM ubuntu:16.04

RUN apt-get update && apt-get install gettext wget -y 
RUN wget https://github.com/Azure/acs-engine/releases/download/v0.7.0/acs-engine-v0.7.0-linux-amd64.tar.gz
RUN tar -zxf acs-engine-v0.7.0-linux-amd64.tar.gz acs-engine-v0.7.0-linux-amd64/acs-engine --strip=1
RUN mv acs-engine /usr/local/bin
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | \
     tee /etc/apt/sources.list.d/azure-cli.list
RUN apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893
RUN apt-get install apt-transport-https -y
RUN apt-get update && apt-get install azure-cli -y