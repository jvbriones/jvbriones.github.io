---
sidebar_position: 20
---

# docker-compose

### Alias

- alias **dc**="docker-compose"
- alias **dc-u**="docker-compose up --build --force-recreate --no-deps -d"
- alias **dc-d**="docker-compose down --remove-orphans --volumes"

### Top Commands

COMMAND | DESCRIPTION
---|---
`docker-compose ps` | List status of all services
`docker-compose up -d` | Start all the services
`docker-compose stop <service-name>` | Stop service
`docker-compose logs -f <service-name>` | Follow the service logs
`docker-compose exec <service-name> bash` | Open bash inside service

:::info
Commands are relative to a corresponding _docker-compose.yml_ file
:::

``` bash
To use a base .yml and an extended one:
> docker-compose -f docker-compose.yml -f docker-compose-2.yml up -d

To get logs:
> docker-compose -f docker-compose.yml -f docker-compose-mvi-2.yml logs -f
```

### Volumes

Volumes are stored by default in `/var/lib/docker/volumes`.

``` yaml
volumes:
  my-volume:

services:
  app:
    volumes:
      - my-volume:/path-in-container
```

### Networking

By default docker-compose will create a new network for the given compose file. You can change the behavior by defining custom networks in your compose file.

#### Create and assign custom network

``` yaml
networks:
  custom-network:

services:
  app:
    networks:
      - custom-network
```

#### Use existing networks

If you want to use an existing Docker network for your compose files, you can add the `external: true` parameter in your compose file

``` yaml
networks:
  existing-network:
    external: true
```

### docker-compose.yml

``` yaml
version: '3.7'
services:
  backend-tests:
    image: registry/acceptance-tests:a4be480
    environment:
      - TESTING_ENV=${TESTING_ENV}
      - NAMESPACE=${NAMESPACE}
      - AUTH_SERVICE_CLIENT_ID=${AUTH_SERVICE_CLIENT_ID}
      - AUTH_SERVICE_CLIENT_SECRET=${AUTH_SERVICE_CLIENT_SECRET}
    command: >
      sh -c "npm run test:all:
      npm run junit;
      npm run report"
    volumes:
      - ../report:/opt/app/report
  web-tests:
    image: registry/acceptance-tests:latest
    environment:
      - TESTING_ENV=${TESTING_ENV}
      - NAMESPACE=${NAMESPACE}
      - AUTH_SERVICE_CLIENT_ID=${AUTH_SERVICE_CLIENT_ID}
      - AUTH_SERVICE_CLIENT_SECRET=${AUTH_SERVICE_CLIENT_SECRET}
    command: >
      sh -c "xvfb-run npm run test:web;
      npm run junit;
      npm run report"
    volumes:
      - ../report:/opt/app/report
```
