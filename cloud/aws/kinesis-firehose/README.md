# CLOUD AWS KINESIS-FIREHOSE DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-aws-kinesis-firehose" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//cloud/aws/kinesis-firehose?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kinesis Firehose No incoming records

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| incoming\_records\_enabled | Flag to enable Kinesis Firehorse incoming records monitor | string | `"true"` | no |
| incoming\_records\_extra\_tags | Extra tags for Kinesis Firehorse incoming records monitor | list | `[]` | no |
| incoming\_records\_message | Custom message for Kinesis Firehorse incoming records monitor | string | `""` | no |
| incoming\_records\_silenced | Groups to mute for Kinesis Firehorse incoming records monitor | map | `{}` | no |
| incoming\_records\_timeframe | Monitor timeframe for incoming records metrics evaluation [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |

## Outputs

| Name | Description |
|------|-------------|
| firehose\_incoming\_records\_id | id for monitor firehose_incoming_records |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_firehose/](https://docs.datadoghq.com/integrations/amazon_firehose/)

AWS Kinesis Firehose metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/akf-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/akf-metricscollected.html)
