#!/bin/bash

# # Import informations
source ./information.txt

# Identifies user
USER=$(whoami)
DATE=$(date)
BODY="Container $CONTAINER_NAME_OR_ID ESTÁ FORA DO AR.\nIDENTIFICAÇÃO EM $DATE"


if [ ! -e "/home/$USER/container.log" ]; then #Se arquivo de log não existe, então ele é criado
    echo > /home/$USER/container.log
    chmod 777 /home/$USER/container.log
fi
echo "2"
# check container name
if [ -z "$CONTAINER_NAME_OR_ID" ]; then
    echo "Defina o nome do container no arquivo information.txt"
    exit 1
fi
echo "3"
# check if container is running
if sudo docker ps --filter "name=$CONTAINER_NAME_OR_ID" --format "{{.Names}}" | grep -wq "$CONTAINER_NAME_OR_ID"; then

    # Container is running, just records information in the log file
    sed -i '1s/^/'"$DATE"'\nContainer '"$CONTAINER_NAME_OR_ID"' is running.:\n\n/' /home/$USER/container.log
    exit 0
fi

# Records information in the log file
sed -i '1s/^/'"$DATE"'\n[ ERROR ]: Container '"$CONTAINER_NAME_OR_ID"' is NOT running.:\n\n/' /home/$USER/container.log

# Send email
echo -e "Subject: $SUBJECT\n\n$BODY" | msmtp -a $DEFAULT_ACCOUNT $RECIPIENT