.PHONY: all

all: build-images run-stack

build-images: clean-images
	docker tag containous/whoami whoami:local
	docker save whoami:local -o ./images/whoami.tar
	docker tag containous/whoamitcp whoamitcp:local
	docker save whoamitcp:local -o ./images/whoamitcp.tar
	docker save containous/traefik:latest -o ./images/traefik.tar

clean: clean-images
	rm -rf ./in/coredns.yaml
	rm -rf ./in/traefik.yaml

clean-images:
	rm -rf ./images/whoami.tar
	rm -rf ./images/whoamitcp.tar
	rm -rf ./images/traefik.tar

run-stack: stop
	docker-compose up -d
	export KUBECONFIG=$(pwd)/out/kubeconfig.yaml

stop:
	docker-compose down && docker system prune -f --volumes

test-http:
	curl localhost/whoami

test-api:
	curl localhost:8080/api/rawdata | jq

test-tcp:
	telnet localhost 8090