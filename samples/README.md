# Samples and Testing

You need to follow the instructions above and have the SDK generated and post-processed before trying the SDKs out. Samples for testing each SDK are available in the `samples` directory. In order to manually test the SDKs locally, follow the instructions below for each language. Sample files should be kept in sync with the READMEs of each SDK in order to make sure the README sample can run successfully.

### JavaScript

The sample for JavaScript already has a link to the SDK, but you need to build the SDK before using it.

```
cd sdks/vX/news-api/javascript
npm run build
```
#### Note: Where `vX` should be `v4` or `v5`
#### Note: Remember to edit the path in package.json so it points to the version you want to test.

And then run the samples by providing your APP_ID and APP_KEY through environment variables:
```
cd samples/javascript
NEWSAPI_APP_ID=YOUR_APP_ID_HERE NEWSAPI_APP_KEY=YOUR_APP_KEY_HERE node index.js
```

### Python

The sample for Python is set up using Python 3.7.4, so you have to install python 3.7.4 (preferrably using [`pyenv`](https://github.com/pyenv/pyenv)) and then install the package on:

```
pyenv shell 3.7.4
cd sdks/vX/news-api/python
pip install .
```
#### Note: Where `vX` should be `v4` or `v5`

And then run the samples by providing your APP_ID and APP_KEY through environment variables:
```
pyenv shell 3.7.4
cd samples/python
NEWSAPI_APP_ID=YOUR_APP_ID_HERE NEWSAPI_APP_KEY=YOUR_APP_EY_HERE python index.py
```

### Ruby

To test the Ruby SDK you need to first build and install the gem:

```
cd sdks/vX/news-api/ruby
gem build aylien_news_api.gemspec
gem install ./aylien_news_api-<VERSION>.gem
```
#### Note: Where `vX` should be `v4` or `v5`

(If you get an error about the gem containing itself, try removing `aylien_news_api-<VERSION>.gem` first)


And then run the samples by providing your APP_ID and APP_KEY through environment variables:
```
cd samples/ruby
NEWSAPI_APP_ID=YOUR_APP_ID_HERE NEWSAPI_APP_KEY=YOUR_APP_EY_HERE ruby index.rb
```

### Go

The Golang sample requires you to have the SDK linked inside your GOPATH. The suggested approach is to link the SDK directory inside your GOPATH and install the dependencies:

```
mkdir -p $GOPATH/src/github.com/AYLIEN/
ln -s /absolute/path/to/sdks/vX/news-api/go $GOPATH/src/github.com/AYLIEN/aylien_newsapi_go/v4

go get github.com/stretchr/testify/assert
go get golang.org/x/oauth2
go get golang.org/x/net/context
go get github.com/antihax/optional
```
#### Note: Where `vX` should be `v4` or `v5`

And then run the samples by providing your APP_ID and APP_KEY through environment variables:
```
cd samples/go
NEWSAPI_APP_ID=YOUR_APP_ID_HERE NEWSAPI_APP_KEY=YOUR_APP_EY_HERE go run index.go
```
