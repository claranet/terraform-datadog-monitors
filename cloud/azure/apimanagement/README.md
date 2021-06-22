# CLOUD AZURE APIMANAGEMENT DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-apimanagement" {
  source      = "claranet/monitors/datadog//cloud/azure/apimanagement"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- API Management is down
- API Management successful requests rate too low
- API Management too many failed requests
- API Management too many other requests
- API Management too many unauthorized requests

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apimgt\_status\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `10` | no |
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| failed\_requests\_enabled | Flag to enable API Management failed requests monitor | `string` | `"true"` | no |
| failed\_requests\_extra\_tags | Extra tags for API Management failed requests monitor | `list(string)` | `[]` | no |
| failed\_requests\_message | Custom message for API Management failed requests monitor | `string` | `""` | no |
| failed\_requests\_threshold\_critical | Maximum acceptable percent of failed requests | `number` | `90` | no |
| failed\_requests\_threshold\_warning | Warning regarding acceptable percent of failed requests | `number` | `50` | no |
| failed\_requests\_time\_aggregator | Monitor aggregator for API Management failed requests [available values: min, max or avg] | `string` | `"min"` | no |
| failed\_requests\_timeframe | Monitor timeframe for API Management failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when a Redis monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| other\_requests\_enabled | Flag to enable API Management other requests monitor | `string` | `"true"` | no |
| other\_requests\_extra\_tags | Extra tags for API Management other requests monitor | `list(string)` | `[]` | no |
| other\_requests\_message | Custom message for API Management other requests monitor | `string` | `""` | no |
| other\_requests\_threshold\_critical | Maximum acceptable percent of other requests | `number` | `90` | no |
| other\_requests\_threshold\_warning | Warning regarding acceptable percent of other requests | `number` | `50` | no |
| other\_requests\_time\_aggregator | Monitor aggregator for API Management other requests [available values: min, max or avg] | `string` | `"min"` | no |
| other\_requests\_timeframe | Monitor timeframe for API Management other requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| status\_enabled | Flag to enable API Management status monitor | `string` | `"true"` | no |
| status\_extra\_tags | Extra tags for API Management status monitor | `list(string)` | `[]` | no |
| status\_message | Custom message for API Management status monitor | `string` | `""` | no |
| status\_time\_aggregator | Monitor aggregator for API Management status [available values: min, max or avg] | `string` | `"max"` | no |
| status\_timeframe | Monitor timeframe for API Management status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| successful\_requests\_enabled | Flag to enable API Management successful requests monitor | `string` | `"true"` | no |
| successful\_requests\_extra\_tags | Extra tags for API Management successful requests monitor | `list(string)` | `[]` | no |
| successful\_requests\_message | Custom message for API Management successful requests monitor | `string` | `""` | no |
| successful\_requests\_threshold\_critical | Minimum acceptable percent of successful requests | `number` | `10` | no |
| successful\_requests\_threshold\_warning | Warning regarding acceptable percent of successful requests | `number` | `30` | no |
| successful\_requests\_time\_aggregator | Monitor aggregator for API Management successful requests [available values: min, max or avg] | `string` | `"max"` | no |
| successful\_requests\_timeframe | Monitor timeframe for API Management successful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| unauthorized\_requests\_enabled | Flag to enable API Management unauthorized requests monitor | `string` | `"true"` | no |
| unauthorized\_requests\_extra\_tags | Extra tags for API Management unauthorized requests monitor | `list(string)` | `[]` | no |
| unauthorized\_requests\_message | Custom message for API Management unauthorized requests monitor | `string` | `""` | no |
| unauthorized\_requests\_threshold\_critical | Maximum acceptable percent of unauthorized requests | `number` | `90` | no |
| unauthorized\_requests\_threshold\_warning | Warning regarding acceptable percent of unauthorized requests | `number` | `50` | no |
| unauthorized\_requests\_time\_aggregator | Monitor aggregator for API Management unauthorized requests [available values: min, max or avg] | `string` | `"min"` | no |
| unauthorized\_requests\_timeframe | Monitor timeframe for API Management unauthorized requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| apimgt\_failed\_requests\_id | id for monitor apimgt\_failed\_requests |
| apimgt\_other\_requests\_id | id for monitor apimgt\_other\_requests |
| apimgt\_status\_id | id for monitor apimgt\_status |
| apimgt\_successful\_requests\_id | id for monitor apimgt\_successful\_requests |
| apimgt\_unauthorized\_requests\_id | id for monitor apimgt\_unauthorized\_requests |

## Related documentation

Azure API Management metrics documentation: [https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-use-azure-monitor](https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-use-azure-monitor)
