import os
import aylien_news_api

configuration = aylien_news_api.Configuration()
configuration.api_key['X-AYLIEN-NewsAPI-Application-ID'] = os.environ.get(
    'NEWSAPI_APP_ID')
configuration.api_key['X-AYLIEN-NewsAPI-Application-Key'] = os.environ.get(
    'NEWSAPI_APP_KEY')

client = aylien_news_api.ApiClient(configuration)
api_instance = aylien_news_api.DefaultApi(client)


def get_stories():
    """
    Returns a list of story objects
    """
    response = api_instance.list_stories(
        title='Donald Trump',
        published_at_start='NOW-6HOURS',
        per_page=100
    )

    return response.stories


stories = get_stories()
clustered_stories = {}
clusters = []

for story in stories:
    if len(story.clusters) > 0:
        cluster = story.clusters[0]
        if cluster not in clusters:
            clustered_stories[cluster] = [story.title]
        else:
            clustered_stories[cluster].append(story.title)

for cluster in clustered_stories:
    print(cluster, len(
        clustered_stories[cluster]), clustered_stories[cluster][0])
