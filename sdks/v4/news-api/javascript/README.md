# AYLIEN News API - JavaScript SDK

The AYLIEN News API is the most powerful way of sourcing, searching and syndicating analyzed and enriched news content. It is accessed by sending HTTP requests to our server, which returns information to your client. 

Sign up at [https://newsapi.aylien.com/](https://newsapi.aylien.com/).

For more documentation see [https://newsapi.aylien.com/docs/](https://newsapi.aylien.com/docs/).

## Installation

### For [Node.js](https://nodejs.org/)

#### npm

Install it via:

```shell
npm install aylien-news-api --save
```
### For browser

The library also works in the browser environment via npm and [browserify](http://browserify.org/). After following
the above steps with Node.js and installing browserify with `npm install -g browserify`,
perform the following (assuming *main.js* is your entry file, that's to say your javascript file where you actually 
use this library):

```shell
browserify main.js > bundle.js
```

Then include *bundle.js* in the HTML pages.

### Webpack Configuration

Using Webpack you may encounter the following error: "Module not found: Error:
Cannot resolve module", most certainly you should disable AMD loader. Add/merge
the following section to your webpack config:

```javascript
module: {
  rules: [
    {
      parser: {
        amd: false
      }
    }
  ]
}
```

## Getting Started

Please follow the [installation](#installation) instruction and execute the following JS code:

```javascript
var AylienNewsApi = require("aylien-news-api");

var defaultClient = AylienNewsApi.ApiClient.instance;

var app_id = defaultClient.authentications["app_id"];
app_id.apiKey = process.env["NEWSAPI_APP_ID"];

var app_key = defaultClient.authentications["app_key"];
app_key.apiKey = process.env["NEWSAPI_APP_KEY"];

var api = new AylienNewsApi.DefaultApi();

var opts = {
  title: "trump",
  sortBy: "social_shares_count.facebook",
  notLanguage: ["en"],
  publishedAtStart: "NOW-7DAYS",
  publishedAtEnd: "NOW",
  entitiesBodyLinksDbpedia: [
    "http://dbpedia.org/resource/Donald_Trump",
    "http://dbpedia.org/resource/Hillary_Rodham_Clinton"
  ]
};

var callback = function(error, data, response) {
  if (error) {
    console.error(error);
  } else {
    console.log("API called successfully. Returned data: ");
    console.log("========================================");
    for (var i = 0; i < data.stories.length; i++) {
      console.log(data.stories[i].title + " / " + data.stories[i].source.name);
    }
  }
};

api.listStories(opts, callback);
```

## Documentation for API Endpoints

All URIs are relative to *https://api.aylien.com/news*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AylienNewsApi.DefaultApi* | [**listAutocompletes**](docs/DefaultApi.md#listAutocompletes) | **GET** /autocompletes | List autocompletes
*AylienNewsApi.DefaultApi* | [**listClusters**](docs/DefaultApi.md#listClusters) | **GET** /clusters | List Clusters
*AylienNewsApi.DefaultApi* | [**listCoverages**](docs/DefaultApi.md#listCoverages) | **GET** /coverages | List coverages
*AylienNewsApi.DefaultApi* | [**listHistograms**](docs/DefaultApi.md#listHistograms) | **GET** /histograms | List histograms
*AylienNewsApi.DefaultApi* | [**listRelatedStories**](docs/DefaultApi.md#listRelatedStories) | **GET** /related_stories | List related stories
*AylienNewsApi.DefaultApi* | [**listStories**](docs/DefaultApi.md#listStories) | **GET** /stories | List Stories
*AylienNewsApi.DefaultApi* | [**listTimeSeries**](docs/DefaultApi.md#listTimeSeries) | **GET** /time_series | List time series
*AylienNewsApi.DefaultApi* | [**listTrends**](docs/DefaultApi.md#listTrends) | **GET** /trends | List trends


## Documentation for Models

 - [AylienNewsApi.Author](docs/Author.md)
 - [AylienNewsApi.Autocomplete](docs/Autocomplete.md)
 - [AylienNewsApi.Autocompletes](docs/Autocompletes.md)
 - [AylienNewsApi.Category](docs/Category.md)
 - [AylienNewsApi.CategoryLinks](docs/CategoryLinks.md)
 - [AylienNewsApi.Cluster](docs/Cluster.md)
 - [AylienNewsApi.Clusters](docs/Clusters.md)
 - [AylienNewsApi.Coverages](docs/Coverages.md)
 - [AylienNewsApi.Entities](docs/Entities.md)
 - [AylienNewsApi.Entity](docs/Entity.md)
 - [AylienNewsApi.EntityLinks](docs/EntityLinks.md)
 - [AylienNewsApi.Error](docs/Error.md)
 - [AylienNewsApi.ErrorLinks](docs/ErrorLinks.md)
 - [AylienNewsApi.Errors](docs/Errors.md)
 - [AylienNewsApi.HistogramInterval](docs/HistogramInterval.md)
 - [AylienNewsApi.Histograms](docs/Histograms.md)
 - [AylienNewsApi.Location](docs/Location.md)
 - [AylienNewsApi.Media](docs/Media.md)
 - [AylienNewsApi.Rank](docs/Rank.md)
 - [AylienNewsApi.Rankings](docs/Rankings.md)
 - [AylienNewsApi.RelatedStories](docs/RelatedStories.md)
 - [AylienNewsApi.RepresentativeStory](docs/RepresentativeStory.md)
 - [AylienNewsApi.Scope](docs/Scope.md)
 - [AylienNewsApi.Sentiment](docs/Sentiment.md)
 - [AylienNewsApi.Sentiments](docs/Sentiments.md)
 - [AylienNewsApi.ShareCount](docs/ShareCount.md)
 - [AylienNewsApi.ShareCounts](docs/ShareCounts.md)
 - [AylienNewsApi.Source](docs/Source.md)
 - [AylienNewsApi.Stories](docs/Stories.md)
 - [AylienNewsApi.Story](docs/Story.md)
 - [AylienNewsApi.StoryCluster](docs/StoryCluster.md)
 - [AylienNewsApi.StoryLinks](docs/StoryLinks.md)
 - [AylienNewsApi.StoryTranslations](docs/StoryTranslations.md)
 - [AylienNewsApi.StoryTranslationsEn](docs/StoryTranslationsEn.md)
 - [AylienNewsApi.Summary](docs/Summary.md)
 - [AylienNewsApi.TimeSeries](docs/TimeSeries.md)
 - [AylienNewsApi.TimeSeriesList](docs/TimeSeriesList.md)
 - [AylienNewsApi.Trend](docs/Trend.md)
 - [AylienNewsApi.Trends](docs/Trends.md)
