AWS ElasticCache Redis Service DataDog monitors
===============================================

How to use this module
----------------------

```
module "datadog-monitors-aws-elasticcache-redis" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/aws/elasticache/redis?ref={revision}"

  message = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}

```

Purpose
-------
Creates DataDog monitors with the following checks :

* Cache Miss

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cache_miss_aggregator | Monitor aggregator for Elasticache Redis cache miss [available values: min, max, sum or avg] | string | `min` | no |
| cache_miss_message | Custom message for Elasticache Redis cache miss monitor | string | `` | no |
| cache_miss_silenced | Groups to mute for Elasticache Redis cache miss monitor | map | `<map>` | no |
| cache_miss_threshold_critical | Elasticache Redis cache miss critical threshold in percentage | string | `95` | no |
| cache_miss_threshold_warning | Elasticache Redis cache miss warning threshold in percentage | string | `80` | no |
| cache_miss_timeframe | Monitor timeframe for Elasticache Redis cache miss [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture Environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)

AWS ElasticSearch Service Instance metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/elasticache-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/elasticache-metricscollected.html)
