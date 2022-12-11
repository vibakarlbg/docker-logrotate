#!/bin/ash

# Docker Entrypoint, sets up crontab and hand over to `tini`

echo "${CRON_SCHEDULE} /usr/sbin/logrotate -s /home/appuser/logrotate.state -l /home/appuser/logrotate.log /etc/logrotate.conf" | crontab -

exec tini $@