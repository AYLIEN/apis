# AYLIEN News API - Go SDK

The AYLIEN News API is the most powerful way of sourcing, searching and syndicating analyzed and enriched news content. It is accessed by sending HTTP requests to our server, which returns information to your client. 

Sign up at [https://newsapi.aylien.com/](https://newsapi.aylien.com/).

For more documentation see [https://newsapi.aylien.com/docs/](https://newsapi.aylien.com/docs/).

## Installation

Install directly using `go get`:

```
go get github.com/AYLIEN/aylien_newsapi_go
```

Install the following dependencies:
```
go get github.com/stretchr/testify/assert
go get golang.org/x/oauth2
go get golang.org/x/net/context
go get github.com/antihax/optional
```

Put the package under your project folder and add the following in import:
```golang
import "./newsapi"
```

## Getting Started

```
package main

// Import the library
import (
	"context"
	"fmt"
	newsapi "github.com/AYLIEN/aylien_newsapi_go"
	"os"

	"github.com/antihax/optional"
)

func main() {
	cfg := newsapi.NewConfiguration()
	cfg.DefaultHeader["X-AYLIEN-NewsAPI-Application-ID"] = os.Getenv("NEWSAPI_APP_ID")

	// Configure API key authorization: app_key
	cfg.DefaultHeader["X-AYLIEN-NewsAPI-Application-Key"] = os.Getenv("NEWSAPI_APP_KEY")

	client := newsapi.NewAPIClient(cfg)
	api := client.DefaultApi

	storiesParams := &newsapi.ListStoriesOpts{
		Title:            optional.NewString("trump"),
		NotLanguage:      optional.NewInterface([]string{"en"}),
		PublishedAtStart: optional.NewString("NOW-7DAYS"),
		PublishedAtEnd:   optional.NewString("NOW"),
		EntitiesBodyLinksDbpedia: optional.NewInterface([]string{
			"http://dbpedia.org/resource/Donald_Trump",
		}),
	}

	storiesResponse, res, err := api.ListStories(context.Background(), storiesParams)
	if err != nil {
		panic(err)
	}
	_ = res

	for _, story := range storiesResponse.Stories {
		fmt.Println(story.Title, " / ", story.Source.Name)
	}
}
```

## Documentation for API Endpoints

All URIs are relative to *https://api.aylien.com/news*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*DefaultApi* | [**ListAutocompletes**](docs/DefaultApi.md#listautocompletes) | **Get** /autocompletes | List autocompletes
*DefaultApi* | [**ListClusters**](docs/DefaultApi.md#listclusters) | **Get** /clusters | List Clusters
*DefaultApi* | [**ListCoverages**](docs/DefaultApi.md#listcoverages) | **Get** /coverages | List coverages
*DefaultApi* | [**ListHistograms**](docs/DefaultApi.md#listhistograms) | **Get** /histograms | List histograms
*DefaultApi* | [**ListRelatedStories**](docs/DefaultApi.md#listrelatedstories) | **Get** /related_stories | List related stories
*DefaultApi* | [**ListStories**](docs/DefaultApi.md#liststories) | **Get** /stories | List Stories
*DefaultApi* | [**ListTimeSeries**](docs/DefaultApi.md#listtimeseries) | **Get** /time_series | List time series
*DefaultApi* | [**ListTrends**](docs/DefaultApi.md#listtrends) | **Get** /trends | List trends


## Documentation For Models

 - [Author](docs/Author.md)
 - [Autocomplete](docs/Autocomplete.md)
 - [Autocompletes](docs/Autocompletes.md)
 - [Category](docs/Category.md)
 - [CategoryLinks](docs/CategoryLinks.md)
 - [Cluster](docs/Cluster.md)
 - [Clusters](docs/Clusters.md)
 - [Coverages](docs/Coverages.md)
 - [Entities](docs/Entities.md)
 - [Entity](docs/Entity.md)
 - [EntityLinks](docs/EntityLinks.md)
 - [Error](docs/Error.md)
 - [ErrorLinks](docs/ErrorLinks.md)
 - [Errors](docs/Errors.md)
 - [HistogramInterval](docs/HistogramInterval.md)
 - [Histograms](docs/Histograms.md)
 - [Location](docs/Location.md)
 - [Media](docs/Media.md)
 - [Rank](docs/Rank.md)
 - [Rankings](docs/Rankings.md)
 - [RelatedStories](docs/RelatedStories.md)
 - [RepresentativeStory](docs/RepresentativeStory.md)
 - [Scope](docs/Scope.md)
 - [Sentiment](docs/Sentiment.md)
 - [Sentiments](docs/Sentiments.md)
 - [ShareCount](docs/ShareCount.md)
 - [ShareCounts](docs/ShareCounts.md)
 - [Source](docs/Source.md)
 - [Stories](docs/Stories.md)
 - [Story](docs/Story.md)
 - [StoryCluster](docs/StoryCluster.md)
 - [StoryLinks](docs/StoryLinks.md)
 - [StoryTranslations](docs/StoryTranslations.md)
 - [StoryTranslationsEn](docs/StoryTranslationsEn.md)
 - [Summary](docs/Summary.md)
 - [TimeSeries](docs/TimeSeries.md)
 - [TimeSeriesList](docs/TimeSeriesList.md)
 - [Trend](docs/Trend.md)
 - [Trends](docs/Trends.md)
