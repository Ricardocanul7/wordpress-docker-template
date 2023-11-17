COMPOSE=docker compose -f docker-compose.yaml
EXEC=${COMPOSE} exec -u 1000 php

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

create-project:	## make clean install of wordpress
	${COMPOSE} up -d --build
	./permissions.sh