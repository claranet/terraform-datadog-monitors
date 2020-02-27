# CLOUD AZURE VPN-GATEWAYS-CONNEXIONS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-vpn-gateways-connexions" {
  source      = "claranet/monitors/datadog//cloud/azure/vpn-gateways-connexions"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- VPN Gateway Connexion status

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| appservices\_status\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `10` | no |
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| vpngw\_connexion\_status\_extra\_tags | Extra tags for VPN Gateways connexions monitor | `list(string)` | `[]` | no |
| vpngw\_connexion\_status\_no\_data\_timeframe | VPN Gateways connexions monitor no data timeframe | `number` | `10` | no |
| vpngw\_connexion\_status\_status\_message | Custom message for VPN Gateway connexions status monitor | `string` | `""` | no |
| vpngw\_connexion\_status\_threshold\_warning | VPN Gateways connexions monitor limit (warning threshold) | `number` | `3` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpngw\_connexion\_status\_id | id for monitor vpngw\_connexion\_status |

