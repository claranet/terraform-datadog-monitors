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

No requirements.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| conversion\_errors\_enabled | Flag to enable Stream Analytics conversion errors monitor | `string` | `"true"` | no |
| conversion\_errors\_extra\_tags | Extra tags for Stream Analytics conversion errors monitor | `list(string)` | `[]` | no |
| conversion\_errors\_message | Custom message for Stream Analytics conversion errors monitor | `string` | `""` | no |
| conversion\_errors\_threshold\_critical | Conversion errors limit (critical threshold) | `number` | `10` | no |
| conversion\_errors\_threshold\_warning | Conversion errors limit (warning threshold) | `number` | `0` | no |
| conversion\_errors\_time\_aggregator | Monitor aggregator for Stream Analytics conversion errors [available values: min, max or avg] | `string` | `"min"` | no |
| conversion\_errors\_timeframe | Monitor timeframe for Stream Analytics conversion errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| failed\_function\_requests\_enabled | Flag to enable Stream Analytics failed requests monitor | `string` | `"true"` | no |
| failed\_function\_requests\_extra\_tags | Extra tags for Stream Analytics failed requests monitor | `list(string)` | `[]` | no |
| failed\_function\_requests\_message | Custom message for Stream Analytics failed requests monitor | `string` | `""` | no |
| failed\_function\_requests\_threshold\_critical | Failed Function Request rate limit (critical threshold) | `number` | `10` | no |
| failed\_function\_requests\_threshold\_warning | Failed Function Request rate limit (warning threshold) | `number` | `0` | no |
| failed\_function\_requests\_time\_aggregator | Monitor aggregator for Stream Analytics failed requests [available values: min, max or avg] | `string` | `"min"` | no |
| failed\_function\_requests\_timeframe | Monitor timeframe for Stream Analytics failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when a Redis monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| runtime\_errors\_enabled | Flag to enable Stream Analytics runtime errors monitor | `string` | `"true"` | no |
| runtime\_errors\_extra\_tags | Extra tags for Stream Analytics runtime errors monitor | `list(string)` | `[]` | no |
| runtime\_errors\_message | Custom message for Stream Analytics runtime errors monitor | `string` | `""` | no |
| runtime\_errors\_threshold\_critical | Runtime errors limit (critical threshold) | `number` | `10` | no |
| runtime\_errors\_threshold\_warning | Runtime errors limit (warning threshold) | `number` | `0` | no |
| runtime\_errors\_time\_aggregator | Monitor aggregator for Stream Analytics runtime errors [available values: min, max or avg] | `string` | `"min"` | no |
| runtime\_errors\_timeframe | Monitor timeframe for Stream Analytics runtime errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| status\_enabled | Flag to enable Stream Analytics status monitor | `string` | `"true"` | no |
| status\_extra\_tags | Extra tags for Stream Analytics status monitor | `list(string)` | `[]` | no |
| status\_message | Custom message for Stream Analytics status monitor | `string` | `""` | no |
| status\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `10` | no |
| status\_time\_aggregator | Monitor aggregator for Stream Analytics status [available values: min, max or avg] | `string` | `"max"` | no |
| status\_timeframe | Monitor timeframe for Stream Analytics status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| su\_utilization\_enabled | Flag to enable Stream Analytics utilization monitor | `string` | `"true"` | no |
| su\_utilization\_extra\_tags | Extra tags for Stream Analytics utilization monitor | `list(string)` | `[]` | no |
| su\_utilization\_message | Custom message for Stream Analytics utilization monitor | `string` | `""` | no |
| su\_utilization\_threshold\_critical | Streaming Unit utilization rate limit (critical threshold) | `number` | `95` | no |
| su\_utilization\_threshold\_warning | Streaming Unit utilization rate limit (warning threshold) | `number` | `80` | no |
| su\_utilization\_time\_aggregator | Monitor aggregator for Stream Analytics utilization [available values: min, max or avg] | `string` | `"min"` | no |
| su\_utilization\_timeframe | Monitor timeframe for Stream Analytics utilization [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| conversion\_errors\_id | id for monitor conversion\_errors |
| failed\_function\_requests\_id | id for monitor failed\_function\_requests |
| runtime\_errors\_id | id for monitor runtime\_errors |
| status\_id | id for monitor status |
| su\_utilization\_id | id for monitor su\_utilization |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)
