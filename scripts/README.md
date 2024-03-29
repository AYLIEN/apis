# Generation

We use OpenAPI Generator to automatically generate our SDKs. This process is mostly automated using a few scripts outlined here.

## Installing the generator

Use `install-openapi-generator.sh` to download the version of generator that we use.

```
sh ./install-openapi-generator.sh
```

## Generating the SDKs

> Note: Make sure you edit package version manually in `/aylien/vX/news/config/*.json` and in `/aylien/vX/news/*.yaml` into either `v4.x.x` or `v5.x.x`.

The SDKs are generated from the API definition files found in the [`/aylien/vX/`](/aylien/vX) directory. There are also JSON configuration files in these directories for each language (see [`/aylien/vX/news/config`](/aylien/vX/news/config) for example). This process is automatic using the `generate-sdks.sh <version>` script.

> Note: Make sure you have `gsed` installed.

```
sh ./generate-sdks.sh vX
```
> Note: Where `vX` is your version to generate. `ex. ./generate-sdks.sh v4`


Please note that this script calls `install-openapi-generator.sh` if it can't find the `openapi-generator-cli.jar` file.

## Post-generation

Unfortunately the generator has some limitations, and these limitations make it necessary for us to do some post-processing of the SDKs in order to make them fit for daily use of our users. There is a script for automatically applying these changes:

```
sh ./post-generation-modification.sh vX
```
> Note: Where `vX` is your version to generate. `ex. ./generate-sdks.sh v4`

## Publishing

For publishing new versions of SDKs, first make sure you have bumped the version. Each SDK's version is controlled in [`aylien/v1/news/config/*.json`](../aylien/v1/news/config).

Credentials for publishing SDKs can be found in LastPass in a secure note called "SDK Credentials".

### Git

First step in publishing is pushing to git and creating a release. This step is the same for all SDKs and it is as follows:

```
cd sdks/news-api/javascript
rm -rf .git # to make sure there is no other git repo here
git init
git add .
git commit -m "Write release notes here"
git remote add origin git@github.com:aylien/aylien_newsapi_nodejs # substitute with correct repository name for each language

git pull --rebase -s recursive -Xtheirs origin master # this will ignore any rebase conflicts and take the local version to be the ground truth
git cherry-pick --skip # in case you find yourself in a cherry-picking state, sometimes happens
git rebase --continue # in case you find yourself in a rebasing state, sometimes happens
git push origin master
```

Don't forget to create a release on GitHub.

### JavaScript: npm

For publishing to npm, you need to log into the AYLIEN npmjs account. This is available on LastPass.

```
npm login
```

With that in place, build and publish:
```
npm install
npm run build
npm publish
```

Make sure to also push to the remote git repository and create a release.

### Python: pypi

For uploading to pypi you need to install `twine`, build and check the package and then upload it. Username and password can be found in the secure note.

```
pip install wheel
pip install twine
python setup.py sdist bdist_wheel
twine check dist/*
twine upload --non-interactive -u $PYPI_USERNAME -p $PYPI_PASSWORD dist/*
```

Make sure to also push to the remote git repository and create a release.

### Ruby: gems

Ruby Gems expects an API Key for uploading gems, this key can be found in the secure note. Put the key in place:

```
echo ":rubygems_api_key: $GEM_API_KEY" >$HOME/.gem/credentials
```

Then build and publish the gem:
```
gem build aylien_news_api.gemspec
gem push aylien_news_api-*.gem
```

Make sure to also push to the remote git repository and create a release.

### Go

Go directly retrieves the packages from Github, no publication necessary other than pushing to [git](#git) and making a release.

### Automated Script

There is an automated script available for doing all of this, but you should only use it if you know what you are doing. Read the script before using it to understand how it works.

```
sh ./github-release.sh 'Release Notes here' 'Branch name here' 'x.x.x'
sh ./publish.sh vX
```
> Note: Where `vX` is your version to publush. `ex. ./publish.sh v4`

## Testing

See the `samples` directory for instructions on testing.
