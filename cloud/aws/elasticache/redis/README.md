AWS ElasticCache Redis Service DataDog monitors
===============================================

How to use this module
----------------------

```
module "datadog-monitors-aws-elasticcache-redis" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/aws/elasticache/redis?ref={revision}"

  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
  redis_size  = "${var.size_of_redis}"
}

```

Purpose
-------
Creates DataDog monitors with the following checks:

* Cache Hit
* CPU High
* Swap

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cache_hits_aggregator | Monitor aggregator for Elasticache redis cache hits [available values: min, max, sum or avg] | string | `min` | no |
| cache_hits_message | Custom message for Elasticache redis cache hits monitor | string | `` | no |
| cache_hits_silenced | Groups to mute for Elasticache redis cache hits monitor | map | `<map>` | no |
| cache_hits_threshold_critical | Elasticache redis cache hits critical threshold in percentage | string | `10` | no |
| cache_hits_threshold_warning | Elasticache redis cache hits warning threshold in percentage | string | `20` | no |
| cache_hits_timeframe | Monitor timeframe for Elasticache redis cache hits [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| cpu_high_aggregator | Monitor aggregator for Elasticache redis cpu high [available values: min, max, sum or avg] | string | `min` | no |
| cpu_high_message | Custom message for Elasticache redis cpu high monitor | string | `` | no |
| cpu_high_silenced | Groups to mute for Elasticache redis cpu high monitor | map | `<map>` | no |
| cpu_high_threshold_critical | Elasticache redis cpu high critical threshold in percentage | string | `90` | no |
| cpu_high_threshold_warning | Elasticache redis cpu high warning threshold in percentage | string | `75` | no |
| cpu_high_timeframe | Monitor timeframe for Elasticache redis cpu high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture Environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| redis_size | Size of the Elasticache redis instance | string | - | yes |
| swap_aggregator | Monitor aggregator for Elasticache redis swap [available values: min, max, sum or avg] | string | `min` | no |
| swap_message | Custom message for Elasticache redis swap monitor | string | `` | no |
| swap_silenced | Groups to mute for Elasticache redis swap monitor | map | `<map>` | no |
| swap_timeframe | Monitor timeframe for Elasticache redis swap [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)
And more here:

* [https://www.datadoghq.com/dashboards/elasticache-dashboard-redis/](https://www.datadoghq.com/dashboards/elasticache-dashboard-redis/)
* [https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/](https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/)

AWS ElasticSearch Service Instance metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/elasticache-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/elasticache-metricscollected.html)
