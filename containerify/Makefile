IMAGE := cups-debian2
SERVICE := cups

.PHONY: build up down logs sh rebuild clean

#build:
#	podman build -t $(IMAGE) .
#


COMPOSE = podman compose

rmi:
	$(COMPOSE) down --rmi all --volumes --remove-orphans

up:
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

logs:
	$(COMPOSE) logs -f $(SERVICE)

logs2:
	$(COMPOSE) exec $(SERVICE) bash -c 'tail -f /var/log/cups/*'

sh:
	$(COMPOSE) exec $(SERVICE) bash


rebuild:
	$(COMPOSE) down
	$(COMPOSE) up -d --build

clean:
	$(COMPOSE) down
	podman rmi $(IMAGE) 2>/dev/null || true
	podman volume prune -f

curl:
	curl 127.0.0.1:10631
