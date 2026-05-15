#!/bin/bash
echo "Startup"
echo "  Writing live-config"

# get configuration from environment
env | /bin/env2json.awk > /etc/config-live.json

if [ -f /etc/layout.json ]; then
    echo "  Writing config (w/ layout)"
    # big configuration with layout
    # get node configuration
    cat /etc/layout.json | jq ".[\"$NODE_NAME\"]" > /etc/config-node.json

    # merge configurations
    jq -s '.[0] * .[1] * .[2]' /etc/config-base.json /etc/config-node.json /etc/config-live.json > /etc/config.json
else
    echo "  Writing config (w/o layout)"
    # small configuration
    # merge configurations
    jq -s '.[0] * .[1]' /etc/config-base.json /etc/config-live.json > /etc/config.json
fi

echo "Final config:"
cat /etc/config.json | jq

printf "Waiting for kubernetes-dns to catch up with $CUBEFS_SERVICE_NAME "
until ping -c 1 $CUBEFS_SERVICE_NAME; do
    printf "."
    sleep 1
done

echo -e "\nConfig finished, starting cfs"
/bin/cfs-server -redirect-std -f -c /etc/config.json
