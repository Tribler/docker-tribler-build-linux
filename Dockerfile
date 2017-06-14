FROM ubuntu:16.04
LABEL MAINTAINER Mitchell Olsthoorn <mitchell.olsthoorn@outlook.com>

# Make the GUI work in a container
ENV DEBIAN_FRONTEND=noninteractive

# Installing dependencies and cleaning up afterwards
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    debhelper \
    devscripts \
    git \
    fakeroot \
    python-setuptools \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN git clone --recursive https://github.com/Tribler/tribler.git

WORKDIR /root/tribler

RUN python Tribler/Main/Build/update_version_from_git.py
RUN debuild -i -us -uc -b


CMD ["bash"]
