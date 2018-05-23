AWS ElasticCache Memcached Service DataDog monitors
===================================================

How to use this module
----------------------

```
module "datadog-monitors-aws-elasticcache-redis" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/aws/elasticache/memcached?ref={revision}"

  message           = "${module.datadog-message-alerting.alerting-message}"
  environment       = "${var.environment}"
  elasticache_size  = "${var.size_of_elsaticache}"
}

```

Purpose
-------
Creates DataDog monitors with the following checks :

* Get Hit
* CPU High
* Swap
* Free memory

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu_high_message | Custom message for Elasticache memcached cpu high monitor | string | `` | no |
| cpu_high_silenced | Groups to mute for Elasticache memcached cpu high monitor | map | `<map>` | no |
| cpu_high_threshold_critical | Elasticache memcached cpu high critical threshold in percentage | string | `90` | no |
| cpu_high_threshold_warning | Elasticache memcached cpu high warning threshold in percentage | string | `75` | no |
| cpu_high_time_aggregator | Monitor aggregator for Elasticache memcached cpu high [available values: min, max or avg] | string | `min` | no |
| cpu_high_timeframe | Monitor timeframe for Elasticache memcached cpu high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| elasticache_size | Size of the Elasticache instance | string | - | yes |
| environment | Architecture Environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| free_memory_message | Custom message for Elasticache memcached free memory monitor | string | `` | no |
| free_memory_silenced | Groups to mute for Elasticache memcached free memory monitor | map | `<map>` | no |
| free_memory_threshold_critical | Elasticache memcached free memory critical threshold in percentage | string | `5` | no |
| free_memory_threshold_warning | Elasticache memcached free memory warning threshold in percentage | string | `10` | no |
| free_memory_time_aggregator | Monitor aggregator for Elasticache memcached free memory [available values: min, max or avg] | string | `min` | no |
| free_memory_timeframe | Monitor timeframe for Elasticache memcached free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| get_hits_message | Custom message for Elasticache memcached get hits monitor | string | `` | no |
| get_hits_silenced | Groups to mute for Elasticache memcached get hits monitor | map | `<map>` | no |
| get_hits_threshold_critical | Elasticache memcached get hits critical threshold in percentage | string | `10` | no |
| get_hits_threshold_warning | Elasticache memcached get hits warning threshold in percentage | string | `20` | no |
| get_hits_timeframe | Monitor timeframe for Elasticache memcached get hits [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| swap_message | Custom message for Elasticache memcached swap monitor | string | `` | no |
| swap_silenced | Groups to mute for Elasticache memcached swap monitor | map | `<map>` | no |
| swap_threshold_critical | Elasticache memcached swap critical threshold in percentage | string | `50` | no |
| swap_threshold_warning | Elasticache memcached swap warning threshold in percentage | string | `0` | no |
| swap_time_aggregator | Monitor aggregator for Elasticache memcached swap [available values: min, max or avg] | string | `min` | no |
| swap_timeframe | Monitor timeframe for Elasticache memcached swap [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

Related documentation
---------------------

DataDog documentation:

* [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)
* [https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/](https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/)


AWS ElasticSearch Service Instance metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/elasticache-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/elasticache-metricscollected.html)
