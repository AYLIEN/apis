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


def get_cluster_from_trends():
    response = api_instance.list_trends(
        field='clusters',
        categories_taxonomy='iptc-subjectcode',
        categories_id=['11000000'],
        published_at_end='NOW-12HOURS',
        entities_body_links_dbpedia=[
            'http://dbpedia.org/resource/United_States_Congress']
    )

    return [item.value for item in response.trends]


"""
Returns the representative story, number of stories, and time value for a given cluster
"""


def get_cluster_metadata(cluster_id):
    response = api_instance.list_clusters(
        id=[cluster_id]
    )

    clusters = response.clusters

    if clusters is None or len(clusters) == 0:
        return None

    first_cluster = clusters[0]

    return {
        "cluster": first_cluster.id,
        "representative_story": first_cluster.representative_story,
        "story_count": first_cluster.story_count,
        "time": first_cluster.time
    }


def get_top_stories(cluster_id):
    """
    Returns 3 stories associated with the cluster from the highest-ranking publishers
    """
    response = api_instance.list_stories(
        clusters=[cluster_id],
        sort_by="source.rankings.alexa.rank.US",
        per_page=3
    )

    return response.stories


clusters = {}
cluster_ids = get_cluster_from_trends()

for cluster_id in cluster_ids:
    metadata = get_cluster_metadata(cluster_id)
    if metadata is not None:
        stories = get_top_stories(cluster_id)
        metadata["stories"] = stories
        pprint(metadata)
    else:
        print("{} empty".format(cluster_id))
