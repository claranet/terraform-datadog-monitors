AWS ElastiCache Service DataDog monitors
========================================

How to use this module
----------------------

```
module "datadog-monitors-aws-elasticache" {
  source = "../common"

  message = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
  filter_tags = "${var.filter_tags}"
  resource    = "${var.type_of_resource}"
}

```

This module is loaded by default when you define `memcached` or `redis` monitors

Purpose
-------
Creates DataDog monitors with the following checks:

* Eviction
* Swap
* Max connections
* No connection
* Free Memory

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
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
| filter_tags | Tags used for filtering | string | - | yes |
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
| resource | Type of Elasticache used | string | - | yes |
| swap_message | Custom message for Elasticache swap monitor | string | `` | no |
| swap_silenced | Groups to mute for Elasticache swap monitor | map | `<map>` | no |
| swap_threshold_critical | Elasticache swap critical threshold in percentage | string | `50000000` | no |
| swap_threshold_warning | Elasticache swap warning threshold in percentage | string | `0` | no |
| swap_time_aggregator | Monitor aggregator for Elasticache memcached swap [available values: min, max or avg] | string | `min` | no |
| swap_timeframe | Monitor timeframe for Elasticache swap [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)

AWS ElasticSearch Service Instance metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/elasticache-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/elasticache-metricscollected.html)
