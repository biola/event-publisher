# Globally set up elasticsearch client
Elasticsearch::Model.client = Elasticsearch::Client.new host: Settings.elasticsearch.host
