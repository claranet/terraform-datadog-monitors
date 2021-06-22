# NETWORK TLS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-network-tls" {
  source      = "claranet/monitors/datadog//network/tls"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- TLS cannot connect
- TLS certificate expiration (disabled by default)
- TLS certificate expiring
- TLS invalid certificate

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cannot\_connect\_enabled | Flag to enable TLS cannot connect monitor | `string` | `"true"` | no |
| cannot\_connect\_extra\_tags | Extra tags for TLS cannot connect monitor | `list(string)` | `[]` | no |
| cannot\_connect\_message | Custom message for TLS cannot connect monitor | `string` | `""` | no |
| cannot\_connect\_no\_data\_timeframe | TLS cannot connect monitor no data timeframe | `string` | `10` | no |
| cannot\_connect\_threshold\_warning | TLS cannot connect monitor (warning threshold) | `string` | `3` | no |
| certificate\_expiration\_date\_enabled | Flag to enable Certificate Expiration Date monitor | `string` | `"false"` | no |
| certificate\_expiration\_date\_extra\_tags | Extra tags for Certificate Expiration Date monitor | `list(string)` | `[]` | no |
| certificate\_expiration\_date\_message | Custom message for the Certificate Expiration Date monitor | `string` | `""` | no |
| certificate\_expiration\_date\_threshold\_critical | Container Memory Usage critical threshold | `string` | `15` | no |
| certificate\_expiration\_date\_threshold\_warning | Container Memory Usage warning threshold | `string` | `30` | no |
| certificate\_expiration\_date\_time\_aggregator | Time aggregator for the Certificate Expiration Date monitor | `string` | `"max"` | no |
| certificate\_expiration\_date\_timeframe | Timeframe for the Certificate Expiration Date monitor | `string` | `"last_5m"` | no |
| environment | Architecture Environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `15` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| invalid\_tls\_certificate\_enabled | Flag to enable TLS certificate expiration monitor | `string` | `"true"` | no |
| invalid\_tls\_certificate\_extra\_tags | Extra tags for TLS certificate expiration monitor | `list(string)` | `[]` | no |
| invalid\_tls\_certificate\_message | Custom message for TLS certificate expiration monitor | `string` | `""` | no |
| invalid\_tls\_certificate\_threshold\_warning | TLS certificate expiration monitor (warning threshold) | `string` | `3` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| tls\_certificate\_expiration\_enabled | Flag to enable TLS certificate expiration monitor | `string` | `"true"` | no |
| tls\_certificate\_expiration\_extra\_tags | Extra tags for TLS certificate expiration monitor | `list(string)` | `[]` | no |
| tls\_certificate\_expiration\_message | Custom message for TLS certificate expiration monitor | `string` | `""` | no |
| tls\_certificate\_expiration\_threshold\_warning | TLS certificate expiration monitor (warning threshold) | `string` | `5` | no |

## Outputs

| Name | Description |
|------|-------------|
| cannot\_connect\_id | id for monitor cannot\_connect |
| certificate\_expiration\_date\_id | id for monitor certificate\_expiration\_date |
| invalid\_tls\_certificate\_id | id for monitor invalid\_tls\_certificate |
| tls\_certificate\_expiration\_id | id for monitor tls\_certificate\_expiration |

## Related documentation

- [Datadog TLS integration](https://docs.datadoghq.com/integrations/tls/)

