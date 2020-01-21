# CLOUD AZURE FUNCTIONS DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-functions" {
  source = "claranet/monitors/datadog//cloud/azure/functions"
  version = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Function App connections count too high
- Function App HTTP 5xx errors too high
- Function App threads count too high

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| high\_connections\_count\_enabled | Flag to enable Functions high connections count monitor | `string` | `"true"` | no |
| high\_connections\_count\_extra\_tags | Extra tags for Functions high connections count monitor | `list(string)` | `[]` | no |
| high\_connections\_count\_message | Custom message for Functions high connections count monitor | `string` | `""` | no |
| high\_connections\_count\_threshold\_critical | Alerting threshold for Functions high connections count | `number` | `590` | no |
| high\_connections\_count\_threshold\_warning | Warning threshold for Functions high connections count | `number` | `550` | no |
| high\_connections\_count\_time\_aggregator | Monitor aggregator for Functions high connections count [available values: min, max or avg] | `string` | `"min"` | no |
| high\_connections\_count\_timeframe | Monitor timeframe for Functions high connections count [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| high\_threads\_count\_enabled | Flag to enable Functions high threads count monitor | `string` | `"true"` | no |
| high\_threads\_count\_extra\_tags | Extra tags for Functions high threads count monitor | `list(string)` | `[]` | no |
| high\_threads\_count\_message | Custom message for Functions high threads count monitor | `string` | `""` | no |
| high\_threads\_count\_threshold\_critical | Alerting threshold for Functions high threads count | `number` | `510` | no |
| high\_threads\_count\_threshold\_warning | Warning threshold for Functions high threads count | `number` | `490` | no |
| high\_threads\_count\_time\_aggregator | Monitor aggregator for Functions high threads count [available values: min, max or avg] | `string` | `"min"` | no |
| high\_threads\_count\_timeframe | Monitor timeframe for Functions high threads count [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| http\_5xx\_errors\_rate\_enabled | Flag to enable Functions Http 5xx errors rate monitor | `string` | `"true"` | no |
| http\_5xx\_errors\_rate\_extra\_tags | Extra tags for Functions Http 5xx errors rate monitor | `list(string)` | `[]` | no |
| http\_5xx\_errors\_rate\_message | Custom message for Functions Http 5xx errors rate monitor | `string` | `""` | no |
| http\_5xx\_errors\_rate\_threshold\_critical | Alerting threshold for Functions Http 5xx errors rate | `number` | `20` | no |
| http\_5xx\_errors\_rate\_threshold\_warning | Warning threshold for Functions Http 5xx errors rate | `number` | `10` | no |
| http\_5xx\_errors\_rate\_time\_aggregator | Monitor aggregator for Functions Http 5xx errors rate [available values: min, max or avg] | `string` | `"min"` | no |
| http\_5xx\_errors\_rate\_timeframe | Monitor timeframe for Functions Http 5xx errors rate [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| function\_high\_connections\_count\_id | id for monitor function\_high\_connections\_count |
| function\_high\_threads\_count\_id | id for monitor function\_high\_threads\_count |
| function\_http\_5xx\_errors\_rate\_id | id for monitor function\_http\_5xx\_errors\_rate |

## Related documentation

Datadog Azure documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)

Azure Monitor metrics: [https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftwebsites-functions](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftwebsites-functions)

Azure Functions connections limits: [https://docs.microsoft.com/en-us/azure/azure-functions/manage-connections#connections-limit](https://docs.microsoft.com/en-us/azure/azure-functions/manage-connections#connections-limit)
