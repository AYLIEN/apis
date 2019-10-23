# AYLIEN News API - C# SDK

The AYLIEN News API is the most powerful way of sourcing, searching and syndicating analyzed and enriched news content. It is accessed by sending HTTP requests to our server, which returns information to your client. 

Sign up at [https://newsapi.aylien.com/](https://newsapi.aylien.com/).

For more documentation see [https://newsapi.aylien.com/docs/](https://newsapi.aylien.com/docs/).

## Frameworks supported
- .NET 4.0 or later
- Windows Phone 7.1 (Mango)

## Dependencies
- [FubarCoder](https://www.nuget.org/packages/FubarCoder.RestSharp.Portable.HttpClient) - 4.0.8 or later
- [Newtonsoft.Json](https://www.nuget.org/packages/Newtonsoft.Json/) - 12.0.2 or later

The DLLs included in the package may not be the latest version. We recommend using [NuGet](https://docs.nuget.org/consume/installing-nuget) to obtain the latest version of the packages:
```
Install-Package FubarCoder.RestSharp.Portable.HttpClient
Install-Package Newtonsoft.Json
```

NOTE: RestSharp versions greater than 105.1.0 have a bug which causes file uploads to fail. See [RestSharp#742](https://github.com/restsharp/RestSharp/issues/742)

## Installation
Run the following command to generate the DLL
- [Mac/Linux] `/bin/sh build.sh`
- [Windows] `build.bat`

Then include the DLL (under the `bin` folder) in the C# project, and use the namespaces:
```csharp
using Aylien.NewsApi.Api;
using Aylien.NewsApi.Client;
using Aylien.NewsApi.Model;
```

## Getting Started

```csharp
using System;
using Aylien.NewsApi.Api;
using Aylien.NewsApi.Client;
using Aylien.NewsApi.Model;
using System.Collections.Generic;

namespace GettingStartedExample
{
    class Program
    {
        static void Main(string[] args)
        {
            // Configure API key authorization: app_id
            var apiId = System.Environment.GetEnvironmentVariable("X-AYLIEN-NewsAPI-Application-ID");
            Configuration.Default.ApiKey.Add("X-AYLIEN-NewsAPI-Application-ID", apiId);

            // Configure API key authorization: app_key
            var apiKey = System.Environment.GetEnvironmentVariable("X-AYLIEN-NewsAPI-Application-Key");
            Configuration.Default.ApiKey.Add("X-AYLIEN-NewsAPI-Application-Key", apiKey);

            var apiInstance = new DefaultApi();

            try
            {
                // List stories
                Stories storiesResponse = apiInstance.ListStories(
                    title: "trump",
                    publishedAtStart: "NOW-7DAYS",
                    publishedAtEnd: "NOW",
                    language: new List<string> { "en" },
                    notLanguage: new List<string> { "it", "es" },
                    entitiesBodyLinksDbpedia: new List<string> {
                        "http://dbpedia.org/resource/Donald_Trump",
                        "http://dbpedia.org/resource/Hillary_Rodham_Clinton"
                    },
                    sortBy: "social_shares_count.facebook"
                );

                foreach (var story in storiesResponse._Stories)
                {
                    Console.WriteLine(story.Title + " / " + story.Source.Name);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception when calling DefaultApi.ListStories: " + e.Message);
            }
        }
    }
}
```

## Documentation for API Endpoints

All URIs are relative to *https://api.aylien.com/news*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*DefaultApi* | [**ListAutocompletes**](docs/DefaultApi.md#listautocompletes) | **GET** /autocompletes | List autocompletes
*DefaultApi* | [**ListClusters**](docs/DefaultApi.md#listclusters) | **GET** /clusters | List Clusters
*DefaultApi* | [**ListCoverages**](docs/DefaultApi.md#listcoverages) | **GET** /coverages | List coverages
*DefaultApi* | [**ListHistograms**](docs/DefaultApi.md#listhistograms) | **GET** /histograms | List histograms
*DefaultApi* | [**ListRelatedStories**](docs/DefaultApi.md#listrelatedstories) | **GET** /related_stories | List related stories
*DefaultApi* | [**ListStories**](docs/DefaultApi.md#liststories) | **GET** /stories | List Stories
*DefaultApi* | [**ListTimeSeries**](docs/DefaultApi.md#listtimeseries) | **GET** /time_series | List time series
*DefaultApi* | [**ListTrends**](docs/DefaultApi.md#listtrends) | **GET** /trends | List trends


<a name="documentation-for-models"></a>
## Documentation for Models

 - [Model.Author](docs/Author.md)
 - [Model.Autocomplete](docs/Autocomplete.md)
 - [Model.Autocompletes](docs/Autocompletes.md)
 - [Model.Category](docs/Category.md)
 - [Model.CategoryLinks](docs/CategoryLinks.md)
 - [Model.Cluster](docs/Cluster.md)
 - [Model.Clusters](docs/Clusters.md)
 - [Model.Coverages](docs/Coverages.md)
 - [Model.Entities](docs/Entities.md)
 - [Model.Entity](docs/Entity.md)
 - [Model.EntityLinks](docs/EntityLinks.md)
 - [Model.Error](docs/Error.md)
 - [Model.ErrorLinks](docs/ErrorLinks.md)
 - [Model.Errors](docs/Errors.md)
 - [Model.HistogramInterval](docs/HistogramInterval.md)
 - [Model.Histograms](docs/Histograms.md)
 - [Model.Location](docs/Location.md)
 - [Model.Media](docs/Media.md)
 - [Model.Rank](docs/Rank.md)
 - [Model.Rankings](docs/Rankings.md)
 - [Model.RelatedStories](docs/RelatedStories.md)
 - [Model.RepresentativeStory](docs/RepresentativeStory.md)
 - [Model.Scope](docs/Scope.md)
 - [Model.Sentiment](docs/Sentiment.md)
 - [Model.Sentiments](docs/Sentiments.md)
 - [Model.ShareCount](docs/ShareCount.md)
 - [Model.ShareCounts](docs/ShareCounts.md)
 - [Model.Source](docs/Source.md)
 - [Model.Stories](docs/Stories.md)
 - [Model.Story](docs/Story.md)
 - [Model.StoryCluster](docs/StoryCluster.md)
 - [Model.StoryLinks](docs/StoryLinks.md)
 - [Model.StoryTranslations](docs/StoryTranslations.md)
 - [Model.StoryTranslationsEn](docs/StoryTranslationsEn.md)
 - [Model.Summary](docs/Summary.md)
 - [Model.TimeSeries](docs/TimeSeries.md)
 - [Model.TimeSeriesList](docs/TimeSeriesList.md)
 - [Model.Trend](docs/Trend.md)
 - [Model.Trends](docs/Trends.md)

