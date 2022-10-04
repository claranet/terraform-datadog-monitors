# CLOUD AZURE EVENTGRID DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-eventgrid" {
  source      = "claranet/monitors/datadog//cloud/azure/eventgrid"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Event Grid no successful message
- Event Grid too many failed messages
- Event Grid too many unmatched events

<!-- BEGIN_TF_DOCS -->
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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.eventgrid_failed_messages](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.eventgrid_no_successful_message](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.eventgrid_unmatched_events](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_eventgrid_no_successful_message_no_data_timeframe"></a> [eventgrid\_no\_successful\_message\_no\_data\_timeframe](#input\_eventgrid\_no\_successful\_message\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_failed_messages_rate_enabled"></a> [failed\_messages\_rate\_enabled](#input\_failed\_messages\_rate\_enabled) | Flag to enable Event Grid failed messages monitor | `string` | `"true"` | no |
| <a name="input_failed_messages_rate_extra_tags"></a> [failed\_messages\_rate\_extra\_tags](#input\_failed\_messages\_rate\_extra\_tags) | Extra tags for Event Grid failed messages monitor | `list(string)` | `[]` | no |
| <a name="input_failed_messages_rate_message"></a> [failed\_messages\_rate\_message](#input\_failed\_messages\_rate\_message) | Custom message for Event Grid failed messages monitor | `string` | `""` | no |
| <a name="input_failed_messages_rate_thresold_critical"></a> [failed\_messages\_rate\_thresold\_critical](#input\_failed\_messages\_rate\_thresold\_critical) | Failed messages ratio (percentage) to trigger the critical alert | `number` | `90` | no |
| <a name="input_failed_messages_rate_thresold_warning"></a> [failed\_messages\_rate\_thresold\_warning](#input\_failed\_messages\_rate\_thresold\_warning) | Failed messages ratio (percentage) to trigger a warning alert | `number` | `50` | no |
| <a name="input_failed_messages_rate_time_aggregator"></a> [failed\_messages\_rate\_time\_aggregator](#input\_failed\_messages\_rate\_time\_aggregator) | Monitor aggregator for Event Grid failed messages [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_failed_messages_rate_timeframe"></a> [failed\_messages\_rate\_timeframe](#input\_failed\_messages\_rate\_timeframe) | Monitor timeframe for Event Grid failed messages [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_no_successful_message_rate_enabled"></a> [no\_successful\_message\_rate\_enabled](#input\_no\_successful\_message\_rate\_enabled) | Flag to enable Event Grid no successful message monitor | `string` | `"true"` | no |
| <a name="input_no_successful_message_rate_extra_tags"></a> [no\_successful\_message\_rate\_extra\_tags](#input\_no\_successful\_message\_rate\_extra\_tags) | Extra tags for Event Grid no successful message monitor | `list(string)` | `[]` | no |
| <a name="input_no_successful_message_rate_message"></a> [no\_successful\_message\_rate\_message](#input\_no\_successful\_message\_rate\_message) | Custom message for Event Grid no successful message monitor | `string` | `""` | no |
| <a name="input_no_successful_message_rate_time_aggregator"></a> [no\_successful\_message\_rate\_time\_aggregator](#input\_no\_successful\_message\_rate\_time\_aggregator) | Monitor aggregator for Event Grid no successful message [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_no_successful_message_rate_timeframe"></a> [no\_successful\_message\_rate\_timeframe](#input\_no\_successful\_message\_rate\_timeframe) | Monitor timeframe for Event Grid no successful message [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |
| <a name="input_unmatched_events_rate_enabled"></a> [unmatched\_events\_rate\_enabled](#input\_unmatched\_events\_rate\_enabled) | Flag to enable Event Grid unmatched events monitor | `string` | `"true"` | no |
| <a name="input_unmatched_events_rate_extra_tags"></a> [unmatched\_events\_rate\_extra\_tags](#input\_unmatched\_events\_rate\_extra\_tags) | Extra tags for Event Grid unmatched events monitor | `list(string)` | `[]` | no |
| <a name="input_unmatched_events_rate_message"></a> [unmatched\_events\_rate\_message](#input\_unmatched\_events\_rate\_message) | Custom message for Event Grid unmatched events monitor | `string` | `""` | no |
| <a name="input_unmatched_events_rate_thresold_critical"></a> [unmatched\_events\_rate\_thresold\_critical](#input\_unmatched\_events\_rate\_thresold\_critical) | Unmatched events ratio (percentage) to trigger the critical alert | `number` | `90` | no |
| <a name="input_unmatched_events_rate_thresold_warning"></a> [unmatched\_events\_rate\_thresold\_warning](#input\_unmatched\_events\_rate\_thresold\_warning) | Unmatched events ratio (percentage) to trigger a warning alert | `number` | `50` | no |
| <a name="input_unmatched_events_rate_time_aggregator"></a> [unmatched\_events\_rate\_time\_aggregator](#input\_unmatched\_events\_rate\_time\_aggregator) | Monitor aggregator for Event Grid unmatched events [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_unmatched_events_rate_timeframe"></a> [unmatched\_events\_rate\_timeframe](#input\_unmatched\_events\_rate\_timeframe) | Monitor timeframe for Event Grid unmatched events [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eventgrid_failed_messages_id"></a> [eventgrid\_failed\_messages\_id](#output\_eventgrid\_failed\_messages\_id) | id for monitor eventgrid\_failed\_messages |
| <a name="output_eventgrid_no_successful_message_id"></a> [eventgrid\_no\_successful\_message\_id](#output\_eventgrid\_no\_successful\_message\_id) | id for monitor eventgrid\_no\_successful\_message |
| <a name="output_eventgrid_unmatched_events_id"></a> [eventgrid\_unmatched\_events\_id](#output\_eventgrid\_unmatched\_events\_id) | id for monitor eventgrid\_unmatched\_events |
<!-- END_TF_DOCS -->
## Related documentation

Datadog Azure documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)

Azure "Monitor event delivery" documentation: [https://docs.microsoft.com/en-us/azure/event-grid/monitor-event-delivery](https://docs.microsoft.com/en-us/azure/event-grid/monitor-event-delivery)

Azure Monitor metrics: [https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsofteventgridtopics](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsofteventgridtopics)
