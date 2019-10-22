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