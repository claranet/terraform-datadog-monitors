# CLOUD AZURE STORAGE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-storage" {
  source      = "claranet/monitors/datadog//cloud/azure/storage"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Azure Blob Storage too many authorization errors
- Azure Blob Storage too many client_other errors
- Azure Blob Storage too many network errors
- Azure Blob Storage too many server_other errors
- Azure Blob Storage too many throttling errors
- Azure Blob Storage too many timeout errors
- Azure File Storage too many authorization errors
- Azure File Storage too many client_other errors
- Azure File Storage too many network errors
- Azure File Storage too many server_other errors
- Azure File Storage too many throttling errors
- Azure File Storage too many timeout errors
- Azure Queue Storage too many authorization errors
- Azure Queue Storage too many client_other errors
- Azure Queue Storage too many network errors
- Azure Queue Storage too many server_other errors
- Azure Queue Storage too many throttling errors
- Azure Queue Storage too many timeout errors
- Azure Storage Blob service too few successful requests
- Azure Storage Blob service too high end to end latency
- Azure Storage File service too few successful requests
- Azure Storage File service too high end to end latency
- Azure Storage is down
- Azure Storage Queue service too few successful requests
- Azure Storage Queue service too high end to end latency
- Azure Storage Table service too few successful requests
- Azure Storage Table service too high end to end latency
- Azure Table Storage too many authorization errors
- Azure Table Storage too many client_other errors
- Azure Table Storage too many network errors
- Azure Table Storage too many server_other errors
- Azure Table Storage too many throttling errors
- Azure Table Storage too many timeout errors

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
| <a name="module_filter-tags-authorization-error"></a> [filter-tags-authorization-error](#module\_filter-tags-authorization-error) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-blob"></a> [filter-tags-blob](#module\_filter-tags-blob) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-client-other-error"></a> [filter-tags-client-other-error](#module\_filter-tags-client-other-error) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-client-other-error-blob"></a> [filter-tags-client-other-error-blob](#module\_filter-tags-client-other-error-blob) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-network-error"></a> [filter-tags-network-error](#module\_filter-tags-network-error) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-server-other-error"></a> [filter-tags-server-other-error](#module\_filter-tags-server-other-error) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-status"></a> [filter-tags-status](#module\_filter-tags-status) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-success"></a> [filter-tags-success](#module\_filter-tags-success) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-success-blob"></a> [filter-tags-success-blob](#module\_filter-tags-success-blob) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-throttling-error"></a> [filter-tags-throttling-error](#module\_filter-tags-throttling-error) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-timeout-error"></a> [filter-tags-timeout-error](#module\_filter-tags-timeout-error) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.blob_authorization_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.blob_client_other_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.blob_network_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.blob_server_other_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.blob_throttling_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.blob_timeout_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.blobservices_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.blobservices_requests_error](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.file_authorization_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.file_client_other_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.file_network_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.file_server_other_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.file_throttling_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.file_timeout_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.fileservices_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.fileservices_requests_error](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.queue_authorization_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.queue_client_other_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.queue_network_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.queue_server_other_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.queue_throttling_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.queue_timeout_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.queueservices_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.queueservices_requests_error](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.storage_status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.table_authorization_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.table_client_other_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.table_network_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.table_server_other_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.table_throttling_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.table_timeout_error_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.tableservices_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.tableservices_requests_error](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authorization_error_requests_enabled"></a> [authorization\_error\_requests\_enabled](#input\_authorization\_error\_requests\_enabled) | Flag to enable Storage authorization errors monitor | `string` | `"true"` | no |
| <a name="input_authorization_error_requests_extra_tags"></a> [authorization\_error\_requests\_extra\_tags](#input\_authorization\_error\_requests\_extra\_tags) | Extra tags for Storage authorization errors monitor | `list(string)` | `[]` | no |
| <a name="input_authorization_error_requests_message"></a> [authorization\_error\_requests\_message](#input\_authorization\_error\_requests\_message) | Custom message for Storage authorization errors monitor | `string` | `""` | no |
| <a name="input_authorization_error_requests_threshold_critical"></a> [authorization\_error\_requests\_threshold\_critical](#input\_authorization\_error\_requests\_threshold\_critical) | Maximum acceptable percent of authorization error requests for a storage | `number` | `90` | no |
| <a name="input_authorization_error_requests_threshold_warning"></a> [authorization\_error\_requests\_threshold\_warning](#input\_authorization\_error\_requests\_threshold\_warning) | Warning regarding acceptable percent of authorization error requests for a storage | `number` | `50` | no |
| <a name="input_authorization_error_requests_time_aggregator"></a> [authorization\_error\_requests\_time\_aggregator](#input\_authorization\_error\_requests\_time\_aggregator) | Monitor aggregator for Storage authorization errors [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_authorization_error_requests_timeframe"></a> [authorization\_error\_requests\_timeframe](#input\_authorization\_error\_requests\_timeframe) | Monitor timeframe for Storage authorization errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_availability_enabled"></a> [availability\_enabled](#input\_availability\_enabled) | Flag to enable Storage availability monitor | `string` | `"true"` | no |
| <a name="input_availability_extra_tags"></a> [availability\_extra\_tags](#input\_availability\_extra\_tags) | Extra tags for Storage availability monitor | `list(string)` | `[]` | no |
| <a name="input_availability_message"></a> [availability\_message](#input\_availability\_message) | Custom message for Storage availability monitor | `string` | `""` | no |
| <a name="input_availability_threshold_critical"></a> [availability\_threshold\_critical](#input\_availability\_threshold\_critical) | Minimum acceptable percent of availability for a storage | `number` | `50` | no |
| <a name="input_availability_threshold_warning"></a> [availability\_threshold\_warning](#input\_availability\_threshold\_warning) | Warning regarding acceptable percent of availability for a storage | `number` | `90` | no |
| <a name="input_availability_time_aggregator"></a> [availability\_time\_aggregator](#input\_availability\_time\_aggregator) | Monitor aggregator for Storage availability [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_availability_timeframe"></a> [availability\_timeframe](#input\_availability\_timeframe) | Monitor timeframe for Storage availability [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_client_other_error_requests_enabled"></a> [client\_other\_error\_requests\_enabled](#input\_client\_other\_error\_requests\_enabled) | Flag to enable Storage other errors monitor | `string` | `"true"` | no |
| <a name="input_client_other_error_requests_extra_tags"></a> [client\_other\_error\_requests\_extra\_tags](#input\_client\_other\_error\_requests\_extra\_tags) | Extra tags for Storage other errors monitor | `list(string)` | `[]` | no |
| <a name="input_client_other_error_requests_message"></a> [client\_other\_error\_requests\_message](#input\_client\_other\_error\_requests\_message) | Custom message for Storage other errors monitor | `string` | `""` | no |
| <a name="input_client_other_error_requests_threshold_critical"></a> [client\_other\_error\_requests\_threshold\_critical](#input\_client\_other\_error\_requests\_threshold\_critical) | Maximum acceptable percent of client other error requests for a storage | `number` | `90` | no |
| <a name="input_client_other_error_requests_threshold_warning"></a> [client\_other\_error\_requests\_threshold\_warning](#input\_client\_other\_error\_requests\_threshold\_warning) | Warning regarding acceptable percent of client other error requests for a storage | `number` | `50` | no |
| <a name="input_client_other_error_requests_time_aggregator"></a> [client\_other\_error\_requests\_time\_aggregator](#input\_client\_other\_error\_requests\_time\_aggregator) | Monitor aggregator for Storage other errors [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_client_other_error_requests_timeframe"></a> [client\_other\_error\_requests\_timeframe](#input\_client\_other\_error\_requests\_timeframe) | Monitor timeframe for Storage other errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_latency_enabled"></a> [latency\_enabled](#input\_latency\_enabled) | Flag to enable Storage latency monitor | `string` | `"true"` | no |
| <a name="input_latency_extra_tags"></a> [latency\_extra\_tags](#input\_latency\_extra\_tags) | Extra tags for Storage latency monitor | `list(string)` | `[]` | no |
| <a name="input_latency_message"></a> [latency\_message](#input\_latency\_message) | Custom message for Storage latency monitor | `string` | `""` | no |
| <a name="input_latency_threshold_critical"></a> [latency\_threshold\_critical](#input\_latency\_threshold\_critical) | Maximum acceptable end to end latency (ms) for a storage | `number` | `2000` | no |
| <a name="input_latency_threshold_warning"></a> [latency\_threshold\_warning](#input\_latency\_threshold\_warning) | Warning regarding acceptable end to end latency (ms) for a storage | `number` | `1000` | no |
| <a name="input_latency_time_aggregator"></a> [latency\_time\_aggregator](#input\_latency\_time\_aggregator) | Monitor aggregator for Storage latency [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_latency_timeframe"></a> [latency\_timeframe](#input\_latency\_timeframe) | Monitor timeframe for Storage latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a Redis monitor is triggered | `any` | n/a | yes |
| <a name="input_minimum_traffic"></a> [minimum\_traffic](#input\_minimum\_traffic) | Minimum traffic to have for requests status alerts to avoid false triggering. | `number` | `20` | no |
| <a name="input_network_error_requests_enabled"></a> [network\_error\_requests\_enabled](#input\_network\_error\_requests\_enabled) | Flag to enable Storage network errors monitor | `string` | `"true"` | no |
| <a name="input_network_error_requests_extra_tags"></a> [network\_error\_requests\_extra\_tags](#input\_network\_error\_requests\_extra\_tags) | Extra tags for Storage network errors monitor | `list(string)` | `[]` | no |
| <a name="input_network_error_requests_message"></a> [network\_error\_requests\_message](#input\_network\_error\_requests\_message) | Custom message for Storage network errors monitor | `string` | `""` | no |
| <a name="input_network_error_requests_threshold_critical"></a> [network\_error\_requests\_threshold\_critical](#input\_network\_error\_requests\_threshold\_critical) | Maximum acceptable percent of network error requests for a storage | `number` | `90` | no |
| <a name="input_network_error_requests_threshold_warning"></a> [network\_error\_requests\_threshold\_warning](#input\_network\_error\_requests\_threshold\_warning) | Warning regarding acceptable percent of network error requests for a storage | `number` | `50` | no |
| <a name="input_network_error_requests_time_aggregator"></a> [network\_error\_requests\_time\_aggregator](#input\_network\_error\_requests\_time\_aggregator) | Monitor aggregator for Storage network errors [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_network_error_requests_timeframe"></a> [network\_error\_requests\_timeframe](#input\_network\_error\_requests\_timeframe) | Monitor timeframe for Storage network errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_server_other_error_requests_enabled"></a> [server\_other\_error\_requests\_enabled](#input\_server\_other\_error\_requests\_enabled) | Flag to enable Storage server other errors monitor | `string` | `"true"` | no |
| <a name="input_server_other_error_requests_extra_tags"></a> [server\_other\_error\_requests\_extra\_tags](#input\_server\_other\_error\_requests\_extra\_tags) | Extra tags for Storage server other errors monitor | `list(string)` | `[]` | no |
| <a name="input_server_other_error_requests_message"></a> [server\_other\_error\_requests\_message](#input\_server\_other\_error\_requests\_message) | Custom message for Storage server other errors monitor | `string` | `""` | no |
| <a name="input_server_other_error_requests_threshold_critical"></a> [server\_other\_error\_requests\_threshold\_critical](#input\_server\_other\_error\_requests\_threshold\_critical) | Maximum acceptable percent of server other error requests for a storage | `number` | `90` | no |
| <a name="input_server_other_error_requests_threshold_warning"></a> [server\_other\_error\_requests\_threshold\_warning](#input\_server\_other\_error\_requests\_threshold\_warning) | Warning regarding acceptable percent of server other error requests for a storage | `number` | `50` | no |
| <a name="input_server_other_error_requests_time_aggregator"></a> [server\_other\_error\_requests\_time\_aggregator](#input\_server\_other\_error\_requests\_time\_aggregator) | Monitor aggregator for Storage other errors [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_server_other_error_requests_timeframe"></a> [server\_other\_error\_requests\_timeframe](#input\_server\_other\_error\_requests\_timeframe) | Monitor timeframe for Storage server other errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_status_enabled"></a> [status\_enabled](#input\_status\_enabled) | Flag to enable App Services status monitor | `string` | `"true"` | no |
| <a name="input_status_extra_tags"></a> [status\_extra\_tags](#input\_status\_extra\_tags) | Extra tags for App Services status monitor | `list(string)` | `[]` | no |
| <a name="input_status_message"></a> [status\_message](#input\_status\_message) | Custom message for storage Services status monitor | `string` | `""` | no |
| <a name="input_status_time_aggregator"></a> [status\_time\_aggregator](#input\_status\_time\_aggregator) | Monitor aggregator for Storage Services status [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_status_timeframe"></a> [status\_timeframe](#input\_status\_timeframe) | Monitor timeframe for Storage Services status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_storage_status_no_data_timeframe"></a> [storage\_status\_no\_data\_timeframe](#input\_storage\_status\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_successful_requests_enabled"></a> [successful\_requests\_enabled](#input\_successful\_requests\_enabled) | Flag to enable Storage sucessful requests monitor | `string` | `"true"` | no |
| <a name="input_successful_requests_extra_tags"></a> [successful\_requests\_extra\_tags](#input\_successful\_requests\_extra\_tags) | Extra tags for Storage sucessful requests monitor | `list(string)` | `[]` | no |
| <a name="input_successful_requests_message"></a> [successful\_requests\_message](#input\_successful\_requests\_message) | Custom message for Storage sucessful requests monitor | `string` | `""` | no |
| <a name="input_successful_requests_time_aggregator"></a> [successful\_requests\_time\_aggregator](#input\_successful\_requests\_time\_aggregator) | Monitor aggregator for Storage sucessful requests [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_successful_requests_timeframe"></a> [successful\_requests\_timeframe](#input\_successful\_requests\_timeframe) | Monitor timeframe for Storage sucessful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_successful_storage_requests_threshold_critical"></a> [successful\_storage\_requests\_threshold\_critical](#input\_successful\_storage\_requests\_threshold\_critical) | Minimum acceptable percent of successful requests for a storage | `number` | `90` | no |
| <a name="input_successful_storage_requests_threshold_warning"></a> [successful\_storage\_requests\_threshold\_warning](#input\_successful\_storage\_requests\_threshold\_warning) | Warning regarding acceptable percent of successful requests for a storage | `number` | `70` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global variables | `list(string)` | <pre>[<br>  "type:cloud",<br>  "provider:azure",<br>  "resource:storage"<br>]</pre> | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `"claranet"` | no |
| <a name="input_throttling_error_requests_enabled"></a> [throttling\_error\_requests\_enabled](#input\_throttling\_error\_requests\_enabled) | Flag to enable Storage throttling error monitor | `string` | `"true"` | no |
| <a name="input_throttling_error_requests_extra_tags"></a> [throttling\_error\_requests\_extra\_tags](#input\_throttling\_error\_requests\_extra\_tags) | Extra tags for Storage throttling error monitor | `list(string)` | `[]` | no |
| <a name="input_throttling_error_requests_message"></a> [throttling\_error\_requests\_message](#input\_throttling\_error\_requests\_message) | Custom message for Storage throttling error monitor | `string` | `""` | no |
| <a name="input_throttling_error_requests_threshold_critical"></a> [throttling\_error\_requests\_threshold\_critical](#input\_throttling\_error\_requests\_threshold\_critical) | Maximum acceptable percent of throttling error requests for a storage | `number` | `90` | no |
| <a name="input_throttling_error_requests_threshold_warning"></a> [throttling\_error\_requests\_threshold\_warning](#input\_throttling\_error\_requests\_threshold\_warning) | Warning regarding acceptable percent of throttling error requests for a storage | `number` | `50` | no |
| <a name="input_throttling_error_requests_time_aggregator"></a> [throttling\_error\_requests\_time\_aggregator](#input\_throttling\_error\_requests\_time\_aggregator) | Monitor aggregator for Storage throttling errors [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_throttling_error_requests_timeframe"></a> [throttling\_error\_requests\_timeframe](#input\_throttling\_error\_requests\_timeframe) | Monitor timeframe for Storage throttling errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_timeout_error_requests_enabled"></a> [timeout\_error\_requests\_enabled](#input\_timeout\_error\_requests\_enabled) | Flag to enable Storage timeout monitor | `string` | `"true"` | no |
| <a name="input_timeout_error_requests_extra_tags"></a> [timeout\_error\_requests\_extra\_tags](#input\_timeout\_error\_requests\_extra\_tags) | Extra tags for Storage timeout monitor | `list(string)` | `[]` | no |
| <a name="input_timeout_error_requests_message"></a> [timeout\_error\_requests\_message](#input\_timeout\_error\_requests\_message) | Custom message for Storage timeout monitor | `string` | `""` | no |
| <a name="input_timeout_error_requests_threshold_critical"></a> [timeout\_error\_requests\_threshold\_critical](#input\_timeout\_error\_requests\_threshold\_critical) | Maximum acceptable percent of timeout error requests for a storage | `number` | `90` | no |
| <a name="input_timeout_error_requests_threshold_warning"></a> [timeout\_error\_requests\_threshold\_warning](#input\_timeout\_error\_requests\_threshold\_warning) | Warning regarding acceptable percent of timeout error requests for a storage | `number` | `50` | no |
| <a name="input_timeout_error_requests_time_aggregator"></a> [timeout\_error\_requests\_time\_aggregator](#input\_timeout\_error\_requests\_time\_aggregator) | Monitor aggregator for Storage timeout [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_timeout_error_requests_timeframe"></a> [timeout\_error\_requests\_timeframe](#input\_timeout\_error\_requests\_timeframe) | Monitor timeframe for Storage timeout [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_blob_authorization_error_requests_id"></a> [blob\_authorization\_error\_requests\_id](#output\_blob\_authorization\_error\_requests\_id) | id for monitor blob\_authorization\_error\_requests |
| <a name="output_blob_client_other_error_requests_id"></a> [blob\_client\_other\_error\_requests\_id](#output\_blob\_client\_other\_error\_requests\_id) | id for monitor blob\_client\_other\_error\_requests |
| <a name="output_blob_network_error_requests_id"></a> [blob\_network\_error\_requests\_id](#output\_blob\_network\_error\_requests\_id) | id for monitor blob\_network\_error\_requests |
| <a name="output_blob_server_other_error_requests_id"></a> [blob\_server\_other\_error\_requests\_id](#output\_blob\_server\_other\_error\_requests\_id) | id for monitor blob\_server\_other\_error\_requests |
| <a name="output_blob_throttling_error_requests_id"></a> [blob\_throttling\_error\_requests\_id](#output\_blob\_throttling\_error\_requests\_id) | id for monitor blob\_throttling\_error\_requests |
| <a name="output_blob_timeout_error_requests_id"></a> [blob\_timeout\_error\_requests\_id](#output\_blob\_timeout\_error\_requests\_id) | id for monitor blob\_timeout\_error\_requests |
| <a name="output_blobservices_latency_id"></a> [blobservices\_latency\_id](#output\_blobservices\_latency\_id) | id for monitor blobservices\_latency |
| <a name="output_blobservices_requests_error_id"></a> [blobservices\_requests\_error\_id](#output\_blobservices\_requests\_error\_id) | id for monitor blobservices\_requests\_error |
| <a name="output_file_authorization_error_requests_id"></a> [file\_authorization\_error\_requests\_id](#output\_file\_authorization\_error\_requests\_id) | id for monitor file\_authorization\_error\_requests |
| <a name="output_file_client_other_error_requests_id"></a> [file\_client\_other\_error\_requests\_id](#output\_file\_client\_other\_error\_requests\_id) | id for monitor file\_client\_other\_error\_requests |
| <a name="output_file_network_error_requests_id"></a> [file\_network\_error\_requests\_id](#output\_file\_network\_error\_requests\_id) | id for monitor file\_network\_error\_requests |
| <a name="output_file_server_other_error_requests_id"></a> [file\_server\_other\_error\_requests\_id](#output\_file\_server\_other\_error\_requests\_id) | id for monitor file\_server\_other\_error\_requests |
| <a name="output_file_throttling_error_requests_id"></a> [file\_throttling\_error\_requests\_id](#output\_file\_throttling\_error\_requests\_id) | id for monitor file\_throttling\_error\_requests |
| <a name="output_file_timeout_error_requests_id"></a> [file\_timeout\_error\_requests\_id](#output\_file\_timeout\_error\_requests\_id) | id for monitor file\_timeout\_error\_requests |
| <a name="output_fileservices_latency_id"></a> [fileservices\_latency\_id](#output\_fileservices\_latency\_id) | id for monitor fileservices\_latency |
| <a name="output_fileservices_requests_error_id"></a> [fileservices\_requests\_error\_id](#output\_fileservices\_requests\_error\_id) | id for monitor fileservices\_requests\_error |
| <a name="output_queue_authorization_error_requests_id"></a> [queue\_authorization\_error\_requests\_id](#output\_queue\_authorization\_error\_requests\_id) | id for monitor queue\_authorization\_error\_requests |
| <a name="output_queue_client_other_error_requests_id"></a> [queue\_client\_other\_error\_requests\_id](#output\_queue\_client\_other\_error\_requests\_id) | id for monitor queue\_client\_other\_error\_requests |
| <a name="output_queue_network_error_requests_id"></a> [queue\_network\_error\_requests\_id](#output\_queue\_network\_error\_requests\_id) | id for monitor queue\_network\_error\_requests |
| <a name="output_queue_server_other_error_requests_id"></a> [queue\_server\_other\_error\_requests\_id](#output\_queue\_server\_other\_error\_requests\_id) | id for monitor queue\_server\_other\_error\_requests |
| <a name="output_queue_throttling_error_requests_id"></a> [queue\_throttling\_error\_requests\_id](#output\_queue\_throttling\_error\_requests\_id) | id for monitor queue\_throttling\_error\_requests |
| <a name="output_queue_timeout_error_requests_id"></a> [queue\_timeout\_error\_requests\_id](#output\_queue\_timeout\_error\_requests\_id) | id for monitor queue\_timeout\_error\_requests |
| <a name="output_queueservices_latency_id"></a> [queueservices\_latency\_id](#output\_queueservices\_latency\_id) | id for monitor queueservices\_latency |
| <a name="output_queueservices_requests_error_id"></a> [queueservices\_requests\_error\_id](#output\_queueservices\_requests\_error\_id) | id for monitor queueservices\_requests\_error |
| <a name="output_storage_status_id"></a> [storage\_status\_id](#output\_storage\_status\_id) | id for monitor storage\_status |
| <a name="output_table_authorization_error_requests_id"></a> [table\_authorization\_error\_requests\_id](#output\_table\_authorization\_error\_requests\_id) | id for monitor table\_authorization\_error\_requests |
| <a name="output_table_client_other_error_requests_id"></a> [table\_client\_other\_error\_requests\_id](#output\_table\_client\_other\_error\_requests\_id) | id for monitor table\_client\_other\_error\_requests |
| <a name="output_table_network_error_requests_id"></a> [table\_network\_error\_requests\_id](#output\_table\_network\_error\_requests\_id) | id for monitor table\_network\_error\_requests |
| <a name="output_table_server_other_error_requests_id"></a> [table\_server\_other\_error\_requests\_id](#output\_table\_server\_other\_error\_requests\_id) | id for monitor table\_server\_other\_error\_requests |
| <a name="output_table_throttling_error_requests_id"></a> [table\_throttling\_error\_requests\_id](#output\_table\_throttling\_error\_requests\_id) | id for monitor table\_throttling\_error\_requests |
| <a name="output_table_timeout_error_requests_id"></a> [table\_timeout\_error\_requests\_id](#output\_table\_timeout\_error\_requests\_id) | id for monitor table\_timeout\_error\_requests |
| <a name="output_tableservices_latency_id"></a> [tableservices\_latency\_id](#output\_tableservices\_latency\_id) | id for monitor tableservices\_latency |
| <a name="output_tableservices_requests_error_id"></a> [tableservices\_requests\_error\_id](#output\_tableservices\_requests\_error\_id) | id for monitor tableservices\_requests\_error |
<!-- END_TF_DOCS -->
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_storage/](https://docs.datadoghq.com/integrations/azure_storage/)

DataDog blog: [https://www.datadoghq.com/blog/monitor-azure-storage-datadog/](https://www.datadoghq.com/blog/monitor-azure-storage-datadog/)

Azure Storage metrics documentation: [https://docs.microsoft.com/en-us/azure/storage/common/storage-monitor-storage-account](https://docs.microsoft.com/en-us/azure/storage/common/storage-monitor-storage-account)

Azure Storage metrics detailed documentation [https://docs.microsoft.com/en-us/rest/api/storageservices/storage-analytics-metrics-table-schema](https://docs.microsoft.com/en-us/rest/api/storageservices/storage-analytics-metrics-table-schema)
