FROM docker:latest
LABEL maintainer "Maxim Parkhomenko <psma@parmax.kiev.ua>"
LABEL SOURCE "https://github.com/parmax/special-agent/main/images/special-agent"
LABEL branch "main"

RUN apk add --no-cache coreutils

WORKDIR /dist

COPY setup.sh /dist/

CMD ["/dist/setup.sh"]

ENTRYPOINT ["/usr/bin/ros", "entrypoint"]
