AWS ElasticCache Memcached Service DataDog monitors
===================================================

How to use this module
----------------------

```
module "datadog-monitors-aws-elasticcache-redis" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/aws/elasticache/memcached?ref={revision}"

  message = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}

```

Purpose
-------
Creates DataDog monitors with the following checks :

* Get requests missed

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture Environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| get_requests_miss_aggregator | Monitor aggregator for Elasticache Memcached get requests missed [available values: min, max, sum or avg] | string | `min` | no |
| get_requests_miss_message | Custom message for Elasticache Memcached get requests missed monitor | string | `` | no |
| get_requests_miss_silenced | Groups to mute for Elasticache Memcached get requests missed monitor | map | `<map>` | no |
| get_requests_miss_threshold_critical | Elasticache Memcached get requests missed critical threshold in percentage | string | `95` | no |
| get_requests_miss_threshold_warning | Elasticache Memcached get requests missed warning threshold in percentage | string | `80` | no |
| get_requests_miss_timeframe | Monitor timeframe for Elasticache Memcached get requests missed [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| message | Message sent when an alert is triggered | string | - | yes |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)

AWS ElasticSearch Service Instance metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/elasticache-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/elasticache-metricscollected.html)
