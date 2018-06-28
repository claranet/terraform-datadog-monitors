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
* Eviction growing
* Swap
* Max connections
* No connection
* Free Memory

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)

AWS ElasticSearch Service Instance metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/elasticache-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/elasticache-metricscollected.html)

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | - | yes |
| environment | Infrastructure Environment | string | - | yes |
| eviction_growing_condition_timeframe | Monitor condition timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | - | yes |
| eviction_growing_message | Custom message for Elasticache eviction growing monitor | string | - | yes |
| eviction_growing_silenced | Groups to mute for Elasticache eviction growing monitor | map | - | yes |
| eviction_growing_threshold_critical | Elasticache eviction growing critical threshold in percentage | string | - | yes |
| eviction_growing_threshold_warning | Elasticache eviction growing warning threshold in percentage | string | - | yes |
| eviction_growing_timeframe | Monitor timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | - | yes |
| eviction_message | Custom message for Elasticache eviction monitor | string | - | yes |
| eviction_silenced | Groups to mute for Elasticache eviction monitor | map | - | yes |
| eviction_time_aggregator | Monitor aggregator for Elasticache eviction [available values: min, max or avg] | string | - | yes |
| eviction_timeframe | Monitor timeframe for Elasticache eviction [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | - | yes |
| filter_tags | Tags used for filtering | string | - | yes |
| free_memory_condition_timeframe | Monitor condition timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | - | yes |
| free_memory_message | Custom message for Elasticache free memory monitor | string | - | yes |
| free_memory_silenced | Groups to mute for Elasticache free memory monitor | map | - | yes |
| free_memory_threshold_critical | Elasticache free memory critical threshold in percentage | string | - | yes |
| free_memory_threshold_warning | Elasticache free memory warning threshold in percentage | string | - | yes |
| free_memory_timeframe | Monitor timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | - | yes |
| max_connection_message | Custom message for Elasticache max connection monitor | string | - | yes |
| max_connection_silenced | Groups to mute for Elasticache max connection monitor | map | - | yes |
| max_connection_time_aggregator | Monitor aggregator for Elasticache max connection [available values: min, max or avg] | string | - | yes |
| max_connection_timeframe | Monitor timeframe for Elasticache max connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | - | yes |
| message | Message sent when an alert is triggered | string | - | yes |
| no_connection_message | Custom message for Elasticache no connection monitor | string | - | yes |
| no_connection_silenced | Groups to mute for Elasticache no connection monitor | map | - | yes |
| no_connection_time_aggregator | Monitor aggregator for Elasticache no connection [available values: min, max or avg] | string | - | yes |
| no_connection_timeframe | Monitor timeframe for Elasticache no connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | - | yes |
| resource | Type of Elasticache used | string | - | yes |
| swap_message | Custom message for Elasticache swap monitor | string | - | yes |
| swap_silenced | Groups to mute for Elasticache swap monitor | map | - | yes |
| swap_threshold_critical | Elasticache swap critical threshold in percentage | string | - | yes |
| swap_threshold_warning | Elasticache swap warning threshold in percentage | string | - | yes |
| swap_time_aggregator | Monitor aggregator for Elasticache memcached swap [available values: min, max or avg] | string | - | yes |
| swap_timeframe | Monitor timeframe for Elasticache swap [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | - | yes |
