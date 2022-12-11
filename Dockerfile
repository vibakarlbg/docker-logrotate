FROM alpine:3.17.0

ARG USERNAME=appuser
ARG GROUPNAME=appgroup
ARG UID=100
ARG GID=1000

RUN apk update \
    && apk upgrade \
    && apk --no-cache add shadow logrotate tini gettext libintl busybox-suid

RUN groupadd -g ${GID} ${GROUPNAME} \
    && useradd -u ${UID} ${USERNAME} -g ${GID} -m

WORKDIR /home/${USERNAME}

COPY entrypoint.sh .

USER ${USERNAME}

ENTRYPOINT ["./entrypoint.sh"]

CMD ["/usr/sbin/crond", "-f", "-L", "/dev/stdout", "-c", "/home/appuser"]