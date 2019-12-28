# Docker image for cgit which works with Gitolite

This image allows you to run a lighttpd server with cgit in a container.

Based on Alpine Linux.

## Quick setup

Change root-title in conf/cgitrc.

Run your Gitolite container in the background:

* Docker >= 1.9

        docker run -d --name cgit -p 80:80 -p 443:443 -v gitolite-git:/var/lib/git sergstetsuk/alpine-cgit

* Docker < 1.9

        docker run -d --name cgit -p 80:80 -p 443:443 --volumes-from gitolite-data sergstetsuk/alpine-cgit

