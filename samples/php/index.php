<?php
require_once('../../sdks/news-api/php/vendor/autoload.php');

// Configure API key authorization: app_id
$config = Aylien\NewsApi\Configuration::getDefaultConfiguration()->setApiKey('X-AYLIEN-NewsAPI-Application-ID', $_SERVER['NEWSAPI_APP_ID']);

// Configure API key authorization: app_key
$config = Aylien\NewsApi\Configuration::getDefaultConfiguration()->setApiKey('X-AYLIEN-NewsAPI-Application-Key', $_SERVER['NEWSAPI_APP_KEY']);

$apiInstance = new Aylien\NewsApi\Api\DefaultApi(
    new GuzzleHttp\Client(),
    $config
);

$opts = array(
  'title' => 'trump',
  'published_at_start' => 'NOW-7DAYS',
  'published_at_end' => 'NOW',
  'entities_body_links_dbpedia' => [
    'http://dbpedia.org/resource/Donald_Trump',
    'http://dbpedia.org/resource/Hillary_Rodham_Clinton'
  ],
  'not_language' => ['en'],
  'sort_by' => 'social_shares_count.facebook'
);

try {
    $result = $apiInstance->listStories($opts);
    for($i = 0; $i < sizeof($result->getStories()); $i++){
      print_r($result->getStories()[$i]->getTitle() . " / " .
        $result->getStories()[$i]->getSource()->getName() . "\n");
    }
} catch (Exception $e) {
    print_r($e->getResponseObject()->getErrors());
    echo 'Exception when calling DefaultApi->listStories: ', $e->getMessage(), "\n";
}
?>
