# CLOUD AZURE AZURE-SEARCH DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-azure-search" {
  source      = "claranet/monitors/datadog//cloud/azure/azure-search"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Azure Search latency too high
- Azure Search throttled queries rate is too high

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.1.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.azure_search_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.azure_search_throttled_queries_rate](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_search_latency_no_data_timeframe"></a> [azure\_search\_latency\_no\_data\_timeframe](#input\_azure\_search\_latency\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_latency_enabled"></a> [latency\_enabled](#input\_latency\_enabled) | Flag to enable Azure Search latency monitor | `string` | `"true"` | no |
| <a name="input_latency_extra_tags"></a> [latency\_extra\_tags](#input\_latency\_extra\_tags) | Extra tags for Azure Search latency monitor | `list(string)` | `[]` | no |
| <a name="input_latency_message"></a> [latency\_message](#input\_latency\_message) | Custom message for Azure Search latency monitor | `string` | `""` | no |
| <a name="input_latency_threshold_critical"></a> [latency\_threshold\_critical](#input\_latency\_threshold\_critical) | Alerting threshold for Azure Search latency in seconds | `number` | `4` | no |
| <a name="input_latency_threshold_warning"></a> [latency\_threshold\_warning](#input\_latency\_threshold\_warning) | Warning threshold for Azure Search latency in seconds | `number` | `2` | no |
| <a name="input_latency_time_aggregator"></a> [latency\_time\_aggregator](#input\_latency\_time\_aggregator) | Monitor aggregator for Azure Search latency [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_latency_timeframe"></a> [latency\_timeframe](#input\_latency\_timeframe) | Monitor timeframe for Azure Search latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_throttled_queries_rate_enabled"></a> [throttled\_queries\_rate\_enabled](#input\_throttled\_queries\_rate\_enabled) | Flag to enable Azure Search throttled queries rate monitor | `string` | `"true"` | no |
| <a name="input_throttled_queries_rate_extra_tags"></a> [throttled\_queries\_rate\_extra\_tags](#input\_throttled\_queries\_rate\_extra\_tags) | Extra tags for Azure Search throttled queries rate monitor | `list(string)` | `[]` | no |
| <a name="input_throttled_queries_rate_message"></a> [throttled\_queries\_rate\_message](#input\_throttled\_queries\_rate\_message) | Custom message for Azure Search throttled queries rate monitor | `string` | `""` | no |
| <a name="input_throttled_queries_rate_threshold_critical"></a> [throttled\_queries\_rate\_threshold\_critical](#input\_throttled\_queries\_rate\_threshold\_critical) | Alerting threshold for Azure Search throttled queries rate | `number` | `50` | no |
| <a name="input_throttled_queries_rate_threshold_warning"></a> [throttled\_queries\_rate\_threshold\_warning](#input\_throttled\_queries\_rate\_threshold\_warning) | Warning threshold for Azure Search throttled queries rate | `number` | `25` | no |
| <a name="input_throttled_queries_rate_time_aggregator"></a> [throttled\_queries\_rate\_time\_aggregator](#input\_throttled\_queries\_rate\_time\_aggregator) | Monitor aggregator for Azure Search throttled queries rate [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_throttled_queries_rate_timeframe"></a> [throttled\_queries\_rate\_timeframe](#input\_throttled\_queries\_rate\_timeframe) | Monitor timeframe for Azure Search throttled queries rate [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure_search_latency_id"></a> [azure\_search\_latency\_id](#output\_azure\_search\_latency\_id) | id for monitor azure\_search\_latency |
| <a name="output_azure_search_throttled_queries_rate_id"></a> [azure\_search\_throttled\_queries\_rate\_id](#output\_azure\_search\_throttled\_queries\_rate\_id) | id for monitor azure\_search\_throttled\_queries\_rate |
<!-- END_TF_DOCS -->
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_app_services](https://docs.datadoghq.com/integrations/azure_app_services)

Azure Documentation [https://docs.microsoft.com/en-us/azure/search/search-monitor-usage](https://docs.microsoft.com/en-us/azure/search/search-monitor-usage)

Azure monitor metrics [https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftsearchsearchservices](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftsearchsearchservices)
