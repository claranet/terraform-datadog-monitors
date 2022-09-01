# CLOUD AZURE FRONTDOOR DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-frontdoor" {
  source      = "claranet/monitors/datadog//cloud/azure/frontdoor"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Front Door backend health is too low
- Front Door backend request latency is too high
- Front Door has no requests
- Front Door is down
- Front Door total latency is too high

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
| <a name="module_filter-tags-4xx-error"></a> [filter-tags-4xx-error](#module\_filter-tags-4xx-error) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-5xx-error"></a> [filter-tags-5xx-error](#module\_filter-tags-5xx-error) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-backend-4xx-error"></a> [filter-tags-backend-4xx-error](#module\_filter-tags-backend-4xx-error) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-backend-5xx-error"></a> [filter-tags-backend-5xx-error](#module\_filter-tags-backend-5xx-error) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.frontdoor_backend_health](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.frontdoor_backend_request_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.frontdoor_request_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.frontdoor_status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.frontdoor_total_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_frontdoor_backend_health_enabled"></a> [frontdoor\_backend\_health\_enabled](#input\_frontdoor\_backend\_health\_enabled) | Flag to enable Front Door backend health | `string` | `"true"` | no |
| <a name="input_frontdoor_backend_health_extra_tags"></a> [frontdoor\_backend\_health\_extra\_tags](#input\_frontdoor\_backend\_health\_extra\_tags) | Extra tags for Front Door backend health | `list(string)` | `[]` | no |
| <a name="input_frontdoor_backend_health_message"></a> [frontdoor\_backend\_health\_message](#input\_frontdoor\_backend\_health\_message) | Custom message for Front Door backend health | `string` | `""` | no |
| <a name="input_frontdoor_backend_health_threshold_critical"></a> [frontdoor\_backend\_health\_threshold\_critical](#input\_frontdoor\_backend\_health\_threshold\_critical) | Maximum acceptable end to end backend health (ms) for Front Door | `number` | `50` | no |
| <a name="input_frontdoor_backend_health_threshold_warning"></a> [frontdoor\_backend\_health\_threshold\_warning](#input\_frontdoor\_backend\_health\_threshold\_warning) | Warning threshold for Front Door backend health | `number` | `75` | no |
| <a name="input_frontdoor_backend_health_time_aggregator"></a> [frontdoor\_backend\_health\_time\_aggregator](#input\_frontdoor\_backend\_health\_time\_aggregator) | Monitor aggregator for Front Door backend health [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_frontdoor_backend_health_timeframe"></a> [frontdoor\_backend\_health\_timeframe](#input\_frontdoor\_backend\_health\_timeframe) | Monitor timeframe for Front Door backend health [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_frontdoor_backend_request_latency_enabled"></a> [frontdoor\_backend\_request\_latency\_enabled](#input\_frontdoor\_backend\_request\_latency\_enabled) | Flag to enable Front Door backend request latency | `string` | `"true"` | no |
| <a name="input_frontdoor_backend_request_latency_extra_tags"></a> [frontdoor\_backend\_request\_latency\_extra\_tags](#input\_frontdoor\_backend\_request\_latency\_extra\_tags) | Extra tags for Front Door backend request latency | `list(string)` | `[]` | no |
| <a name="input_frontdoor_backend_request_latency_message"></a> [frontdoor\_backend\_request\_latency\_message](#input\_frontdoor\_backend\_request\_latency\_message) | Custom message for Front Door backend request latency | `string` | `""` | no |
| <a name="input_frontdoor_backend_request_latency_threshold_critical"></a> [frontdoor\_backend\_request\_latency\_threshold\_critical](#input\_frontdoor\_backend\_request\_latency\_threshold\_critical) | Maximum acceptable end to end latency (ms) for Front Door backend request | `number` | `1000` | no |
| <a name="input_frontdoor_backend_request_latency_threshold_warning"></a> [frontdoor\_backend\_request\_latency\_threshold\_warning](#input\_frontdoor\_backend\_request\_latency\_threshold\_warning) | Warning threshold for Front Door backend request latency | `number` | `500` | no |
| <a name="input_frontdoor_backend_request_latency_time_aggregator"></a> [frontdoor\_backend\_request\_latency\_time\_aggregator](#input\_frontdoor\_backend\_request\_latency\_time\_aggregator) | Monitor aggregator for Front Door backend request latency [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_frontdoor_backend_request_latency_timeframe"></a> [frontdoor\_backend\_request\_latency\_timeframe](#input\_frontdoor\_backend\_request\_latency\_timeframe) | Monitor timeframe for Front Door backend request latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_frontdoor_request_count_enabled"></a> [frontdoor\_request\_count\_enabled](#input\_frontdoor\_request\_count\_enabled) | Flag to enable Front Door request count | `string` | `"true"` | no |
| <a name="input_frontdoor_request_count_extra_tags"></a> [frontdoor\_request\_count\_extra\_tags](#input\_frontdoor\_request\_count\_extra\_tags) | Extra tags for Front Door request count | `list(string)` | `[]` | no |
| <a name="input_frontdoor_request_count_message"></a> [frontdoor\_request\_count\_message](#input\_frontdoor\_request\_count\_message) | Custom message for Front Door request count | `string` | `""` | no |
| <a name="input_frontdoor_request_count_time_aggregator"></a> [frontdoor\_request\_count\_time\_aggregator](#input\_frontdoor\_request\_count\_time\_aggregator) | Monitor aggregator for Front Door request count [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_frontdoor_request_count_timeframe"></a> [frontdoor\_request\_count\_timeframe](#input\_frontdoor\_request\_count\_timeframe) | Monitor timeframe for Front Door request count [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_frontdoor_status_no_data_timeframe"></a> [frontdoor\_status\_no\_data\_timeframe](#input\_frontdoor\_status\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_frontdoor_total_latency_enabled"></a> [frontdoor\_total\_latency\_enabled](#input\_frontdoor\_total\_latency\_enabled) | Flag to enable Front Door total latency | `string` | `"true"` | no |
| <a name="input_frontdoor_total_latency_extra_tags"></a> [frontdoor\_total\_latency\_extra\_tags](#input\_frontdoor\_total\_latency\_extra\_tags) | Extra tags for Front Door total latency | `list(string)` | `[]` | no |
| <a name="input_frontdoor_total_latency_message"></a> [frontdoor\_total\_latency\_message](#input\_frontdoor\_total\_latency\_message) | Custom message for Front Door total latency | `string` | `""` | no |
| <a name="input_frontdoor_total_latency_threshold_critical"></a> [frontdoor\_total\_latency\_threshold\_critical](#input\_frontdoor\_total\_latency\_threshold\_critical) | Maximum acceptable end to end total latency (ms) for Front Door | `number` | `20` | no |
| <a name="input_frontdoor_total_latency_threshold_warning"></a> [frontdoor\_total\_latency\_threshold\_warning](#input\_frontdoor\_total\_latency\_threshold\_warning) | Warning threshold for Front Door total lantency | `number` | `15` | no |
| <a name="input_frontdoor_total_latency_time_aggregator"></a> [frontdoor\_total\_latency\_time\_aggregator](#input\_frontdoor\_total\_latency\_time\_aggregator) | Monitor aggregator for Front Door total latency [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_frontdoor_total_latency_timeframe"></a> [frontdoor\_total\_latency\_timeframe](#input\_frontdoor\_total\_latency\_timeframe) | Monitor timeframe for Front Door total latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_status_enabled"></a> [status\_enabled](#input\_status\_enabled) | Flag to enable App Gateway status | `string` | `"true"` | no |
| <a name="input_status_extra_tags"></a> [status\_extra\_tags](#input\_status\_extra\_tags) | Extra tags for App Gateway status | `list(string)` | `[]` | no |
| <a name="input_status_message"></a> [status\_message](#input\_status\_message) | Custom message for App Gateway status | `string` | `""` | no |
| <a name="input_status_time_aggregator"></a> [status\_time\_aggregator](#input\_status\_time\_aggregator) | Monitor aggregator for App Gateway status [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_status_timeframe"></a> [status\_timeframe](#input\_status\_timeframe) | Monitor timeframe for App Gateway status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontdoor_backend_health_id"></a> [frontdoor\_backend\_health\_id](#output\_frontdoor\_backend\_health\_id) | id for monitor frontdoor\_backend\_health |
| <a name="output_frontdoor_backend_request_latency_id"></a> [frontdoor\_backend\_request\_latency\_id](#output\_frontdoor\_backend\_request\_latency\_id) | id for monitor frontdoor\_backend\_request\_latency |
| <a name="output_frontdoor_request_count_id"></a> [frontdoor\_request\_count\_id](#output\_frontdoor\_request\_count\_id) | id for monitor frontdoor\_request\_count |
| <a name="output_frontdoor_status_id"></a> [frontdoor\_status\_id](#output\_frontdoor\_status\_id) | id for monitor frontdoor\_status |
| <a name="output_frontdoor_total_latency_id"></a> [frontdoor\_total\_latency\_id](#output\_frontdoor\_total\_latency\_id) | id for monitor frontdoor\_total\_latency |
## Related documentation

