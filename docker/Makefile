build:
	docker build -t wws/ansible:1.0.0 .

connect:
	docker exec -i -t ansible /bin/bash

run:
	docker run -d --rm --name ansible  wws/ansible:1.0.0

stop:
	docker stop ansible

up:
	docker-compose up -d

down:
	docker-compose down -d
