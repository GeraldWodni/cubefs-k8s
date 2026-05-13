#!/bin/bash

# get configuration from environment
env | /bin/env2json.awk > /etc/config-live.json

# merge configurations
jq -s '.[0] * .[1]' /etc/config-base.json /etc/config-live.json > /etc/config.json

# run server
/bin/cfs-server -c /etc/config.json

