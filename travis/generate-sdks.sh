  #!/usr/bin/env bash

set -eu

if [ -n "${SWAGGER_CMD+1}" ]
then
  echo "Using Swagger command \`${SWAGGER_CMD}\`."
else
  SWAGGER_CMD="java -jar $(pwd)/swagger-codegen-cli.jar"
  if [ -n "$(ls swagger-codegen-cli.jar)" ]
  then
    echo "Using Swagger command \`${SWAGGER_CMD}\`."
  else
    ./install-swagger-codegen.sh
  
    echo "Using Swagger command \`${SWAGGER_CMD}\`."
  fi
fi

for lang in "csharp" "ruby" "php" "java" "nodejs-server" "go" "python"
do
    echo "Building ${lang} ..."
    $SWAGGER_CMD generate \
        --input-spec "../aylien/v1/text/api.yaml" \
        --lang "${lang}" \
        --output "../swagger-out/text-api/${lang}"
    $SWAGGER_CMD generate \
        --input-spec "../aylien/v1/news/api.yaml" \
        --lang "${lang}" \
        --output "../swagger-out/news-api/${lang}"
done
echo "All done!"
