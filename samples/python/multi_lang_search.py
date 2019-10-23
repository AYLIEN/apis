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
Searches across all languages for a search term in English.
"""
response = api_instance.list_stories(
    title='investors',
    translations_en_title='investors',
    published_at_start='NOW-1MONTH/DAY',
    published_at_end='NOW/DAY',
    per_page=10
)

for item in response.stories:
    if item.language != 'en':
        print(item.language)
        print(item.title)
        print(item.translations.en.title)
    else:
        print(item.title)
