release_note=$1
release_version=$2

cd ../sdks/v${release_version:0:1}/news-api

if [ -z "$release_note" ]; then
  echo 'Release note is required! ex. ./github-release.sh "advanced tagger support" 4.7.2 or ./github-release.sh "advanced tagger support" 5.1.0'
  exit -1
fi

if [ -z "$release_version" ]; then
  echo 'Version to release is required! ex. ./github-release.sh "advanced tagger support" 4.7.2 or ./github-release.sh "advanced tagger support" 5.1.0'
  exit -1
fi

if [ ${release_version:0:1} == "v" ]; then
  echo "Provide release version with following format `X.X.X` not with `vX.X.X`"
  exit -1
fi

function git_push() {
  rm -rf .git
  git init
  git add .
  git commit -m "$release_note"
  git remote add origin git@github.com:aylien/aylien_newsapi_$lang

  git pull --rebase -s recursive -Xtheirs origin master
  git checkout -b release-v$release_version
  git push origin release-v$release_version

  git tag -a v$release_version -m "${release_note}"
  git push --tags
}

function git_push_javascript() {
  rm -rf .git
  git init
  git add .
  git commit -m "$release_note"
  git remote add origin git@github.com:aylien/aylien_newsapi_nodejs

  git pull --rebase -s recursive -Xtheirs origin master
  git checkout -b release-v$release_version
  git rm -r node_modules
  git rm -r dist
  git commit -a --amend --no-edit
  #git push origin release-v$release_version

  #git tag -a v$release_version -m "${release_note}"
  #git push --tags
}

cd javascript
git_push_javascript
cd ..

echo "python: publishing to pypi"
echo "- using PYPI_USERNAME and PYPI_PASSWORD env variables"
cd python
lang=python
git_push
cd ..

cd ruby
lang=ruby
git_push
cd ..

echo "go: there is no publication necessary, users pull directly from github."
cd go
lang=go
git_push
cd ..
