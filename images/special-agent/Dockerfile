FROM docker:latest
LABEL maintainer "Maxim Parkhomenko <psma@parmax.kiev.ua>"
LABEL SOURCE "https://github.com/parmax/special-agent"
LABEL branch "master"

COPY setup.sh /dist/

CMD [ "/dist/setup.sh" ]

ENTRYPOINT [ "/usr/bin/ros", "entrypoint" ]

