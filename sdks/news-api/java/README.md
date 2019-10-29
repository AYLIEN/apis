# AYLIEN News API - Java SDK

The AYLIEN News API is the most powerful way of sourcing, searching and syndicating analyzed and enriched news content. It is accessed by sending HTTP requests to our server, which returns information to your client. 

Sign up at [https://newsapi.aylien.com/](https://newsapi.aylien.com/).

For more documentation see [https://newsapi.aylien.com/docs/](https://newsapi.aylien.com/docs/).

## Requirements

Building the API client library requires:
1. Java 1.7+
2. Maven/Gradle

## Installation

To install the API client library to your local Maven repository, simply execute:

```shell
mvn clean install
```

To deploy it to a remote Maven repository instead, configure the settings of the repository and execute:

```shell
mvn clean deploy
```

Refer to the [OSSRH Guide](http://central.sonatype.org/pages/ossrh-guide.html) for more information.

### Maven users

Add this dependency to your project's POM:

```xml
<dependency>
  <groupId>com.aylien.newsapi</groupId>
  <artifactId>client</artifactId>
  <version>3.0.0</version>
  <scope>compile</scope>
</dependency>
```

### Gradle users

Add this dependency to your project's build file:

```groovy
compile "com.aylien.newsapi:client:3.0.0"
```

### Others

At first generate the JAR by executing:

```shell
mvn clean package
```

Then manually install the following JARs:

* `target/client-3.0.0.jar`
* `target/lib/*.jar`

## Getting Started

Please follow the [installation](#installation) instruction and execute the following Java code:

```java
import com.aylien.newsapi.ApiClient;
import com.aylien.newsapi.ApiException;
import com.aylien.newsapi.Configuration;
import com.aylien.newsapi.api.DefaultApi;
import com.aylien.newsapi.auth.*;
import com.aylien.newsapi.models.*;
import java.util.*;

public class Main {

  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.aylien.com/news");

    // Configure API key authorization: app_id
    ApiKeyAuth app_id = (ApiKeyAuth)defaultClient.getAuthentication("app_id");
    app_id.setApiKey(System.getenv("NEWSAPI_APP_ID"));

    // Configure API key authorization: app_key
    ApiKeyAuth app_key = (ApiKeyAuth)defaultClient.getAuthentication("app_key");
    app_key.setApiKey(System.getenv("NEWSAPI_APP_KEY"));

    DefaultApi apiInstance = new DefaultApi(defaultClient);

    String title = "startup";
    List<String> notLanguage = Arrays.asList("en");
    String publishedAtStart = "NOW-3MONTHS";
    String publishedAtEnd = "NOW";
    Integer perPage = 10;

    try {
      Stories result = apiInstance.listStories()
                           .title(title)
                           .notLanguage(notLanguage)
                           .publishedAtStart(publishedAtStart)
                           .publishedAtEnd(publishedAtEnd)
                           .perPage(perPage)
                           .execute();
      for (Iterator i = result.getStories().iterator(); i.hasNext();) {
        Story story = (Story)i.next();
        System.out.println(story.getTitle() + " / " +
                           story.getSource().getName());
      }
    } catch (ApiException e) {
      System.err.println("Exception when calling DefaultApi#listStories");
      e.printStackTrace();
    }
  }
}
```

## Documentation for API Endpoints

All URIs are relative to *https://api.aylien.com/news*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*DefaultApi* | [**listAutocompletes**](docs/DefaultApi.md#listAutocompletes) | **GET** /autocompletes | List autocompletes
*DefaultApi* | [**listClusters**](docs/DefaultApi.md#listClusters) | **GET** /clusters | List Clusters
*DefaultApi* | [**listCoverages**](docs/DefaultApi.md#listCoverages) | **GET** /coverages | List coverages
*DefaultApi* | [**listHistograms**](docs/DefaultApi.md#listHistograms) | **GET** /histograms | List histograms
*DefaultApi* | [**listRelatedStories**](docs/DefaultApi.md#listRelatedStories) | **GET** /related_stories | List related stories
*DefaultApi* | [**listStories**](docs/DefaultApi.md#listStories) | **GET** /stories | List Stories
*DefaultApi* | [**listTimeSeries**](docs/DefaultApi.md#listTimeSeries) | **GET** /time_series | List time series
*DefaultApi* | [**listTrends**](docs/DefaultApi.md#listTrends) | **GET** /trends | List trends


## Documentation for Models

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

## Recommendation

It's recommended to create an instance of `ApiClient` per thread in a multithreaded environment to avoid any potential issues.


