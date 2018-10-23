# CLOUD AZURE SERVICEBUS DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-servicebus" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors.git//cloud/azure/servicebus?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Service Bus has no active connection
- Service Bus is down
- Service Bus server errors rate is high
- Service Bus user errors rate is high

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `900` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_custom_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |
| no_active_connections_enabled | Flag to enable Service Bus status monitor | string | `true` | no |
| no_active_connections_message | Custom message for Service Bus status monitor | string | `` | no |
| no_active_connections_silenced | Groups to mute for Service Bus status monitor | map | `{}` | no |
| no_active_connections_time_aggregator | Monitor aggregator for Service Bus status [available values: min, max or avg] | string | `max` | no |
| no_active_connections_timeframe | Monitor timeframe for Service Bus status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| server_errors_enabled | Flag to enable Service Bus server errors monitor | string | `true` | no |
| server_errors_message | Custom message for Service Bus server errors monitor | string | `` | no |
| server_errors_silenced | Groups to mute for Service Bus server errors monitor | map | `{}` | no |
| server_errors_threshold_critical | Critical threshold for Service Bus server errors monitor | string | `90` | no |
| server_errors_threshold_warning | Warning threshold for Service Bus server errors monitor | string | `50` | no |
| server_errors_time_aggregator | Monitor aggregator for Service Bus server errors [available values: min, max or avg] | string | `min` | no |
| server_errors_timeframe | Monitor timeframe for Service Bus server errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| status_enabled | Flag to enable Service Bus status monitor | string | `true` | no |
| status_extra_tags | Extra tags for Service Bus status monitor | list | `[]` | no |
| status_message | Custom message for Service Bus status monitor | string | `` | no |
| status_silenced | Groups to mute for Service Bus status monitor | map | `{}` | no |
| status_time_aggregator | Monitor aggregator for Service Bus status [available values: min, max or avg] | string | `max` | no |
| status_timeframe | Monitor timeframe for Service Bus status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| user_errors_enabled | Flag to enable Service Bus user errors monitor | string | `true` | no |
| user_errors_message | Custom message for Service Bus user errors monitor | string | `` | no |
| user_errors_silenced | Groups to mute for Service Bus user errors monitor | map | `{}` | no |
| user_errors_threshold_critical | Critical threshold for Service Bus user errors monitor | string | `90` | no |
| user_errors_threshold_warning | Warning threshold for Service Bus user errors monitor | string | `50` | no |
| user_errors_time_aggregator | Monitor aggregator for Service Bus user errors [available values: min, max or avg] | string | `min` | no |
| user_errors_timeframe | Monitor timeframe for Service Bus user errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

## Outputs

| Name | Description |
|------|-------------|
| service_bus_no_active_connections_id | id for monitor service_bus_no_active_connections |
| service_bus_server_errors_id | id for monitor service_bus_server_errors |
| service_bus_user_errors_id | id for monitor service_bus_user_errors |
| servicebus_status_id | id for monitor servicebus_status |

## Related documentation

DataDog documentation : [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)  
You must search `servicebus`, there is no integration for now.

Azure metrics documentation : [https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftservicebusnamespaces](https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftservicebusnamespaces)
