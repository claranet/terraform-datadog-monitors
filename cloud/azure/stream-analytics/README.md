# CLOUD AZURE STREAM-ANALYTICS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-stream-analytics" {
  source      = "claranet/monitors/datadog//cloud/azure/stream-analytics"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Stream Analytics is down
- Stream Analytics streaming units utilization too high
- Stream Analytics too many conversion errors
- Stream Analytics too many failed requests
- Stream Analytics too many runtime errors

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
| [datadog_monitor.conversion_errors](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.failed_function_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.runtime_errors](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.su_utilization](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_conversion_errors_enabled"></a> [conversion\_errors\_enabled](#input\_conversion\_errors\_enabled) | Flag to enable Stream Analytics conversion errors monitor | `string` | `"true"` | no |
| <a name="input_conversion_errors_extra_tags"></a> [conversion\_errors\_extra\_tags](#input\_conversion\_errors\_extra\_tags) | Extra tags for Stream Analytics conversion errors monitor | `list(string)` | `[]` | no |
| <a name="input_conversion_errors_message"></a> [conversion\_errors\_message](#input\_conversion\_errors\_message) | Custom message for Stream Analytics conversion errors monitor | `string` | `""` | no |
| <a name="input_conversion_errors_threshold_critical"></a> [conversion\_errors\_threshold\_critical](#input\_conversion\_errors\_threshold\_critical) | Conversion errors limit (critical threshold) | `number` | `10` | no |
| <a name="input_conversion_errors_threshold_warning"></a> [conversion\_errors\_threshold\_warning](#input\_conversion\_errors\_threshold\_warning) | Conversion errors limit (warning threshold) | `number` | `0` | no |
| <a name="input_conversion_errors_time_aggregator"></a> [conversion\_errors\_time\_aggregator](#input\_conversion\_errors\_time\_aggregator) | Monitor aggregator for Stream Analytics conversion errors [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_conversion_errors_timeframe"></a> [conversion\_errors\_timeframe](#input\_conversion\_errors\_timeframe) | Monitor timeframe for Stream Analytics conversion errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_failed_function_requests_enabled"></a> [failed\_function\_requests\_enabled](#input\_failed\_function\_requests\_enabled) | Flag to enable Stream Analytics failed requests monitor | `string` | `"true"` | no |
| <a name="input_failed_function_requests_extra_tags"></a> [failed\_function\_requests\_extra\_tags](#input\_failed\_function\_requests\_extra\_tags) | Extra tags for Stream Analytics failed requests monitor | `list(string)` | `[]` | no |
| <a name="input_failed_function_requests_message"></a> [failed\_function\_requests\_message](#input\_failed\_function\_requests\_message) | Custom message for Stream Analytics failed requests monitor | `string` | `""` | no |
| <a name="input_failed_function_requests_threshold_critical"></a> [failed\_function\_requests\_threshold\_critical](#input\_failed\_function\_requests\_threshold\_critical) | Failed Function Request rate limit (critical threshold) | `number` | `10` | no |
| <a name="input_failed_function_requests_threshold_warning"></a> [failed\_function\_requests\_threshold\_warning](#input\_failed\_function\_requests\_threshold\_warning) | Failed Function Request rate limit (warning threshold) | `number` | `0` | no |
| <a name="input_failed_function_requests_time_aggregator"></a> [failed\_function\_requests\_time\_aggregator](#input\_failed\_function\_requests\_time\_aggregator) | Monitor aggregator for Stream Analytics failed requests [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_failed_function_requests_timeframe"></a> [failed\_function\_requests\_timeframe](#input\_failed\_function\_requests\_timeframe) | Monitor timeframe for Stream Analytics failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a Redis monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_runtime_errors_enabled"></a> [runtime\_errors\_enabled](#input\_runtime\_errors\_enabled) | Flag to enable Stream Analytics runtime errors monitor | `string` | `"true"` | no |
| <a name="input_runtime_errors_extra_tags"></a> [runtime\_errors\_extra\_tags](#input\_runtime\_errors\_extra\_tags) | Extra tags for Stream Analytics runtime errors monitor | `list(string)` | `[]` | no |
| <a name="input_runtime_errors_message"></a> [runtime\_errors\_message](#input\_runtime\_errors\_message) | Custom message for Stream Analytics runtime errors monitor | `string` | `""` | no |
| <a name="input_runtime_errors_threshold_critical"></a> [runtime\_errors\_threshold\_critical](#input\_runtime\_errors\_threshold\_critical) | Runtime errors limit (critical threshold) | `number` | `10` | no |
| <a name="input_runtime_errors_threshold_warning"></a> [runtime\_errors\_threshold\_warning](#input\_runtime\_errors\_threshold\_warning) | Runtime errors limit (warning threshold) | `number` | `0` | no |
| <a name="input_runtime_errors_time_aggregator"></a> [runtime\_errors\_time\_aggregator](#input\_runtime\_errors\_time\_aggregator) | Monitor aggregator for Stream Analytics runtime errors [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_runtime_errors_timeframe"></a> [runtime\_errors\_timeframe](#input\_runtime\_errors\_timeframe) | Monitor timeframe for Stream Analytics runtime errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_status_enabled"></a> [status\_enabled](#input\_status\_enabled) | Flag to enable Stream Analytics status monitor | `string` | `"true"` | no |
| <a name="input_status_extra_tags"></a> [status\_extra\_tags](#input\_status\_extra\_tags) | Extra tags for Stream Analytics status monitor | `list(string)` | `[]` | no |
| <a name="input_status_message"></a> [status\_message](#input\_status\_message) | Custom message for Stream Analytics status monitor | `string` | `""` | no |
| <a name="input_status_no_data_timeframe"></a> [status\_no\_data\_timeframe](#input\_status\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_status_time_aggregator"></a> [status\_time\_aggregator](#input\_status\_time\_aggregator) | Monitor aggregator for Stream Analytics status [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_status_timeframe"></a> [status\_timeframe](#input\_status\_timeframe) | Monitor timeframe for Stream Analytics status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_su_utilization_enabled"></a> [su\_utilization\_enabled](#input\_su\_utilization\_enabled) | Flag to enable Stream Analytics utilization monitor | `string` | `"true"` | no |
| <a name="input_su_utilization_extra_tags"></a> [su\_utilization\_extra\_tags](#input\_su\_utilization\_extra\_tags) | Extra tags for Stream Analytics utilization monitor | `list(string)` | `[]` | no |
| <a name="input_su_utilization_message"></a> [su\_utilization\_message](#input\_su\_utilization\_message) | Custom message for Stream Analytics utilization monitor | `string` | `""` | no |
| <a name="input_su_utilization_threshold_critical"></a> [su\_utilization\_threshold\_critical](#input\_su\_utilization\_threshold\_critical) | Streaming Unit utilization rate limit (critical threshold) | `number` | `95` | no |
| <a name="input_su_utilization_threshold_warning"></a> [su\_utilization\_threshold\_warning](#input\_su\_utilization\_threshold\_warning) | Streaming Unit utilization rate limit (warning threshold) | `number` | `80` | no |
| <a name="input_su_utilization_time_aggregator"></a> [su\_utilization\_time\_aggregator](#input\_su\_utilization\_time\_aggregator) | Monitor aggregator for Stream Analytics utilization [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_su_utilization_timeframe"></a> [su\_utilization\_timeframe](#input\_su\_utilization\_timeframe) | Monitor timeframe for Stream Analytics utilization [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_conversion_errors_id"></a> [conversion\_errors\_id](#output\_conversion\_errors\_id) | id for monitor conversion\_errors |
| <a name="output_failed_function_requests_id"></a> [failed\_function\_requests\_id](#output\_failed\_function\_requests\_id) | id for monitor failed\_function\_requests |
| <a name="output_runtime_errors_id"></a> [runtime\_errors\_id](#output\_runtime\_errors\_id) | id for monitor runtime\_errors |
| <a name="output_status_id"></a> [status\_id](#output\_status\_id) | id for monitor status |
| <a name="output_su_utilization_id"></a> [su\_utilization\_id](#output\_su\_utilization\_id) | id for monitor su\_utilization |
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)
