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
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Architecture environment | `string` | n/a | yes |
| errors\_rate\_enabled | Flag to enable Event Hub errors monitor | `string` | `"true"` | no |
| errors\_rate\_extra\_tags | Extra tags for Event Hub errors monitor | `list(string)` | `[]` | no |
| errors\_rate\_message | Custom message for Event Hub errors monitor | `string` | `""` | no |
| errors\_rate\_thresold\_critical | Errors ratio (percentage) to trigger the critical alert | `number` | `90` | no |
| errors\_rate\_thresold\_warning | Errors ratio (percentage) to trigger a warning alert | `number` | `50` | no |
| errors\_rate\_time\_aggregator | Monitor aggregator for Event Hub errors [available values: min, max or avg] | `string` | `"min"` | no |
| errors\_rate\_timeframe | Monitor timeframe for Event Hub errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| eventhub\_status\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `10` | no |
| failed\_requests\_rate\_enabled | Flag to enable Event Hub failed requests monitor | `string` | `"true"` | no |
| failed\_requests\_rate\_extra\_tags | Extra tags for Event Hub failed requests monitor | `list(string)` | `[]` | no |
| failed\_requests\_rate\_message | Custom message for Event Hub failed requests monitor | `string` | `""` | no |
| failed\_requests\_rate\_thresold\_critical | Failed requests ratio (percentage) to trigger the critical alert | `number` | `90` | no |
| failed\_requests\_rate\_thresold\_warning | Failed requests ratio (percentage) to trigger a warning alert | `number` | `50` | no |
| failed\_requests\_rate\_time\_aggregator | Monitor aggregator for Event Hub failed requests [available values: min, max or avg] | `string` | `"min"` | no |
| failed\_requests\_rate\_timeframe | Monitor timeframe for Event Hub failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| status\_enabled | Flag to enable Event Hub status monitor | `string` | `"true"` | no |
| status\_extra\_tags | Extra tags for Event Hub status monitor | `list(string)` | `[]` | no |
| status\_message | Custom message for Event Hub status monitor | `string` | `""` | no |
| status\_time\_aggregator | Monitor aggregator for Event Hub status [available values: min, max or avg] | `string` | `"max"` | no |
| status\_timeframe | Monitor timeframe for Event Hub status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| eventhub\_errors\_id | id for monitor eventhub\_errors |
| eventhub\_failed\_requests\_id | id for monitor eventhub\_failed\_requests |
| eventhub\_status\_id | id for monitor eventhub\_status |

## Related documentation

Datadog documentation : [https://docs.datadoghq.com/integrations/azure_event_hub/](https://docs.datadoghq.com/integrations/azure_event_hub/)

Azure metrics documentation : [https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-metrics-azure-monitor](https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-metrics-azure-monitor)
