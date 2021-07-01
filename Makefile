SHELL=/bin/bash -euo pipefail

OS?=ubuntu:18.04
TAG?=bcc-bootstrap-docker
CONTAINER_NAME?=bcc-bootstrap-container

build:
	docker build . --build-arg OS=$(OS)  -t $(TAG)
.PHONY: build

# example: WORKDIR=/home/projects make test-run
test-run:
	docker run -it -v $(WORKDIR):/work --workdir=/work --rm --privileged\
		-v /lib/modules:/lib/modules:ro -v /usr/src:/usr/src:ro\
		-v /sys/kernel/debug:/sys/kernel/debug:rw\
		--name $(CONTAINER_NAME)\
		--pid=host\
		$(TAG)
.PHONY: run

test-exec:
	docker exec -ti $(CONTAINER_NAME) bash
.PHONY: exec
