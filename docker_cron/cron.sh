#!/bin/bash

# Define cron instruction
CRON_JOB="*/5 * * * * /path/to/my_script.sh"

# Verifique se o trabalho cron já existe
(crontab -l | grep -F "$CRON_JOB") || (crontab -l; echo "$CRON_JOB") | crontab -