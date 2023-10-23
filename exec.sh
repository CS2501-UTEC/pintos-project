#!/bin/bash 
echo "CS2S01 Operating Systems 2021-2"
echo "Staring the docker container."
name=""
if [ -z "$1" ]
  then
    name="pintos"
    echo "No name provided. Using the default name '$name'"
  else
    name=$1
fi
volumeName="${name}_volume"
docker start $volumeName
docker exec -it $volumeName bash