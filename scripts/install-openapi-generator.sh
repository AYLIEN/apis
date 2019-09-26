#!/bin/bash

OPENAPI_DIR=./openapi-codegen
OPENAPI_PATCHES_DIR=$(pwd)/travis-ci/openapi-codegen-patches

echo "Downloading openapi-generator-cli..."
VERSION=4.1.2
wget http://central.maven.org/maven2/org/openapitools/openapi-generator-cli/$VERSION/openapi-generator-cli-$VERSION.jar -O openapi-generator-cli.jar

# set $OPENAPI_CMD
export OPENAPI_CMD="java -jar $(pwd)/openapi-generator-cli.jar"
