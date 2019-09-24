# CLOUD AZURE APP-GATEWAY DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-app-gateway" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//cloud/azure/app-gateway?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- App Gateway backend connect time
- App Gateway Backend HTTP 4xx errors
- App Gateway failed requests
- App Gateway HTTP 4xx errors
- App Gateway HTTP 5xx errors
- App Gateway HTTP Backend 5xx errors
- App Gateway is down
- App Gateway no connection
- App Gateway no healthy host

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| appgateway\_backend\_connect\_time\_enabled | Flag to enable App Gateway backend_connect_time monitor | string | `"true"` | no |
| appgateway\_backend\_connect\_time\_extra\_tags | Extra tags for App Gateway backend_connect_time monitor | list(string) | `[]` | no |
| appgateway\_backend\_connect\_time\_message | Custom message for App Gateway backend_connect_time monitor | string | `""` | no |
| appgateway\_backend\_connect\_time\_threshold\_critical | Maximum critical backend_connect_time errors | string | `"50"` | no |
| appgateway\_backend\_connect\_time\_threshold\_warning | Warning regarding backend_connect_time errors | string | `"40"` | no |
| appgateway\_backend\_connect\_time\_time\_aggregator | Monitor aggregator for App Gateway backend_connect_time [available values: min, max or avg] | string | `"min"` | no |
| appgateway\_backend\_connect\_time\_timeframe | Monitor timeframe for App Gateway backend_connect_time [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| appgateway\_backend\_http\_4xx\_errors\_enabled | Flag to enable App Gateway http 4xx errors monitor | string | `"true"` | no |
| appgateway\_backend\_http\_4xx\_errors\_extra\_tags | Extra tags for App Gateway http 4xx errors monitor | list(string) | `[]` | no |
| appgateway\_backend\_http\_4xx\_errors\_message | Custom message for App Gateway http 4xx errors monitor | string | `""` | no |
| appgateway\_backend\_http\_4xx\_errors\_threshold\_critical | Minimum critical acceptable percent of 4xx error | string | `"30"` | no |
| appgateway\_backend\_http\_4xx\_errors\_threshold\_warning | Warning regarding acceptable percent of 4xx error | string | `"20"` | no |
| appgateway\_backend\_http\_4xx\_errors\_time\_aggregator | Monitor aggregator for App Gateway http 4xx errors [available values: min, max or avg] | string | `"max"` | no |
| appgateway\_backend\_http\_4xx\_errors\_timeframe | Monitor timeframe for App Gateway http 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| appgateway\_backend\_http\_5xx\_errors\_enabled | Flag to enable App Gateway http 5xx errors monitor | string | `"true"` | no |
| appgateway\_backend\_http\_5xx\_errors\_extra\_tags | Extra tags for App Gateway http 5xx errors monitor | list(string) | `[]` | no |
| appgateway\_backend\_http\_5xx\_errors\_message | Custom message for App Gateway http 5xx errors monitor | string | `""` | no |
| appgateway\_backend\_http\_5xx\_errors\_threshold\_critical | Minimum critical acceptable percent of 5xx error | string | `"30"` | no |
| appgateway\_backend\_http\_5xx\_errors\_threshold\_warning | Warning regarding acceptable percent of 5xx error | string | `"20"` | no |
| appgateway\_backend\_http\_5xx\_errors\_time\_aggregator | Monitor aggregator for App Gateway http 5xx errors [available values: min, max or avg] | string | `"max"` | no |
| appgateway\_backend\_http\_5xx\_errors\_timeframe | Monitor timeframe for App Gateway http 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| appgateway\_failed\_requests\_enabled | Flag to enable App Gateway failed requests monitor | string | `"true"` | no |
| appgateway\_failed\_requests\_extra\_tags | Extra tags for App Gateway failed requests monitor | list(string) | `[]` | no |
| appgateway\_failed\_requests\_message | Custom message for App Gateway failed requests monitor | string | `""` | no |
| appgateway\_failed\_requests\_threshold\_critical | Maximum critical acceptable percent of failed errors | string | `"50"` | no |
| appgateway\_failed\_requests\_threshold\_warning | Warning regarding acceptable percent of failed errors | string | `"40"` | no |
| appgateway\_failed\_requests\_time\_aggregator | Monitor aggregator for App Gateway failed requests [available values: min, max or avg] | string | `"min"` | no |
| appgateway\_failed\_requests\_timeframe | Monitor timeframe for App Gateway failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| appgateway\_healthy\_host\_count\_enabled | Flag to enable App Gateway healthy host monitor | string | `"true"` | no |
| appgateway\_healthy\_host\_count\_extra\_tags | Extra tags for App Gateway healthy host monitor | list(string) | `[]` | no |
| appgateway\_healthy\_host\_count\_message | Custom message for App Gateway healthy host monitor | string | `""` | no |
| appgateway\_healthy\_host\_count\_time\_aggregator | Monitor aggregator for App Gateway healthy host [available values: min, max or avg] | string | `"min"` | no |
| appgateway\_healthy\_host\_count\_timeframe | Monitor timeframe for App Gateway healthy host [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| appgateway\_http\_4xx\_errors\_enabled | Flag to enable App Gateway http 4xx errors monitor | string | `"true"` | no |
| appgateway\_http\_4xx\_errors\_extra\_tags | Extra tags for App Gateway http 4xx errors monitor | list(string) | `[]` | no |
| appgateway\_http\_4xx\_errors\_message | Custom message for App Gateway http 4xx errors monitor | string | `""` | no |
| appgateway\_http\_4xx\_errors\_threshold\_critical | Minimum critical acceptable percent of 4xx error | string | `"30"` | no |
| appgateway\_http\_4xx\_errors\_threshold\_warning | Warning regarding acceptable percent of 4xx error | string | `"20"` | no |
| appgateway\_http\_4xx\_errors\_time\_aggregator | Monitor aggregator for App Gateway http 4xx errors [available values: min, max or avg] | string | `"max"` | no |
| appgateway\_http\_4xx\_errors\_timeframe | Monitor timeframe for App Gateway http 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| appgateway\_http\_5xx\_errors\_enabled | Flag to enable App Gateway http 5xx errors monitor | string | `"true"` | no |
| appgateway\_http\_5xx\_errors\_extra\_tags | Extra tags for App Gateway http 5xx errors monitor | list(string) | `[]` | no |
| appgateway\_http\_5xx\_errors\_message | Custom message for App Gateway http 5xx errors monitor | string | `""` | no |
| appgateway\_http\_5xx\_errors\_threshold\_critical | Minimum critical acceptable percent of 5xx error | string | `"30"` | no |
| appgateway\_http\_5xx\_errors\_threshold\_warning | Warning regarding acceptable percent of 5xx error | string | `"20"` | no |
| appgateway\_http\_5xx\_errors\_time\_aggregator | Monitor aggregator for App Gateway http 5xx errors [available values: min, max or avg] | string | `"max"` | no |
| appgateway\_http\_5xx\_errors\_timeframe | Monitor timeframe for App Gateway http 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| current\_connection\_enabled | Flag to enable App Gateway current connections monitor | string | `"true"` | no |
| current\_connection\_extra\_tags | Extra tags for App Gateway current connections monitor | list(string) | `[]` | no |
| current\_connection\_message | Custom message for App Gateway current connections monitor | string | `""` | no |
| current\_connection\_time\_aggregator | Monitor aggregator for App Gateway current connections [available values: min, max or avg] | string | `"min"` | no |
| current\_connection\_timeframe | Monitor timeframe for App Gateway current connections [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| status\_enabled | Flag to enable App Gateway status | string | `"true"` | no |
| status\_extra\_tags | Extra tags for App Gateway status | list(string) | `[]` | no |
| status\_message | Custom message for App Gateway status | string | `""` | no |
| status\_time\_aggregator | Monitor aggregator for App Gateway status [available values: min, max or avg] | string | `"min"` | no |
| status\_timeframe | Monitor timeframe for App Gateway status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| appgateway\_backend\_connect\_time\_id | id for monitor appgateway_backend_connect_time |
| appgateway\_backend\_http\_4xx\_errors\_id | id for monitor appgateway_backend_http_4xx_errors |
| appgateway\_backend\_http\_5xx\_errors\_id | id for monitor appgateway_backend_http_5xx_errors |
| appgateway\_failed\_requests\_id | id for monitor appgateway_failed_requests |
| appgateway\_healthy\_host\_count\_id | id for monitor appgateway_healthy_host_count |
| appgateway\_http\_4xx\_errors\_id | id for monitor appgateway_http_4xx_errors |
| appgateway\_http\_5xx\_errors\_id | id for monitor appgateway_http_5xx_errors |
| appgateway\_status\_id | id for monitor appgateway_status |
| current\_connection\_id | id for monitor current_connection |

## Related documentation

