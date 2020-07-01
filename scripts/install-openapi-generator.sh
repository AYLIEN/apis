#!/bin/bash

OPENAPI_DIR=./openapi-codegen
OPENAPI_PATCHES_DIR=$(pwd)/travis-ci/openapi-codegen-patches

echo "Downloading openapi-generator-cli..."
#VERSION=4.3.0
wget https://github.com/AYLIEN/openapi-generator/releases/download/4.3.1-aylien2/openapi-generator-cli.jar

# set $OPENAPI_CMD
export OPENAPI_CMD="java -jar $(pwd)/openapi-generator-cli.jar"
