# CLOUD AZURE APP-SERVICES DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-app-services" {
  source      = "claranet/monitors/datadog//cloud/azure/app-services"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- App Services HTTP 4xx errors too high
- App Services HTTP 5xx errors too high
- App Services HTTP successful responses too low
- App Services is down
- App Services memory usage
- App Services response time too high

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| appservices\_status\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `10` | no |
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| http\_4xx\_requests\_enabled | Flag to enable App Services 4xx requests monitor | `string` | `"true"` | no |
| http\_4xx\_requests\_extra\_tags | Extra tags for App Services 4xx requests monitor | `list(string)` | `[]` | no |
| http\_4xx\_requests\_message | Custom message for App Services 4xx requests monitor | `string` | `""` | no |
| http\_4xx\_requests\_threshold\_critical | Maximum critical acceptable percent of 4xx errors | `number` | `90` | no |
| http\_4xx\_requests\_threshold\_warning | Warning regarding acceptable percent of 4xx errors | `number` | `50` | no |
| http\_4xx\_requests\_time\_aggregator | Monitor aggregator for App Services 4xx requests [available values: min, max or avg] | `string` | `"min"` | no |
| http\_4xx\_requests\_timeframe | Monitor timeframe for App Services 4xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| http\_5xx\_requests\_enabled | Flag to enable App Services 5xx requests monitor | `string` | `"true"` | no |
| http\_5xx\_requests\_extra\_tags | Extra tags for App Services 5xx requests monitor | `list(string)` | `[]` | no |
| http\_5xx\_requests\_message | Custom message for App Services 5xx requests monitor | `string` | `""` | no |
| http\_5xx\_requests\_threshold\_critical | Maximum critical acceptable percent of 5xx errors | `number` | `90` | no |
| http\_5xx\_requests\_threshold\_warning | Warning regarding acceptable percent of 5xx errors | `number` | `50` | no |
| http\_5xx\_requests\_time\_aggregator | Monitor aggregator for App Services 5xx requests [available values: min, max or avg] | `string` | `"min"` | no |
| http\_5xx\_requests\_timeframe | Monitor timeframe for App Services 5xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| http\_successful\_requests\_enabled | Flag to enable App Services successful requests monitor | `string` | `"true"` | no |
| http\_successful\_requests\_extra\_tags | Extra tags for App Services successful requests monitor | `list(string)` | `[]` | no |
| http\_successful\_requests\_message | Custom message for App Services successful requests monitor | `string` | `""` | no |
| http\_successful\_requests\_threshold\_critical | Minimum critical acceptable percent of 2xx & 3xx requests | `number` | `10` | no |
| http\_successful\_requests\_threshold\_warning | Warning regarding acceptable percent of 2xx & 3xx requests | `number` | `30` | no |
| http\_successful\_requests\_time\_aggregator | Monitor aggregator for App Services successful requests [available values: min, max or avg] | `string` | `"max"` | no |
| http\_successful\_requests\_timeframe | Monitor timeframe for App Services successful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| memory\_usage\_enabled | Flag to enable App Services memory usage monitor | `string` | `"true"` | no |
| memory\_usage\_extra\_tags | Extra tags for App Services memory usage monitor | `list(string)` | `[]` | no |
| memory\_usage\_message | Custom message for App Services memory usage monitor | `string` | `""` | no |
| memory\_usage\_threshold\_critical | Alerting threshold in Mib | `number` | `1073741824` | no |
| memory\_usage\_threshold\_warning | Warning threshold in MiB | `number` | `536870912` | no |
| memory\_usage\_time\_aggregator | Monitor aggregator for App Services memory usage [available values: min, max or avg] | `string` | `"min"` | no |
| memory\_usage\_timeframe | Monitor timeframe for App Services memory usage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| response\_time\_enabled | Flag to enable App Services response time monitor | `string` | `"true"` | no |
| response\_time\_extra\_tags | Extra tags for App Services response time monitor | `list(string)` | `[]` | no |
| response\_time\_message | Custom message for App Services response time monitor | `string` | `""` | no |
| response\_time\_threshold\_critical | Alerting threshold for response time in seconds | `number` | `10` | no |
| response\_time\_threshold\_warning | Warning threshold for response time in seconds | `number` | `5` | no |
| response\_time\_time\_aggregator | Monitor aggregator for App Services response time [available values: min, max or avg] | `string` | `"min"` | no |
| response\_time\_timeframe | Monitor timeframe for App Services response time [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| status\_enabled | Flag to enable App Services status monitor | `string` | `"true"` | no |
| status\_extra\_tags | Extra tags for App Services status monitor | `list(string)` | `[]` | no |
| status\_message | Custom message for App Services status monitor | `string` | `""` | no |
| status\_time\_aggregator | Monitor aggregator for App Services status [available values: min, max or avg] | `string` | `"max"` | no |
| status\_timeframe | Monitor timeframe for App Services status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| appservices\_http\_4xx\_errors\_count\_id | id for monitor appservices\_http\_4xx\_errors\_count |
| appservices\_http\_5xx\_errors\_count\_id | id for monitor appservices\_http\_5xx\_errors\_count |
| appservices\_http\_success\_status\_rate\_id | id for monitor appservices\_http\_success\_status\_rate |
| appservices\_memory\_usage\_count\_id | id for monitor appservices\_memory\_usage\_count |
| appservices\_response\_time\_id | id for monitor appservices\_response\_time |
| appservices\_status\_id | id for monitor appservices\_status |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_app_services](https://docs.datadoghq.com/integrations/azure_app_services)
