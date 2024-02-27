#!/bin/bash
CHAINID="athens_7001-1"
KEYRING="test"
HOSTNAME=$(hostname)
signer="operator"
nodeip=""
node=tcp:$nodeip//:26657

signerAddress=$(zetacored keys show $signer -a --keyring-backend=test)
echo "signerAddress: $signerAddress"

zetacored tx  group create-group-with-policy "$signerAddress" group-metadata group-policy-metadata post_genesis_scripts/create_group/members.json post_genesis_scripts/create_group/policy.json --from $signer --fees=40azeta --chain-id=$CHAINID --keyring-backend=$KEYRING -y --broadcast-mode=block --node=$node
zetacored q group group-policies-by-group 1 --node=$node



