#!/bin/bash

CONTAINER=$1 # Name or ID continer
FILE_LOCATION=$2 # File location
LOCAL_DESTINATION=$3 # Destination directory inside the container

# Checks if all parameters were passed
if [ -z "$FILE_LOCATION" ] || [ -z "$LOCAL_DESTINATION" ] || [ -z "CONTAINER" ] ; then
    echo "Script requer localização e nome do arquivo e caminho destino dentro do container"
    exit 1
fi

# Copy the file
docker cp $FILE_LOCATION $CONTAINER:$LOCAL_DESTINATION