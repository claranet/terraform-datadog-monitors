# CLOUD AZURE APP-SERVICES DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-app-services" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/app-services?ref={revision}"

  environment = "${var.environment}"
  message = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks :

- App Services response time too high
- App Services memory usage
- App Services HTTP 5xx errors too high
- App Services HTTP 4xx errors too high
- App Services HTTP successful responses too low

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| http_4xx_requests_message | Custom message for App Services 4xx requests monitor | string | `` | no |
| http_4xx_requests_silenced | Groups to mute for App Services 4xx requests monitor | map | `<map>` | no |
| http_4xx_requests_threshold_critical | Maximum critical acceptable percent of 4xx errors | string | `90` | no |
| http_4xx_requests_threshold_warning | Warning regarding acceptable percent of 4xx errors | string | `50` | no |
| http_4xx_requests_timeframe | Monitor timeframe for App Services 4xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| http_5xx_requests_message | Custom message for App Services 5xx requests monitor | string | `` | no |
| http_5xx_requests_silenced | Groups to mute for App Services 5xx requests monitor | map | `<map>` | no |
| http_5xx_requests_threshold_critical | Maximum critical acceptable percent of 5xx errors | string | `90` | no |
| http_5xx_requests_threshold_warning | Warning regarding acceptable percent of 5xx errors | string | `50` | no |
| http_5xx_requests_timeframe | Monitor timeframe for App Services 5xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| http_successful_requests_message | Custom message for App Services successful requests monitor | string | `` | no |
| http_successful_requests_silenced | Groups to mute for App Services successful requests monitor | map | `<map>` | no |
| http_successful_requests_threshold_critical | Minimum critical acceptable percent of 2xx & 3xx requests | string | `10` | no |
| http_successful_requests_threshold_warning | Warning regarding acceptable percent of 2xx & 3xx requests | string | `30` | no |
| http_successful_requests_timeframe | Monitor timeframe for App Services successful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| memory_usage_message | Custom message for App Services memory usage monitor | string | `` | no |
| memory_usage_silenced | Groups to mute for App Services memory usage monitor | map | `<map>` | no |
| memory_usage_threshold_critical | Alerting threshold in Mib | string | `1073741824` | no |
| memory_usage_threshold_warning | Warning threshold in MiB | string | `536870912` | no |
| memory_usage_time_aggregator | Monitor aggregator for App Services memory usage [available values: min, max or avg] | string | `min` | no |
| memory_usage_timeframe | Monitor timeframe for App Services memory usage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| response_time_message | Custom message for App Services response time monitor | string | `` | no |
| response_time_silenced | Groups to mute for App Services response time monitor | map | `<map>` | no |
| response_time_threshold_critical | Alerting threshold for response time in seconds | string | `10` | no |
| response_time_threshold_warning | Warning threshold for response time in seconds | string | `5` | no |
| response_time_time_aggregator | Monitor aggregator for App Services response time [available values: min, max or avg] | string | `min` | no |
| response_time_timeframe | Monitor timeframe for App Services response time [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

## Outputs

| Name | Description |
|------|-------------|
| appservices_http_4xx_errors_count_id | id for monitor appservices_http_4xx_errors_count |
| appservices_http_5xx_errors_count_id | id for monitor appservices_http_5xx_errors_count |
| appservices_http_success_status_rate_id | id for monitor appservices_http_success_status_rate |
| appservices_memory_usage_count_id | id for monitor appservices_memory_usage_count |
| appservices_response_time_id | id for monitor appservices_response_time |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_app_services](https://docs.datadoghq.com/integrations/azure_app_services)
