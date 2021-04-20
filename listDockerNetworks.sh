#!/bin/sh

ids="$(docker network ls |grep -v NETWORK | awk '{print $1}')"

for id in $ids
do
  docker network inspect "$id" \
    | jq '.[] | (.Name + ": " + .IPAM.Config[].Subnet)'
done
