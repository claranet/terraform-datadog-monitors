# CLOUD AZURE SERVICEBUS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-servicebus" {
  source      = "claranet/monitors/datadog//cloud/azure/servicebus"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Service Bus has no active connection
- Service Bus is down
- Service Bus server errors rate is high
- Service Bus user errors rate is high

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
| [datadog_monitor.service_bus_no_active_connections](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.service_bus_server_errors](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.service_bus_user_errors](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.servicebus_status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_no_active_connections_enabled"></a> [no\_active\_connections\_enabled](#input\_no\_active\_connections\_enabled) | Flag to enable Service Bus no active connections monitor | `string` | `"true"` | no |
| <a name="input_no_active_connections_extra_tags"></a> [no\_active\_connections\_extra\_tags](#input\_no\_active\_connections\_extra\_tags) | Extra tags for Service Bus no active connections monitor | `list(string)` | `[]` | no |
| <a name="input_no_active_connections_message"></a> [no\_active\_connections\_message](#input\_no\_active\_connections\_message) | Custom message for Service Bus no active connections monitor | `string` | `""` | no |
| <a name="input_no_active_connections_time_aggregator"></a> [no\_active\_connections\_time\_aggregator](#input\_no\_active\_connections\_time\_aggregator) | Monitor aggregator for Service Bus no active connections [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_no_active_connections_timeframe"></a> [no\_active\_connections\_timeframe](#input\_no\_active\_connections\_timeframe) | Monitor timeframe for Service Bus no active connections [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_server_errors_enabled"></a> [server\_errors\_enabled](#input\_server\_errors\_enabled) | Flag to enable Service Bus server errors monitor | `string` | `"true"` | no |
| <a name="input_server_errors_extra_tags"></a> [server\_errors\_extra\_tags](#input\_server\_errors\_extra\_tags) | Extra tags for Service Bus server errors monitor | `list(string)` | `[]` | no |
| <a name="input_server_errors_message"></a> [server\_errors\_message](#input\_server\_errors\_message) | Custom message for Service Bus server errors monitor | `string` | `""` | no |
| <a name="input_server_errors_threshold_critical"></a> [server\_errors\_threshold\_critical](#input\_server\_errors\_threshold\_critical) | Critical threshold for Service Bus server errors monitor | `number` | `90` | no |
| <a name="input_server_errors_threshold_warning"></a> [server\_errors\_threshold\_warning](#input\_server\_errors\_threshold\_warning) | Warning threshold for Service Bus server errors monitor | `number` | `50` | no |
| <a name="input_server_errors_time_aggregator"></a> [server\_errors\_time\_aggregator](#input\_server\_errors\_time\_aggregator) | Monitor aggregator for Service Bus server errors [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_server_errors_timeframe"></a> [server\_errors\_timeframe](#input\_server\_errors\_timeframe) | Monitor timeframe for Service Bus server errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_servicebus_status_no_data_timeframe"></a> [servicebus\_status\_no\_data\_timeframe](#input\_servicebus\_status\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_status_enabled"></a> [status\_enabled](#input\_status\_enabled) | Flag to enable Service Bus status monitor | `string` | `"true"` | no |
| <a name="input_status_extra_tags"></a> [status\_extra\_tags](#input\_status\_extra\_tags) | Extra tags for Service Bus status monitor | `list(string)` | `[]` | no |
| <a name="input_status_message"></a> [status\_message](#input\_status\_message) | Custom message for Service Bus status monitor | `string` | `""` | no |
| <a name="input_status_time_aggregator"></a> [status\_time\_aggregator](#input\_status\_time\_aggregator) | Monitor aggregator for Service Bus status [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_status_timeframe"></a> [status\_timeframe](#input\_status\_timeframe) | Monitor timeframe for Service Bus status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |
| <a name="input_user_errors_enabled"></a> [user\_errors\_enabled](#input\_user\_errors\_enabled) | Flag to enable Service Bus user errors monitor | `string` | `"true"` | no |
| <a name="input_user_errors_extra_tags"></a> [user\_errors\_extra\_tags](#input\_user\_errors\_extra\_tags) | Extra tags for Service Bus user errors monitor | `list(string)` | `[]` | no |
| <a name="input_user_errors_message"></a> [user\_errors\_message](#input\_user\_errors\_message) | Custom message for Service Bus user errors monitor | `string` | `""` | no |
| <a name="input_user_errors_threshold_critical"></a> [user\_errors\_threshold\_critical](#input\_user\_errors\_threshold\_critical) | Critical threshold for Service Bus user errors monitor | `number` | `90` | no |
| <a name="input_user_errors_threshold_warning"></a> [user\_errors\_threshold\_warning](#input\_user\_errors\_threshold\_warning) | Warning threshold for Service Bus user errors monitor | `number` | `50` | no |
| <a name="input_user_errors_time_aggregator"></a> [user\_errors\_time\_aggregator](#input\_user\_errors\_time\_aggregator) | Monitor aggregator for Service Bus user errors [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_user_errors_timeframe"></a> [user\_errors\_timeframe](#input\_user\_errors\_timeframe) | Monitor timeframe for Service Bus user errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_bus_no_active_connections_id"></a> [service\_bus\_no\_active\_connections\_id](#output\_service\_bus\_no\_active\_connections\_id) | id for monitor service\_bus\_no\_active\_connections |
| <a name="output_service_bus_server_errors_id"></a> [service\_bus\_server\_errors\_id](#output\_service\_bus\_server\_errors\_id) | id for monitor service\_bus\_server\_errors |
| <a name="output_service_bus_user_errors_id"></a> [service\_bus\_user\_errors\_id](#output\_service\_bus\_user\_errors\_id) | id for monitor service\_bus\_user\_errors |
| <a name="output_servicebus_status_id"></a> [servicebus\_status\_id](#output\_servicebus\_status\_id) | id for monitor servicebus\_status |
<!-- END_TF_DOCS -->
## Related documentation

DataDog documentation : [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)  
You must search `servicebus`, there is no integration for now.

Azure metrics documentation : [https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftservicebusnamespaces](https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftservicebusnamespaces)
