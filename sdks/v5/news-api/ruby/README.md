# AYLIEN News API - Ruby SDK

The AYLIEN News API is the most powerful way of sourcing, searching and syndicating analyzed and enriched news content. It is accessed by sending HTTP requests to our server, which returns information to your client. 

Sign up at [https://newsapi.aylien.com/](https://newsapi.aylien.com/).

For more documentation see [https://newsapi.aylien.com/docs/](https://newsapi.aylien.com/docs/).

## Installation

Add this to the Gemfile:

    gem 'aylien_news_api', '~> 3.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/aylien/aylien_newsapi_ruby, then add the following in the Gemfile:

    gem 'aylien_news_api', :git => 'https://github.com/aylien/aylien_newsapi_ruby.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
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
```

## Documentation for API Endpoints

All URIs are relative to *https://api.aylien.com/news*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AylienNewsApi::DefaultApi* | [**list_autocompletes**](docs/DefaultApi.md#list_autocompletes) | **GET** /autocompletes | List autocompletes
*AylienNewsApi::DefaultApi* | [**list_clusters**](docs/DefaultApi.md#list_clusters) | **GET** /clusters | List Clusters
*AylienNewsApi::DefaultApi* | [**list_coverages**](docs/DefaultApi.md#list_coverages) | **GET** /coverages | List coverages
*AylienNewsApi::DefaultApi* | [**list_histograms**](docs/DefaultApi.md#list_histograms) | **GET** /histograms | List histograms
*AylienNewsApi::DefaultApi* | [**list_related_stories**](docs/DefaultApi.md#list_related_stories) | **GET** /related_stories | List related stories
*AylienNewsApi::DefaultApi* | [**list_stories**](docs/DefaultApi.md#list_stories) | **GET** /stories | List Stories
*AylienNewsApi::DefaultApi* | [**list_time_series**](docs/DefaultApi.md#list_time_series) | **GET** /time_series | List time series
*AylienNewsApi::DefaultApi* | [**list_trends**](docs/DefaultApi.md#list_trends) | **GET** /trends | List trends


## Documentation for Models

 - [AylienNewsApi::Author](docs/Author.md)
 - [AylienNewsApi::Autocomplete](docs/Autocomplete.md)
 - [AylienNewsApi::Autocompletes](docs/Autocompletes.md)
 - [AylienNewsApi::Category](docs/Category.md)
 - [AylienNewsApi::CategoryLinks](docs/CategoryLinks.md)
 - [AylienNewsApi::Cluster](docs/Cluster.md)
 - [AylienNewsApi::Clusters](docs/Clusters.md)
 - [AylienNewsApi::Coverages](docs/Coverages.md)
 - [AylienNewsApi::DunsNumber](docs/DunsNumber.md)
 - [AylienNewsApi::Entities](docs/Entities.md)
 - [AylienNewsApi::Entity](docs/Entity.md)
 - [AylienNewsApi::EntityLinks](docs/EntityLinks.md)
 - [AylienNewsApi::Error](docs/Error.md)
 - [AylienNewsApi::ErrorLinks](docs/ErrorLinks.md)
 - [AylienNewsApi::Errors](docs/Errors.md)
 - [AylienNewsApi::ExternalIds](docs/ExternalIds.md)
 - [AylienNewsApi::HistogramInterval](docs/HistogramInterval.md)
 - [AylienNewsApi::Histograms](docs/Histograms.md)
 - [AylienNewsApi::Location](docs/Location.md)
 - [AylienNewsApi::Media](docs/Media.md)
 - [AylienNewsApi::Rank](docs/Rank.md)
 - [AylienNewsApi::Rankings](docs/Rankings.md)
 - [AylienNewsApi::RelatedStories](docs/RelatedStories.md)
 - [AylienNewsApi::RepresentativeStory](docs/RepresentativeStory.md)
 - [AylienNewsApi::Scope](docs/Scope.md)
 - [AylienNewsApi::Sentiment](docs/Sentiment.md)
 - [AylienNewsApi::Sentiments](docs/Sentiments.md)
 - [AylienNewsApi::ShareCount](docs/ShareCount.md)
 - [AylienNewsApi::ShareCounts](docs/ShareCounts.md)
 - [AylienNewsApi::Source](docs/Source.md)
 - [AylienNewsApi::Stories](docs/Stories.md)
 - [AylienNewsApi::Story](docs/Story.md)
 - [AylienNewsApi::StoryCluster](docs/StoryCluster.md)
 - [AylienNewsApi::StoryLinks](docs/StoryLinks.md)
 - [AylienNewsApi::StoryTranslations](docs/StoryTranslations.md)
 - [AylienNewsApi::StoryTranslationsEn](docs/StoryTranslationsEn.md)
 - [AylienNewsApi::Summary](docs/Summary.md)
 - [AylienNewsApi::TimeSeries](docs/TimeSeries.md)
 - [AylienNewsApi::TimeSeriesList](docs/TimeSeriesList.md)
 - [AylienNewsApi::Trend](docs/Trend.md)
 - [AylienNewsApi::Trends](docs/Trends.md)
