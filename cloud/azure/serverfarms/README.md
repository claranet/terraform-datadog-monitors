# CLOUD AZURE SERVERFARMS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-serverfarms" {
  source      = "claranet/monitors/datadog//cloud/azure/serverfarms"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Serverfarm CPU percentage is too high
- Serverfarm is down
- Serverfarm memory percentage is too high

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cpu\_percentage\_enabled | Flag to enable the serverfarms cpu\_percentage monitor | `string` | `"true"` | no |
| cpu\_percentage\_extra\_tags | Extra tags for serverfarms cpu\_percentage monitor | `list(string)` | `[]` | no |
| cpu\_percentage\_message | Custom message for serverfarm cpu\_percentage monitor | `string` | `""` | no |
| cpu\_percentage\_threshold\_critical | CPU percentage (critical threshold) | `number` | `95` | no |
| cpu\_percentage\_threshold\_warning | CPU percentage (warning threshold) | `number` | `90` | no |
| cpu\_percentage\_time\_aggregator | Monitor aggregator for serverfarms cpu\_percentage [available values: min, max or avg] | `string` | `"min"` | no |
| cpu\_percentage\_timeframe | Monitor timeframe for serverfarms cpu\_percentage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_10m"` | no |
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| memory\_percentage\_enabled | Flag to enable the serverfarms memory\_percentage monitor | `string` | `"true"` | no |
| memory\_percentage\_extra\_tags | Extra tags for serverfarms memory\_percentage monitor | `list(string)` | `[]` | no |
| memory\_percentage\_message | Custom message for serverfarm memory\_percentage monitor | `string` | `""` | no |
| memory\_percentage\_threshold\_critical | Memory percentage (critical threshold) | `number` | `95` | no |
| memory\_percentage\_threshold\_warning | Memory percentage (warning threshold) | `number` | `90` | no |
| memory\_percentage\_time\_aggregator | Monitor aggregator for serverfarms memory\_percentage [available values: min, max or avg] | `string` | `"min"` | no |
| memory\_percentage\_timeframe | Monitor timeframe for serverfarms memory\_percentage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| message | Message sent when a serverfarms monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| status\_enabled | Flag to enable the serverfarms status monitor | `string` | `"true"` | no |
| status\_extra\_tags | Extra tags for serverfarms status monitor | `list(string)` | `[]` | no |
| status\_message | Custom message for serverfarm status monitor | `string` | `""` | no |
| status\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `10` | no |
| status\_time\_aggregator | Monitor aggregator for serverfarms status [available values: min, max or avg] | `string` | `"max"` | no |
| status\_timeframe | Monitor timeframe for serverfarms status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| cpu\_percentage\_id | id for monitor cpu\_percentage |
| memory\_percentage\_id | id for monitor memory\_percentage |
| status\_id | id for monitor status |

## Related documentation

