---
sidebar_position: 10
---

# docker

### Pull and Push Images

COMMAND | DESCRIPTION
---|---
`docker login` | Login to a registry
`docker logout` | Logout from a registry
`docker images` | List all local images
`docker pull REPO:[TAG]` | pull an image/repo from a registry
`docker inspect IMAGE` | Show information (json formatted)
`docker tag IMAGE TAG` | Tag an image
`docker push REPO:[TAG]` | push and image/repo to a registry
`docker rmi IMAGE` | Delete images

``` bash
...
> cat pass.txt | docker login -u 'user-name'  "registry.us-east-2.network" --password-stdin

or after configuring aws access

> aws sso login
> aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 780300....dkr.ecr.us-east-2.amazonaws.com
...
> docker tag other/service:develop mypersonalrepo/service:latest
> docker push mypersonalrepo/service:latest
```

### Run Containers

COMMAND | DESCRIPTION
---|---
`docker run -d IMAGE` | Start a new container (-d detach) from the image. If not present, it will download it
`docker run --name CONTAINER_NAME IMAGE` | Start a new container and set a name
`docker run -p HOSTPORT:CONTAINERPORT IMAGE` | Start a new container with mapped ports
`docker run -P IMAGE` | Start a new container and map all ports

### Inspect Containers

COMMAND | DESCRIPTION
---|---
`docker ps -a` | List all containers, including stopped
`docker stats` | Show statistics of all containers
`docker logs -f --tail 100 CONTAINER` | Follow a container output (last 100 lines)
`docker-compose logs -f eth1 2>>&1 / tee eth1.log` | Follow service `eth1` and write it into a log
`docker top CONTAINER` | List the processes running in a container
`docker diff` | Show the differences with the image (modified files)
`docker inspect` | Show information of a container (json formatted)
`docker inspect -f '{{ json .Config.Env }}' container_name` | Show specific variable

### Interact with Containers

COMMAND | DESCRIPTION
---|---
`docker exec -it CONTAINER /bin/bash` | Open an interactive shell inside a container
`docker cp CONTAINER:PATH HOSTPATH` | Copy files from the container
`docker cp HOSTPATH CONTAINER:PATH` | Copy files into the container
`docker attach CONTAINER` | Attach to a container
`docker run --entrypoint="" -it IMAGE sh` | Enter to container when there are multiples services at different entrypoints

### Stop Containers

COMMAND | DESCRIPTION
---|---
`docker stop CONTAINER` | Graceful stop a container
`docker kill CONTAINER` | Kill (SIGKILL) a container
`docker restart CONTAINER` | Graceful stop and restart a container
`docker rm CONTAINER` | Destroy a container

### Clean up

COMMAND | DESCRIPTION
---|---
`docker kill $(docker ps -a -q)` | To kill all running and stopped containers
`docker rm $(docker ps -q -f status=exited)`| To remove the containers
`docker system prune -a` | To delete all used and unused images
`docker system prune --volumes` | To delete all docker volumes
`docker system prune` | To delete all dangling and unused images, containers, cache and volumes
`sudo ln -s ~$USER/.rd/docker.sock /var/run/docker.sock` | To reset docker service

### Volumes

COMMAND | DESCRIPTION
---|---
`docker volume ls` | List all volumes
`docker volume create VOLUME` | Create a volume
`docker volume inspect VOLUME` | Show information (json formatted)
`docker volume rm VOLUME` | Destroy a volume
`docker volume ls --filter="dangling=true"` | List all dangling volumes (not referenced by any container)
`docker volume prune` | Delete all volumes (not referenced by any container)

``` bash
> docker volume create <volume_name>    
> docker run -d --name <container_name> —mount src=<volume_name>, dst= <container_data_path> <image_name>
```

### Networks

COMMAND | DESCRIPTION
---|---
`docker network create --attachable <network_name>` | To create a network and allow other containers to join

### Dockerfile

``` Dockerfile

FROM registry/library/ubuntu:focal-20221130  

# Install node16
RUN apt-get update && apt-get install -y curl && \
curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
apt-get install -y nodejs unzip  

# Set working directory
WORKDIR /opt/app  

# Install the project dependencies
COPY package*.json tsconfig.json ./  

RUN npm install -g ts-node && \
npm install -g typescript && \
npm ci --only=production  

# Remove useless files from the current layer
RUN rm -rf /var/lib/apt/lists/* && \
rm -rf /var/lib/apt/lists.d/* && \
apt-get autoremove && \
apt-get clean && \
apt-get autoclean && \
npm cache clean --force  

# Install playwright chromium dependencies
RUN npx playwright install --with-deps chromium  

# Copy repository files
COPY . . 

CMD ["sh", "-c", "/usr/bin/npm run test:all"]

```

`> docker build -t image_name:tag_version . (context '.' the current path)`

:::info
CMD is the PID 0, so when it finished the container exits automatically
:::

### RancherDesktop notes

If problems when using RancherDesktop:

``` bash
(> mv docker services/docker)
> docker -v
> docker info
> ...
> sudo ln -s ~$USER/.rd/docker.sock /var/run/docker.sock
```
