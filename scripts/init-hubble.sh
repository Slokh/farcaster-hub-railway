#!/bin/sh

if [ ! -d "./.hubble/.rocks" ]; then
  mkdir -p ./.hubble/.rocks
fi

if [ ! -d "./.hubble/.hub" ]; then
  yarn identity create --output ./.hubble/.hub
fi

ln -s /home/node/app/apps/hubble/.hubble/.hub  /home/node/app/apps/hubble/.hub
ln -s /home/node/app/apps/hubble/.hubble/.rocks /home/node/app/apps/hubble/.rocks

exec node build/cli.js start \
    --network 1 \
    -m $ETH_MAINNET_RPC_URL \
    -l $OPTIMISM_L2_RPC_URL \
    --hub-operator-fid $HUB_OPERATOR_FID \
    --ip 0.0.0.0 \
    --gossip-port 2282 \
    --rpc-port 2283 \
    --rpc-subscribe-per-ip-limit 4 \
    --statsd-metrics-server $STATSD_METRICS_SERVER