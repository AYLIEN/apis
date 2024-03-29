import os
import aylien_news_api
from aylien_news_api.rest import ApiException
from pprint import pprint

configuration = aylien_news_api.Configuration()
configuration.api_key['X-AYLIEN-NewsAPI-Application-ID'] = os.environ.get(
    'NEWSAPI_APP_ID')
configuration.api_key['X-AYLIEN-NewsAPI-Application-Key'] = os.environ.get(
    'NEWSAPI_APP_KEY')

client = aylien_news_api.ApiClient(configuration)
api_instance = aylien_news_api.DefaultApi(client)

try:
    api_response = api_instance.list_clusters(
        time_end='NOW-6HOURS',
        story_count_min=10
    )
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->list_clusters: %s\n" % e)
