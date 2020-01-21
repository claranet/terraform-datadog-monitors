# NETWORK HTTP SSL DataDog monitors

## How to use this module

```
module "datadog-monitors-network-http-ssl" {
  source = "claranet/monitors/datadog//network/http/ssl"
  version = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- SSL certificate expiration (disabled by default)
- SSL invalid certificate

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| certificate\_expiration\_date\_enabled | Flag to enable Certificate Expiration Date monitor | `string` | `"false"` | no |
| certificate\_expiration\_date\_extra\_tags | Extra tags for Certificate Expiration Date monitor | `list(string)` | `[]` | no |
| certificate\_expiration\_date\_message | Custom message for the Certificate Expiration Date monitor | `string` | `""` | no |
| certificate\_expiration\_date\_threshold\_critical | Certificate Expiration Date critical threshold | `string` | `15` | no |
| certificate\_expiration\_date\_threshold\_warning | Certificate Expiration Date warning threshold | `string` | `30` | no |
| certificate\_expiration\_date\_time\_aggregator | Time aggregator for the Certificate Expiration Date monitor | `string` | `"max"` | no |
| certificate\_expiration\_date\_timeframe | Timeframe for the Certificate Expiration Date monitor | `string` | `"last_5m"` | no |
| environment | Architecture Environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `15` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| invalid\_ssl\_certificate\_enabled | Flag to enable SSL invalid certificate monitor | `string` | `"true"` | no |
| invalid\_ssl\_certificate\_extra\_tags | Extra tags for SSL invalid certificate monitor | `list(string)` | `[]` | no |
| invalid\_ssl\_certificate\_message | Custom message for SSL invalid certificate monitor | `string` | `""` | no |
| invalid\_ssl\_certificate\_no\_data\_timeframe | SSL invalid certificate monitor no data timeframe | `string` | `10` | no |
| invalid\_ssl\_certificate\_threshold\_warning | SSL invalid certificate monitor (warning threshold) | `string` | `3` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| certificate\_expiration\_date\_id | id for monitor certificate\_expiration\_date |
| invalid\_ssl\_certificate\_id | id for monitor invalid\_ssl\_certificate |

## Related documentation

