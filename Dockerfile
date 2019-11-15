FROM alpine:3.7
MAINTAINER Robin Appelman <robin@icewind.nl>

####
RUN apk add --no-cache autossh

VOLUME ["/identity", "/identity.pub"]

ENTRYPOINT ["/usr/bin/autossh", "-M", "0", "-T", "-N", "-oStrictHostKeyChecking=no", "-oServerAliveInterval=180", "-oUserKnownHostsFile=/dev/null", "-i", "/identity", "-L"]
