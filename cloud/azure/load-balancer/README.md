# CLOUD AZURE LOAD-BALANCER DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-load-balancer" {
  source      = "claranet/monitors/datadog//cloud/azure/load-balancer"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Load Balancer is unreachable

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| status\_enabled | Flag to enable Load Balancer status monitor | `string` | `"true"` | no |
| status\_extra\_tags | Extra tags for Load Balancer status monitor | `list(string)` | `[]` | no |
| status\_message | Custom message for Load Balancer status monitor | `string` | `""` | no |
| status\_time\_aggregator | Monitor aggregator for Load Balancer status [available values: min, max or avg] | `string` | `"max"` | no |
| status\_timeframe | Monitor timeframe for Load Balancer status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| loadbalancer\_status\_id | id for monitor loadbalancer\_status |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/?tab=azurecliv20](https://docs.datadoghq.com/integrations/azure/?tab=azurecliv20)
