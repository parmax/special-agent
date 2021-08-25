FROM gcc:7.4.0
LABEL maintainer "Maxim Parkhomenko <psma@parmax.kiev.ua>"
LABEL SOURCE "https://github.com/parmax/special-agent/main/images/special-agent"
LABEL branch "main"

RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
        libssl-dev libmount-dev \
        kmod \
        parted lsscsi ksh curl git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /dist

COPY setup.sh /dist/

CMD ["/dist/setup.sh"]

ENTRYPOINT ["/usr/bin/ros", "entrypoint"]
