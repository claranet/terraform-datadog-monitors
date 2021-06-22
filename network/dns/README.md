# NETWORK DNS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-network-dns" {
  source      = "claranet/monitors/datadog//network/dns"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- DNS cannot resolve

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cannot\_resolve\_enabled | Flag to enable DNS cannot resolve monitor | `string` | `"true"` | no |
| cannot\_resolve\_extra\_tags | Extra tags for DNS cannot resolve monitor | `list(string)` | `[]` | no |
| cannot\_resolve\_message | Custom message for DNS cannot resolve monitor | `string` | `""` | no |
| cannot\_resolve\_no\_data\_timeframe | DNS cannot resolve monitor no data timeframe | `string` | `10` | no |
| cannot\_resolve\_threshold\_warning | DNS cannot resolve monitor (warning threshold) | `string` | `3` | no |
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
| cannot\_resolve\_id | id for monitor cannot\_resolve |

## Related documentation

- [Datadog DNS integration](https://docs.datadoghq.com/integrations/dns_check/)
