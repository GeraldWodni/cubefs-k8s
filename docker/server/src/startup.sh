#!/bin/bash

# get configuration from environment
env | /bin/env2json.awk > /etc/config-live.json

# get node configuration
cat /etc/layout.json | jq ".[\"$NODE_NAME\"]" > /etc/config-node.json

# merge configurations
jq -s '.[0] * .[1] * .[2]' /etc/config-base.json /etc/config-node.json /etc/config-live.json > /etc/config.json

# run server logging to stdout and running in foreground
/bin/cfs-server -redirect-std -f -c /etc/config.json

