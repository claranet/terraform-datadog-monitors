# MIDDLEWARE APACHE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-middleware-apache" {
  source      = "claranet/monitors/datadog//middleware/apache"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Apache vhost status does not respond

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apache\_connect\_enabled | Flag to enable Apache status monitor | `string` | `"true"` | no |
| apache\_connect\_extra\_tags | Extra tags for Apache process monitor | `list(string)` | `[]` | no |
| apache\_connect\_message | Custom message for Apache status monitor | `string` | `""` | no |
| apache\_connect\_threshold\_warning | Apache status monitor (warning threshold) | `string` | `3` | no |
| datadog\_apache\_process\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `10` | no |
| environment | Architecture Environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `15` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| datadog\_apache\_process\_id | id for monitor datadog\_apache\_process |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/apache/](https://docs.datadoghq.com/integrations/apache/)
