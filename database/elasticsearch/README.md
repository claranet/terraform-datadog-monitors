# DATABASE ELASTICSEARCH DataDog monitors

## How to use this module

```
module "datadog-monitors-database-elasticsearch" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//database/elasticsearch?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Elasticsearch average index flushing to disk latency
- Elasticsearch average indexing time by document
- Elasticsearch average Old-generation garbage collections latency
- Elasticsearch average search fetch latency
- Elasticsearch average search query latency
- Elasticsearch average Young-generation garbage collections latency
- Elasticsearch change alert on the average time spent by tasks in the queue
- Elasticsearch change alert on the number of currently active queries
- Elasticsearch change alert on the number of query cache evictions
- Elasticsearch change alert on the number of request cache evictions
- Elasticsearch change alert on the number of search fetches currently running
- Elasticsearch change alert on the total number of evictions from the fielddata cache
- ElasticSearch Cluster has unassigned shards
- ElasticSearch Cluster is initializing shards
- ElasticSearch Cluster is relocating shards
- ElasticSearch Cluster status not green
- ElasticSearch does not respond
- ElasticSearch free space < 10%
- Elasticsearch JVM HEAP memory usage
- Elasticsearch JVM memory Old usage
- Elasticsearch JVM memory Young usage
- Elasticsearch number of current open HTTP connections anomaly detected

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cluster\_initializing\_shards\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| cluster\_initializing\_shards\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| cluster\_initializing\_shards\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| cluster\_initializing\_shards\_threshold\_critical | Cluster Status  critical threshold | string | `"2"` | no |
| cluster\_initializing\_shards\_threshold\_warning | Cluster Status warning threshold | string | `"1"` | no |
| cluster\_initializing\_shards\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| cluster\_initializing\_shards\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_5m"` | no |
| cluster\_relocating\_shards\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| cluster\_relocating\_shards\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| cluster\_relocating\_shards\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| cluster\_relocating\_shards\_threshold\_critical | Cluster Status  critical threshold | string | `"2"` | no |
| cluster\_relocating\_shards\_threshold\_warning | Cluster Status warning threshold | string | `"1"` | no |
| cluster\_relocating\_shards\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| cluster\_relocating\_shards\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_5m"` | no |
| cluster\_status\_not\_green\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| cluster\_status\_not\_green\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| cluster\_status\_not\_green\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| cluster\_status\_not\_green\_threshold\_critical | Cluster Status  critical threshold | string | `"0"` | no |
| cluster\_status\_not\_green\_threshold\_warning | Cluster Status warning threshold | string | `"1"` | no |
| cluster\_status\_not\_green\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| cluster\_status\_not\_green\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_5m"` | no |
| cluster\_unassigned\_shards\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| cluster\_unassigned\_shards\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| cluster\_unassigned\_shards\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| cluster\_unassigned\_shards\_threshold\_critical | Cluster Status  critical threshold | string | `"2"` | no |
| cluster\_unassigned\_shards\_threshold\_warning | Cluster Status warning threshold | string | `"1"` | no |
| cluster\_unassigned\_shards\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| cluster\_unassigned\_shards\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_5m"` | no |
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| fetch\_change\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| fetch\_change\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| fetch\_change\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| fetch\_change\_threshold\_critical | Cluster Status  critical threshold | string | `"100"` | no |
| fetch\_change\_threshold\_warning | Cluster Status warning threshold | string | `"75"` | no |
| fetch\_change\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| fetch\_change\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_10m"` | no |
| fetch\_change\_timeshift | Timeshift for the Cluster Status monitor | string | `"last_10m"` | no |
| fetch\_latency\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| fetch\_latency\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| fetch\_latency\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| fetch\_latency\_threshold\_critical | Cluster Status  critical threshold | string | `"4"` | no |
| fetch\_latency\_threshold\_warning | Cluster Status warning threshold | string | `"2"` | no |
| fetch\_latency\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"min"` | no |
| fetch\_latency\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_10m"` | no |
| field\_data\_evictions\_change\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| field\_data\_evictions\_change\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| field\_data\_evictions\_change\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| field\_data\_evictions\_change\_threshold\_critical | Cluster Status  critical threshold | string | `"120"` | no |
| field\_data\_evictions\_change\_threshold\_warning | Cluster Status warning threshold | string | `"60"` | no |
| field\_data\_evictions\_change\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| field\_data\_evictions\_change\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_15m"` | no |
| field\_data\_evictions\_change\_timeshift | Timeframe for the Cluster Status monitor | string | `"last_15m"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| flush\_latency\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| flush\_latency\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| flush\_latency\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| flush\_latency\_threshold\_critical | Cluster Status  critical threshold | string | `"100"` | no |
| flush\_latency\_threshold\_warning | Cluster Status warning threshold | string | `"50"` | no |
| flush\_latency\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| flush\_latency\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_10m"` | no |
| http\_connections\_anomaly\_alert\_window | Alert window. | string | `"last_15m"` | no |
| http\_connections\_anomaly\_count\_default\_zero | Count default zero. | string | `"true"` | no |
| http\_connections\_anomaly\_detection\_algorithm | Anomaly Detection Algorithm used | string | `"agile"` | no |
| http\_connections\_anomaly\_deviations | Deviations to detect the anomaly | string | `"2"` | no |
| http\_connections\_anomaly\_direction | Direction of the anomaly. It can be both, below or above. | string | `"above"` | no |
| http\_connections\_anomaly\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| http\_connections\_anomaly\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| http\_connections\_anomaly\_interval | Interval. | string | `"60"` | no |
| http\_connections\_anomaly\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| http\_connections\_anomaly\_seasonality | Seasonality of the algorithm | string | `"hourly"` | no |
| http\_connections\_anomaly\_threshold\_critical | Cluster Status  critical threshold | string | `"1"` | no |
| http\_connections\_anomaly\_threshold\_warning | Cluster Status warning threshold | string | `"0.75"` | no |
| http\_connections\_anomaly\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| http\_connections\_anomaly\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_4h"` | no |
| indexing\_latency\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| indexing\_latency\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| indexing\_latency\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| indexing\_latency\_threshold\_critical | Cluster Status  critical threshold | string | `"15"` | no |
| indexing\_latency\_threshold\_warning | Cluster Status warning threshold | string | `"10"` | no |
| indexing\_latency\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| indexing\_latency\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_10m"` | no |
| jvm\_gc\_old\_collection\_latency\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| jvm\_gc\_old\_collection\_latency\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| jvm\_gc\_old\_collection\_latency\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| jvm\_gc\_old\_collection\_latency\_threshold\_critical | Cluster Status  critical threshold | string | `"200"` | no |
| jvm\_gc\_old\_collection\_latency\_threshold\_warning | Cluster Status warning threshold | string | `"160"` | no |
| jvm\_gc\_old\_collection\_latency\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| jvm\_gc\_old\_collection\_latency\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_10m"` | no |
| jvm\_gc\_young\_collection\_latency\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| jvm\_gc\_young\_collection\_latency\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| jvm\_gc\_young\_collection\_latency\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| jvm\_gc\_young\_collection\_latency\_threshold\_critical | Cluster Status  critical threshold | string | `"25"` | no |
| jvm\_gc\_young\_collection\_latency\_threshold\_warning | Cluster Status warning threshold | string | `"20"` | no |
| jvm\_gc\_young\_collection\_latency\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| jvm\_gc\_young\_collection\_latency\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_10m"` | no |
| jvm\_heap\_memory\_usage\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| jvm\_heap\_memory\_usage\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| jvm\_heap\_memory\_usage\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| jvm\_heap\_memory\_usage\_threshold\_critical | Cluster Status  critical threshold | string | `"90"` | no |
| jvm\_heap\_memory\_usage\_threshold\_warning | Cluster Status warning threshold | string | `"80"` | no |
| jvm\_heap\_memory\_usage\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| jvm\_heap\_memory\_usage\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_5m"` | no |
| jvm\_memory\_old\_usage\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| jvm\_memory\_old\_usage\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| jvm\_memory\_old\_usage\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| jvm\_memory\_old\_usage\_threshold\_critical | Cluster Status  critical threshold | string | `"90"` | no |
| jvm\_memory\_old\_usage\_threshold\_warning | Cluster Status warning threshold | string | `"80"` | no |
| jvm\_memory\_old\_usage\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| jvm\_memory\_old\_usage\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_10m"` | no |
| jvm\_memory\_young\_usage\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| jvm\_memory\_young\_usage\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| jvm\_memory\_young\_usage\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| jvm\_memory\_young\_usage\_threshold\_critical | Cluster Status  critical threshold | string | `"90"` | no |
| jvm\_memory\_young\_usage\_threshold\_warning | Cluster Status warning threshold | string | `"80"` | no |
| jvm\_memory\_young\_usage\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| jvm\_memory\_young\_usage\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_10m"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before begin to monitor new host | string | `"300"` | no |
| node\_free\_space\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| node\_free\_space\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| node\_free\_space\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| node\_free\_space\_threshold\_critical | Cluster Status  critical threshold | string | `"10"` | no |
| node\_free\_space\_threshold\_warning | Cluster Status warning threshold | string | `"20"` | no |
| node\_free\_space\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"sum"` | no |
| node\_free\_space\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_5m"` | no |
| not\_responding\_enabled | Flag to enable Elasticsearch does not respond monitor | string | `"true"` | no |
| not\_responding\_extra\_tags | Extra tags for Elasticsearch does not respond monitor | list(string) | `[]` | no |
| not\_responding\_message | Custom message for Elasticsearch does not respond monitor | string | `""` | no |
| not\_responding\_no\_data\_timeframe | Elasticsearch not responding monitor no data timeframe | string | `"10"` | no |
| not\_responding\_threshold\_warning | Elasticsearch not responding limit (warning threshold) | string | `"3"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| query\_cache\_evictions\_change\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| query\_cache\_evictions\_change\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| query\_cache\_evictions\_change\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| query\_cache\_evictions\_change\_threshold\_critical | Cluster Status  critical threshold | string | `"120"` | no |
| query\_cache\_evictions\_change\_threshold\_warning | Cluster Status warning threshold | string | `"60"` | no |
| query\_cache\_evictions\_change\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| query\_cache\_evictions\_change\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_15m"` | no |
| query\_cache\_evictions\_change\_timeshift | Timeframe for the Cluster Status monitor | string | `"last_15m"` | no |
| request\_cache\_evictions\_change\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| request\_cache\_evictions\_change\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| request\_cache\_evictions\_change\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| request\_cache\_evictions\_change\_threshold\_critical | Cluster Status  critical threshold | string | `"120"` | no |
| request\_cache\_evictions\_change\_threshold\_warning | Cluster Status warning threshold | string | `"60"` | no |
| request\_cache\_evictions\_change\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| request\_cache\_evictions\_change\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_15m"` | no |
| request\_cache\_evictions\_change\_timeshift | Timeshift for the Cluster Status monitor | string | `"last_15m"` | no |
| search\_query\_change\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| search\_query\_change\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| search\_query\_change\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| search\_query\_change\_threshold\_critical | Cluster Status  critical threshold | string | `"100"` | no |
| search\_query\_change\_threshold\_warning | Cluster Status warning threshold | string | `"75"` | no |
| search\_query\_change\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| search\_query\_change\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_10m"` | no |
| search\_query\_change\_timeshift | Timeshift for the Cluster Status monitor | string | `"last_10m"` | no |
| search\_query\_latency\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| search\_query\_latency\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| search\_query\_latency\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| search\_query\_latency\_threshold\_critical | Cluster Status  critical threshold | string | `"1"` | no |
| search\_query\_latency\_threshold\_warning | Cluster Status warning threshold | string | `"0.5"` | no |
| search\_query\_latency\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| search\_query\_latency\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_10m"` | no |
| task\_time\_in\_queue\_change\_enabled | Flag to enable Cluster Status monitor | string | `"true"` | no |
| task\_time\_in\_queue\_change\_extra\_tags | Extra tags for Cluster Status monitor | list(string) | `[]` | no |
| task\_time\_in\_queue\_change\_message | Custom message for the Cluster Status monitor | string | `""` | no |
| task\_time\_in\_queue\_change\_threshold\_critical | Cluster Status  critical threshold | string | `"200"` | no |
| task\_time\_in\_queue\_change\_threshold\_warning | Cluster Status warning threshold | string | `"100"` | no |
| task\_time\_in\_queue\_change\_time\_aggregator | Time aggregator for the Cluster Status monitor | string | `"avg"` | no |
| task\_time\_in\_queue\_change\_timeframe | Timeframe for the Cluster Status monitor | string | `"last_10m"` | no |
| task\_time\_in\_queue\_change\_timeshift | Timeshift for the Cluster Status monitor | string | `"last_10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_initializing\_shards\_id | id for monitor cluster_initializing_shards |
| cluster\_relocating\_shards\_id | id for monitor cluster_relocating_shards |
| cluster\_status\_not\_green\_id | id for monitor cluster_status_not_green |
| cluster\_unassigned\_shards\_id | id for monitor cluster_unassigned_shards |
| fetch\_change\_id | id for monitor fetch_change |
| fetch\_latency\_id | id for monitor fetch_latency |
| field\_data\_evictions\_change\_id | id for monitor field_data_evictions_change |
| flush\_latency\_id | id for monitor flush_latency |
| http\_connections\_anomaly\_id | id for monitor http_connections_anomaly |
| indexing\_latency\_id | id for monitor indexing_latency |
| jvm\_gc\_old\_collection\_latency\_id | id for monitor jvm_gc_old_collection_latency |
| jvm\_gc\_young\_collection\_latency\_id | id for monitor jvm_gc_young_collection_latency |
| jvm\_heap\_memory\_usage\_id | id for monitor jvm_heap_memory_usage |
| jvm\_memory\_old\_usage\_id | id for monitor jvm_memory_old_usage |
| jvm\_memory\_young\_usage\_id | id for monitor jvm_memory_young_usage |
| node\_free\_space\_id | id for monitor node_free_space |
| not\_responding\_id | id for monitor not_responding |
| query\_cache\_evictions\_change\_id | id for monitor query_cache_evictions_change |
| request\_cache\_evictions\_change\_id | id for monitor request_cache_evictions_change |
| search\_query\_change\_id | id for monitor search_query_change |
| search\_query\_latency\_id | id for monitor search_query_latency |
| task\_time\_in\_queue\_change\_id | id for monitor task_time_in_queue_change |

## Related documentation
* [Integration Datadog & ElasticSearch](https://docs.datadoghq.com/integrations/elastic/)
* [How to monitor ElasticSearch with Datadog](https://www.datadoghq.com/blog/monitor-elasticsearch-datadog/)
