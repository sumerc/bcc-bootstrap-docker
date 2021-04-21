# bcc-bootstrap-docker

A minimal bootstrap Dockerfile to setup a BCC inside a container (Ubuntu Bionic).

```
docker run -it -v $(pwd):/opt --rm --privileged \
    -v /sys/kernel/debug:/sys/kernel/debug:rw \
    --pid=host bcc-boostrap-docker
```
