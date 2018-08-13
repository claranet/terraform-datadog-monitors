# DATABASES ELASTICSEARCH DataDog monitors

## How to use this module

```
module "datadog-monitors-databases-elasticsearch" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//databases/elasticsearch?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
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
| cluster_initializing_shards_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| cluster_initializing_shards_message | Custom message for the Cluster Status monitor | string | `` | no |
| cluster_initializing_shards_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| cluster_initializing_shards_threshold_critical | Cluster Status  critical threshold | string | `2` | no |
| cluster_initializing_shards_threshold_warning | Cluster Status warning threshold | string | `1` | no |
| cluster_initializing_shards_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| cluster_initializing_shards_timeframe | Timeframe for the Cluster Status monitor | string | `last_5m` | no |
| cluster_relocating_shards_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| cluster_relocating_shards_message | Custom message for the Cluster Status monitor | string | `` | no |
| cluster_relocating_shards_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| cluster_relocating_shards_threshold_critical | Cluster Status  critical threshold | string | `2` | no |
| cluster_relocating_shards_threshold_warning | Cluster Status warning threshold | string | `1` | no |
| cluster_relocating_shards_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| cluster_relocating_shards_timeframe | Timeframe for the Cluster Status monitor | string | `last_5m` | no |
| cluster_status_not_green_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| cluster_status_not_green_message | Custom message for the Cluster Status monitor | string | `` | no |
| cluster_status_not_green_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| cluster_status_not_green_threshold_critical | Cluster Status  critical threshold | string | `0` | no |
| cluster_status_not_green_threshold_warning | Cluster Status warning threshold | string | `1` | no |
| cluster_status_not_green_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| cluster_status_not_green_timeframe | Timeframe for the Cluster Status monitor | string | `last_5m` | no |
| cluster_unassigned_shards_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| cluster_unassigned_shards_message | Custom message for the Cluster Status monitor | string | `` | no |
| cluster_unassigned_shards_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| cluster_unassigned_shards_threshold_critical | Cluster Status  critical threshold | string | `2` | no |
| cluster_unassigned_shards_threshold_warning | Cluster Status warning threshold | string | `1` | no |
| cluster_unassigned_shards_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| cluster_unassigned_shards_timeframe | Timeframe for the Cluster Status monitor | string | `last_5m` | no |
| environment | Architecture environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `0` | no |
| fetch_change_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| fetch_change_message | Custom message for the Cluster Status monitor | string | `` | no |
| fetch_change_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| fetch_change_threshold_critical | Cluster Status  critical threshold | string | `100` | no |
| fetch_change_threshold_warning | Cluster Status warning threshold | string | `75` | no |
| fetch_change_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| fetch_change_timeframe | Timeframe for the Cluster Status monitor | string | `last_10m` | no |
| fetch_change_timeshift | Timeshift for the Cluster Status monitor | string | `last_10m` | no |
| fetch_latency_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| fetch_latency_message | Custom message for the Cluster Status monitor | string | `` | no |
| fetch_latency_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| fetch_latency_threshold_critical | Cluster Status  critical threshold | string | `4` | no |
| fetch_latency_threshold_warning | Cluster Status warning threshold | string | `2` | no |
| fetch_latency_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| fetch_latency_timeframe | Timeframe for the Cluster Status monitor | string | `last_10m` | no |
| field_data_evictions_change_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| field_data_evictions_change_message | Custom message for the Cluster Status monitor | string | `` | no |
| field_data_evictions_change_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| field_data_evictions_change_threshold_critical | Cluster Status  critical threshold | string | `120` | no |
| field_data_evictions_change_threshold_warning | Cluster Status warning threshold | string | `60` | no |
| field_data_evictions_change_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| field_data_evictions_change_timeframe | Timeframe for the Cluster Status monitor | string | `last_15m` | no |
| field_data_evictions_change_timeshift | Timeframe for the Cluster Status monitor | string | `last_15m` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| flush_latency_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| flush_latency_message | Custom message for the Cluster Status monitor | string | `` | no |
| flush_latency_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| flush_latency_threshold_critical | Cluster Status  critical threshold | string | `100` | no |
| flush_latency_threshold_warning | Cluster Status warning threshold | string | `50` | no |
| flush_latency_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| flush_latency_timeframe | Timeframe for the Cluster Status monitor | string | `last_10m` | no |
| http_connections_anomaly_alert_window | Alert window. | string | `last_15m` | no |
| http_connections_anomaly_count_default_zero | Count default zero. | string | `true` | no |
| http_connections_anomaly_detection_algorithm | Anomaly Detection Algorithm used | string | `agile` | no |
| http_connections_anomaly_deviations | Deviations to detect the anomaly | string | `2` | no |
| http_connections_anomaly_direction | Direction of the anomaly. It can be both, below or above. | string | `above` | no |
| http_connections_anomaly_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| http_connections_anomaly_interval | Interval. | string | `60` | no |
| http_connections_anomaly_message | Custom message for the Cluster Status monitor | string | `` | no |
| http_connections_anomaly_seasonality | Seasonality of the algorithm | string | `hourly` | no |
| http_connections_anomaly_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| http_connections_anomaly_threshold_critical | Cluster Status  critical threshold | string | `1` | no |
| http_connections_anomaly_threshold_warning | Cluster Status warning threshold | string | `0.75` | no |
| http_connections_anomaly_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| http_connections_anomaly_timeframe | Timeframe for the Cluster Status monitor | string | `last_4h` | no |
| indexing_latency_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| indexing_latency_message | Custom message for the Cluster Status monitor | string | `` | no |
| indexing_latency_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| indexing_latency_threshold_critical | Cluster Status  critical threshold | string | `15` | no |
| indexing_latency_threshold_warning | Cluster Status warning threshold | string | `10` | no |
| indexing_latency_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| indexing_latency_timeframe | Timeframe for the Cluster Status monitor | string | `last_10m` | no |
| jvm_gc_old_collection_latency_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| jvm_gc_old_collection_latency_message | Custom message for the Cluster Status monitor | string | `` | no |
| jvm_gc_old_collection_latency_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| jvm_gc_old_collection_latency_threshold_critical | Cluster Status  critical threshold | string | `200` | no |
| jvm_gc_old_collection_latency_threshold_warning | Cluster Status warning threshold | string | `160` | no |
| jvm_gc_old_collection_latency_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| jvm_gc_old_collection_latency_timeframe | Timeframe for the Cluster Status monitor | string | `last_10m` | no |
| jvm_gc_young_collection_latency_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| jvm_gc_young_collection_latency_message | Custom message for the Cluster Status monitor | string | `` | no |
| jvm_gc_young_collection_latency_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| jvm_gc_young_collection_latency_threshold_critical | Cluster Status  critical threshold | string | `25` | no |
| jvm_gc_young_collection_latency_threshold_warning | Cluster Status warning threshold | string | `20` | no |
| jvm_gc_young_collection_latency_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| jvm_gc_young_collection_latency_timeframe | Timeframe for the Cluster Status monitor | string | `last_10m` | no |
| jvm_heap_memory_usage_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| jvm_heap_memory_usage_message | Custom message for the Cluster Status monitor | string | `` | no |
| jvm_heap_memory_usage_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| jvm_heap_memory_usage_threshold_critical | Cluster Status  critical threshold | string | `90` | no |
| jvm_heap_memory_usage_threshold_warning | Cluster Status warning threshold | string | `80` | no |
| jvm_heap_memory_usage_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| jvm_heap_memory_usage_timeframe | Timeframe for the Cluster Status monitor | string | `last_5m` | no |
| jvm_memory_old_usage_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| jvm_memory_old_usage_message | Custom message for the Cluster Status monitor | string | `` | no |
| jvm_memory_old_usage_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| jvm_memory_old_usage_threshold_critical | Cluster Status  critical threshold | string | `90` | no |
| jvm_memory_old_usage_threshold_warning | Cluster Status warning threshold | string | `80` | no |
| jvm_memory_old_usage_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| jvm_memory_old_usage_timeframe | Timeframe for the Cluster Status monitor | string | `last_10m` | no |
| jvm_memory_young_usage_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| jvm_memory_young_usage_message | Custom message for the Cluster Status monitor | string | `` | no |
| jvm_memory_young_usage_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| jvm_memory_young_usage_threshold_critical | Cluster Status  critical threshold | string | `90` | no |
| jvm_memory_young_usage_threshold_warning | Cluster Status warning threshold | string | `80` | no |
| jvm_memory_young_usage_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| jvm_memory_young_usage_timeframe | Timeframe for the Cluster Status monitor | string | `last_10m` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| new_host_delay | Delay in seconds for the metric evaluation | string | `300` | no |
| node_free_space_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| node_free_space_message | Custom message for the Cluster Status monitor | string | `` | no |
| node_free_space_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| node_free_space_threshold_critical | Cluster Status  critical threshold | string | `10` | no |
| node_free_space_threshold_warning | Cluster Status warning threshold | string | `20` | no |
| node_free_space_time_aggregator | Time aggregator for the Cluster Status monitor | string | `sum` | no |
| node_free_space_timeframe | Timeframe for the Cluster Status monitor | string | `last_5m` | no |
| not_responding_by | Group by for the service check | string | `"port","server"` | no |
| not_responding_extra_tags | Extra tags for Elasticsearch does not respond monitor | list | `<list>` | no |
| not_responding_last | Parameter 'last' for the service check | string | `1` | no |
| not_responding_message | Custom message for Elasticsearch does not respond monitor | string | `` | no |
| not_responding_silenced | Groups to mute for Elasticsearch does not respond monitor | map | `<map>` | no |
| not_responding_threshold_critical | Not responding limit (critical threshold) | string | `5` | no |
| not_responding_threshold_warning | Not responding limit (warning threshold) | string | `0` | no |
| query_cache_evictions_change_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| query_cache_evictions_change_message | Custom message for the Cluster Status monitor | string | `` | no |
| query_cache_evictions_change_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| query_cache_evictions_change_threshold_critical | Cluster Status  critical threshold | string | `120` | no |
| query_cache_evictions_change_threshold_warning | Cluster Status warning threshold | string | `60` | no |
| query_cache_evictions_change_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| query_cache_evictions_change_timeframe | Timeframe for the Cluster Status monitor | string | `last_15m` | no |
| query_cache_evictions_change_timeshift | Timeframe for the Cluster Status monitor | string | `last_15m` | no |
| request_cache_evictions_change_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| request_cache_evictions_change_message | Custom message for the Cluster Status monitor | string | `` | no |
| request_cache_evictions_change_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| request_cache_evictions_change_threshold_critical | Cluster Status  critical threshold | string | `120` | no |
| request_cache_evictions_change_threshold_warning | Cluster Status warning threshold | string | `60` | no |
| request_cache_evictions_change_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| request_cache_evictions_change_timeframe | Timeframe for the Cluster Status monitor | string | `last_15m` | no |
| request_cache_evictions_change_timeshift | Timeshift for the Cluster Status monitor | string | `last_15m` | no |
| search_query_change_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| search_query_change_message | Custom message for the Cluster Status monitor | string | `` | no |
| search_query_change_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| search_query_change_threshold_critical | Cluster Status  critical threshold | string | `100` | no |
| search_query_change_threshold_warning | Cluster Status warning threshold | string | `75` | no |
| search_query_change_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| search_query_change_timeframe | Timeframe for the Cluster Status monitor | string | `last_10m` | no |
| search_query_change_timeshift | Timeshift for the Cluster Status monitor | string | `last_10m` | no |
| search_query_latency_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| search_query_latency_message | Custom message for the Cluster Status monitor | string | `` | no |
| search_query_latency_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| search_query_latency_threshold_critical | Cluster Status  critical threshold | string | `1` | no |
| search_query_latency_threshold_warning | Cluster Status warning threshold | string | `0.5` | no |
| search_query_latency_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| search_query_latency_timeframe | Timeframe for the Cluster Status monitor | string | `last_10m` | no |
| task_time_in_queue_change_extra_tags | Extra tags for Cluster Status monitor | list | `<list>` | no |
| task_time_in_queue_change_message | Custom message for the Cluster Status monitor | string | `` | no |
| task_time_in_queue_change_silenced | Groups to mute for Cluster Status monitor | map | `<map>` | no |
| task_time_in_queue_change_threshold_critical | Cluster Status  critical threshold | string | `200` | no |
| task_time_in_queue_change_threshold_warning | Cluster Status warning threshold | string | `100` | no |
| task_time_in_queue_change_time_aggregator | Time aggregator for the Cluster Status monitor | string | `avg` | no |
| task_time_in_queue_change_timeframe | Timeframe for the Cluster Status monitor | string | `last_10m` | no |
| task_time_in_queue_change_timeshift | Timeshift for the Cluster Status monitor | string | `last_10m` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster_initializing_shards_id | id for monitor cluster_initializing_shards |
| cluster_relocating_shards_id | id for monitor cluster_relocating_shards |
| cluster_status_not_green_id | id for monitor cluster_status_not_green |
| cluster_unassigned_shards_id | id for monitor cluster_unassigned_shards |
| fetch_change_id | id for monitor fetch_change |
| fetch_latency_id | id for monitor fetch_latency |
| field_data_evictions_change_id | id for monitor field_data_evictions_change |
| flush_latency_id | id for monitor flush_latency |
| http_connections_anomaly_id | id for monitor http_connections_anomaly |
| indexing_latency_id | id for monitor indexing_latency |
| jvm_gc_old_collection_latency_id | id for monitor jvm_gc_old_collection_latency |
| jvm_gc_young_collection_latency_id | id for monitor jvm_gc_young_collection_latency |
| jvm_heap_memory_usage_id | id for monitor jvm_heap_memory_usage |
| jvm_memory_old_usage_id | id for monitor jvm_memory_old_usage |
| jvm_memory_young_usage_id | id for monitor jvm_memory_young_usage |
| node_free_space_id | id for monitor node_free_space |
| not_responding_id | id for monitor not_responding |
| query_cache_evictions_change_id | id for monitor query_cache_evictions_change |
| request_cache_evictions_change_id | id for monitor request_cache_evictions_change |
| search_query_change_id | id for monitor search_query_change |
| search_query_latency_id | id for monitor search_query_latency |
| task_time_in_queue_change_id | id for monitor task_time_in_queue_change |

## Related documentation

