cd ../sdks/news-api

for folder in javascript java php csharp go python ruby
do
  cd $folder
  rm -r $(ls | grep -v README)
done

exit 0
