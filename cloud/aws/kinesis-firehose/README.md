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

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.firehose_incoming_records](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_firehose_incoming_records_no_data_timeframe"></a> [firehose\_incoming\_records\_no\_data\_timeframe](#input\_firehose\_incoming\_records\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `30` | no |
| <a name="input_incoming_records_enabled"></a> [incoming\_records\_enabled](#input\_incoming\_records\_enabled) | Flag to enable Kinesis Firehorse incoming records monitor | `string` | `"true"` | no |
| <a name="input_incoming_records_extra_tags"></a> [incoming\_records\_extra\_tags](#input\_incoming\_records\_extra\_tags) | Extra tags for Kinesis Firehorse incoming records monitor | `list(string)` | `[]` | no |
| <a name="input_incoming_records_message"></a> [incoming\_records\_message](#input\_incoming\_records\_message) | Custom message for Kinesis Firehorse incoming records monitor | `string` | `""` | no |
| <a name="input_incoming_records_timeframe"></a> [incoming\_records\_timeframe](#input\_incoming\_records\_timeframe) | Monitor timeframe for incoming records metrics evaluation [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firehose_incoming_records_id"></a> [firehose\_incoming\_records\_id](#output\_firehose\_incoming\_records\_id) | id for monitor firehose\_incoming\_records |
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_firehose/](https://docs.datadoghq.com/integrations/amazon_firehose/)

AWS Kinesis Firehose metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/akf-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/akf-metricscollected.html)
