# CLOUD AWS ECS COMMON DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-ecs-common" {
  source      = "claranet/monitors/datadog//cloud/aws/ecs/common"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- ECS Service CPU Utilization High (disabled by default)
- ECS Service Memory Utilization High (disabled by default)
- ECS Service not healthy enough

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags | Tags used for filtering | `string` | `"*"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| service\_cpu\_utilization\_enabled | Flag to enable Service CPU Utilization monitor | `string` | `"false"` | no |
| service\_cpu\_utilization\_extra\_tags | Extra tags for Service CPU Utilization monitor | `list(string)` | `[]` | no |
| service\_cpu\_utilization\_message | Custom message for the Service CPU Utilization monitor | `string` | `""` | no |
| service\_cpu\_utilization\_threshold\_critical | Critical threshold for the Service CPU Utilization monitor | `string` | `"90"` | no |
| service\_cpu\_utilization\_threshold\_warning | Warning threshold for the Service CPU Utilization monitor | `string` | `"80"` | no |
| service\_cpu\_utilization\_time\_aggregator | Monitor aggregator for Service CPU Utilization [available values: min, max or avg] | `string` | `"min"` | no |
| service\_cpu\_utilization\_timeframe | Timeframe for the Service CPU Utilization monitor | `string` | `"last_5m"` | no |
| service\_memory\_utilization\_enabled | Flag to enable Service Memory Utilization monitor | `string` | `"false"` | no |
| service\_memory\_utilization\_extra\_tags | Extra tags for Service Memory Utilization monitor | `list(string)` | `[]` | no |
| service\_memory\_utilization\_message | Custom message for the Service Memory Utilization monitor | `string` | `""` | no |
| service\_memory\_utilization\_threshold\_critical | Critical threshold for the Service Memory Utilization monitor | `string` | `90` | no |
| service\_memory\_utilization\_threshold\_warning | Warning threshold for the Service Memory Utilization monitor | `string` | `85` | no |
| service\_memory\_utilization\_time\_aggregator | Monitor aggregator for Service Memory Utilization [available values: min, max or avg] | `string` | `"min"` | no |
| service\_memory\_utilization\_timeframe | Timeframe for the Service Memory Utilization monitor | `string` | `"last_5m"` | no |
| service\_missing\_tasks\_enabled | Flag to enable Service Missing Tasks monitor | `string` | `"true"` | no |
| service\_missing\_tasks\_extra\_tags | Extra tags for Service Missing Tasks monitor | `list(string)` | `[]` | no |
| service\_missing\_tasks\_message | Custom message for the Service Missing Tasks monitor | `string` | `""` | no |
| service\_missing\_tasks\_threshold\_critical | Critical threshold for the Service Missing Tasks monitor | `string` | `60` | no |
| service\_missing\_tasks\_threshold\_warning | Warning threshold for the Service Missing Tasks monitor | `string` | `80` | no |
| service\_missing\_tasks\_time\_aggregator | Monitor aggregator for Service Missing Tasks [available values: min, max or avg] | `string` | `"min"` | no |
| service\_missing\_tasks\_timeframe | Timeframe for the Service Missing Tasks monitor | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| service\_cpu\_utilization\_id | id for monitor service\_cpu\_utilization |
| service\_memory\_utilization\_id | id for monitor service\_memory\_utilization |
| service\_missing\_tasks\_id | id for monitor service\_missing\_tasks |

## Related documentation

