# CLOUD AZURE SERVICEBUS DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-servicebus" {
  source = "claranet/monitors/datadog//cloud/azure/servicebus"
  version = "{revision}"

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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| no\_active\_connections\_enabled | Flag to enable Service Bus no active connections monitor | string | `"true"` | no |
| no\_active\_connections\_extra\_tags | Extra tags for Service Bus no active connections monitor | list(string) | `[]` | no |
| no\_active\_connections\_message | Custom message for Service Bus no active connections monitor | string | `""` | no |
| no\_active\_connections\_time\_aggregator | Monitor aggregator for Service Bus no active connections [available values: min, max or avg] | string | `"max"` | no |
| no\_active\_connections\_timeframe | Monitor timeframe for Service Bus no active connections [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| notify\_no\_data | Will raise no data alert if set to true | string | `"true"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| server\_errors\_enabled | Flag to enable Service Bus server errors monitor | string | `"true"` | no |
| server\_errors\_extra\_tags | Extra tags for Service Bus server errors monitor | list(string) | `[]` | no |
| server\_errors\_message | Custom message for Service Bus server errors monitor | string | `""` | no |
| server\_errors\_threshold\_critical | Critical threshold for Service Bus server errors monitor | string | `"90"` | no |
| server\_errors\_threshold\_warning | Warning threshold for Service Bus server errors monitor | string | `"50"` | no |
| server\_errors\_time\_aggregator | Monitor aggregator for Service Bus server errors [available values: min, max or avg] | string | `"min"` | no |
| server\_errors\_timeframe | Monitor timeframe for Service Bus server errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| status\_enabled | Flag to enable Service Bus status monitor | string | `"true"` | no |
| status\_extra\_tags | Extra tags for Service Bus status monitor | list(string) | `[]` | no |
| status\_message | Custom message for Service Bus status monitor | string | `""` | no |
| status\_time\_aggregator | Monitor aggregator for Service Bus status [available values: min, max or avg] | string | `"max"` | no |
| status\_timeframe | Monitor timeframe for Service Bus status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| user\_errors\_enabled | Flag to enable Service Bus user errors monitor | string | `"true"` | no |
| user\_errors\_extra\_tags | Extra tags for Service Bus user errors monitor | list(string) | `[]` | no |
| user\_errors\_message | Custom message for Service Bus user errors monitor | string | `""` | no |
| user\_errors\_threshold\_critical | Critical threshold for Service Bus user errors monitor | string | `"90"` | no |
| user\_errors\_threshold\_warning | Warning threshold for Service Bus user errors monitor | string | `"50"` | no |
| user\_errors\_time\_aggregator | Monitor aggregator for Service Bus user errors [available values: min, max or avg] | string | `"min"` | no |
| user\_errors\_timeframe | Monitor timeframe for Service Bus user errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| service\_bus\_no\_active\_connections\_id | id for monitor service_bus_no_active_connections |
| service\_bus\_server\_errors\_id | id for monitor service_bus_server_errors |
| service\_bus\_user\_errors\_id | id for monitor service_bus_user_errors |
| servicebus\_status\_id | id for monitor servicebus_status |

## Related documentation

DataDog documentation : [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)  
You must search `servicebus`, there is no integration for now.

Azure metrics documentation : [https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftservicebusnamespaces](https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftservicebusnamespaces)
