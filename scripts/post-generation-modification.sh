scripts=$PWD
cd ../sdks/news-api

OS=`uname`
cmd=sed
if [ "$OS" = 'Darwin' ]; then
    # for MacOS
    cmd=gsed
fi

cd javascript
npm install
$cmd -i 's/\(\w\+\)2/not\u\1/g' src/api/DefaultApi.js
$cmd -i 's/\(\w\+\)2/not\u\1/g' docs/DefaultApi.md
npm run build
cd ..

cd go
$cmd -i 's/\(\w\+\)2\b/Not\u\1/g' api_default.go
$cmd -i 's/\(\w\+\)2\b/Not\u\1/g' docs/DefaultApi.md
$cmd -i 's/NotInt3/Int32/g' api_default.go
$cmd -i 's/Not42/422/g' api_default.go
$cmd -i 's/GIT_USER_ID/aylien/' go.mod
$cmd -i 's/GIT_REPO_ID/aylien_newsapi_go/' go.mod
cd ..

cd python
$cmd -i 's/\(\w\+\)2/not_\1/g' aylien_news_api/api/default_api.py
$cmd -i 's/\(\w\+\)2/not_\1/g' docs/DefaultApi.md
$cmd -i 's/not_42/422/g' docs/DefaultApi.md
$cmd -i 's/not_49/492/g' docs/DefaultApi.md
cd ..

cd ruby
$cmd -i 's/@api_client.build_collection_param(\([^,]*\), :multi.*/\1 if !\1.nil?/g' lib/aylien_news_api/api/default_api.rb
$cmd -i 's/\(\w\+\)\[\]/\1/g' lib/aylien_news_api/api/default_api.rb
$cmd -i 's/\(\w\+\)2/not_\1/g' lib/aylien_news_api/api/default_api.rb
$cmd -i 's/\(\w\+\)2/not_\1/g' docs/DefaultApi.md
cd ..
