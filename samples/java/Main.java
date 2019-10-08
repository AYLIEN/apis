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
