# CLOUD AZURE KEYVAULT DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-keyvault" {
  source      = "claranet/monitors/datadog//cloud/azure/keyvault"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Key Vault API latency is high
- Key Vault API result rate is low
- Key Vault is down

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| api\_latency\_enabled | Flag to enable Key Vault API latency monitor | `string` | `"true"` | no |
| api\_latency\_extra\_tags | Extra tags for Key Vault API latency monitor | `list(string)` | `[]` | no |
| api\_latency\_message | Custom message for Key Vault API latency monitor | `string` | `""` | no |
| api\_latency\_threshold\_critical | Critical threshold for Key Vault API latency rate | `number` | `100` | no |
| api\_latency\_threshold\_warning | Warning threshold for Key Vault API latency rate | `number` | `80` | no |
| api\_latency\_time\_aggregator | Monitor aggregator for Key Vault API latency [available values: min, max or avg] | `string` | `"min"` | no |
| api\_latency\_timeframe | Monitor timeframe for Key Vault API latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| api\_result\_enabled | Flag to enable Key Vault API result monitor | `string` | `"true"` | no |
| api\_result\_extra\_tags | Extra tags for Key Vault API result monitor | `list(string)` | `[]` | no |
| api\_result\_message | Custom message for Key Vault API result monitor | `string` | `""` | no |
| api\_result\_threshold\_critical | Critical threshold for Key Vault API result rate | `number` | `10` | no |
| api\_result\_threshold\_warning | Warning threshold for Key Vault API result rate | `number` | `30` | no |
| api\_result\_time\_aggregator | Monitor aggregator for Key Vault API result [available values: min, max or avg] | `string` | `"max"` | no |
| api\_result\_timeframe | Monitor timeframe for Key Vault API result [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| keyvault\_status\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `10` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| status\_enabled | Flag to enable Key Vault status monitor | `string` | `"true"` | no |
| status\_extra\_tags | Extra tags for Key Vault status monitor | `list(string)` | `[]` | no |
| status\_message | Custom message for Key Vault status monitor | `string` | `""` | no |
| status\_time\_aggregator | Monitor aggregator for Key Vault status [available values: min, max or avg] | `string` | `"max"` | no |
| status\_timeframe | Monitor timeframe for Key Vault status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| keyvault\_api\_latency\_id | id for monitor keyvault\_api\_latency |
| keyvault\_api\_result\_id | id for monitor keyvault\_api\_result |
| keyvault\_status\_id | id for monitor keyvault\_status |

## Related documentation

DataDog documentation : [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)  
You must search `keyvault`, there is no integration for now.

Azure metrics documentation : [https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftkeyvaultvaults](https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftkeyvaultvaults)
