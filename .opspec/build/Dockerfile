FROM ubuntu:16.04

RUN apt-get update && apt-get install gettext wget -y 
RUN wget https://github.com/Azure/acs-engine/releases/download/v0.7.0/acs-engine-v0.7.0-linux-amd64.tar.gz
RUN tar -zxf acs-engine-v0.7.0-linux-amd64.tar.gz acs-engine-v0.7.0-linux-amd64/acs-engine --strip=1
RUN mv acs-engine /usr/local/bin