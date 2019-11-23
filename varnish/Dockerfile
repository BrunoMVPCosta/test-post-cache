FROM varnish:6.3

RUN set -ex; \
    apt-get update; \
    apt-get install -y git \
        make \
        automake \
        varnish-dev \
        python-docutils \
        libtool; \
    \
    git clone --depth 1 -b 6.3 --single-branch https://github.com/varnish/varnish-modules /tmp/varnish-modules; \
    cd /tmp/varnish-modules; \
    \
    ./bootstrap; \
    ./configure; \
    make; \
    make check; \
    make install; \
    rm -rf /tmp/*; \
    rm -rf /var/lib/apt/lists/*;

COPY default.vcl /etc/varnish/
