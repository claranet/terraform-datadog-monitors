# CLOUD AZURE APP-GATEWAY DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-app-gateway" {
  source      = "claranet/monitors/datadog//cloud/azure/app-gateway"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- App Gateway backend connect time is too high
- App Gateway backend HTTP 4xx errors rate is too high
- App Gateway backend HTTP 5xx errors rate is too high
- App Gateway backend unhealthy host ratio is too high
- App Gateway failed requests
- App Gateway has no requests
- App Gateway HTTP 4xx errors rate is too high
- App Gateway HTTP 5xx errors rate is too high
- App Gateway is down

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
| <a name="module_filter-tags-4xx-error"></a> [filter-tags-4xx-error](#module\_filter-tags-4xx-error) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-5xx-error"></a> [filter-tags-5xx-error](#module\_filter-tags-5xx-error) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-backend-4xx-error"></a> [filter-tags-backend-4xx-error](#module\_filter-tags-backend-4xx-error) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-backend-5xx-error"></a> [filter-tags-backend-5xx-error](#module\_filter-tags-backend-5xx-error) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.appgateway_backend_connect_time](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.appgateway_backend_http_4xx_errors](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.appgateway_backend_http_5xx_errors](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.appgateway_failed_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.appgateway_healthy_host_ratio](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.appgateway_http_4xx_errors](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.appgateway_http_5xx_errors](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.appgateway_status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.total_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appgateway_backend_connect_time_enabled"></a> [appgateway\_backend\_connect\_time\_enabled](#input\_appgateway\_backend\_connect\_time\_enabled) | Flag to enable App Gateway backend\_connect\_time monitor | `string` | `"true"` | no |
| <a name="input_appgateway_backend_connect_time_extra_tags"></a> [appgateway\_backend\_connect\_time\_extra\_tags](#input\_appgateway\_backend\_connect\_time\_extra\_tags) | Extra tags for App Gateway backend\_connect\_time monitor | `list(string)` | `[]` | no |
| <a name="input_appgateway_backend_connect_time_message"></a> [appgateway\_backend\_connect\_time\_message](#input\_appgateway\_backend\_connect\_time\_message) | Custom message for App Gateway backend\_connect\_time monitor | `string` | `""` | no |
| <a name="input_appgateway_backend_connect_time_threshold_critical"></a> [appgateway\_backend\_connect\_time\_threshold\_critical](#input\_appgateway\_backend\_connect\_time\_threshold\_critical) | Maximum critical backend\_connect\_time errors in milliseconds | `number` | `50` | no |
| <a name="input_appgateway_backend_connect_time_threshold_warning"></a> [appgateway\_backend\_connect\_time\_threshold\_warning](#input\_appgateway\_backend\_connect\_time\_threshold\_warning) | Warning regarding backend\_connect\_time errors in milliseconds | `number` | `40` | no |
| <a name="input_appgateway_backend_connect_time_time_aggregator"></a> [appgateway\_backend\_connect\_time\_time\_aggregator](#input\_appgateway\_backend\_connect\_time\_time\_aggregator) | Monitor aggregator for App Gateway backend\_connect\_time [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_appgateway_backend_connect_time_timeframe"></a> [appgateway\_backend\_connect\_time\_timeframe](#input\_appgateway\_backend\_connect\_time\_timeframe) | Monitor timeframe for App Gateway backend\_connect\_time [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_appgateway_backend_http_4xx_errors_enabled"></a> [appgateway\_backend\_http\_4xx\_errors\_enabled](#input\_appgateway\_backend\_http\_4xx\_errors\_enabled) | Flag to enable App Gateway http 4xx errors monitor | `string` | `"true"` | no |
| <a name="input_appgateway_backend_http_4xx_errors_extra_tags"></a> [appgateway\_backend\_http\_4xx\_errors\_extra\_tags](#input\_appgateway\_backend\_http\_4xx\_errors\_extra\_tags) | Extra tags for App Gateway http 4xx errors monitor | `list(string)` | `[]` | no |
| <a name="input_appgateway_backend_http_4xx_errors_message"></a> [appgateway\_backend\_http\_4xx\_errors\_message](#input\_appgateway\_backend\_http\_4xx\_errors\_message) | Custom message for App Gateway http 4xx errors monitor | `string` | `""` | no |
| <a name="input_appgateway_backend_http_4xx_errors_threshold_critical"></a> [appgateway\_backend\_http\_4xx\_errors\_threshold\_critical](#input\_appgateway\_backend\_http\_4xx\_errors\_threshold\_critical) | Minimum critical acceptable percent of 4xx error | `number` | `95` | no |
| <a name="input_appgateway_backend_http_4xx_errors_threshold_warning"></a> [appgateway\_backend\_http\_4xx\_errors\_threshold\_warning](#input\_appgateway\_backend\_http\_4xx\_errors\_threshold\_warning) | Warning regarding acceptable percent of 4xx error | `number` | `80` | no |
| <a name="input_appgateway_backend_http_4xx_errors_time_aggregator"></a> [appgateway\_backend\_http\_4xx\_errors\_time\_aggregator](#input\_appgateway\_backend\_http\_4xx\_errors\_time\_aggregator) | Monitor aggregator for App Gateway http 4xx errors [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_appgateway_backend_http_4xx_errors_timeframe"></a> [appgateway\_backend\_http\_4xx\_errors\_timeframe](#input\_appgateway\_backend\_http\_4xx\_errors\_timeframe) | Monitor timeframe for App Gateway http 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_appgateway_backend_http_5xx_errors_enabled"></a> [appgateway\_backend\_http\_5xx\_errors\_enabled](#input\_appgateway\_backend\_http\_5xx\_errors\_enabled) | Flag to enable App Gateway http 5xx errors monitor | `string` | `"true"` | no |
| <a name="input_appgateway_backend_http_5xx_errors_extra_tags"></a> [appgateway\_backend\_http\_5xx\_errors\_extra\_tags](#input\_appgateway\_backend\_http\_5xx\_errors\_extra\_tags) | Extra tags for App Gateway http 5xx errors monitor | `list(string)` | `[]` | no |
| <a name="input_appgateway_backend_http_5xx_errors_message"></a> [appgateway\_backend\_http\_5xx\_errors\_message](#input\_appgateway\_backend\_http\_5xx\_errors\_message) | Custom message for App Gateway http 5xx errors monitor | `string` | `""` | no |
| <a name="input_appgateway_backend_http_5xx_errors_threshold_critical"></a> [appgateway\_backend\_http\_5xx\_errors\_threshold\_critical](#input\_appgateway\_backend\_http\_5xx\_errors\_threshold\_critical) | Minimum critical acceptable percent of 5xx error | `number` | `95` | no |
| <a name="input_appgateway_backend_http_5xx_errors_threshold_warning"></a> [appgateway\_backend\_http\_5xx\_errors\_threshold\_warning](#input\_appgateway\_backend\_http\_5xx\_errors\_threshold\_warning) | Warning regarding acceptable percent of 5xx error | `number` | `80` | no |
| <a name="input_appgateway_backend_http_5xx_errors_time_aggregator"></a> [appgateway\_backend\_http\_5xx\_errors\_time\_aggregator](#input\_appgateway\_backend\_http\_5xx\_errors\_time\_aggregator) | Monitor aggregator for App Gateway http 5xx errors [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_appgateway_backend_http_5xx_errors_timeframe"></a> [appgateway\_backend\_http\_5xx\_errors\_timeframe](#input\_appgateway\_backend\_http\_5xx\_errors\_timeframe) | Monitor timeframe for App Gateway http 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_appgateway_failed_requests_enabled"></a> [appgateway\_failed\_requests\_enabled](#input\_appgateway\_failed\_requests\_enabled) | Flag to enable App Gateway failed requests monitor | `string` | `"true"` | no |
| <a name="input_appgateway_failed_requests_extra_tags"></a> [appgateway\_failed\_requests\_extra\_tags](#input\_appgateway\_failed\_requests\_extra\_tags) | Extra tags for App Gateway failed requests monitor | `list(string)` | `[]` | no |
| <a name="input_appgateway_failed_requests_message"></a> [appgateway\_failed\_requests\_message](#input\_appgateway\_failed\_requests\_message) | Custom message for App Gateway failed requests monitor | `string` | `""` | no |
| <a name="input_appgateway_failed_requests_threshold_critical"></a> [appgateway\_failed\_requests\_threshold\_critical](#input\_appgateway\_failed\_requests\_threshold\_critical) | Maximum critical acceptable percent of failed errors | `number` | `95` | no |
| <a name="input_appgateway_failed_requests_threshold_warning"></a> [appgateway\_failed\_requests\_threshold\_warning](#input\_appgateway\_failed\_requests\_threshold\_warning) | Warning regarding acceptable percent of failed errors | `number` | `80` | no |
| <a name="input_appgateway_failed_requests_time_aggregator"></a> [appgateway\_failed\_requests\_time\_aggregator](#input\_appgateway\_failed\_requests\_time\_aggregator) | Monitor aggregator for App Gateway failed requests [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_appgateway_failed_requests_timeframe"></a> [appgateway\_failed\_requests\_timeframe](#input\_appgateway\_failed\_requests\_timeframe) | Monitor timeframe for App Gateway failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_appgateway_http_4xx_errors_enabled"></a> [appgateway\_http\_4xx\_errors\_enabled](#input\_appgateway\_http\_4xx\_errors\_enabled) | Flag to enable App Gateway http 4xx errors monitor | `string` | `"true"` | no |
| <a name="input_appgateway_http_4xx_errors_extra_tags"></a> [appgateway\_http\_4xx\_errors\_extra\_tags](#input\_appgateway\_http\_4xx\_errors\_extra\_tags) | Extra tags for App Gateway http 4xx errors monitor | `list(string)` | `[]` | no |
| <a name="input_appgateway_http_4xx_errors_message"></a> [appgateway\_http\_4xx\_errors\_message](#input\_appgateway\_http\_4xx\_errors\_message) | Custom message for App Gateway http 4xx errors monitor | `string` | `""` | no |
| <a name="input_appgateway_http_4xx_errors_threshold_critical"></a> [appgateway\_http\_4xx\_errors\_threshold\_critical](#input\_appgateway\_http\_4xx\_errors\_threshold\_critical) | Maximum critical acceptable percent of 4xx error | `number` | `95` | no |
| <a name="input_appgateway_http_4xx_errors_threshold_warning"></a> [appgateway\_http\_4xx\_errors\_threshold\_warning](#input\_appgateway\_http\_4xx\_errors\_threshold\_warning) | Warning regarding acceptable percent of 4xx error | `number` | `80` | no |
| <a name="input_appgateway_http_4xx_errors_time_aggregator"></a> [appgateway\_http\_4xx\_errors\_time\_aggregator](#input\_appgateway\_http\_4xx\_errors\_time\_aggregator) | Monitor aggregator for App Gateway http 4xx errors [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_appgateway_http_4xx_errors_timeframe"></a> [appgateway\_http\_4xx\_errors\_timeframe](#input\_appgateway\_http\_4xx\_errors\_timeframe) | Monitor timeframe for App Gateway http 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_appgateway_http_5xx_errors_enabled"></a> [appgateway\_http\_5xx\_errors\_enabled](#input\_appgateway\_http\_5xx\_errors\_enabled) | Flag to enable App Gateway http 5xx errors monitor | `string` | `"true"` | no |
| <a name="input_appgateway_http_5xx_errors_extra_tags"></a> [appgateway\_http\_5xx\_errors\_extra\_tags](#input\_appgateway\_http\_5xx\_errors\_extra\_tags) | Extra tags for App Gateway http 5xx errors monitor | `list(string)` | `[]` | no |
| <a name="input_appgateway_http_5xx_errors_message"></a> [appgateway\_http\_5xx\_errors\_message](#input\_appgateway\_http\_5xx\_errors\_message) | Custom message for App Gateway http 5xx errors monitor | `string` | `""` | no |
| <a name="input_appgateway_http_5xx_errors_threshold_critical"></a> [appgateway\_http\_5xx\_errors\_threshold\_critical](#input\_appgateway\_http\_5xx\_errors\_threshold\_critical) | Maximum critical acceptable percent of 5xx error | `number` | `95` | no |
| <a name="input_appgateway_http_5xx_errors_threshold_warning"></a> [appgateway\_http\_5xx\_errors\_threshold\_warning](#input\_appgateway\_http\_5xx\_errors\_threshold\_warning) | Warning regarding acceptable percent of 5xx error | `number` | `80` | no |
| <a name="input_appgateway_http_5xx_errors_time_aggregator"></a> [appgateway\_http\_5xx\_errors\_time\_aggregator](#input\_appgateway\_http\_5xx\_errors\_time\_aggregator) | Monitor aggregator for App Gateway http 5xx errors [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_appgateway_http_5xx_errors_timeframe"></a> [appgateway\_http\_5xx\_errors\_timeframe](#input\_appgateway\_http\_5xx\_errors\_timeframe) | Monitor timeframe for App Gateway http 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_appgateway_status_no_data_timeframe"></a> [appgateway\_status\_no\_data\_timeframe](#input\_appgateway\_status\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_appgateway_unhealthy_host_ratio_enabled"></a> [appgateway\_unhealthy\_host\_ratio\_enabled](#input\_appgateway\_unhealthy\_host\_ratio\_enabled) | Flag to enable App Gateway unhealthy host ratio monitor | `string` | `"true"` | no |
| <a name="input_appgateway_unhealthy_host_ratio_extra_tags"></a> [appgateway\_unhealthy\_host\_ratio\_extra\_tags](#input\_appgateway\_unhealthy\_host\_ratio\_extra\_tags) | Extra tags for App Gateway unhealthy host ratio monitor | `list(string)` | `[]` | no |
| <a name="input_appgateway_unhealthy_host_ratio_message"></a> [appgateway\_unhealthy\_host\_ratio\_message](#input\_appgateway\_unhealthy\_host\_ratio\_message) | Custom message for App Gateway unhealthy host ratio monitor | `string` | `""` | no |
| <a name="input_appgateway_unhealthy_host_ratio_threshold_critical"></a> [appgateway\_unhealthy\_host\_ratio\_threshold\_critical](#input\_appgateway\_unhealthy\_host\_ratio\_threshold\_critical) | Maximum critical acceptable ratio of unhealthy host | `number` | `75` | no |
| <a name="input_appgateway_unhealthy_host_ratio_threshold_warning"></a> [appgateway\_unhealthy\_host\_ratio\_threshold\_warning](#input\_appgateway\_unhealthy\_host\_ratio\_threshold\_warning) | Warning regarding acceptable ratio of unhealthy host | `number` | `50` | no |
| <a name="input_appgateway_unhealthy_host_ratio_time_aggregator"></a> [appgateway\_unhealthy\_host\_ratio\_time\_aggregator](#input\_appgateway\_unhealthy\_host\_ratio\_time\_aggregator) | Monitor aggregator for App Gateway unhealthy host ratio [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_appgateway_unhealthy_host_ratio_timeframe"></a> [appgateway\_unhealthy\_host\_ratio\_timeframe](#input\_appgateway\_unhealthy\_host\_ratio\_timeframe) | Monitor timeframe for App Gateway unhealthy host ratio [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_status_enabled"></a> [status\_enabled](#input\_status\_enabled) | Flag to enable App Gateway status | `string` | `"true"` | no |
| <a name="input_status_extra_tags"></a> [status\_extra\_tags](#input\_status\_extra\_tags) | Extra tags for App Gateway status | `list(string)` | `[]` | no |
| <a name="input_status_message"></a> [status\_message](#input\_status\_message) | Custom message for App Gateway status | `string` | `""` | no |
| <a name="input_status_time_aggregator"></a> [status\_time\_aggregator](#input\_status\_time\_aggregator) | Monitor aggregator for App Gateway status [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_status_timeframe"></a> [status\_timeframe](#input\_status\_timeframe) | Monitor timeframe for App Gateway status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_total_requests_enabled"></a> [total\_requests\_enabled](#input\_total\_requests\_enabled) | Flag to enable App Gateway current connections monitor | `string` | `"true"` | no |
| <a name="input_total_requests_extra_tags"></a> [total\_requests\_extra\_tags](#input\_total\_requests\_extra\_tags) | Extra tags for App Gateway current connections monitor | `list(string)` | `[]` | no |
| <a name="input_total_requests_message"></a> [total\_requests\_message](#input\_total\_requests\_message) | Custom message for App Gateway current connections monitor | `string` | `""` | no |
| <a name="input_total_requests_time_aggregator"></a> [total\_requests\_time\_aggregator](#input\_total\_requests\_time\_aggregator) | Monitor aggregator for App Gateway current connections [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_total_requests_timeframe"></a> [total\_requests\_timeframe](#input\_total\_requests\_timeframe) | Monitor timeframe for App Gateway current connections [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_appgateway_backend_connect_time_id"></a> [appgateway\_backend\_connect\_time\_id](#output\_appgateway\_backend\_connect\_time\_id) | id for monitor appgateway\_backend\_connect\_time |
| <a name="output_appgateway_backend_http_4xx_errors_id"></a> [appgateway\_backend\_http\_4xx\_errors\_id](#output\_appgateway\_backend\_http\_4xx\_errors\_id) | id for monitor appgateway\_backend\_http\_4xx\_errors |
| <a name="output_appgateway_backend_http_5xx_errors_id"></a> [appgateway\_backend\_http\_5xx\_errors\_id](#output\_appgateway\_backend\_http\_5xx\_errors\_id) | id for monitor appgateway\_backend\_http\_5xx\_errors |
| <a name="output_appgateway_failed_requests_id"></a> [appgateway\_failed\_requests\_id](#output\_appgateway\_failed\_requests\_id) | id for monitor appgateway\_failed\_requests |
| <a name="output_appgateway_healthy_host_ratio_id"></a> [appgateway\_healthy\_host\_ratio\_id](#output\_appgateway\_healthy\_host\_ratio\_id) | id for monitor appgateway\_healthy\_host\_ratio |
| <a name="output_appgateway_http_4xx_errors_id"></a> [appgateway\_http\_4xx\_errors\_id](#output\_appgateway\_http\_4xx\_errors\_id) | id for monitor appgateway\_http\_4xx\_errors |
| <a name="output_appgateway_http_5xx_errors_id"></a> [appgateway\_http\_5xx\_errors\_id](#output\_appgateway\_http\_5xx\_errors\_id) | id for monitor appgateway\_http\_5xx\_errors |
| <a name="output_appgateway_status_id"></a> [appgateway\_status\_id](#output\_appgateway\_status\_id) | id for monitor appgateway\_status |
| <a name="output_total_requests_id"></a> [total\_requests\_id](#output\_total\_requests\_id) | id for monitor total\_requests |
<!-- END_TF_DOCS -->
## Related documentation

