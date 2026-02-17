
IMAGE := cups-debian
SERVICE := cups

.PHONY: build up down logs sh rebuild clean

build:
	podman build -t $(IMAGE) .

up:
	podman-compose up -d --build

down:
	podman-compose down

logs:
	podman-compose logs -f $(SERVICE)

logs2:
	podman-compose exec $(SERVICE) bash -c 'tail -f /var/log/cups/*'

sh:
	podman-compose exec $(SERVICE) bash


rebuild:
	podman-compose down
	podman-compose up -d --build

clean:
	podman-compose down
	podman rmi $(IMAGE) 2>/dev/null || true
	podman volume prune -f

curl:
	curl 127.0.0.1:10631
