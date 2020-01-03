cd ../sdks/news-api

release_note=${1:-"minor update"}

function git_push {
  rm -rf .git
  git init
  git add .
  git commit -m "$release_note"
  git remote add origin git@github.com:aylien/aylien_newsapi_$lang

  git pull origin master -s recursive -X ours
  git cherry-pick --skip
  git rebase --continue
  git push origin master
}

echo "javascript: publishing to npm"
if [ ! -f "$HOME/.npmrc" ]; then
  echo "- $HOME/.npmrc not found, using NPM_AUTH_TOKEN from env to create it."
  echo "//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN" > $HOME/.npmrc
fi

cd javascript
lang=nodejs
git_push

npm install
npm run build
npm publish
cd ..

echo "php: publishing to packagist"
echo "- please note that packagist expects a new github release, and only updates the package in that case"
echo "- using PACKAGIST_API_TOKEN from env"
cd php
lang=php
git_push

curl -XPOST -H 'content-type:application/json' \
  "https://packagist.org/api/update-package?username=aylien&apiToken=$PACKAGIST_API_TOKEN" \
  -d '{"repository":{"url":"https://github.com/aylien/aylien_newsapi_php"}}'
cd ..

echo "python: publishing to pypi"
echo "- using PYPI_USERNAME and PYPI_PASSWORD env variables"
cd python
lang=python
git_push

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
lang=ruby
git_push

gem build aylien_news_api.gemspec
gem push aylien_news_api-*.gem
cd ..

echo "go: there is no publication necessary, users pull directly from github."
cd go
lang=go
git_push
cd ..

echo "java: TBD"
cd java
lang=java
git_push
cd ..

echo "csharp: TBD"
cd csharp
lang=csharp
git_push
cd ..
