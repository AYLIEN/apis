#!/bin/bash

OPENAPI_DIR=./openapi-codegen
OPENAPI_PATCHES_DIR=`pwd`/travis-ci/openapi-codegen-patches

echo "Downloading openapi-generator-cli..."
wget http://central.maven.org/maven2/org/openapitools/openapi-generator-cli/3.3.4/openapi-generator-cli-3.3.4.jar -O openapi-generator-cli.jar

# set $OPENAPI_CMD
export OPENAPI_CMD="java -jar $(pwd)/openapi-generator-cli.jar"
