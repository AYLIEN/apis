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

# remove tags as they cause breaking change in module names
OS=`uname`
cmd=sed
if [ "$OS" = 'Darwin' ]; then
    # for MacOS
    cmd=gsed
fi
cat ../aylien/v1/news/api.yaml | tr '\n' '\r' | $cmd -e 's/\s\s\+tags:\r\s*- \w*//g' | tr '\r' '\n' > temp.api.yaml

python remove-post-body.py temp.api.yaml no-post.api.yaml

for lang in "ruby" "javascript" "go" "python"
do
  f="temp.api.yaml"
  if [[ "$lang" == "javascript" || "$lang" == "go" ]]; then
    f="no-post.api.yaml"
  fi

  echo "Building ${lang} ..."
  $OPENAPI_CMD generate \
      --skip-validate-spec \
      --input-spec "../aylien/v1/text/api.yaml" \
      --generator-name "${lang}" \
      --output "../sdks/text-api/${lang}"
  $OPENAPI_CMD generate \
      --skip-validate-spec \
      --input-spec "$f" \
      --generator-name "${lang}" \
      --config "../aylien/v1/news/config/${lang}.json" \
      --output "../sdks/news-api/${lang}"
done

rm temp.api.yaml
rm no-post.api.yaml

echo "All done!"

