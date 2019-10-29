# AYLIEN News API - PHP SDK

The AYLIEN News API is the most powerful way of sourcing, searching and syndicating analyzed and enriched news content. It is accessed by sending HTTP requests to our server, which returns information to your client. 

Sign up at [https://newsapi.aylien.com/](https://newsapi.aylien.com/).

For more documentation see [https://newsapi.aylien.com/docs/](https://newsapi.aylien.com/docs/).

## Requirements

PHP 5.5 and later

## Installation & Usage

### Composer

To install the bindings via [Composer](http://getcomposer.org/), add the following to `composer.json`:

```json
{
  "require": {
    "aylien/newsapi": "~3.0.0"
  }
}
```

Then run `composer install`

### Manual Installation

Download the files and include `autoload.php`:

```php
    require_once('/path/to/aylien/newsapi/vendor/autoload.php');
```

## Tests

To run the unit tests:

```bash
composer install
./vendor/bin/phpunit
```

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');

// Configure API key authorization: app_id
$config = Aylien\NewsApi\Configuration::getDefaultConfiguration()->setApiKey('X-AYLIEN-NewsAPI-Application-ID', $_SERVER['NEWSAPI_APP_ID']);

// Configure API key authorization: app_key
$config = Aylien\NewsApi\Configuration::getDefaultConfiguration()->setApiKey('X-AYLIEN-NewsAPI-Application-Key', $_SERVER['NEWSAPI_APP_KEY']);

$apiInstance = new Aylien\NewsApi\Api\DefaultApi(
    new GuzzleHttp\Client(),
    $config
);

$opts = array(
  'title' => 'trump',
  'publishedAtStart' => 'NOW-7DAYS',
  'publishedAtEnd' => 'NOW',
  'entitiesBodyLinksDbpedia' => [
    'http://dbpedia.org/resource/Donald_Trump',
    'http://dbpedia.org/resource/Hillary_Rodham_Clinton'
  ],
  'notLanguage' => ['en'],
  'sortBy' => 'social_shares_count.facebook'
);

try {
    $result = $apiInstance->listStories($opts);
    for($i = 0; $i < sizeof($result->getStories()); $i++){
      print_r($result->getStories()[$i]->getTitle() . " / " .
        $result->getStories()[$i]->getSource()->getName() . "\n");
    }
} catch (Exception $e) {
    print_r($e->getResponseObject()->getErrors());
    echo 'Exception when calling DefaultApi->listStories: ', $e->getMessage(), "\n";
}
?>
```

## Documentation for API Endpoints

All URIs are relative to *https://api.aylien.com/news*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*DefaultApi* | [**listAutocompletes**](docs/Api/DefaultApi.md#listautocompletes) | **GET** /autocompletes | List autocompletes
*DefaultApi* | [**listClusters**](docs/Api/DefaultApi.md#listclusters) | **GET** /clusters | List Clusters
*DefaultApi* | [**listCoverages**](docs/Api/DefaultApi.md#listcoverages) | **GET** /coverages | List coverages
*DefaultApi* | [**listHistograms**](docs/Api/DefaultApi.md#listhistograms) | **GET** /histograms | List histograms
*DefaultApi* | [**listRelatedStories**](docs/Api/DefaultApi.md#listrelatedstories) | **GET** /related_stories | List related stories
*DefaultApi* | [**listStories**](docs/Api/DefaultApi.md#liststories) | **GET** /stories | List Stories
*DefaultApi* | [**listTimeSeries**](docs/Api/DefaultApi.md#listtimeseries) | **GET** /time_series | List time series
*DefaultApi* | [**listTrends**](docs/Api/DefaultApi.md#listtrends) | **GET** /trends | List trends


## Documentation For Models

 - [Author](docs/Model/Author.md)
 - [Autocomplete](docs/Model/Autocomplete.md)
 - [Autocompletes](docs/Model/Autocompletes.md)
 - [Category](docs/Model/Category.md)
 - [CategoryLinks](docs/Model/CategoryLinks.md)
 - [Cluster](docs/Model/Cluster.md)
 - [Clusters](docs/Model/Clusters.md)
 - [Coverages](docs/Model/Coverages.md)
 - [Entities](docs/Model/Entities.md)
 - [Entity](docs/Model/Entity.md)
 - [EntityLinks](docs/Model/EntityLinks.md)
 - [Error](docs/Model/Error.md)
 - [ErrorLinks](docs/Model/ErrorLinks.md)
 - [Errors](docs/Model/Errors.md)
 - [HistogramInterval](docs/Model/HistogramInterval.md)
 - [Histograms](docs/Model/Histograms.md)
 - [Location](docs/Model/Location.md)
 - [Media](docs/Model/Media.md)
 - [Rank](docs/Model/Rank.md)
 - [Rankings](docs/Model/Rankings.md)
 - [RelatedStories](docs/Model/RelatedStories.md)
 - [RepresentativeStory](docs/Model/RepresentativeStory.md)
 - [Scope](docs/Model/Scope.md)
 - [Sentiment](docs/Model/Sentiment.md)
 - [Sentiments](docs/Model/Sentiments.md)
 - [ShareCount](docs/Model/ShareCount.md)
 - [ShareCounts](docs/Model/ShareCounts.md)
 - [Source](docs/Model/Source.md)
 - [Stories](docs/Model/Stories.md)
 - [Story](docs/Model/Story.md)
 - [StoryCluster](docs/Model/StoryCluster.md)
 - [StoryLinks](docs/Model/StoryLinks.md)
 - [StoryTranslations](docs/Model/StoryTranslations.md)
 - [StoryTranslationsEn](docs/Model/StoryTranslationsEn.md)
 - [Summary](docs/Model/Summary.md)
 - [TimeSeries](docs/Model/TimeSeries.md)
 - [TimeSeriesList](docs/Model/TimeSeriesList.md)
 - [Trend](docs/Model/Trend.md)
 - [Trends](docs/Model/Trends.md)
