# CLOUD AZURE STORAGE DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-storage" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/storage?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Azure Storage is down
- Azure Storage too few successful requests
- Azure Storage too high end to end latency
- Azure Storage too many authorization errors
- Azure Storage too many client_other errors
- Azure Storage too many network errors
- Azure Storage too many server_other errors
- Azure Storage too many throttling errors
- Azure Storage too many timeout errors

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| authorization_error_requests_enabled | Flag to enable Storage authorization errors monitor | string | `true` | no |
| authorization_error_requests_extra_tags | Extra tags for Storage authorization errors monitor | list | `[]` | no |
| authorization_error_requests_message | Custom message for Storage authorization errors monitor | string | `` | no |
| authorization_error_requests_silenced | Groups to mute for Storage authorization errors monitor | map | `{}` | no |
| authorization_error_requests_threshold_critical | Maximum acceptable percent of authorization error requests for a storage | string | `90` | no |
| authorization_error_requests_threshold_warning | Warning regarding acceptable percent of authorization error requests for a storage | string | `50` | no |
| authorization_error_requests_time_aggregator | Monitor aggregator for Storage authorization errors [available values: min, max or avg] | string | `min` | no |
| authorization_error_requests_timeframe | Monitor timeframe for Storage authorization errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| availability_enabled | Flag to enable Storage availability monitor | string | `true` | no |
| availability_extra_tags | Extra tags for Storage availability monitor | list | `[]` | no |
| availability_message | Custom message for Storage availability monitor | string | `` | no |
| availability_silenced | Groups to mute for Storage availability monitor | map | `{}` | no |
| availability_threshold_critical | Minimum acceptable percent of availability for a storage | string | `50` | no |
| availability_threshold_warning | Warning regarding acceptable percent of availability for a storage | string | `90` | no |
| availability_time_aggregator | Monitor aggregator for Storage availability [available values: min, max or avg] | string | `max` | no |
| availability_timeframe | Monitor timeframe for Storage availability [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| client_other_error_requests_enabled | Flag to enable Storage other errors monitor | string | `true` | no |
| client_other_error_requests_extra_tags | Extra tags for Storage other errors monitor | list | `[]` | no |
| client_other_error_requests_message | Custom message for Storage other errors monitor | string | `` | no |
| client_other_error_requests_silenced | Groups to mute for Storage other errors monitor | map | `{}` | no |
| client_other_error_requests_threshold_critical | Maximum acceptable percent of client other error requests for a storage | string | `90` | no |
| client_other_error_requests_threshold_warning | Warning regarding acceptable percent of client other error requests for a storage | string | `50` | no |
| client_other_error_requests_time_aggregator | Monitor aggregator for Storage other errors [available values: min, max or avg] | string | `min` | no |
| client_other_error_requests_timeframe | Monitor timeframe for Storage other errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| environment | Architecture environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `900` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_custom_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| latency_enabled | Flag to enable Storage latency monitor | string | `true` | no |
| latency_extra_tags | Extra tags for Storage latency monitor | list | `[]` | no |
| latency_message | Custom message for Storage latency monitor | string | `` | no |
| latency_silenced | Groups to mute for Storage latency monitor | map | `{}` | no |
| latency_threshold_critical | Maximum acceptable end to end latency (ms) for a storage | string | `2000` | no |
| latency_threshold_warning | Warning regarding acceptable end to end latency (ms) for a storage | string | `1000` | no |
| latency_time_aggregator | Monitor aggregator for Storage latency [available values: min, max or avg] | string | `min` | no |
| latency_timeframe | Monitor timeframe for Storage latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| message | Message sent when a Redis monitor is triggered | string | - | yes |
| network_error_requests_enabled | Flag to enable Storage network errors monitor | string | `true` | no |
| network_error_requests_extra_tags | Extra tags for Storage network errors monitor | list | `[]` | no |
| network_error_requests_message | Custom message for Storage network errors monitor | string | `` | no |
| network_error_requests_silenced | Groups to mute for Storage network errors monitor | map | `{}` | no |
| network_error_requests_threshold_critical | Maximum acceptable percent of network error requests for a storage | string | `90` | no |
| network_error_requests_threshold_warning | Warning regarding acceptable percent of network error requests for a storage | string | `50` | no |
| network_error_requests_time_aggregator | Monitor aggregator for Storage network errors [available values: min, max or avg] | string | `min` | no |
| network_error_requests_timeframe | Monitor timeframe for Storage network errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |
| server_other_error_requests_enabled | Flag to enable Storage server other errors monitor | string | `true` | no |
| server_other_error_requests_extra_tags | Extra tags for Storage server other errors monitor | list | `[]` | no |
| server_other_error_requests_message | Custom message for Storage server other errors monitor | string | `` | no |
| server_other_error_requests_silenced | Groups to mute for Storage server other errors monitor | map | `{}` | no |
| server_other_error_requests_threshold_critical | Maximum acceptable percent of server other error requests for a storage | string | `90` | no |
| server_other_error_requests_threshold_warning | Warning regarding acceptable percent of server other error requests for a storage | string | `50` | no |
| server_other_error_requests_time_aggregator | Monitor aggregator for Storage other errors [available values: min, max or avg] | string | `min` | no |
| server_other_error_requests_timeframe | Monitor timeframe for Storage server other errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| successful_requests_enabled | Flag to enable Storage sucessful requests monitor | string | `true` | no |
| successful_requests_extra_tags | Extra tags for Storage sucessful requests monitor | list | `[]` | no |
| successful_requests_message | Custom message for Storage sucessful requests monitor | string | `` | no |
| successful_requests_silenced | Groups to mute for Storage sucessful requests monitor | map | `{}` | no |
| successful_requests_threshold_critical | Minimum acceptable percent of successful requests for a storage | string | `10` | no |
| successful_requests_threshold_warning | Warning regarding acceptable percent of successful requests for a storage | string | `30` | no |
| successful_requests_time_aggregator | Monitor aggregator for Storage sucessful requests [available values: min, max or avg] | string | `max` | no |
| successful_requests_timeframe | Monitor timeframe for Storage sucessful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| throttling_error_requests_enabled | Flag to enable Storage throttling error monitor | string | `true` | no |
| throttling_error_requests_extra_tags | Extra tags for Storage throttling error monitor | list | `[]` | no |
| throttling_error_requests_message | Custom message for Storage throttling error monitor | string | `` | no |
| throttling_error_requests_silenced | Groups to mute for Storage throttling error monitor | map | `{}` | no |
| throttling_error_requests_threshold_critical | Maximum acceptable percent of throttling error requests for a storage | string | `90` | no |
| throttling_error_requests_threshold_warning | Warning regarding acceptable percent of throttling error requests for a storage | string | `50` | no |
| throttling_error_requests_time_aggregator | Monitor aggregator for Storage throttling errors [available values: min, max or avg] | string | `min` | no |
| throttling_error_requests_timeframe | Monitor timeframe for Storage throttling errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| timeout_error_requests_enabled | Flag to enable Storage timeout monitor | string | `true` | no |
| timeout_error_requests_extra_tags | Extra tags for Storage timeout monitor | list | `[]` | no |
| timeout_error_requests_message | Custom message for Storage timeout monitor | string | `` | no |
| timeout_error_requests_silenced | Groups to mute for Storage timeout monitor | map | `{}` | no |
| timeout_error_requests_threshold_critical | Maximum acceptable percent of timeout error requests for a storage | string | `90` | no |
| timeout_error_requests_threshold_warning | Warning regarding acceptable percent of timeout error requests for a storage | string | `50` | no |
| timeout_error_requests_time_aggregator | Monitor aggregator for Storage timeout [available values: min, max or avg] | string | `min` | no |
| timeout_error_requests_timeframe | Monitor timeframe for Storage timeout [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

## Outputs

| Name | Description |
|------|-------------|
| authorization_error_requests_id | id for monitor authorization_error_requests |
| availability_id | id for monitor availability |
| client_other_error_requests_id | id for monitor client_other_error_requests |
| latency_id | id for monitor latency |
| network_error_requests_id | id for monitor network_error_requests |
| server_other_error_requests_id | id for monitor server_other_error_requests |
| successful_requests_id | id for monitor successful_requests |
| throttling_error_requests_id | id for monitor throttling_error_requests |
| timeout_error_requests_id | id for monitor timeout_error_requests |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_storage/](https://docs.datadoghq.com/integrations/azure_storage/)

DataDog blog: [https://www.datadoghq.com/blog/monitor-azure-storage-datadog/](https://www.datadoghq.com/blog/monitor-azure-storage-datadog/)

Azure Storage metrics documentation: [https://docs.microsoft.com/en-us/azure/storage/common/storage-monitor-storage-account](https://docs.microsoft.com/en-us/azure/storage/common/storage-monitor-storage-account)

Azure Storage metrics detailed documentation [https://docs.microsoft.com/en-us/rest/api/storageservices/storage-analytics-metrics-table-schema](https://docs.microsoft.com/en-us/rest/api/storageservices/storage-analytics-metrics-table-schema)
