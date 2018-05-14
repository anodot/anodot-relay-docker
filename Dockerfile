FROM ubuntu
MAINTAINER Shay Lang "shay@anodot.com"
RUN apt-get update -y
RUN apt-get install nodejs npm -y
RUN npm install anodot-relay -g
ADD ./config.json /opt/
EXPOSE 2003 2004
CMD ["/usr/local/bin/relay", "/opt/config.json"]
