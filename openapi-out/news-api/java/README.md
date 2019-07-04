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
  <version>2.0.0</version>
  <scope>compile</scope>
</dependency>
```

### Gradle users

Add this dependency to your project's build file:

```groovy
compile "com.aylien.newsapi:client:2.0.0"
```

### Others

At first generate the JAR by executing:

```shell
mvn clean package
```

Then manually install the following JARs:

* `target/client-2.0.0.jar`
* `target/lib/*.jar`

## Getting Started

Please follow the [installation](#installation) instruction and execute the following Java code:

```java
import com.aylien.newsapi.*;
import com.aylien.newsapi.auth.*;
import com.aylien.newsapi.models.*;
import com.aylien.newsapi.parameters.*;
import com.aylien.newsapi.api.DefaultApi;

import java.util.*;

public class Main {

    public static void main(String[] args) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();

        // Configure API key authorization: app_id
        ApiKeyAuth app_id = (ApiKeyAuth) defaultClient.getAuthentication("app_id");
        app_id.setApiKey("YOUR_APP_ID");

        // Configure API key authorization: app_key
        ApiKeyAuth app_key = (ApiKeyAuth) defaultClient.getAuthentication("app_key");
        app_key.setApiKey("YOUR_APP_KEY");

        DefaultApi apiInstance = new DefaultApi();

        List<Long> id = Arrays.asList(985744L);
        List<Long> exclamationId = Arrays.asList(5241L, 4412L);
        String title = "startup AND (raise OR raised OR raising OR raises)";
        String body = "startup";
        String text = "startup company";
        String translationsEnTitle = "startup AND (raise OR raised OR raising OR raises)";
        String translationsEnBody = "startup";
        String translationsEnText = "startup company";
        List<String> language = Arrays.asList("en", "es", "es");
        List<String> exclamationLanguage = Arrays.asList("fr", "pt", "it");
        String publishedAtStart = "NOW-3MONTHS/DAY";
        String publishedAtEnd = "NOW-10DAYS";
        String categoriesTaxonomy = "iab-qag";
        Boolean categoriesConfident = true;
        List<String> categoriesId = Arrays.asList("IAB15", "IAB13-1");
        List<String> exclamationCategoriesId = Arrays.asList("IAB3-2");
        List<Integer> categoriesLevel = Arrays.asList(2);
        List<Integer> exclamationCategoriesLevel = Arrays.asList(1, 3);
        List<String> entitiesTitleText = Arrays.asList("GNU/Linux", "Microsoft Windows");
        List<String> exclamationEntitiesTitleText = Arrays.asList("Ireland", "Dublin");
        List<String> entitiesTitleType = Arrays.asList("Software", "Organization");
        List<String> exclamationEntitiesTitleType = Arrays.asList("Agent", "Person");
        List<String> entitiesTitleLinksDbpedia = Arrays.asList("http://dbpedia.org/resource/Linux");
        List<String> exclamationEntitiesTitleLinksDbpedia = Arrays.asList("http://dbpedia.org/resource/Windows");
        List<String> entitiesBodyText = Arrays.asList("GNU/Linux", "Microsoft Windows");
        List<String> exclamationEntitiesBodyText = Arrays.asList("Trump");
        List<String> entitiesBodyType = Arrays.asList("Agent", "Person");
        List<String> exclamationEntitiesBodyType = Arrays.asList("Software", "Organization");
        List<String> entitiesBodyLinksDbpedia = Arrays.asList("entitiesBodyLinksDbpedia_example");
        List<String> exclamationEntitiesBodyLinksDbpedia = Arrays.asList("http://dbpedia.org/resource/Linux");
        String sentimentTitlePolarity = "negative";
        String exclamationSentimentTitlePolarity = "positive";
        String sentimentBodyPolarity = "neutral";
        String exclamationSentimentBodyPolarity = "negative";
        Integer mediaImagesCountMin = 2;
        Integer mediaImagesCountMax = 4;
        Integer mediaImagesWidthMin = 640;
        Integer mediaImagesWidthMax = 1024;
        Integer mediaImagesHeightMin = 480;
        Integer mediaImagesHeightMax = 800;
        Integer mediaImagesContentLengthMin = 25411;
        Integer mediaImagesContentLengthMax = 369541;
        List<String> mediaImagesFormat = Arrays.asList("JPEG", "BMP", "GIF");
        List<String> exclamationMediaImagesFormat = Arrays.asList("PNG", "TIFF");
        Integer mediaVideosCountMin = 1;
        Integer mediaVideosCountMax = 2;
        List<Integer> authorId = Arrays.asList(36521);
        List<Integer> exclamationAuthorId = Arrays.asList(2541);
        String authorName = "John Doe";
        String exclamationAuthorName = "Mike Wally";
        List<Integer> sourceId = Arrays.asList(1411);
        List<Integer> exclamationSourceId = Arrays.asList(251);
        List<String> sourceName = Arrays.asList("BBC");
        List<String> exclamationSourceName = Arrays.asList("Fox News");
        List<String> sourceDomain = Arrays.asList("bbc.co.uk");
        List<String> exclamationSourceDomain = Arrays.asList("foxnews.com");
        List<String> sourceLocationsCountry = Arrays.asList("US", "IE");
        List<String> exclamationSourceLocationsCountry = Arrays.asList("IR");
        List<String> sourceLocationsState = Arrays.asList("California");
        List<String> exclamationSourceLocationsState = Arrays.asList("Arizona");
        List<String> sourceLocationsCity = Arrays.asList("Los Angeles");
        List<String> exclamationSourceLocationsCity = Arrays.asList("Dublin City");
        List<String> sourceScopesCountry = Arrays.asList("IE", "NG");
        List<String> exclamationSourceScopesCountry = Arrays.asList("US", "GB");
        List<String> sourceScopesState = Arrays.asList("Co Dublin");
        List<String> exclamationSourceScopesState = Arrays.asList("Co Wicklow");
        List<String> sourceScopesCity = Arrays.asList("Dublin City");
        List<String> exclamationSourceScopesCity = Arrays.asList("Cork");
        List<String> sourceScopesLevel = Arrays.asList("national");
        List<String> exclamationSourceScopesLevel = Arrays.asList("local");
        Integer sourceLinksInCountMin = 354211;
        Integer sourceLinksInCountMax = 587412;
        Integer sourceRankingsAlexaRankMin = 10;
        Integer sourceRankingsAlexaRankMax = 2500;
        List<String> sourceRankingsAlexaCountry = Arrays.asList("IE");
        Integer socialSharesCountFacebookMin = 3521;
        Integer socialSharesCountFacebookMax = 5841;
        Integer socialSharesCountGooglePlusMin = 2514;
        Integer socialSharesCountGooglePlusMax = 36521;
        Integer socialSharesCountLinkedinMin = 6521;
        Integer socialSharesCountLinkedinMax = 36521;
        Integer socialSharesCountRedditMin = 14125;
        Integer socialSharesCountRedditMax = 95412;
        List<String> clusters = Arrays.asList("433413");
        List<String> _return = Arrays.asList("id", "title");
        String sortBy = "published_at";
        String sortDirection = "desc";
        String cursor = "*";
        Integer perPage = 10;

        try {
          Stories result = apiInstance.listStories(id, exclamationId, title, body, text, translationsEnTitle, translationsEnBody, translationsEnText, language, exclamationLanguage, publishedAtStart, publishedAtEnd, categoriesTaxonomy, categoriesConfident, categoriesId, exclamationCategoriesId, categoriesLevel, exclamationCategoriesLevel, entitiesTitleText, exclamationEntitiesTitleText, entitiesTitleType, exclamationEntitiesTitleType, entitiesTitleLinksDbpedia, exclamationEntitiesTitleLinksDbpedia, entitiesBodyText, exclamationEntitiesBodyText, entitiesBodyType, exclamationEntitiesBodyType, entitiesBodyLinksDbpedia, exclamationEntitiesBodyLinksDbpedia, sentimentTitlePolarity, exclamationSentimentTitlePolarity, sentimentBodyPolarity, exclamationSentimentBodyPolarity, mediaImagesCountMin, mediaImagesCountMax, mediaImagesWidthMin, mediaImagesWidthMax, mediaImagesHeightMin, mediaImagesHeightMax, mediaImagesContentLengthMin, mediaImagesContentLengthMax, mediaImagesFormat, exclamationMediaImagesFormat, mediaVideosCountMin, mediaVideosCountMax, authorId, exclamationAuthorId, authorName, exclamationAuthorName, sourceId, exclamationSourceId, sourceName, exclamationSourceName, sourceDomain, exclamationSourceDomain, sourceLocationsCountry, exclamationSourceLocationsCountry, sourceLocationsState, exclamationSourceLocationsState, sourceLocationsCity, exclamationSourceLocationsCity, sourceScopesCountry, exclamationSourceScopesCountry, sourceScopesState, exclamationSourceScopesState, sourceScopesCity, exclamationSourceScopesCity, sourceScopesLevel, exclamationSourceScopesLevel, sourceLinksInCountMin, sourceLinksInCountMax, sourceRankingsAlexaRankMin, sourceRankingsAlexaRankMax, sourceRankingsAlexaCountry, socialSharesCountFacebookMin, socialSharesCountFacebookMax, socialSharesCountGooglePlusMin, socialSharesCountGooglePlusMax, socialSharesCountLinkedinMin, socialSharesCountLinkedinMax, socialSharesCountRedditMin, socialSharesCountRedditMax, clusters, _return, sortBy, sortDirection, cursor, perPage);
            for (Iterator i = result.getStories().iterator(); i.hasNext();){
                Story story = (Story)i.next();
                System.out.println(story.getTitle() + " / " + story.getSource().getName());
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


