# MIDDLEWARE NGINX DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-middleware-nginx" {
  source      = "claranet/monitors/datadog//middleware/nginx"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Nginx dropped connections
- Nginx vhost status does not respond

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
| nginx\_connect\_enabled | Flag to enable Nginx status monitor | `string` | `"true"` | no |
| nginx\_connect\_extra\_tags | Extra tags for Nginx process monitor | `list(string)` | `[]` | no |
| nginx\_connect\_message | Custom message for Nginx status monitor | `string` | `""` | no |
| nginx\_connect\_no\_data\_timeframe | Nginx status monitor no data timeframe | `string` | `10` | no |
| nginx\_connect\_threshold\_warning | Nginx status monitor (warning threshold) | `string` | `3` | no |
| nginx\_dropped\_enabled | Flag to enable Nginx dropped monitor | `string` | `"true"` | no |
| nginx\_dropped\_extra\_tags | Extra tags for Nginx dropped connections monitor | `list(string)` | `[]` | no |
| nginx\_dropped\_message | Custom message for Nginx dropped connections monitor | `string` | `""` | no |
| nginx\_dropped\_threshold\_critical | Nginx dropped connections critical threshold | `number` | `0` | no |
| nginx\_dropped\_time\_aggregator | Monitor aggregator for Nginx dropped connections [available values: min, max or avg] | `string` | `"min"` | no |
| nginx\_dropped\_timeframe | Monitor timeframe for Nginx dropped connections [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| datadog\_nginx\_dropped\_connections\_id | id for monitor datadog\_nginx\_dropped\_connections |
| datadog\_nginx\_process\_id | id for monitor datadog\_nginx\_process |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/nginx/](https://docs.datadoghq.com/integrations/nginx/)
