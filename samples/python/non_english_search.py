import os
import aylien_news_api

configuration = aylien_news_api.Configuration()
configuration.api_key['X-AYLIEN-NewsAPI-Application-ID'] = os.environ.get(
    'NEWSAPI_APP_ID')
configuration.api_key['X-AYLIEN-NewsAPI-Application-Key'] = os.environ.get(
    'NEWSAPI_APP_KEY')

client = aylien_news_api.ApiClient(configuration)
api_instance = aylien_news_api.DefaultApi(client)

"""
Searches across a Russian stories for a query term in that language ("Putin").
"""
response = api_instance.list_stories(
    title='Путин',
    language=['ru'],
    published_at_start='NOW-1MONTH/DAY',
    published_at_end='NOW/DAY',
    per_page=3
)

for item in response.stories:
    print(item.title)
    print(item.translations.en.title)
