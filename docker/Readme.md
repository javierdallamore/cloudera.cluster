# Docker for Ansible Playbooks for Cloudera Data Platform

This will generate a docker image with this repo inside ready to run.

This image expects a folder to be mounted inside the docker in /data with the following files

* inventory_static.ini: 

An inventory file is a grouped list which informs what the playbook will actually do, and to which servers.

https://github.com/cloudera-labs/cloudera.cluster/blob/v2/docs/inventories.md

* extra_vars.yml

The file extra_vars.yml contains general variables to override during playbook execution.

* cluster.yml

The file cluster.yml contains special variables specifically for cluster deployment: services, roles and configs.

* secrets.yml

Passwords are required at various points during the playbook run. It is recommended to use Ansible Vault and create an encrypted file in which to store these passwords and other sensitive variables securely.

## Makefile

In this same folder there is a Makefile where you can find tasks for each step explained in this document.

## Build Image

To build this docker image run

    make build

or
	docker build -t wws/ansible:1.0.0 .

## Run Docker

To run this docker:

    make run

or:

	docker run -d --rm --name ansible  wws/ansible:1.0.0

or if you want to use docker compose, you can run:

    make up

or

    docker-compose up -d

This docker compose mounts a data folder inside the docker in the path /data. This folder must contain the following files:

* inventory_static.ini
* extra_vars.yml
* cluster.yml
* secrets.yml

# Run Installation

Connect to the docker instance with:

    make connect

or

    docker exec -i -t ansible /bin/bash

go to /app and run the run.sh file

    cd /app
    sh run.sh
