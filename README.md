anodot-relay-docker
===================

Anodot graphite relay service - Docker 

### Usage

#### Git

- Clone the repo
- Add the Anodot token to the `config.json`  
- `docker build -t anodot .`
- `docker run -d -p 2003:2003 -p 2004:2004 -t anodot`

#### [Docker Hub](https://registry.hub.docker.com/u/alexshd/anodot-relay/) 

##### Dockerfile
```
FROM alexshd/anodot-relay 
ADD ./config.json /opt/
EXPOSE 2003 2004
CMD ["/usr/local/bin/relay", "/opt/config.json"]
```

##### config.json
```
{
    "url": "https://api.anodot.com",
    "token": "<YOUR ANODOT SERVISE TOKEN>",
    "log": "error",
    "showStats": false,
    "plainPort": 2003,
    "picklePort": 2004,
    "flushInterval": 5000
}
```

##### Using the service 
- Get the token from anodot
- Make a directory with the `config.json` and `Dockerfile`
- Add the token to `config.json` 
-  `docker build -t anodot .` 
- `docker run -d -p 2003:2003 -p 2004:2004 -t anodot`
- Start sending your graphite metrics to the Anodot service...
