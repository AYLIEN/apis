cd ../sdks/news-api

for folder in javascript go python ruby
do
  if [ -d "$folder" ]; then
    cd $folder
    rm -r $(ls | grep -v README)
    rm -rf .git
    cd ..
  fi
done

exit 0
