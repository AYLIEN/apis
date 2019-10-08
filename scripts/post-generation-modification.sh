cd ../sdks/news-api

echo "node/javascript sdk"

cd javascript
npm install
sed -i 's/\(\w\+\)2/not\u\1/g' src/api/DefaultApi.js
npm run build
cd ..

cd go
sed -i 's/\(\w\+\)2\b/Not\u\1/g' api_default.go
sed -i 's/NotInt3/Int32/g' api_default.go
sed -i 's/Not42/422/g' api_default.go
cd ..

cd java
sed -i 's/exclamation\(\w\+\)/not\u\1/g' src/main/java/com/aylien/newsapi/api/DefaultApi.java
rm -rf src/test
cd ..

cd php
sed -i 's/\(\w\+\)2/not\u\1/g' lib/Api/DefaultApi.php
cd ..

cd python
sed -i 's/\(\w\+\)2/not_\1/g' aylien_news_api/api/default_api.py
cd ..

cd ruby
sed -i 's/@api_client.build_collection_param(\([^,]*\), :multi.*/\1 if !\1.nil?/g' lib/aylien_news_api/api/default_api.rb
sed -i 's/\(\w\+\)\[\]/\1/g' lib/aylien_news_api/api/default_api.rb
sed -i 's/\(\w\+\)2/not_\1/g' lib/aylien_news_api/api/default_api.rb
