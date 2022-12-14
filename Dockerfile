FROM alpine:latest

ARG USERNAME=appuser
ARG GROUPNAME=appgroup
ARG UID=100
ARG GID=1000

RUN apk add logrotate shadow

RUN groupadd -g ${GID} ${GROUPNAME} \
    && useradd -u ${UID} ${USERNAME} -g ${GID} -m

ADD logrotate.sh /logrotate.sh

RUN chmod +x /logrotate.sh