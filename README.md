# Tribler build image for Linux

This docker image is meant to make it easier to package Tribler for Linux by making the process of creating a deb file for Tribler easier.

## How to use
To make use of this image, you first need to pull this image from docker hub:
```shell
docker pull tribler/docker-tribler-build-linux
```
 
Or build it yourself by building from this repository:
```shell 
git clone https://github.com/Tribler/docker-tribler-build-linux.git
docker build -t tribler/docker-tribler-build-linux docker-tribler-build-linux
```

When the image is pulled or built, it can be run by executing this command:

```shell
sudo docker run -it --rm \
-v <absolute location to folder where assets should be>:/home/code/bin \
tribler/docker-tribler-build-linux
```

## Optional environment variables
### REPO_URL (Default: https://github.com/Tribler/tribler.git)
The REPO_URL env variable lets you change the repository url of code that the image is going to pull. This can be used for packaging forks of tribler.

```shell
sudo docker run -it --rm \
-v <absolute location to folder where assets should be>:/home/code/bin \
-e REPO_URL=<url of code repository> \
tribler/docker-tribler-build-linux
```

### VERSION (Default: next)
The VERSION env variable lets you change the specific version that is built during the packaging. This is handled by changing the branch of the repository. So in this way branches and tags can be selected.

```shell
sudo docker run -it --rm \
-v <absolute location to folder where assets should be>:/home/code/bin \
-e VERSION=<version> \
tribler/docker-tribler-build-linux
```
