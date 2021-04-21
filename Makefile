SHELL=/bin/bash -euo pipefail

OS?=ubuntu:18.04
TAG?=bcc-bootstrap-docker

build:
	docker build . --build-arg OS=$(OS)  -t $(TAG)
.PHONY: build

test-run:
	docker run -it -v $(pwd):/opt --rm --privileged -v /sys/kernel/debug:/sys/kernel/debug:rw --pid=host $(TAG)
.PHONY: run
