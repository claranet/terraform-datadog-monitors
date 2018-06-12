AWS ElastiCache Redis Service DataDog monitors
==============================================

How to use this module
----------------------

```
module "datadog-monitors-aws-elasticache-redis" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/aws/elasticache/redis?ref={revision}"

  message           = "${module.datadog-message-alerting.alerting-message}"
  environment       = "${var.environment}"
  elasticache_size  = "${var.size_of_elsaticache}"
  nodes             = "${data.my_cluster.num_cache_nodes}"
}

```

You can retrieve the number of nodes using the data source :

```
data "aws_elasticache_cluster" "my_cluster" {
  cluster_id = "my-cluster-id"
}

```

Purpose
-------
Creates DataDog monitors with the following checks:

* Cache hits
* CPU high
* Commands received
* Replication lag

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cache_hits_message | Custom message for Elasticache redis cache hits monitor | string | `` | no |
| cache_hits_silenced | Groups to mute for Elasticache redis cache hits monitor | map | `<map>` | no |
| cache_hits_threshold_critical | Elasticache redis cache hits critical threshold in percentage | string | `10` | no |
| cache_hits_threshold_warning | Elasticache redis cache hits warning threshold in percentage | string | `20` | no |
| cache_hits_timeframe | Monitor timeframe for Elasticache redis cache hits [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| commands_message | Custom message for Elasticache redis commands monitor | string | `` | no |
| commands_silenced | Groups to mute for Elasticache redis commands monitor | map | `<map>` | no |
| commands_timeframe | Monitor timeframe for Elasticache redis commands [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| cpu_high_message | Custom message for Elasticache redis cpu high monitor | string | `` | no |
| cpu_high_silenced | Groups to mute for Elasticache redis cpu high monitor | map | `<map>` | no |
| cpu_high_threshold_critical | Elasticache redis cpu high critical threshold in percentage | string | `90` | no |
| cpu_high_threshold_warning | Elasticache redis cpu high warning threshold in percentage | string | `75` | no |
| cpu_high_time_aggregator | Monitor aggregator for Elasticache redis cpu high [available values: min, max or avg] | string | `avg` | no |
| cpu_high_timeframe | Monitor timeframe for Elasticache redis cpu high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| elasticache_size | Size of the Elasticache instance | string | - | yes |
| environment | Infrastructure Environment | string | - | yes |
| eviction_growing_condition_timeframe | Monitor condition timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| eviction_growing_message | Custom message for Elasticache eviction growing monitor | string | `` | no |
| eviction_growing_silenced | Groups to mute for Elasticache eviction growing monitor | map | `<map>` | no |
| eviction_growing_threshold_critical | Elasticache eviction growing critical threshold in percentage | string | `30` | no |
| eviction_growing_threshold_warning | Elasticache eviction growing warning threshold in percentage | string | `10` | no |
| eviction_growing_timeframe | Monitor timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| eviction_message | Custom message for Elasticache eviction monitor | string | `` | no |
| eviction_silenced | Groups to mute for Elasticache eviction monitor | map | `<map>` | no |
| eviction_time_aggregator | Monitor aggregator for Elasticache eviction [available values: min, max or avg] | string | `min` | no |
| eviction_timeframe | Monitor timeframe for Elasticache eviction [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| free_memory_condition_timeframe | Monitor condition timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| free_memory_message | Custom message for Elasticache free memory monitor | string | `` | no |
| free_memory_silenced | Groups to mute for Elasticache free memory monitor | map | `<map>` | no |
| free_memory_threshold_critical | Elasticache free memory critical threshold in percentage | string | `-70` | no |
| free_memory_threshold_warning | Elasticache free memory warning threshold in percentage | string | `-50` | no |
| free_memory_timeframe | Monitor timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| max_connection_message | Custom message for Elasticache max connection monitor | string | `` | no |
| max_connection_silenced | Groups to mute for Elasticache max connection monitor | map | `<map>` | no |
| max_connection_time_aggregator | Monitor aggregator for Elasticache max connection [available values: min, max or avg] | string | `max` | no |
| max_connection_timeframe | Monitor timeframe for Elasticache max connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| no_connection_message | Custom message for Elasticache no connection monitor | string | `` | no |
| no_connection_silenced | Groups to mute for Elasticache no connection monitor | map | `<map>` | no |
| no_connection_time_aggregator | Monitor aggregator for Elasticache no connection [available values: min, max or avg] | string | `min` | no |
| no_connection_timeframe | Monitor timeframe for Elasticache no connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| nodes | Number of Elasticache nodes | string | - | yes |
| replication_lag_message | Custom message for Elasticache redis replication lag monitor | string | `` | no |
| replication_lag_silenced | Groups to mute for Elasticache redis replication lag monitor | map | `<map>` | no |
| replication_lag_threshold_critical | Elasticache redis replication lag critical threshold in seconds | string | `1` | no |
| replication_lag_threshold_warning | Elasticache redis replication lag warning threshold in seconds | string | `0` | no |
| replication_lag_time_aggregator | Monitor aggregator for Elasticache redis replication lag [available values: min, max or avg] | string | `min` | no |
| replication_lag_timeframe | Monitor timeframe for Elasticache redis replication lag [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| swap_message | Custom message for Elasticache swap monitor | string | `` | no |
| swap_silenced | Groups to mute for Elasticache swap monitor | map | `<map>` | no |
| swap_threshold_critical | Elasticache swap critical threshold in percentage | string | `50000000` | no |
| swap_threshold_warning | Elasticache swap warning threshold in percentage | string | `0` | no |
| swap_time_aggregator | Monitor aggregator for Elasticache memcached swap [available values: min, max or avg] | string | `min` | no |
| swap_timeframe | Monitor timeframe for Elasticache swap [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

Related documentation
---------------------

DataDog documentation:

* [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)
* [https://www.datadoghq.com/dashboards/elasticache-dashboard-redis/](https://www.datadoghq.com/dashboards/elasticache-dashboard-redis/)
* [https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/](https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/)

AWS ElasticSearch Service Instance metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/elasticache-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/elasticache-metricscollected.html)
