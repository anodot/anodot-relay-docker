FROM ubuntu
MAINTAINER Alex SHD "alex@shdlabs.com"
RUN sudo apt-get update -y
RUN sudo apt-get install nodejs nodejs-legacy npm -y
RUN sudo npm install anodot-relay -g
ADD ./config.json /opt/
EXPOSE 2003 2004
CMD ["/usr/local/bin/relay", "/opt/config.json"]
