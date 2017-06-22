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

RUN mkdir -p /root/code/bin
WORKDIR /root/code

ENV REPO_URL=https://github.com/Tribler/tribler.git
RUN git clone --recursive ${REPO_URL} tribler

WORKDIR /root/code/tribler

ENV VERSION=next
RUN git checkout ${VERSION}

CMD /usr/bin/debuild -i -us -uc -b && mv ../tribler_* ../bin/
