  #!/usr/bin/env bash

set -eu

if [ -n "${OPENAPI_CMD+1}" ]
then
  echo "Using OpenAPI Generator command \`${OPENAPI_CMD}\`."
else
  OPENAPI_CMD="java -jar $(pwd)/openapi-generator-cli.jar"
  if [ -n "$(ls openapi-generator-cli.jar)" ]
  then
    echo "Using OpenAPI Generator command \`${OPENAPI_CMD}\`."
  else
    ./install-openapi-generator.sh
  
    echo "Using OpenAPI command \`${OPENAPI_CMD}\`."
  fi
fi

#for lang in "csharp" "ruby" "php" "java" "javascript" "go" "python"
for lang in "php"
do
    echo "Building ${lang} ..."
    $OPENAPI_CMD generate \
        --skip-validate-spec \
        --input-spec "../aylien/v1/text/api.yaml" \
        --generator-name "${lang}" \
        --output "../openapi-out/text-api/${lang}"
    $OPENAPI_CMD generate \
        --skip-validate-spec \
        --input-spec "../aylien/v1/news/api.yaml" \
        --generator-name "${lang}" \
        --config "../aylien/v1/news/config/${lang}.json" \
        --output "../openapi-out/news-api/${lang}"
done
echo "All done!"
