# Load the gem
require 'aylien_news_api'

# Setup authorization
AylienNewsApi.configure do |config|
  config.api_key['X-AYLIEN-NewsAPI-Application-ID'] = ENV['NEWSAPI_APP_ID']
  config.api_key['X-AYLIEN-NewsAPI-Application-Key'] = ENV['NEWSAPI_APP_KEY']
end

api_instance = AylienNewsApi::DefaultApi.new

opts = {
  title: 'trump',
  published_at_start: "NOW-7DAYS",
  published_at_end: "NOW",
  entities_body_links_dbpedia: [
    'http://dbpedia.org/resource/Donald_Trump',
  ],
  not_language: ['en'],
  sort_by: 'social_shares_count.facebook'
}


begin
  result = api_instance.list_stories(opts)
  result.stories.each do |story|
    puts "#{story.title} / #{story.source.name}"
  end
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling DefaultApi->list_stories: #{e}"
  puts e.response_body
end

begin
  result = api_instance.advanced_list_stories(
    AylienNewsApi::Parameter.new(
      title: AylienNewsApi::Query.new(
        text: "Trump"
      )
    ), {sort_by: 'social_shares_count.facebook'})
  result.stories.each do |story|
    puts "#{story.title} / #{story.source.name}"
  end
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling DefaultApi->advanced_list_stories: #{e}"
  puts e.response_body
end
