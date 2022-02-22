# CLOUD GCP PUBSUB TOPIC DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-gcp-pubsub-topic" {
  source      = "claranet/monitors/datadog//cloud/gcp/pubsub/topic"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Pub/Sub Topic ratio of sending messages with result unavailable
- Pub/Sub Topic sending messages operations
- Pub/Sub Topic sending messages with result unavailable (disabled by default)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.1.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.sending_operations_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.unavailable_sending_operations_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.unavailable_sending_operations_ratio](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags"></a> [filter\_tags](#input\_filter\_tags) | Tags used for filtering | `string` | `"*"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds for the new host evaluation | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_sending_operations_count_enabled"></a> [sending\_operations\_count\_enabled](#input\_sending\_operations\_count\_enabled) | Flag to enable GCP Pub/Sub Unavailable Sending Operations Count monitor | `string` | `"true"` | no |
| <a name="input_sending_operations_count_extra_tags"></a> [sending\_operations\_count\_extra\_tags](#input\_sending\_operations\_count\_extra\_tags) | Extra tags for GCP Pub/Sub Sending Operations Count monitor | `list(string)` | `[]` | no |
| <a name="input_sending_operations_count_message"></a> [sending\_operations\_count\_message](#input\_sending\_operations\_count\_message) | Custom message for the GCP Pub/Sub Sending Operations Count monitor | `string` | `""` | no |
| <a name="input_sending_operations_count_threshold_critical"></a> [sending\_operations\_count\_threshold\_critical](#input\_sending\_operations\_count\_threshold\_critical) | Critical threshold for the number of sending operations. | `string` | `0` | no |
| <a name="input_sending_operations_count_time_aggregator"></a> [sending\_operations\_count\_time\_aggregator](#input\_sending\_operations\_count\_time\_aggregator) | Timeframe for the GCP Pub/Sub Sending Operations Count monitor | `string` | `"sum"` | no |
| <a name="input_sending_operations_count_timeframe"></a> [sending\_operations\_count\_timeframe](#input\_sending\_operations\_count\_timeframe) | Timeframe for the GCP Pub/Sub Sending Operations Count monitor | `string` | `"last_30m"` | no |
| <a name="input_unavailable_sending_operations_count_enabled"></a> [unavailable\_sending\_operations\_count\_enabled](#input\_unavailable\_sending\_operations\_count\_enabled) | Flag to enable GCP Pub/Sub Unavailable Sending Operations Count monitor | `string` | `"false"` | no |
| <a name="input_unavailable_sending_operations_count_extra_tags"></a> [unavailable\_sending\_operations\_count\_extra\_tags](#input\_unavailable\_sending\_operations\_count\_extra\_tags) | Extra tags for GCP Pub/Sub Unavailable Sending Operations Count monitor | `list(string)` | `[]` | no |
| <a name="input_unavailable_sending_operations_count_message"></a> [unavailable\_sending\_operations\_count\_message](#input\_unavailable\_sending\_operations\_count\_message) | Custom message for the GCP Pub/Sub Unavailable Sending Operations Count monitor | `string` | `""` | no |
| <a name="input_unavailable_sending_operations_count_threshold_critical"></a> [unavailable\_sending\_operations\_count\_threshold\_critical](#input\_unavailable\_sending\_operations\_count\_threshold\_critical) | Critical threshold for the number of unavailable sending operations | `string` | `4` | no |
| <a name="input_unavailable_sending_operations_count_threshold_warning"></a> [unavailable\_sending\_operations\_count\_threshold\_warning](#input\_unavailable\_sending\_operations\_count\_threshold\_warning) | Warning threshold for the number of unavailable sending operations | `string` | `2` | no |
| <a name="input_unavailable_sending_operations_count_time_aggregator"></a> [unavailable\_sending\_operations\_count\_time\_aggregator](#input\_unavailable\_sending\_operations\_count\_time\_aggregator) | Timeframe for the GCP Pub/Sub Unavailable Sending Operations Count monitor | `string` | `"sum"` | no |
| <a name="input_unavailable_sending_operations_count_timeframe"></a> [unavailable\_sending\_operations\_count\_timeframe](#input\_unavailable\_sending\_operations\_count\_timeframe) | Timeframe for the GCP Pub/Sub Unavailable Sending Operations Count monitor | `string` | `"last_10m"` | no |
| <a name="input_unavailable_sending_operations_ratio_enabled"></a> [unavailable\_sending\_operations\_ratio\_enabled](#input\_unavailable\_sending\_operations\_ratio\_enabled) | Flag to enable GCP Pub/Sub Unavailable Sending Operations Ratio monitor | `string` | `"true"` | no |
| <a name="input_unavailable_sending_operations_ratio_extra_tags"></a> [unavailable\_sending\_operations\_ratio\_extra\_tags](#input\_unavailable\_sending\_operations\_ratio\_extra\_tags) | Extra tags for GCP Pub/Sub Unavailable Sending Operations Ratio monitor | `list(string)` | `[]` | no |
| <a name="input_unavailable_sending_operations_ratio_message"></a> [unavailable\_sending\_operations\_ratio\_message](#input\_unavailable\_sending\_operations\_ratio\_message) | Custom message for the GCP Pub/Sub Unavailable Sending Operations Ratio monitor | `string` | `""` | no |
| <a name="input_unavailable_sending_operations_ratio_threshold_critical"></a> [unavailable\_sending\_operations\_ratio\_threshold\_critical](#input\_unavailable\_sending\_operations\_ratio\_threshold\_critical) | Critical threshold (%) for the ratio of unavailable sending operations | `string` | `20` | no |
| <a name="input_unavailable_sending_operations_ratio_threshold_warning"></a> [unavailable\_sending\_operations\_ratio\_threshold\_warning](#input\_unavailable\_sending\_operations\_ratio\_threshold\_warning) | Warning threshold (%) for the ratio of unavailable sending operations | `string` | `10` | no |
| <a name="input_unavailable_sending_operations_ratio_time_aggregator"></a> [unavailable\_sending\_operations\_ratio\_time\_aggregator](#input\_unavailable\_sending\_operations\_ratio\_time\_aggregator) | Timeframe for the GCP Pub/Sub Unavailable Sending Operations Ratio monitor | `string` | `"sum"` | no |
| <a name="input_unavailable_sending_operations_ratio_timeframe"></a> [unavailable\_sending\_operations\_ratio\_timeframe](#input\_unavailable\_sending\_operations\_ratio\_timeframe) | Timeframe for the GCP Pub/Sub Unavailable Sending Operations Ratio monitor | `string` | `"last_10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sending_operations_count_id"></a> [sending\_operations\_count\_id](#output\_sending\_operations\_count\_id) | id for monitor sending\_operations\_count |
| <a name="output_unavailable_sending_operations_count_id"></a> [unavailable\_sending\_operations\_count\_id](#output\_unavailable\_sending\_operations\_count\_id) | id for monitor unavailable\_sending\_operations\_count |
| <a name="output_unavailable_sending_operations_ratio_id"></a> [unavailable\_sending\_operations\_ratio\_id](#output\_unavailable\_sending\_operations\_ratio\_id) | id for monitor unavailable\_sending\_operations\_ratio |
## Related documentation

* [GCP Pub/Sub Metrics](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-pubsub)
* [Datadog GCP Pub/Sub integration](https://docs.datadoghq.com/integrations/google_cloud_pubsub/)
