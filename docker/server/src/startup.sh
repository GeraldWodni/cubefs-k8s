#!/bin/bash

# get configuration from environment
env | /bin/env2json.awk > /etc/config-live.json

if [ -f /etc/layout.json ]; then
    # big configuration with layout
    # get node configuration
    cat /etc/layout.json | jq ".[\"$NODE_NAME\"]" > /etc/config-node.json

    # merge configurations
    jq -s '.[0] * .[1] * .[2]' /etc/config-base.json /etc/config-node.json /etc/config-live.json > /etc/config.json
else
    # small configuration
    # merge configurations
    jq -s '.[0] * .[1]' /etc/config-base.json /etc/config-live.json > /etc/config.json
fi

/bin/cfs-server -redirect-std -f -c /etc/config.json
