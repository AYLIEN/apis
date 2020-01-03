cd ../sdks/news-api

echo "javascript: publishing to npm"
if [ ! -f "$HOME/.npmrc" ]; then
  echo "- $HOME/.npmrc not found, using NPM_AUTH_TOKEN from env to create it."
  echo "//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN" > $HOME/.npmrc
fi

cd javascript
npm install
npm run build
npm publish
cd ..

echo "php: publishing to packagist"
echo "- please note that packagist reads the actual code from the git repository directly, so this step must be run after the changes are already pushed on github"
echo "- using PACKAGIST_API_TOKEN from env"
cd php
curl -XPOST -H 'content-type:application/json' \
  "https://packagist.org/api/update-package?username=aylien&apiToken=$PACKAGIST_API_TOKEN" \
  -d '{"repository":{"url":"https://github.com/aylien/aylien_newsapi_php"}}'
cd ..

echo "python: publishing to pypi"
echo "- using PYPI_USERNAME and PYPI_PASSWORD env variables"
cd python
pip install twine
python setup.py sdist bdist_wheel
twine check dist/*
twine upload --non-interactive  -u $PYPI_USERNAME -p $PYPI_PASSWORD dist/*
cd ..

echo "ruby: publishing to gems"
if [ ! -f "$HOME/.gem/credentials" ]; then
  echo "- $HOME/.gem/credentials not found, using GEM_API_KEY from env to create it."
  mkdir -p $HOME/.gem
  echo ":rubygems_api_key: $GEM_API_KEY" > $HOME/.gem/credentials
fi
cd ruby
gem build aylien_news_api.gemspec
gem push aylien_news_api-*.gem

echo "go: there is no publication necessary, users pull directly from github"

