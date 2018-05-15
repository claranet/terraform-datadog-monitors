AWS ElasticCache Service DataDog monitors
=========================================

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

Purpose
-------
Creates DataDog monitors with the following checks :

* Eviction

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture Environment | string | - | yes |
| eviction_aggregator | Monitor aggregator for Elasticache eviction [available values: min, max, sum or avg] | string | `min` | no |
| eviction_message | Custom message for Elasticache eviction monitor | string | `` | no |
| eviction_silenced | Groups to mute for Elasticache eviction monitor | map | `<map>` | no |
| eviction_timeframe | Monitor timeframe for Elasticache eviction [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| filter_tags | Tags used for filtering | string | - | yes |
| message | Message sent when an alert is triggered | string | - | yes |
| resource | Type of Elasticache used | string | - | yes |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)

AWS ElasticSearch Service Instance metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/elasticache-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/elasticache-metricscollected.html)
