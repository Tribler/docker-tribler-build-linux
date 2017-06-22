#!/bin/bash

# Download code from repository
git clone --recursive ${REPO_URL} tribler

# Change version
cd /root/code/tribler
git checkout ${VERSION}

# Run build command
/usr/bin/debuild -i -us -uc -b

# Move distribution files to seperate directory
mv ../tribler_* ../bin/
