# DATABASE ELASTICSEARCH DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-elasticsearch" {
  source      = "claranet/monitors/datadog//database/elasticsearch"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Elasticsearch average index flushing to disk latency
- Elasticsearch average indexing latency by document
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

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.1.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.cluster_initializing_shards](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.cluster_relocating_shards](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.cluster_status_not_green](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.cluster_unassigned_shards](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.fetch_change](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.fetch_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.field_data_evictions_change](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.flush_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.http_connections_anomaly](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.indexing_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.jvm_gc_old_collection_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.jvm_gc_young_collection_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.jvm_heap_memory_usage](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.jvm_memory_old_usage](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.jvm_memory_young_usage](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.node_free_space](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.not_responding](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.query_cache_evictions_change](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.request_cache_evictions_change](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.search_query_change](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.search_query_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.task_time_in_queue_change](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_initializing_shards_enabled"></a> [cluster\_initializing\_shards\_enabled](#input\_cluster\_initializing\_shards\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_cluster_initializing_shards_extra_tags"></a> [cluster\_initializing\_shards\_extra\_tags](#input\_cluster\_initializing\_shards\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_cluster_initializing_shards_message"></a> [cluster\_initializing\_shards\_message](#input\_cluster\_initializing\_shards\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_cluster_initializing_shards_threshold_critical"></a> [cluster\_initializing\_shards\_threshold\_critical](#input\_cluster\_initializing\_shards\_threshold\_critical) | Cluster Status  critical threshold | `string` | `2` | no |
| <a name="input_cluster_initializing_shards_threshold_warning"></a> [cluster\_initializing\_shards\_threshold\_warning](#input\_cluster\_initializing\_shards\_threshold\_warning) | Cluster Status warning threshold | `string` | `1` | no |
| <a name="input_cluster_initializing_shards_time_aggregator"></a> [cluster\_initializing\_shards\_time\_aggregator](#input\_cluster\_initializing\_shards\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_cluster_initializing_shards_timeframe"></a> [cluster\_initializing\_shards\_timeframe](#input\_cluster\_initializing\_shards\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_5m"` | no |
| <a name="input_cluster_relocating_shards_enabled"></a> [cluster\_relocating\_shards\_enabled](#input\_cluster\_relocating\_shards\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_cluster_relocating_shards_extra_tags"></a> [cluster\_relocating\_shards\_extra\_tags](#input\_cluster\_relocating\_shards\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_cluster_relocating_shards_message"></a> [cluster\_relocating\_shards\_message](#input\_cluster\_relocating\_shards\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_cluster_relocating_shards_threshold_critical"></a> [cluster\_relocating\_shards\_threshold\_critical](#input\_cluster\_relocating\_shards\_threshold\_critical) | Cluster Status  critical threshold | `string` | `2` | no |
| <a name="input_cluster_relocating_shards_threshold_warning"></a> [cluster\_relocating\_shards\_threshold\_warning](#input\_cluster\_relocating\_shards\_threshold\_warning) | Cluster Status warning threshold | `string` | `1` | no |
| <a name="input_cluster_relocating_shards_time_aggregator"></a> [cluster\_relocating\_shards\_time\_aggregator](#input\_cluster\_relocating\_shards\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_cluster_relocating_shards_timeframe"></a> [cluster\_relocating\_shards\_timeframe](#input\_cluster\_relocating\_shards\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_5m"` | no |
| <a name="input_cluster_status_not_green_enabled"></a> [cluster\_status\_not\_green\_enabled](#input\_cluster\_status\_not\_green\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_cluster_status_not_green_extra_tags"></a> [cluster\_status\_not\_green\_extra\_tags](#input\_cluster\_status\_not\_green\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_cluster_status_not_green_message"></a> [cluster\_status\_not\_green\_message](#input\_cluster\_status\_not\_green\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_cluster_status_not_green_threshold_critical"></a> [cluster\_status\_not\_green\_threshold\_critical](#input\_cluster\_status\_not\_green\_threshold\_critical) | Cluster Status  critical threshold | `string` | `0` | no |
| <a name="input_cluster_status_not_green_threshold_warning"></a> [cluster\_status\_not\_green\_threshold\_warning](#input\_cluster\_status\_not\_green\_threshold\_warning) | Cluster Status warning threshold | `string` | `1` | no |
| <a name="input_cluster_status_not_green_time_aggregator"></a> [cluster\_status\_not\_green\_time\_aggregator](#input\_cluster\_status\_not\_green\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_cluster_status_not_green_timeframe"></a> [cluster\_status\_not\_green\_timeframe](#input\_cluster\_status\_not\_green\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_5m"` | no |
| <a name="input_cluster_unassigned_shards_enabled"></a> [cluster\_unassigned\_shards\_enabled](#input\_cluster\_unassigned\_shards\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_cluster_unassigned_shards_extra_tags"></a> [cluster\_unassigned\_shards\_extra\_tags](#input\_cluster\_unassigned\_shards\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_cluster_unassigned_shards_message"></a> [cluster\_unassigned\_shards\_message](#input\_cluster\_unassigned\_shards\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_cluster_unassigned_shards_threshold_critical"></a> [cluster\_unassigned\_shards\_threshold\_critical](#input\_cluster\_unassigned\_shards\_threshold\_critical) | Cluster Status  critical threshold | `string` | `2` | no |
| <a name="input_cluster_unassigned_shards_threshold_warning"></a> [cluster\_unassigned\_shards\_threshold\_warning](#input\_cluster\_unassigned\_shards\_threshold\_warning) | Cluster Status warning threshold | `string` | `1` | no |
| <a name="input_cluster_unassigned_shards_time_aggregator"></a> [cluster\_unassigned\_shards\_time\_aggregator](#input\_cluster\_unassigned\_shards\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_cluster_unassigned_shards_timeframe"></a> [cluster\_unassigned\_shards\_timeframe](#input\_cluster\_unassigned\_shards\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_fetch_change_enabled"></a> [fetch\_change\_enabled](#input\_fetch\_change\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_fetch_change_extra_tags"></a> [fetch\_change\_extra\_tags](#input\_fetch\_change\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_fetch_change_message"></a> [fetch\_change\_message](#input\_fetch\_change\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_fetch_change_threshold_critical"></a> [fetch\_change\_threshold\_critical](#input\_fetch\_change\_threshold\_critical) | Cluster Status  critical threshold | `string` | `100` | no |
| <a name="input_fetch_change_threshold_warning"></a> [fetch\_change\_threshold\_warning](#input\_fetch\_change\_threshold\_warning) | Cluster Status warning threshold | `string` | `75` | no |
| <a name="input_fetch_change_time_aggregator"></a> [fetch\_change\_time\_aggregator](#input\_fetch\_change\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_fetch_change_timeframe"></a> [fetch\_change\_timeframe](#input\_fetch\_change\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_10m"` | no |
| <a name="input_fetch_change_timeshift"></a> [fetch\_change\_timeshift](#input\_fetch\_change\_timeshift) | Timeshift for the Cluster Status monitor | `string` | `"last_10m"` | no |
| <a name="input_fetch_latency_enabled"></a> [fetch\_latency\_enabled](#input\_fetch\_latency\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_fetch_latency_extra_tags"></a> [fetch\_latency\_extra\_tags](#input\_fetch\_latency\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_fetch_latency_message"></a> [fetch\_latency\_message](#input\_fetch\_latency\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_fetch_latency_threshold_critical"></a> [fetch\_latency\_threshold\_critical](#input\_fetch\_latency\_threshold\_critical) | Cluster Status  critical threshold | `string` | `20` | no |
| <a name="input_fetch_latency_threshold_warning"></a> [fetch\_latency\_threshold\_warning](#input\_fetch\_latency\_threshold\_warning) | Cluster Status warning threshold | `string` | `10` | no |
| <a name="input_fetch_latency_time_aggregator"></a> [fetch\_latency\_time\_aggregator](#input\_fetch\_latency\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"min"` | no |
| <a name="input_fetch_latency_timeframe"></a> [fetch\_latency\_timeframe](#input\_fetch\_latency\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_15m"` | no |
| <a name="input_field_data_evictions_change_enabled"></a> [field\_data\_evictions\_change\_enabled](#input\_field\_data\_evictions\_change\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_field_data_evictions_change_extra_tags"></a> [field\_data\_evictions\_change\_extra\_tags](#input\_field\_data\_evictions\_change\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_field_data_evictions_change_message"></a> [field\_data\_evictions\_change\_message](#input\_field\_data\_evictions\_change\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_field_data_evictions_change_threshold_critical"></a> [field\_data\_evictions\_change\_threshold\_critical](#input\_field\_data\_evictions\_change\_threshold\_critical) | Cluster Status  critical threshold | `string` | `120` | no |
| <a name="input_field_data_evictions_change_threshold_warning"></a> [field\_data\_evictions\_change\_threshold\_warning](#input\_field\_data\_evictions\_change\_threshold\_warning) | Cluster Status warning threshold | `string` | `60` | no |
| <a name="input_field_data_evictions_change_time_aggregator"></a> [field\_data\_evictions\_change\_time\_aggregator](#input\_field\_data\_evictions\_change\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_field_data_evictions_change_timeframe"></a> [field\_data\_evictions\_change\_timeframe](#input\_field\_data\_evictions\_change\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_15m"` | no |
| <a name="input_field_data_evictions_change_timeshift"></a> [field\_data\_evictions\_change\_timeshift](#input\_field\_data\_evictions\_change\_timeshift) | Timeframe for the Cluster Status monitor | `string` | `"last_15m"` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_flush_latency_enabled"></a> [flush\_latency\_enabled](#input\_flush\_latency\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_flush_latency_extra_tags"></a> [flush\_latency\_extra\_tags](#input\_flush\_latency\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_flush_latency_message"></a> [flush\_latency\_message](#input\_flush\_latency\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_flush_latency_threshold_critical"></a> [flush\_latency\_threshold\_critical](#input\_flush\_latency\_threshold\_critical) | Cluster Status  critical threshold | `string` | `150` | no |
| <a name="input_flush_latency_threshold_warning"></a> [flush\_latency\_threshold\_warning](#input\_flush\_latency\_threshold\_warning) | Cluster Status warning threshold | `string` | `100` | no |
| <a name="input_flush_latency_time_aggregator"></a> [flush\_latency\_time\_aggregator](#input\_flush\_latency\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_flush_latency_timeframe"></a> [flush\_latency\_timeframe](#input\_flush\_latency\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_15m"` | no |
| <a name="input_http_connections_anomaly_alert_window"></a> [http\_connections\_anomaly\_alert\_window](#input\_http\_connections\_anomaly\_alert\_window) | Alert window. | `string` | `"last_15m"` | no |
| <a name="input_http_connections_anomaly_count_default_zero"></a> [http\_connections\_anomaly\_count\_default\_zero](#input\_http\_connections\_anomaly\_count\_default\_zero) | Count default zero. | `string` | `"true"` | no |
| <a name="input_http_connections_anomaly_detection_algorithm"></a> [http\_connections\_anomaly\_detection\_algorithm](#input\_http\_connections\_anomaly\_detection\_algorithm) | Anomaly Detection Algorithm used | `string` | `"agile"` | no |
| <a name="input_http_connections_anomaly_deviations"></a> [http\_connections\_anomaly\_deviations](#input\_http\_connections\_anomaly\_deviations) | Deviations to detect the anomaly | `string` | `2` | no |
| <a name="input_http_connections_anomaly_direction"></a> [http\_connections\_anomaly\_direction](#input\_http\_connections\_anomaly\_direction) | Direction of the anomaly. It can be both, below or above. | `string` | `"above"` | no |
| <a name="input_http_connections_anomaly_enabled"></a> [http\_connections\_anomaly\_enabled](#input\_http\_connections\_anomaly\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_http_connections_anomaly_extra_tags"></a> [http\_connections\_anomaly\_extra\_tags](#input\_http\_connections\_anomaly\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_http_connections_anomaly_interval"></a> [http\_connections\_anomaly\_interval](#input\_http\_connections\_anomaly\_interval) | Interval. | `string` | `60` | no |
| <a name="input_http_connections_anomaly_message"></a> [http\_connections\_anomaly\_message](#input\_http\_connections\_anomaly\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_http_connections_anomaly_seasonality"></a> [http\_connections\_anomaly\_seasonality](#input\_http\_connections\_anomaly\_seasonality) | Seasonality of the algorithm | `string` | `"hourly"` | no |
| <a name="input_http_connections_anomaly_threshold_critical"></a> [http\_connections\_anomaly\_threshold\_critical](#input\_http\_connections\_anomaly\_threshold\_critical) | Cluster Status  critical threshold | `string` | `1` | no |
| <a name="input_http_connections_anomaly_threshold_warning"></a> [http\_connections\_anomaly\_threshold\_warning](#input\_http\_connections\_anomaly\_threshold\_warning) | Cluster Status warning threshold | `string` | `0.75` | no |
| <a name="input_http_connections_anomaly_time_aggregator"></a> [http\_connections\_anomaly\_time\_aggregator](#input\_http\_connections\_anomaly\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_http_connections_anomaly_timeframe"></a> [http\_connections\_anomaly\_timeframe](#input\_http\_connections\_anomaly\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_4h"` | no |
| <a name="input_indexing_latency_enabled"></a> [indexing\_latency\_enabled](#input\_indexing\_latency\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_indexing_latency_extra_tags"></a> [indexing\_latency\_extra\_tags](#input\_indexing\_latency\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_indexing_latency_message"></a> [indexing\_latency\_message](#input\_indexing\_latency\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_indexing_latency_threshold_critical"></a> [indexing\_latency\_threshold\_critical](#input\_indexing\_latency\_threshold\_critical) | Cluster Status  critical threshold | `string` | `30` | no |
| <a name="input_indexing_latency_threshold_warning"></a> [indexing\_latency\_threshold\_warning](#input\_indexing\_latency\_threshold\_warning) | Cluster Status warning threshold | `string` | `15` | no |
| <a name="input_indexing_latency_time_aggregator"></a> [indexing\_latency\_time\_aggregator](#input\_indexing\_latency\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_indexing_latency_timeframe"></a> [indexing\_latency\_timeframe](#input\_indexing\_latency\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_10m"` | no |
| <a name="input_jvm_gc_old_collection_latency_enabled"></a> [jvm\_gc\_old\_collection\_latency\_enabled](#input\_jvm\_gc\_old\_collection\_latency\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_jvm_gc_old_collection_latency_extra_tags"></a> [jvm\_gc\_old\_collection\_latency\_extra\_tags](#input\_jvm\_gc\_old\_collection\_latency\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_jvm_gc_old_collection_latency_message"></a> [jvm\_gc\_old\_collection\_latency\_message](#input\_jvm\_gc\_old\_collection\_latency\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_jvm_gc_old_collection_latency_threshold_critical"></a> [jvm\_gc\_old\_collection\_latency\_threshold\_critical](#input\_jvm\_gc\_old\_collection\_latency\_threshold\_critical) | Cluster Status  critical threshold | `string` | `300` | no |
| <a name="input_jvm_gc_old_collection_latency_threshold_warning"></a> [jvm\_gc\_old\_collection\_latency\_threshold\_warning](#input\_jvm\_gc\_old\_collection\_latency\_threshold\_warning) | Cluster Status warning threshold | `string` | `200` | no |
| <a name="input_jvm_gc_old_collection_latency_time_aggregator"></a> [jvm\_gc\_old\_collection\_latency\_time\_aggregator](#input\_jvm\_gc\_old\_collection\_latency\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_jvm_gc_old_collection_latency_timeframe"></a> [jvm\_gc\_old\_collection\_latency\_timeframe](#input\_jvm\_gc\_old\_collection\_latency\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_15m"` | no |
| <a name="input_jvm_gc_young_collection_latency_enabled"></a> [jvm\_gc\_young\_collection\_latency\_enabled](#input\_jvm\_gc\_young\_collection\_latency\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_jvm_gc_young_collection_latency_extra_tags"></a> [jvm\_gc\_young\_collection\_latency\_extra\_tags](#input\_jvm\_gc\_young\_collection\_latency\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_jvm_gc_young_collection_latency_message"></a> [jvm\_gc\_young\_collection\_latency\_message](#input\_jvm\_gc\_young\_collection\_latency\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_jvm_gc_young_collection_latency_threshold_critical"></a> [jvm\_gc\_young\_collection\_latency\_threshold\_critical](#input\_jvm\_gc\_young\_collection\_latency\_threshold\_critical) | Cluster Status  critical threshold | `string` | `40` | no |
| <a name="input_jvm_gc_young_collection_latency_threshold_warning"></a> [jvm\_gc\_young\_collection\_latency\_threshold\_warning](#input\_jvm\_gc\_young\_collection\_latency\_threshold\_warning) | Cluster Status warning threshold | `string` | `20` | no |
| <a name="input_jvm_gc_young_collection_latency_time_aggregator"></a> [jvm\_gc\_young\_collection\_latency\_time\_aggregator](#input\_jvm\_gc\_young\_collection\_latency\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_jvm_gc_young_collection_latency_timeframe"></a> [jvm\_gc\_young\_collection\_latency\_timeframe](#input\_jvm\_gc\_young\_collection\_latency\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_15m"` | no |
| <a name="input_jvm_heap_memory_usage_enabled"></a> [jvm\_heap\_memory\_usage\_enabled](#input\_jvm\_heap\_memory\_usage\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_jvm_heap_memory_usage_extra_tags"></a> [jvm\_heap\_memory\_usage\_extra\_tags](#input\_jvm\_heap\_memory\_usage\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_jvm_heap_memory_usage_message"></a> [jvm\_heap\_memory\_usage\_message](#input\_jvm\_heap\_memory\_usage\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_jvm_heap_memory_usage_threshold_critical"></a> [jvm\_heap\_memory\_usage\_threshold\_critical](#input\_jvm\_heap\_memory\_usage\_threshold\_critical) | Cluster Status  critical threshold | `string` | `90` | no |
| <a name="input_jvm_heap_memory_usage_threshold_warning"></a> [jvm\_heap\_memory\_usage\_threshold\_warning](#input\_jvm\_heap\_memory\_usage\_threshold\_warning) | Cluster Status warning threshold | `string` | `80` | no |
| <a name="input_jvm_heap_memory_usage_time_aggregator"></a> [jvm\_heap\_memory\_usage\_time\_aggregator](#input\_jvm\_heap\_memory\_usage\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_jvm_heap_memory_usage_timeframe"></a> [jvm\_heap\_memory\_usage\_timeframe](#input\_jvm\_heap\_memory\_usage\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_5m"` | no |
| <a name="input_jvm_memory_old_usage_enabled"></a> [jvm\_memory\_old\_usage\_enabled](#input\_jvm\_memory\_old\_usage\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_jvm_memory_old_usage_extra_tags"></a> [jvm\_memory\_old\_usage\_extra\_tags](#input\_jvm\_memory\_old\_usage\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_jvm_memory_old_usage_message"></a> [jvm\_memory\_old\_usage\_message](#input\_jvm\_memory\_old\_usage\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_jvm_memory_old_usage_threshold_critical"></a> [jvm\_memory\_old\_usage\_threshold\_critical](#input\_jvm\_memory\_old\_usage\_threshold\_critical) | Cluster Status  critical threshold | `string` | `90` | no |
| <a name="input_jvm_memory_old_usage_threshold_warning"></a> [jvm\_memory\_old\_usage\_threshold\_warning](#input\_jvm\_memory\_old\_usage\_threshold\_warning) | Cluster Status warning threshold | `string` | `80` | no |
| <a name="input_jvm_memory_old_usage_time_aggregator"></a> [jvm\_memory\_old\_usage\_time\_aggregator](#input\_jvm\_memory\_old\_usage\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_jvm_memory_old_usage_timeframe"></a> [jvm\_memory\_old\_usage\_timeframe](#input\_jvm\_memory\_old\_usage\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_10m"` | no |
| <a name="input_jvm_memory_young_usage_enabled"></a> [jvm\_memory\_young\_usage\_enabled](#input\_jvm\_memory\_young\_usage\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_jvm_memory_young_usage_extra_tags"></a> [jvm\_memory\_young\_usage\_extra\_tags](#input\_jvm\_memory\_young\_usage\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_jvm_memory_young_usage_message"></a> [jvm\_memory\_young\_usage\_message](#input\_jvm\_memory\_young\_usage\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_jvm_memory_young_usage_threshold_critical"></a> [jvm\_memory\_young\_usage\_threshold\_critical](#input\_jvm\_memory\_young\_usage\_threshold\_critical) | Cluster Status  critical threshold | `string` | `90` | no |
| <a name="input_jvm_memory_young_usage_threshold_warning"></a> [jvm\_memory\_young\_usage\_threshold\_warning](#input\_jvm\_memory\_young\_usage\_threshold\_warning) | Cluster Status warning threshold | `string` | `80` | no |
| <a name="input_jvm_memory_young_usage_time_aggregator"></a> [jvm\_memory\_young\_usage\_time\_aggregator](#input\_jvm\_memory\_young\_usage\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_jvm_memory_young_usage_timeframe"></a> [jvm\_memory\_young\_usage\_timeframe](#input\_jvm\_memory\_young\_usage\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_10m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before begin to monitor new host | `number` | `300` | no |
| <a name="input_node_free_space_enabled"></a> [node\_free\_space\_enabled](#input\_node\_free\_space\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_node_free_space_extra_tags"></a> [node\_free\_space\_extra\_tags](#input\_node\_free\_space\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_node_free_space_message"></a> [node\_free\_space\_message](#input\_node\_free\_space\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_node_free_space_threshold_critical"></a> [node\_free\_space\_threshold\_critical](#input\_node\_free\_space\_threshold\_critical) | Cluster Status  critical threshold | `string` | `10` | no |
| <a name="input_node_free_space_threshold_warning"></a> [node\_free\_space\_threshold\_warning](#input\_node\_free\_space\_threshold\_warning) | Cluster Status warning threshold | `string` | `20` | no |
| <a name="input_node_free_space_time_aggregator"></a> [node\_free\_space\_time\_aggregator](#input\_node\_free\_space\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"sum"` | no |
| <a name="input_node_free_space_timeframe"></a> [node\_free\_space\_timeframe](#input\_node\_free\_space\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_5m"` | no |
| <a name="input_not_responding_enabled"></a> [not\_responding\_enabled](#input\_not\_responding\_enabled) | Flag to enable Elasticsearch does not respond monitor | `string` | `"true"` | no |
| <a name="input_not_responding_extra_tags"></a> [not\_responding\_extra\_tags](#input\_not\_responding\_extra\_tags) | Extra tags for Elasticsearch does not respond monitor | `list(string)` | `[]` | no |
| <a name="input_not_responding_message"></a> [not\_responding\_message](#input\_not\_responding\_message) | Custom message for Elasticsearch does not respond monitor | `string` | `""` | no |
| <a name="input_not_responding_no_data_timeframe"></a> [not\_responding\_no\_data\_timeframe](#input\_not\_responding\_no\_data\_timeframe) | Elasticsearch not responding monitor no data timeframe | `string` | `10` | no |
| <a name="input_not_responding_threshold_warning"></a> [not\_responding\_threshold\_warning](#input\_not\_responding\_threshold\_warning) | Elasticsearch not responding limit (warning threshold) | `number` | `3` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_query_cache_evictions_change_enabled"></a> [query\_cache\_evictions\_change\_enabled](#input\_query\_cache\_evictions\_change\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_query_cache_evictions_change_extra_tags"></a> [query\_cache\_evictions\_change\_extra\_tags](#input\_query\_cache\_evictions\_change\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_query_cache_evictions_change_message"></a> [query\_cache\_evictions\_change\_message](#input\_query\_cache\_evictions\_change\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_query_cache_evictions_change_threshold_critical"></a> [query\_cache\_evictions\_change\_threshold\_critical](#input\_query\_cache\_evictions\_change\_threshold\_critical) | Cluster Status  critical threshold | `string` | `120` | no |
| <a name="input_query_cache_evictions_change_threshold_warning"></a> [query\_cache\_evictions\_change\_threshold\_warning](#input\_query\_cache\_evictions\_change\_threshold\_warning) | Cluster Status warning threshold | `string` | `60` | no |
| <a name="input_query_cache_evictions_change_time_aggregator"></a> [query\_cache\_evictions\_change\_time\_aggregator](#input\_query\_cache\_evictions\_change\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_query_cache_evictions_change_timeframe"></a> [query\_cache\_evictions\_change\_timeframe](#input\_query\_cache\_evictions\_change\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_15m"` | no |
| <a name="input_query_cache_evictions_change_timeshift"></a> [query\_cache\_evictions\_change\_timeshift](#input\_query\_cache\_evictions\_change\_timeshift) | Timeframe for the Cluster Status monitor | `string` | `"last_15m"` | no |
| <a name="input_request_cache_evictions_change_enabled"></a> [request\_cache\_evictions\_change\_enabled](#input\_request\_cache\_evictions\_change\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_request_cache_evictions_change_extra_tags"></a> [request\_cache\_evictions\_change\_extra\_tags](#input\_request\_cache\_evictions\_change\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_request_cache_evictions_change_message"></a> [request\_cache\_evictions\_change\_message](#input\_request\_cache\_evictions\_change\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_request_cache_evictions_change_threshold_critical"></a> [request\_cache\_evictions\_change\_threshold\_critical](#input\_request\_cache\_evictions\_change\_threshold\_critical) | Cluster Status  critical threshold | `string` | `120` | no |
| <a name="input_request_cache_evictions_change_threshold_warning"></a> [request\_cache\_evictions\_change\_threshold\_warning](#input\_request\_cache\_evictions\_change\_threshold\_warning) | Cluster Status warning threshold | `string` | `60` | no |
| <a name="input_request_cache_evictions_change_time_aggregator"></a> [request\_cache\_evictions\_change\_time\_aggregator](#input\_request\_cache\_evictions\_change\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_request_cache_evictions_change_timeframe"></a> [request\_cache\_evictions\_change\_timeframe](#input\_request\_cache\_evictions\_change\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_15m"` | no |
| <a name="input_request_cache_evictions_change_timeshift"></a> [request\_cache\_evictions\_change\_timeshift](#input\_request\_cache\_evictions\_change\_timeshift) | Timeshift for the Cluster Status monitor | `string` | `"last_15m"` | no |
| <a name="input_search_query_change_enabled"></a> [search\_query\_change\_enabled](#input\_search\_query\_change\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_search_query_change_extra_tags"></a> [search\_query\_change\_extra\_tags](#input\_search\_query\_change\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_search_query_change_message"></a> [search\_query\_change\_message](#input\_search\_query\_change\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_search_query_change_threshold_critical"></a> [search\_query\_change\_threshold\_critical](#input\_search\_query\_change\_threshold\_critical) | Cluster Status  critical threshold | `string` | `100` | no |
| <a name="input_search_query_change_threshold_warning"></a> [search\_query\_change\_threshold\_warning](#input\_search\_query\_change\_threshold\_warning) | Cluster Status warning threshold | `string` | `75` | no |
| <a name="input_search_query_change_time_aggregator"></a> [search\_query\_change\_time\_aggregator](#input\_search\_query\_change\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_search_query_change_timeframe"></a> [search\_query\_change\_timeframe](#input\_search\_query\_change\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_10m"` | no |
| <a name="input_search_query_change_timeshift"></a> [search\_query\_change\_timeshift](#input\_search\_query\_change\_timeshift) | Timeshift for the Cluster Status monitor | `string` | `"last_10m"` | no |
| <a name="input_search_query_latency_enabled"></a> [search\_query\_latency\_enabled](#input\_search\_query\_latency\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_search_query_latency_extra_tags"></a> [search\_query\_latency\_extra\_tags](#input\_search\_query\_latency\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_search_query_latency_message"></a> [search\_query\_latency\_message](#input\_search\_query\_latency\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_search_query_latency_threshold_critical"></a> [search\_query\_latency\_threshold\_critical](#input\_search\_query\_latency\_threshold\_critical) | Cluster Status  critical threshold | `string` | `20` | no |
| <a name="input_search_query_latency_threshold_warning"></a> [search\_query\_latency\_threshold\_warning](#input\_search\_query\_latency\_threshold\_warning) | Cluster Status warning threshold | `string` | `10` | no |
| <a name="input_search_query_latency_time_aggregator"></a> [search\_query\_latency\_time\_aggregator](#input\_search\_query\_latency\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_search_query_latency_timeframe"></a> [search\_query\_latency\_timeframe](#input\_search\_query\_latency\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_15m"` | no |
| <a name="input_task_time_in_queue_change_enabled"></a> [task\_time\_in\_queue\_change\_enabled](#input\_task\_time\_in\_queue\_change\_enabled) | Flag to enable Cluster Status monitor | `string` | `"true"` | no |
| <a name="input_task_time_in_queue_change_extra_tags"></a> [task\_time\_in\_queue\_change\_extra\_tags](#input\_task\_time\_in\_queue\_change\_extra\_tags) | Extra tags for Cluster Status monitor | `list(string)` | `[]` | no |
| <a name="input_task_time_in_queue_change_message"></a> [task\_time\_in\_queue\_change\_message](#input\_task\_time\_in\_queue\_change\_message) | Custom message for the Cluster Status monitor | `string` | `""` | no |
| <a name="input_task_time_in_queue_change_threshold_critical"></a> [task\_time\_in\_queue\_change\_threshold\_critical](#input\_task\_time\_in\_queue\_change\_threshold\_critical) | Cluster Status  critical threshold | `string` | `200` | no |
| <a name="input_task_time_in_queue_change_threshold_warning"></a> [task\_time\_in\_queue\_change\_threshold\_warning](#input\_task\_time\_in\_queue\_change\_threshold\_warning) | Cluster Status warning threshold | `string` | `100` | no |
| <a name="input_task_time_in_queue_change_time_aggregator"></a> [task\_time\_in\_queue\_change\_time\_aggregator](#input\_task\_time\_in\_queue\_change\_time\_aggregator) | Time aggregator for the Cluster Status monitor | `string` | `"avg"` | no |
| <a name="input_task_time_in_queue_change_timeframe"></a> [task\_time\_in\_queue\_change\_timeframe](#input\_task\_time\_in\_queue\_change\_timeframe) | Timeframe for the Cluster Status monitor | `string` | `"last_10m"` | no |
| <a name="input_task_time_in_queue_change_timeshift"></a> [task\_time\_in\_queue\_change\_timeshift](#input\_task\_time\_in\_queue\_change\_timeshift) | Timeshift for the Cluster Status monitor | `string` | `"last_10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_initializing_shards_id"></a> [cluster\_initializing\_shards\_id](#output\_cluster\_initializing\_shards\_id) | id for monitor cluster\_initializing\_shards |
| <a name="output_cluster_relocating_shards_id"></a> [cluster\_relocating\_shards\_id](#output\_cluster\_relocating\_shards\_id) | id for monitor cluster\_relocating\_shards |
| <a name="output_cluster_status_not_green_id"></a> [cluster\_status\_not\_green\_id](#output\_cluster\_status\_not\_green\_id) | id for monitor cluster\_status\_not\_green |
| <a name="output_cluster_unassigned_shards_id"></a> [cluster\_unassigned\_shards\_id](#output\_cluster\_unassigned\_shards\_id) | id for monitor cluster\_unassigned\_shards |
| <a name="output_fetch_change_id"></a> [fetch\_change\_id](#output\_fetch\_change\_id) | id for monitor fetch\_change |
| <a name="output_fetch_latency_id"></a> [fetch\_latency\_id](#output\_fetch\_latency\_id) | id for monitor fetch\_latency |
| <a name="output_field_data_evictions_change_id"></a> [field\_data\_evictions\_change\_id](#output\_field\_data\_evictions\_change\_id) | id for monitor field\_data\_evictions\_change |
| <a name="output_flush_latency_id"></a> [flush\_latency\_id](#output\_flush\_latency\_id) | id for monitor flush\_latency |
| <a name="output_http_connections_anomaly_id"></a> [http\_connections\_anomaly\_id](#output\_http\_connections\_anomaly\_id) | id for monitor http\_connections\_anomaly |
| <a name="output_indexing_latency_id"></a> [indexing\_latency\_id](#output\_indexing\_latency\_id) | id for monitor indexing\_latency |
| <a name="output_jvm_gc_old_collection_latency_id"></a> [jvm\_gc\_old\_collection\_latency\_id](#output\_jvm\_gc\_old\_collection\_latency\_id) | id for monitor jvm\_gc\_old\_collection\_latency |
| <a name="output_jvm_gc_young_collection_latency_id"></a> [jvm\_gc\_young\_collection\_latency\_id](#output\_jvm\_gc\_young\_collection\_latency\_id) | id for monitor jvm\_gc\_young\_collection\_latency |
| <a name="output_jvm_heap_memory_usage_id"></a> [jvm\_heap\_memory\_usage\_id](#output\_jvm\_heap\_memory\_usage\_id) | id for monitor jvm\_heap\_memory\_usage |
| <a name="output_jvm_memory_old_usage_id"></a> [jvm\_memory\_old\_usage\_id](#output\_jvm\_memory\_old\_usage\_id) | id for monitor jvm\_memory\_old\_usage |
| <a name="output_jvm_memory_young_usage_id"></a> [jvm\_memory\_young\_usage\_id](#output\_jvm\_memory\_young\_usage\_id) | id for monitor jvm\_memory\_young\_usage |
| <a name="output_node_free_space_id"></a> [node\_free\_space\_id](#output\_node\_free\_space\_id) | id for monitor node\_free\_space |
| <a name="output_not_responding_id"></a> [not\_responding\_id](#output\_not\_responding\_id) | id for monitor not\_responding |
| <a name="output_query_cache_evictions_change_id"></a> [query\_cache\_evictions\_change\_id](#output\_query\_cache\_evictions\_change\_id) | id for monitor query\_cache\_evictions\_change |
| <a name="output_request_cache_evictions_change_id"></a> [request\_cache\_evictions\_change\_id](#output\_request\_cache\_evictions\_change\_id) | id for monitor request\_cache\_evictions\_change |
| <a name="output_search_query_change_id"></a> [search\_query\_change\_id](#output\_search\_query\_change\_id) | id for monitor search\_query\_change |
| <a name="output_search_query_latency_id"></a> [search\_query\_latency\_id](#output\_search\_query\_latency\_id) | id for monitor search\_query\_latency |
| <a name="output_task_time_in_queue_change_id"></a> [task\_time\_in\_queue\_change\_id](#output\_task\_time\_in\_queue\_change\_id) | id for monitor task\_time\_in\_queue\_change |
## Related documentation
* [Integration Datadog & ElasticSearch](https://docs.datadoghq.com/integrations/elastic/)
* [How to monitor ElasticSearch with Datadog](https://www.datadoghq.com/blog/monitor-elasticsearch-datadog/)
