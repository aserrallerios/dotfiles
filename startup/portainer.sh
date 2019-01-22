#!/bin/sh

if command -v docker >/dev/null 2>&1; then
	docker volume create portainer_data || EXIT_CODE=$? && true
	docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer || EXIT_CODE=$? && true
fi
