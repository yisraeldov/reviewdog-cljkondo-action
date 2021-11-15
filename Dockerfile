FROM cljkondo/clj-kondo

ENV REVIEWDOG_VERSION=v0.13.0

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL3006
RUN apt-get install --no-install-recommends -yy wget git

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
