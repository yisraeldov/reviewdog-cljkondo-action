FROM cljkondo/clj-kondo:2021.10.19

ENV REVIEWDOG_VERSION=v0.13.1

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL3003,DL3008
RUN apt-get install --no-install-recommends -yy wget git

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
