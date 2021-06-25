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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.1.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.appservices_http_4xx_errors_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.appservices_http_5xx_errors_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.appservices_http_success_status_rate](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.appservices_memory_usage_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.appservices_response_time](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.appservices_status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appservices_status_no_data_timeframe"></a> [appservices\_status\_no\_data\_timeframe](#input\_appservices\_status\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_http_4xx_requests_enabled"></a> [http\_4xx\_requests\_enabled](#input\_http\_4xx\_requests\_enabled) | Flag to enable App Services 4xx requests monitor | `string` | `"true"` | no |
| <a name="input_http_4xx_requests_extra_tags"></a> [http\_4xx\_requests\_extra\_tags](#input\_http\_4xx\_requests\_extra\_tags) | Extra tags for App Services 4xx requests monitor | `list(string)` | `[]` | no |
| <a name="input_http_4xx_requests_message"></a> [http\_4xx\_requests\_message](#input\_http\_4xx\_requests\_message) | Custom message for App Services 4xx requests monitor | `string` | `""` | no |
| <a name="input_http_4xx_requests_threshold_critical"></a> [http\_4xx\_requests\_threshold\_critical](#input\_http\_4xx\_requests\_threshold\_critical) | Maximum critical acceptable percent of 4xx errors | `number` | `90` | no |
| <a name="input_http_4xx_requests_threshold_warning"></a> [http\_4xx\_requests\_threshold\_warning](#input\_http\_4xx\_requests\_threshold\_warning) | Warning regarding acceptable percent of 4xx errors | `number` | `50` | no |
| <a name="input_http_4xx_requests_time_aggregator"></a> [http\_4xx\_requests\_time\_aggregator](#input\_http\_4xx\_requests\_time\_aggregator) | Monitor aggregator for App Services 4xx requests [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_http_4xx_requests_timeframe"></a> [http\_4xx\_requests\_timeframe](#input\_http\_4xx\_requests\_timeframe) | Monitor timeframe for App Services 4xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_http_5xx_requests_enabled"></a> [http\_5xx\_requests\_enabled](#input\_http\_5xx\_requests\_enabled) | Flag to enable App Services 5xx requests monitor | `string` | `"true"` | no |
| <a name="input_http_5xx_requests_extra_tags"></a> [http\_5xx\_requests\_extra\_tags](#input\_http\_5xx\_requests\_extra\_tags) | Extra tags for App Services 5xx requests monitor | `list(string)` | `[]` | no |
| <a name="input_http_5xx_requests_message"></a> [http\_5xx\_requests\_message](#input\_http\_5xx\_requests\_message) | Custom message for App Services 5xx requests monitor | `string` | `""` | no |
| <a name="input_http_5xx_requests_threshold_critical"></a> [http\_5xx\_requests\_threshold\_critical](#input\_http\_5xx\_requests\_threshold\_critical) | Maximum critical acceptable percent of 5xx errors | `number` | `90` | no |
| <a name="input_http_5xx_requests_threshold_warning"></a> [http\_5xx\_requests\_threshold\_warning](#input\_http\_5xx\_requests\_threshold\_warning) | Warning regarding acceptable percent of 5xx errors | `number` | `50` | no |
| <a name="input_http_5xx_requests_time_aggregator"></a> [http\_5xx\_requests\_time\_aggregator](#input\_http\_5xx\_requests\_time\_aggregator) | Monitor aggregator for App Services 5xx requests [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_http_5xx_requests_timeframe"></a> [http\_5xx\_requests\_timeframe](#input\_http\_5xx\_requests\_timeframe) | Monitor timeframe for App Services 5xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_http_successful_requests_enabled"></a> [http\_successful\_requests\_enabled](#input\_http\_successful\_requests\_enabled) | Flag to enable App Services successful requests monitor | `string` | `"true"` | no |
| <a name="input_http_successful_requests_extra_tags"></a> [http\_successful\_requests\_extra\_tags](#input\_http\_successful\_requests\_extra\_tags) | Extra tags for App Services successful requests monitor | `list(string)` | `[]` | no |
| <a name="input_http_successful_requests_message"></a> [http\_successful\_requests\_message](#input\_http\_successful\_requests\_message) | Custom message for App Services successful requests monitor | `string` | `""` | no |
| <a name="input_http_successful_requests_threshold_critical"></a> [http\_successful\_requests\_threshold\_critical](#input\_http\_successful\_requests\_threshold\_critical) | Minimum critical acceptable percent of 2xx & 3xx requests | `number` | `10` | no |
| <a name="input_http_successful_requests_threshold_warning"></a> [http\_successful\_requests\_threshold\_warning](#input\_http\_successful\_requests\_threshold\_warning) | Warning regarding acceptable percent of 2xx & 3xx requests | `number` | `30` | no |
| <a name="input_http_successful_requests_time_aggregator"></a> [http\_successful\_requests\_time\_aggregator](#input\_http\_successful\_requests\_time\_aggregator) | Monitor aggregator for App Services successful requests [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_http_successful_requests_timeframe"></a> [http\_successful\_requests\_timeframe](#input\_http\_successful\_requests\_timeframe) | Monitor timeframe for App Services successful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_memory_usage_enabled"></a> [memory\_usage\_enabled](#input\_memory\_usage\_enabled) | Flag to enable App Services memory usage monitor | `string` | `"true"` | no |
| <a name="input_memory_usage_extra_tags"></a> [memory\_usage\_extra\_tags](#input\_memory\_usage\_extra\_tags) | Extra tags for App Services memory usage monitor | `list(string)` | `[]` | no |
| <a name="input_memory_usage_message"></a> [memory\_usage\_message](#input\_memory\_usage\_message) | Custom message for App Services memory usage monitor | `string` | `""` | no |
| <a name="input_memory_usage_threshold_critical"></a> [memory\_usage\_threshold\_critical](#input\_memory\_usage\_threshold\_critical) | Alerting threshold in Mib | `number` | `1073741824` | no |
| <a name="input_memory_usage_threshold_warning"></a> [memory\_usage\_threshold\_warning](#input\_memory\_usage\_threshold\_warning) | Warning threshold in MiB | `number` | `536870912` | no |
| <a name="input_memory_usage_time_aggregator"></a> [memory\_usage\_time\_aggregator](#input\_memory\_usage\_time\_aggregator) | Monitor aggregator for App Services memory usage [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_memory_usage_timeframe"></a> [memory\_usage\_timeframe](#input\_memory\_usage\_timeframe) | Monitor timeframe for App Services memory usage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_response_time_enabled"></a> [response\_time\_enabled](#input\_response\_time\_enabled) | Flag to enable App Services response time monitor | `string` | `"true"` | no |
| <a name="input_response_time_extra_tags"></a> [response\_time\_extra\_tags](#input\_response\_time\_extra\_tags) | Extra tags for App Services response time monitor | `list(string)` | `[]` | no |
| <a name="input_response_time_message"></a> [response\_time\_message](#input\_response\_time\_message) | Custom message for App Services response time monitor | `string` | `""` | no |
| <a name="input_response_time_threshold_critical"></a> [response\_time\_threshold\_critical](#input\_response\_time\_threshold\_critical) | Alerting threshold for response time in seconds | `number` | `10` | no |
| <a name="input_response_time_threshold_warning"></a> [response\_time\_threshold\_warning](#input\_response\_time\_threshold\_warning) | Warning threshold for response time in seconds | `number` | `5` | no |
| <a name="input_response_time_time_aggregator"></a> [response\_time\_time\_aggregator](#input\_response\_time\_time\_aggregator) | Monitor aggregator for App Services response time [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_response_time_timeframe"></a> [response\_time\_timeframe](#input\_response\_time\_timeframe) | Monitor timeframe for App Services response time [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_status_enabled"></a> [status\_enabled](#input\_status\_enabled) | Flag to enable App Services status monitor | `string` | `"true"` | no |
| <a name="input_status_extra_tags"></a> [status\_extra\_tags](#input\_status\_extra\_tags) | Extra tags for App Services status monitor | `list(string)` | `[]` | no |
| <a name="input_status_message"></a> [status\_message](#input\_status\_message) | Custom message for App Services status monitor | `string` | `""` | no |
| <a name="input_status_time_aggregator"></a> [status\_time\_aggregator](#input\_status\_time\_aggregator) | Monitor aggregator for App Services status [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_status_timeframe"></a> [status\_timeframe](#input\_status\_timeframe) | Monitor timeframe for App Services status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_appservices_http_4xx_errors_count_id"></a> [appservices\_http\_4xx\_errors\_count\_id](#output\_appservices\_http\_4xx\_errors\_count\_id) | id for monitor appservices\_http\_4xx\_errors\_count |
| <a name="output_appservices_http_5xx_errors_count_id"></a> [appservices\_http\_5xx\_errors\_count\_id](#output\_appservices\_http\_5xx\_errors\_count\_id) | id for monitor appservices\_http\_5xx\_errors\_count |
| <a name="output_appservices_http_success_status_rate_id"></a> [appservices\_http\_success\_status\_rate\_id](#output\_appservices\_http\_success\_status\_rate\_id) | id for monitor appservices\_http\_success\_status\_rate |
| <a name="output_appservices_memory_usage_count_id"></a> [appservices\_memory\_usage\_count\_id](#output\_appservices\_memory\_usage\_count\_id) | id for monitor appservices\_memory\_usage\_count |
| <a name="output_appservices_response_time_id"></a> [appservices\_response\_time\_id](#output\_appservices\_response\_time\_id) | id for monitor appservices\_response\_time |
| <a name="output_appservices_status_id"></a> [appservices\_status\_id](#output\_appservices\_status\_id) | id for monitor appservices\_status |
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_app_services](https://docs.datadoghq.com/integrations/azure_app_services)
