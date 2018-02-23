AWS Kinesis Firehose DataDog monitors
==========================================

How to use this module
----------------------

```
module "datadog-monitors-aws-firehose" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/aws/kinesis-firehose?ref={revision}"

  message = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}

```

Purpose
-------
Creates DataDog monitors with the following checks :

* No incoming record

Inputs
------
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| incoming_records_timeframe | Monitor timeframe for incoming records metrics evaluation [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| message | Message sent when an alert is triggered | string | - | yes |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_firehose/](https://docs.datadoghq.com/integrations/amazon_firehose/)

AWS Kinesis Firehose metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/akf-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/akf-metricscollected.html)
