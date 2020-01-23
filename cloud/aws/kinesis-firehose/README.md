# CLOUD AWS KINESIS-FIREHOSE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-kinesis-firehose" {
  source      = "claranet/monitors/datadog//cloud/aws/kinesis-firehose"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kinesis Firehose No incoming records

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| environment | Environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| firehose\_incoming\_records\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `30` | no |
| incoming\_records\_enabled | Flag to enable Kinesis Firehorse incoming records monitor | `string` | `"true"` | no |
| incoming\_records\_extra\_tags | Extra tags for Kinesis Firehorse incoming records monitor | `list(string)` | `[]` | no |
| incoming\_records\_message | Custom message for Kinesis Firehorse incoming records monitor | `string` | `""` | no |
| incoming\_records\_timeframe | Monitor timeframe for incoming records metrics evaluation [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| firehose\_incoming\_records\_id | id for monitor firehose\_incoming\_records |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_firehose/](https://docs.datadoghq.com/integrations/amazon_firehose/)

AWS Kinesis Firehose metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/akf-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/akf-metricscollected.html)
