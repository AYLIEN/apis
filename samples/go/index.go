package main

// Import the library
import (
	"context"
	"fmt"
	newsapi "github.com/AYLIEN/aylien_newsapi_go/v4"
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
