from __future__ import print_function
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
    # List autocompletes
    api_response = api_instance.list_stories(
        title='startup',
        published_at_start='NOW-7DAYS',
        published_at_end='NOW',
        not_language=['en']
    )
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->list_autocompletes: %s\n" % e)
