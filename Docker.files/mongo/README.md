---
Description: Creating a Docker image with MongoDB pre-installed using a Dockerfile and sharing the image on Docker Hub
Keywords: docker, dockerize, dockerizing, article, example, docker.io, platform, package, installation, networking, mongodb, containers, images, image, sharing, dockerfile, build, auto-building, auto-scaling, framework
Title: Dockerize MongoDB
---

# Docker Image [![](https://images.microbadger.com/badges/version/tbaltrushaitis/gsmc-public.svg)](https://microbadger.com/images/tbaltrushaitis/gsmc-public) [![](https://images.microbadger.com/badges/image/tbaltrushaitis/gsmc-public.svg)](https://microbadger.com/images/tbaltrushaitis/gsmc-public)

![GSMC Logo](https://bitbucket.org/gsmcenter/public/avatar/128)

`docker-mongo`

--------

#### Provide a Docker Container with MongoDB service preinstalled.

### Packages Dependencies ###

 Package | Version  | Tag 
---------|----------|-----
Container | 0.0.2 | dev
Linux   | 4.4.0-45 | generic
MongoDB | v3.4.0 | org


## Building the MongoDB Docker image

With our `Dockerfile`, we can now build the MongoDB image using Docker. Unless
experimenting, it is always a good practice to tag Docker images by passing the
`--tag` option to `docker build` command.

```dockerfile
# Format: docker build --tag/-t <user-name>/<repository> .
# Example:
$ docker build --tag my/repo .
```
Once this command is issued, Docker will go through the `Dockerfile` and build
the image. The final image will be tagged `my/repo`.

------------------

## Pushing the MongoDB image to Docker Hub

All Docker image repositories can be hosted and shared on
[Docker Hub](https://hub.docker.com) with the `docker push` command. For this,
you need to be logged-in.

```bash
# Log-in
$ docker login

Username:
..
```

```bash
# Push the image
# Format: docker push <user-name>/<repository>
$ docker push my/repo

The push refers to a repository [my/repo] (len: 1)
Sending image list
Pushing repository my/repo (1 tags)
..
```

------------------

## Using the MongoDB image

Using the MongoDB image we created, we can run one or more MongoDB instances
as daemon process(es).

```bash
# Basic way
# Usage: docker run --name <name for container> -d <user-name>/<repository>
$ docker run -p 27017:27017 --name mongo_instance_001 -d my/repo

# Dockerized MongoDB, lean and mean!
# Usage: docker run --name <name for container> -d <user-name>/<repository> --noprealloc --smallfiles
$ docker run -p 27017:27017 --name mongo_instance_001 -d my/repo --smallfiles

# Checking out the logs of a MongoDB container
# Usage: docker logs <name for container>
$ docker logs mongo_instance_001

# Playing with MongoDB
# Usage: mongo --port <port you get from `docker ps`>
$ mongo --port 27017

# If using docker-machine
# Usage: mongo --port <port you get from `docker ps`>  --host <ip address from `docker-machine ip VM_NAME`>
$ mongo --port 27017 --host 192.168.59.103
```

------------------

> **Tip:** If you want to run two containers on the same engine, then you will need to map
the exposed port to two different ports on the host

```bash
# Start two containers and map the ports
$ docker run -p 28001:27017 --name mongo_instance_001 -d my/repo

$ docker run -p 28002:27017 --name mongo_instance_002 -d my/repo

# Now you can connect to each MongoDB instance on the two ports
$ mongo --port 28001

$ mongo --port 28002
```

------------------

### More Info ###

 - [Linking containers](../userguide/networking/default_network/dockerlinks.md)
 - [Cross-host linking containers](../admin/ambassador_pattern_linking.md)
 - [Creating an Automated Build](/docker-hub/builds/)
