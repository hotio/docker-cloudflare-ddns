FROM hotio/base@sha256:cac4e16e96664e8f25578b009d4c7471be2e04937e943a16a560adea042e843b

ENV INTERVAL=300 DETECTION_MODE="dig-whoami.cloudflare" LOG_LEVEL=3

ARG APPRISE_VERSION
RUN apk add --no-cache python3 py3-six py3-requests py3-pip ncurses iproute2 bind-tools && \
    pip3 install --no-cache-dir --upgrade apprise==${APPRISE_VERSION} && \
    apk del --purge py3-pip

COPY root/ /

RUN chmod 755 "${APP_DIR}/cloudflare-ddns.sh"

ARG LABEL_CREATED
LABEL org.opencontainers.image.created=$LABEL_CREATED
ARG LABEL_TITLE
LABEL org.opencontainers.image.title=$LABEL_TITLE
ARG LABEL_REVISION
LABEL org.opencontainers.image.revision=$LABEL_REVISION
ARG LABEL_SOURCE
LABEL org.opencontainers.image.source=$LABEL_SOURCE
ARG LABEL_VENDOR
LABEL org.opencontainers.image.vendor=$LABEL_VENDOR
ARG LABEL_URL
LABEL org.opencontainers.image.url=$LABEL_URL
