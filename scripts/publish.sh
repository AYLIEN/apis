cd ../sdks/news-api

echo "javascript: publishing to npm"
if [ ! -f "$HOME/.npmrc" ]; then
  echo "- $HOME/.npmrc not found, using NPM_AUTH_TOKEN from env to create it."
  echo "//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN" >$HOME/.npmrc
fi

cd javascript
npm install
npm run build
npm publish
cd ..

cd python
pip3 install twine
python3 setup.py sdist bdist_wheel
twine check dist/*
twine upload --non-interactive -u $PYPI_USERNAME -p $PYPI_PASSWORD dist/*
cd ..

echo "ruby: publishing to gems"
if [ ! -f "$HOME/.gem/credentials" ]; then
  echo "- $HOME/.gem/credentials not found, using GEM_API_KEY from env to create it."
  mkdir -p $HOME/.gem
  echo ":rubygems_api_key: $GEM_API_KEY" >$HOME/.gem/credentials
fi
cd ruby 
gem build aylien_news_api.gemspec
gem push aylien_news_api-*.gem
cd ..
