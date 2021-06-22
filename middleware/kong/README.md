# MIDDLEWARE KONG DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-middleware-kong" {
  source      = "claranet/monitors/datadog//middleware/kong"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kong does not respond
- Kong exceeded its treatment limit

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Architecture Environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `15` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| not\_responding\_enabled | Flag to enable Kong does not respond monitor | `string` | `"true"` | no |
| not\_responding\_extra\_tags | Extra tags for Kong does not respond monitor | `list(string)` | `[]` | no |
| not\_responding\_message | Custom message for Kong does not respond monitor | `string` | `""` | no |
| not\_responding\_no\_data\_timeframe | Kong does not respond monitor no data timeframe | `string` | `10` | no |
| not\_responding\_threshold\_warning | Warning threshold for the service check | `string` | `3` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| treatment\_limit\_enabled | Flag to enable Kong Treatment Limit monitor | `string` | `"true"` | no |
| treatment\_limit\_extra\_tags | Extra tags for Kong Treatment Limit monitor | `list(string)` | `[]` | no |
| treatment\_limit\_message | Custom message for the Kong Treatment Limit monitor | `string` | `""` | no |
| treatment\_limit\_threshold\_critical | Docker Container Memory Usage  critical threshold | `string` | `20` | no |
| treatment\_limit\_threshold\_warning | Docker Container Memory Usage warning threshold | `string` | `0` | no |
| treatment\_limit\_time\_aggregator | Time aggregator for the Kong Treatment Limit monitor | `string` | `"min"` | no |
| treatment\_limit\_timeframe | Timeframe for the Kong Treatment Limit monitor | `string` | `"last_15m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| not\_responding\_id | id for monitor not\_responding |
| treatment\_limit\_id | id for monitor treatment\_limit |

## Related documentation

* [Datadog Kong integration](https://docs.datadoghq.com/integrations/kong/)

