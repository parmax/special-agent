FROM debian:stable-slim
LABEL maintainer "Maxim Parkhomenko <psma@parmax.kiev.ua>"
LABEL SOURCE "https://github.com/parmax/special-agent/main/images/special-agent"
LABEL branch "main"

RUN apt-get update && apt-get install -yq --no-install-recommends \
        bash && \
        apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /dist

COPY setup.sh /dist/

RUN chmod +x /dist/setup.sh

CMD ["/dist/setup.sh"]

ENTRYPOINT ["/usr/bin/ros", "entrypoint"]
