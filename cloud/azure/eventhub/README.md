# CLOUD AZURE EVENTHUB DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-eventhub" {
  source      = "claranet/monitors/datadog//cloud/azure/eventhub"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Event Hub is down
- Event Hub too many errors
- Event Hub too many failed requests

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
| [datadog_monitor.eventhub_errors](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.eventhub_failed_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.eventhub_status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_errors_rate_enabled"></a> [errors\_rate\_enabled](#input\_errors\_rate\_enabled) | Flag to enable Event Hub errors monitor | `string` | `"true"` | no |
| <a name="input_errors_rate_extra_tags"></a> [errors\_rate\_extra\_tags](#input\_errors\_rate\_extra\_tags) | Extra tags for Event Hub errors monitor | `list(string)` | `[]` | no |
| <a name="input_errors_rate_message"></a> [errors\_rate\_message](#input\_errors\_rate\_message) | Custom message for Event Hub errors monitor | `string` | `""` | no |
| <a name="input_errors_rate_thresold_critical"></a> [errors\_rate\_thresold\_critical](#input\_errors\_rate\_thresold\_critical) | Errors ratio (percentage) to trigger the critical alert | `number` | `90` | no |
| <a name="input_errors_rate_thresold_warning"></a> [errors\_rate\_thresold\_warning](#input\_errors\_rate\_thresold\_warning) | Errors ratio (percentage) to trigger a warning alert | `number` | `50` | no |
| <a name="input_errors_rate_time_aggregator"></a> [errors\_rate\_time\_aggregator](#input\_errors\_rate\_time\_aggregator) | Monitor aggregator for Event Hub errors [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_errors_rate_timeframe"></a> [errors\_rate\_timeframe](#input\_errors\_rate\_timeframe) | Monitor timeframe for Event Hub errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_eventhub_status_no_data_timeframe"></a> [eventhub\_status\_no\_data\_timeframe](#input\_eventhub\_status\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_failed_requests_rate_enabled"></a> [failed\_requests\_rate\_enabled](#input\_failed\_requests\_rate\_enabled) | Flag to enable Event Hub failed requests monitor | `string` | `"true"` | no |
| <a name="input_failed_requests_rate_extra_tags"></a> [failed\_requests\_rate\_extra\_tags](#input\_failed\_requests\_rate\_extra\_tags) | Extra tags for Event Hub failed requests monitor | `list(string)` | `[]` | no |
| <a name="input_failed_requests_rate_message"></a> [failed\_requests\_rate\_message](#input\_failed\_requests\_rate\_message) | Custom message for Event Hub failed requests monitor | `string` | `""` | no |
| <a name="input_failed_requests_rate_thresold_critical"></a> [failed\_requests\_rate\_thresold\_critical](#input\_failed\_requests\_rate\_thresold\_critical) | Failed requests ratio (percentage) to trigger the critical alert | `number` | `90` | no |
| <a name="input_failed_requests_rate_thresold_warning"></a> [failed\_requests\_rate\_thresold\_warning](#input\_failed\_requests\_rate\_thresold\_warning) | Failed requests ratio (percentage) to trigger a warning alert | `number` | `50` | no |
| <a name="input_failed_requests_rate_time_aggregator"></a> [failed\_requests\_rate\_time\_aggregator](#input\_failed\_requests\_rate\_time\_aggregator) | Monitor aggregator for Event Hub failed requests [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_failed_requests_rate_timeframe"></a> [failed\_requests\_rate\_timeframe](#input\_failed\_requests\_rate\_timeframe) | Monitor timeframe for Event Hub failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_status_enabled"></a> [status\_enabled](#input\_status\_enabled) | Flag to enable Event Hub status monitor | `string` | `"true"` | no |
| <a name="input_status_extra_tags"></a> [status\_extra\_tags](#input\_status\_extra\_tags) | Extra tags for Event Hub status monitor | `list(string)` | `[]` | no |
| <a name="input_status_message"></a> [status\_message](#input\_status\_message) | Custom message for Event Hub status monitor | `string` | `""` | no |
| <a name="input_status_time_aggregator"></a> [status\_time\_aggregator](#input\_status\_time\_aggregator) | Monitor aggregator for Event Hub status [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_status_timeframe"></a> [status\_timeframe](#input\_status\_timeframe) | Monitor timeframe for Event Hub status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eventhub_errors_id"></a> [eventhub\_errors\_id](#output\_eventhub\_errors\_id) | id for monitor eventhub\_errors |
| <a name="output_eventhub_failed_requests_id"></a> [eventhub\_failed\_requests\_id](#output\_eventhub\_failed\_requests\_id) | id for monitor eventhub\_failed\_requests |
| <a name="output_eventhub_status_id"></a> [eventhub\_status\_id](#output\_eventhub\_status\_id) | id for monitor eventhub\_status |
## Related documentation

Datadog documentation : [https://docs.datadoghq.com/integrations/azure_event_hub/](https://docs.datadoghq.com/integrations/azure_event_hub/)

Azure metrics documentation : [https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-metrics-azure-monitor](https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-metrics-azure-monitor)
