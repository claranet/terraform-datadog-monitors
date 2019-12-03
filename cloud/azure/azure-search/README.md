# CLOUD AZURE AZURE-SEARCH DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-azure-search" {
  source = "git::ssh://git@github.com/claranet/terraform-datadog-monitors.git//cloud/azure/azure-search?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Azure Search latency too high
- Azure Search throttled queries rate is too high

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| latency\_enabled | Flag to enable Azure Search latency monitor | string | `"true"` | no |
| latency\_extra\_tags | Extra tags for Azure Search latency monitor | list(string) | `[]` | no |
| latency\_message | Custom message for Azure Search latency monitor | string | `""` | no |
| latency\_threshold\_critical | Alerting threshold for Azure Search latency in seconds | string | `"4"` | no |
| latency\_threshold\_warning | Warning threshold for Azure Search latency in seconds | string | `"2"` | no |
| latency\_time\_aggregator | Monitor aggregator for Azure Search latency [available values: min, max or avg] | string | `"min"` | no |
| latency\_timeframe | Monitor timeframe for Azure Search latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| notify\_no\_data | Will raise no data alert if set to true | string | `"true"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| throttled\_queries\_rate\_enabled | Flag to enable Azure Search throttled queries rate monitor | string | `"true"` | no |
| throttled\_queries\_rate\_extra\_tags | Extra tags for Azure Search throttled queries rate monitor | list(string) | `[]` | no |
| throttled\_queries\_rate\_message | Custom message for Azure Search throttled queries rate monitor | string | `""` | no |
| throttled\_queries\_rate\_threshold\_critical | Alerting threshold for Azure Search throttled queries rate | string | `"50"` | no |
| throttled\_queries\_rate\_threshold\_warning | Warning threshold for Azure Search throttled queries rate | string | `"25"` | no |
| throttled\_queries\_rate\_time\_aggregator | Monitor aggregator for Azure Search throttled queries rate [available values: min, max or avg] | string | `"min"` | no |
| throttled\_queries\_rate\_timeframe | Monitor timeframe for Azure Search throttled queries rate [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| azure\_search\_latency\_id | id for monitor azure_search_latency |
| azure\_search\_throttled\_queries\_rate\_id | id for monitor azure_search_throttled_queries_rate |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_app_services](https://docs.datadoghq.com/integrations/azure_app_services)

Azure Documentation [https://docs.microsoft.com/en-us/azure/search/search-monitor-usage](https://docs.microsoft.com/en-us/azure/search/search-monitor-usage)

Azure monitor metrics [https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftsearchsearchservices](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftsearchsearchservices)
