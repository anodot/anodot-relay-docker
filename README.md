anodot-relay-docker
===================

Anodot graphite relay service - Docker  

### Usage

#### Git

- Clone the repo
- Add the Anodot token to the `config.json`  
- `docker build -t anodot .`
- `docker run -d -p 2003:2003 -p 2004:2004 -t anodot`

#### [Docker Hub](https://hub.docker.com/r/anodot/anodot-relay/) 

##### Dockerfile
```
FROM anodot/anodot-relay 
ADD ./config.json /opt/
EXPOSE 2003 2004
CMD ["/usr/local/bin/relay", "/opt/config.json"]
```

##### config.json
```

{
    "url": "https://api.anodot.com",
    "token": "<YOUR API TOKEN>",
    "log": "error",
    "showStats": false,
    "sendStats": true,
    "plainPort": 2003,
    "picklePort": 2004,
    "flushInterval": 5000,
    "metricBlacklist": "",
    "metricWhitelist": "",
    "metricRewrite": [],
    "metricPrefix": "",
    "metricCounter":"",
    "maxConnections": 100,
    "sortBeforeSend": false
}


```

for more details about config.json refer to https://www.npmjs.org/package/anodot-relay

##### Using the service 
- Get the token from anodot
- Make a directory with the `config.json` and `Dockerfile`
- Add the token to `config.json` 
-  `docker build -t anodot .` 
- `docker run -d -p 2003:2003 -p 2004:2004 -t anodot`
- Start sending your graphite metrics to the Anodot service...
