ARG OS
FROM $OS
ARG OS

RUN apt-get update
RUN apt install -y linux-tools-generic 
RUN apt install -y python3 python3-setuptools python3-dev
RUN apt install -y build-essential

RUN ln -fs /usr/lib/linux-tools/*/perf /usr/bin/perf

RUN apt-get update
RUN apt-get install -y ca-certificates

COPY install-bcc-$OS.sh /opt
COPY install-bcc-prerequisites-$OS.sh /opt
RUN chmod +x /opt/install-bcc-$OS.sh /opt/install-bcc-prerequisites-$OS.sh

RUN /opt/install-bcc-prerequisites-$OS.sh

# Install BCC from source:
# https://github.com/iovisor/bcc/issues/3220#issuecomment-759628013
RUN /opt/install-bcc-$OS.sh
