# CLOUD AZURE APP-GATEWAY DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-app-gateway" {
  source      = "claranet/monitors/datadog//cloud/azure/app-gateway"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- App Gateway backend connect time is too high
- App Gateway backend HTTP 4xx errors rate is too high
- App Gateway backend HTTP 5xx errors rate is too high
- App Gateway backend unhealthy host ratio is too high
- App Gateway failed requests
- App Gateway has no successful requests
- App Gateway HTTP 4xx errors rate is too high
- App Gateway HTTP 5xx errors rate is too high
- App Gateway is down

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| appgateway\_backend\_connect\_time\_enabled | Flag to enable App Gateway backend\_connect\_time monitor | `string` | `"true"` | no |
| appgateway\_backend\_connect\_time\_extra\_tags | Extra tags for App Gateway backend\_connect\_time monitor | `list(string)` | `[]` | no |
| appgateway\_backend\_connect\_time\_message | Custom message for App Gateway backend\_connect\_time monitor | `string` | `""` | no |
| appgateway\_backend\_connect\_time\_threshold\_critical | Maximum critical backend\_connect\_time errors in milliseconds | `number` | `50` | no |
| appgateway\_backend\_connect\_time\_threshold\_warning | Warning regarding backend\_connect\_time errors in milliseconds | `number` | `40` | no |
| appgateway\_backend\_connect\_time\_time\_aggregator | Monitor aggregator for App Gateway backend\_connect\_time [available values: min, max or avg] | `string` | `"max"` | no |
| appgateway\_backend\_connect\_time\_timeframe | Monitor timeframe for App Gateway backend\_connect\_time [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| appgateway\_backend\_http\_4xx\_errors\_enabled | Flag to enable App Gateway http 4xx errors monitor | `string` | `"true"` | no |
| appgateway\_backend\_http\_4xx\_errors\_extra\_tags | Extra tags for App Gateway http 4xx errors monitor | `list(string)` | `[]` | no |
| appgateway\_backend\_http\_4xx\_errors\_message | Custom message for App Gateway http 4xx errors monitor | `string` | `""` | no |
| appgateway\_backend\_http\_4xx\_errors\_threshold\_critical | Minimum critical acceptable percent of 4xx error | `number` | `95` | no |
| appgateway\_backend\_http\_4xx\_errors\_threshold\_warning | Warning regarding acceptable percent of 4xx error | `number` | `80` | no |
| appgateway\_backend\_http\_4xx\_errors\_time\_aggregator | Monitor aggregator for App Gateway http 4xx errors [available values: min, max or avg] | `string` | `"max"` | no |
| appgateway\_backend\_http\_4xx\_errors\_timeframe | Monitor timeframe for App Gateway http 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| appgateway\_backend\_http\_5xx\_errors\_enabled | Flag to enable App Gateway http 5xx errors monitor | `string` | `"true"` | no |
| appgateway\_backend\_http\_5xx\_errors\_extra\_tags | Extra tags for App Gateway http 5xx errors monitor | `list(string)` | `[]` | no |
| appgateway\_backend\_http\_5xx\_errors\_message | Custom message for App Gateway http 5xx errors monitor | `string` | `""` | no |
| appgateway\_backend\_http\_5xx\_errors\_threshold\_critical | Minimum critical acceptable percent of 5xx error | `number` | `95` | no |
| appgateway\_backend\_http\_5xx\_errors\_threshold\_warning | Warning regarding acceptable percent of 5xx error | `number` | `80` | no |
| appgateway\_backend\_http\_5xx\_errors\_time\_aggregator | Monitor aggregator for App Gateway http 5xx errors [available values: min, max or avg] | `string` | `"max"` | no |
| appgateway\_backend\_http\_5xx\_errors\_timeframe | Monitor timeframe for App Gateway http 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| appgateway\_failed\_requests\_enabled | Flag to enable App Gateway failed requests monitor | `string` | `"true"` | no |
| appgateway\_failed\_requests\_extra\_tags | Extra tags for App Gateway failed requests monitor | `list(string)` | `[]` | no |
| appgateway\_failed\_requests\_message | Custom message for App Gateway failed requests monitor | `string` | `""` | no |
| appgateway\_failed\_requests\_threshold\_critical | Maximum critical acceptable percent of failed errors | `number` | `95` | no |
| appgateway\_failed\_requests\_threshold\_warning | Warning regarding acceptable percent of failed errors | `number` | `80` | no |
| appgateway\_failed\_requests\_time\_aggregator | Monitor aggregator for App Gateway failed requests [available values: min, max or avg] | `string` | `"min"` | no |
| appgateway\_failed\_requests\_timeframe | Monitor timeframe for App Gateway failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| appgateway\_http\_4xx\_errors\_enabled | Flag to enable App Gateway http 4xx errors monitor | `string` | `"true"` | no |
| appgateway\_http\_4xx\_errors\_extra\_tags | Extra tags for App Gateway http 4xx errors monitor | `list(string)` | `[]` | no |
| appgateway\_http\_4xx\_errors\_message | Custom message for App Gateway http 4xx errors monitor | `string` | `""` | no |
| appgateway\_http\_4xx\_errors\_threshold\_critical | Maximum critical acceptable percent of 4xx error | `number` | `95` | no |
| appgateway\_http\_4xx\_errors\_threshold\_warning | Warning regarding acceptable percent of 4xx error | `number` | `80` | no |
| appgateway\_http\_4xx\_errors\_time\_aggregator | Monitor aggregator for App Gateway http 4xx errors [available values: min, max or avg] | `string` | `"max"` | no |
| appgateway\_http\_4xx\_errors\_timeframe | Monitor timeframe for App Gateway http 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| appgateway\_http\_5xx\_errors\_enabled | Flag to enable App Gateway http 5xx errors monitor | `string` | `"true"` | no |
| appgateway\_http\_5xx\_errors\_extra\_tags | Extra tags for App Gateway http 5xx errors monitor | `list(string)` | `[]` | no |
| appgateway\_http\_5xx\_errors\_message | Custom message for App Gateway http 5xx errors monitor | `string` | `""` | no |
| appgateway\_http\_5xx\_errors\_threshold\_critical | Maximum critical acceptable percent of 5xx error | `number` | `95` | no |
| appgateway\_http\_5xx\_errors\_threshold\_warning | Warning regarding acceptable percent of 5xx error | `number` | `80` | no |
| appgateway\_http\_5xx\_errors\_time\_aggregator | Monitor aggregator for App Gateway http 5xx errors [available values: min, max or avg] | `string` | `"max"` | no |
| appgateway\_http\_5xx\_errors\_timeframe | Monitor timeframe for App Gateway http 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| appgateway\_status\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `10` | no |
| appgateway\_unhealthy\_host\_ratio\_enabled | Flag to enable App Gateway unhealthy host ratio monitor | `string` | `"true"` | no |
| appgateway\_unhealthy\_host\_ratio\_extra\_tags | Extra tags for App Gateway unhealthy host ratio monitor | `list(string)` | `[]` | no |
| appgateway\_unhealthy\_host\_ratio\_message | Custom message for App Gateway unhealthy host ratio monitor | `string` | `""` | no |
| appgateway\_unhealthy\_host\_ratio\_threshold\_critical | Maximum critical acceptable ratio of unhealthy host | `number` | `75` | no |
| appgateway\_unhealthy\_host\_ratio\_threshold\_warning | Warning regarding acceptable ratio of unhealthy host | `number` | `50` | no |
| appgateway\_unhealthy\_host\_ratio\_time\_aggregator | Monitor aggregator for App Gateway unhealthy host ratio [available values: min, max or avg] | `string` | `"max"` | no |
| appgateway\_unhealthy\_host\_ratio\_timeframe | Monitor timeframe for App Gateway unhealthy host ratio [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| status\_enabled | Flag to enable App Gateway status | `string` | `"true"` | no |
| status\_extra\_tags | Extra tags for App Gateway status | `list(string)` | `[]` | no |
| status\_message | Custom message for App Gateway status | `string` | `""` | no |
| status\_time\_aggregator | Monitor aggregator for App Gateway status [available values: min, max or avg] | `string` | `"max"` | no |
| status\_timeframe | Monitor timeframe for App Gateway status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| total\_requests\_enabled | Flag to enable App Gateway current connections monitor | `string` | `"true"` | no |
| total\_requests\_extra\_tags | Extra tags for App Gateway current connections monitor | `list(string)` | `[]` | no |
| total\_requests\_message | Custom message for App Gateway current connections monitor | `string` | `""` | no |
| total\_requests\_time\_aggregator | Monitor aggregator for App Gateway current connections [available values: min, max or avg] | `string` | `"max"` | no |
| total\_requests\_timeframe | Monitor timeframe for App Gateway current connections [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| appgateway\_backend\_connect\_time\_id | id for monitor appgateway\_backend\_connect\_time |
| appgateway\_backend\_http\_4xx\_errors\_id | id for monitor appgateway\_backend\_http\_4xx\_errors |
| appgateway\_backend\_http\_5xx\_errors\_id | id for monitor appgateway\_backend\_http\_5xx\_errors |
| appgateway\_failed\_requests\_id | id for monitor appgateway\_failed\_requests |
| appgateway\_healthy\_host\_ratio\_id | id for monitor appgateway\_healthy\_host\_ratio |
| appgateway\_http\_4xx\_errors\_id | id for monitor appgateway\_http\_4xx\_errors |
| appgateway\_http\_5xx\_errors\_id | id for monitor appgateway\_http\_5xx\_errors |
| appgateway\_status\_id | id for monitor appgateway\_status |
| total\_requests\_id | id for monitor total\_requests |

## Related documentation

