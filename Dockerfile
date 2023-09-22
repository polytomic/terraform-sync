# Base image
FROM alpine:latest

ARG TARGETARCH=amd64
ARG TARGETOS=linux
ARG POLYTOMIC_IMPORTER_VERSION=0.3.25

RUN apk add --no-cache \
        bash \
        ca-certificates \
        curl \
    && curl -sLo polytomic-importer.zip \
    https://github.com/polytomic/terraform-provider-polytomic/releases/download/v${POLYTOMIC_IMPORTER_VERSION}/polytomic_importer_${POLYTOMIC_IMPORTER_VERSION}_${TARGETOS}_${TARGETARCH}.zip \
    && unzip -p \
    polytomic-importer.zip  \
    polytomic_importer_v${POLYTOMIC_IMPORTER_VERSION} > /polytomic-importer \
    && chmod +x /polytomic-importer 

# Copies your code file  repository to the filesystem
COPY entrypoint.sh /entrypoint.sh

# change permission to execute the script and
RUN chmod +x /entrypoint.sh

# file to execute when the docker container starts up
ENTRYPOINT ["/entrypoint.sh"]
