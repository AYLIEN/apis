#!/bin/bash

SWAGGER_DIR=./swagger-codegen
SWAGGER_PATCHES_DIR=`pwd`/travis-ci/swagger-codegen-patches

echo "Downloading swagger-codegen cli..."
wget http://central.maven.org/maven2/io/swagger/swagger-codegen-cli/2.4.5/swagger-codegen-cli-2.4.5.jar -O swagger-codegen-cli.jar

# set $SWAGGER_CMD
export SWAGGER_CMD="java -jar $(pwd)/swagger-codegen-cli.jar"
