#!/usr/bin/env bash

set -eo pipefail

# get protoc executions
go get github.com/regen-network/cosmos-proto/protoc-gen-gocosmos 2>/dev/null

# get cosmos sdk from github
go get github.com/cosmos/cosmos-sdk 2>/dev/null

echo "Generating gogo proto code"
proto_dirs=$(find ./proto -path -prune -o -name '*.proto' -print0 | xargs -0 -n1 dirname | sort | uniq)
for dir in $proto_dirs; do
  for file in $(find "${dir}" -maxdepth 1 -name '*.proto'); do
    if grep go_package $file &>/dev/null; then
#      protoc -I=. --gogo_out=. --go-grpc_out=require_unimplemented_servers=false:. $file 
        protoc -I=. -I=third_party/proto --gocosmos_out=plugins=interfacetype+grpc,\
Mgoogle/protobuf/any.proto=github.com/cosmos/cosmos-sdk/codec/types,\
Mgoogle/protobuf/duration.proto=github.com/gogo/protobuf/types,\
Mgoogle/protobuf/struct.proto=github.com/gogo/protobuf/types,\
Mgoogle/protobuf/timestamp.proto=github.com/gogo/protobuf/types,\
Mgoogle/protobuf/wrappers.proto=github.com/gogo/protobuf/types,\
Mcosmos/orm/v1alpha1/orm.proto=github.com/cosmos/cosmos-sdk/api/cosmos/orm/v1alpha1:. \
        --grpc-gateway_out=logtostderr=true:. \
        $file 
    fi
  done
done

# move proto files to the right places
#
# Note: Proto files are suffixed with the current binary version.

#go mod tidy -compat=1.18
cp -r github.com/faddat/dig/x/* x/
rm -rf github.com

# TODO: Uncomment once ORM/Pulsar support is needed.
#
# Ref: https://github.com/osmosis-labs/osmosis/pull/1589
# ./scripts/protocgen2.sh
