# CLOUD GCP BIG-QUERY DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-gcp-big-query" {
  source      = "claranet/monitors/datadog//cloud/gcp/big-query"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- GCP Big Query Available Slots
- GCP Big Query Concurrent Queries
- GCP Big Query Execution Time
- GCP Big Query Scanned Bytes
- GCP Big Query Scanned Bytes Billed
- GCP Big Query Stored Bytes
- GCP Big Query Table Count
- GCP Big Query Uploaded Bytes
- GCP Big Query Uploaded Bytes Billed

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

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.available_slots](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.concurrent_queries](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.execution_time](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.scanned_bytes](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.scanned_bytes_billed](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.stored_bytes](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.table_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.uploaded_bytes](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.uploaded_bytes_billed](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_available_slots_enabled"></a> [available\_slots\_enabled](#input\_available\_slots\_enabled) | Flag to enable GCP Big Query Available Slots monitor | `string` | `"true"` | no |
| <a name="input_available_slots_extra_tags"></a> [available\_slots\_extra\_tags](#input\_available\_slots\_extra\_tags) | Extra tags for GCP Big Query Available Slots monitor | `list(string)` | `[]` | no |
| <a name="input_available_slots_message"></a> [available\_slots\_message](#input\_available\_slots\_message) | Custom message for the Available Slots monitor | `string` | `""` | no |
| <a name="input_available_slots_threshold_critical"></a> [available\_slots\_threshold\_critical](#input\_available\_slots\_threshold\_critical) | Available Slots (critical threshold) | `string` | `200` | no |
| <a name="input_available_slots_threshold_warning"></a> [available\_slots\_threshold\_warning](#input\_available\_slots\_threshold\_warning) | Available Slots (warning threshold) | `string` | `300` | no |
| <a name="input_available_slots_timeframe"></a> [available\_slots\_timeframe](#input\_available\_slots\_timeframe) | Timeframe for the Available Slots monitor | `string` | `"last_5m"` | no |
| <a name="input_concurrent_queries_enabled"></a> [concurrent\_queries\_enabled](#input\_concurrent\_queries\_enabled) | Flag to enable GCP Big Query Concurrent Queries monitor | `string` | `"true"` | no |
| <a name="input_concurrent_queries_extra_tags"></a> [concurrent\_queries\_extra\_tags](#input\_concurrent\_queries\_extra\_tags) | Extra tags for GCP Big Query Concurrent Queries monitor | `list(string)` | `[]` | no |
| <a name="input_concurrent_queries_message"></a> [concurrent\_queries\_message](#input\_concurrent\_queries\_message) | Custom message for the Concurrent Queries monitor | `string` | `""` | no |
| <a name="input_concurrent_queries_threshold_critical"></a> [concurrent\_queries\_threshold\_critical](#input\_concurrent\_queries\_threshold\_critical) | Concurrent Queries (critical threshold) (hard limit 50) | `string` | `45` | no |
| <a name="input_concurrent_queries_threshold_warning"></a> [concurrent\_queries\_threshold\_warning](#input\_concurrent\_queries\_threshold\_warning) | Concurrent Queries (warning threshold) (hard limit 50) | `string` | `40` | no |
| <a name="input_concurrent_queries_timeframe"></a> [concurrent\_queries\_timeframe](#input\_concurrent\_queries\_timeframe) | Timeframe for the Concurrent Queries monitor | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_execution_time_enabled"></a> [execution\_time\_enabled](#input\_execution\_time\_enabled) | Flag to enable GCP Big Query Execution Time monitor | `string` | `"true"` | no |
| <a name="input_execution_time_extra_tags"></a> [execution\_time\_extra\_tags](#input\_execution\_time\_extra\_tags) | Extra tags for GCP Big Query Execution Time monitor | `list(string)` | `[]` | no |
| <a name="input_execution_time_message"></a> [execution\_time\_message](#input\_execution\_time\_message) | Custom message for the Execution Time monitor | `string` | `""` | no |
| <a name="input_execution_time_threshold_critical"></a> [execution\_time\_threshold\_critical](#input\_execution\_time\_threshold\_critical) | Average Execution Time in seconds (critical threshold) | `string` | `150` | no |
| <a name="input_execution_time_threshold_warning"></a> [execution\_time\_threshold\_warning](#input\_execution\_time\_threshold\_warning) | Average Execution Time in seconds (warning threshold) | `string` | `100` | no |
| <a name="input_execution_time_timeframe"></a> [execution\_time\_timeframe](#input\_execution\_time\_timeframe) | Timeframe for the Execution Time monitor | `string` | `"last_5m"` | no |
| <a name="input_filter_tags"></a> [filter\_tags](#input\_filter\_tags) | Tags used for filtering | `string` | `"*"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds for the new host evaluation | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_scanned_bytes_billed_enabled"></a> [scanned\_bytes\_billed\_enabled](#input\_scanned\_bytes\_billed\_enabled) | Flag to enable GCP Big Query Scanned Bytes Billed monitor | `string` | `"true"` | no |
| <a name="input_scanned_bytes_billed_extra_tags"></a> [scanned\_bytes\_billed\_extra\_tags](#input\_scanned\_bytes\_billed\_extra\_tags) | Extra tags for GCP Big Query Scanned Bytes Billed monitor | `list(string)` | `[]` | no |
| <a name="input_scanned_bytes_billed_message"></a> [scanned\_bytes\_billed\_message](#input\_scanned\_bytes\_billed\_message) | Custom message for the Scanned Bytes Billed monitor | `string` | `""` | no |
| <a name="input_scanned_bytes_billed_threshold_critical"></a> [scanned\_bytes\_billed\_threshold\_critical](#input\_scanned\_bytes\_billed\_threshold\_critical) | Scanned Bytes Billed (critical threshold) | `string` | `1` | no |
| <a name="input_scanned_bytes_billed_threshold_warning"></a> [scanned\_bytes\_billed\_threshold\_warning](#input\_scanned\_bytes\_billed\_threshold\_warning) | Scanned Bytes Billed (warning threshold) | `string` | `0` | no |
| <a name="input_scanned_bytes_billed_timeframe"></a> [scanned\_bytes\_billed\_timeframe](#input\_scanned\_bytes\_billed\_timeframe) | Timeframe for the Scanned Bytes Billed monitor | `string` | `"last_4h"` | no |
| <a name="input_scanned_bytes_enabled"></a> [scanned\_bytes\_enabled](#input\_scanned\_bytes\_enabled) | Flag to enable GCP Big Query Scanned Bytes monitor | `string` | `"true"` | no |
| <a name="input_scanned_bytes_extra_tags"></a> [scanned\_bytes\_extra\_tags](#input\_scanned\_bytes\_extra\_tags) | Extra tags for GCP Big Query Scanned Bytes monitor | `list(string)` | `[]` | no |
| <a name="input_scanned_bytes_message"></a> [scanned\_bytes\_message](#input\_scanned\_bytes\_message) | Custom message for the Scanned Bytes monitor | `string` | `""` | no |
| <a name="input_scanned_bytes_threshold_critical"></a> [scanned\_bytes\_threshold\_critical](#input\_scanned\_bytes\_threshold\_critical) | Scanned Bytes (critical threshold) | `string` | `1` | no |
| <a name="input_scanned_bytes_threshold_warning"></a> [scanned\_bytes\_threshold\_warning](#input\_scanned\_bytes\_threshold\_warning) | Scanned Bytes (warning threshold) | `string` | `0` | no |
| <a name="input_scanned_bytes_timeframe"></a> [scanned\_bytes\_timeframe](#input\_scanned\_bytes\_timeframe) | Timeframe for the Scanned Bytes monitor | `string` | `"last_4h"` | no |
| <a name="input_stored_bytes_enabled"></a> [stored\_bytes\_enabled](#input\_stored\_bytes\_enabled) | Flag to enable GCP Big Query Stored Bytes monitor | `string` | `"true"` | no |
| <a name="input_stored_bytes_extra_tags"></a> [stored\_bytes\_extra\_tags](#input\_stored\_bytes\_extra\_tags) | Extra tags for GCP Big Query Stored Bytes monitor | `list(string)` | `[]` | no |
| <a name="input_stored_bytes_message"></a> [stored\_bytes\_message](#input\_stored\_bytes\_message) | Custom message for the Stored Bytes monitor | `string` | `""` | no |
| <a name="input_stored_bytes_threshold_critical"></a> [stored\_bytes\_threshold\_critical](#input\_stored\_bytes\_threshold\_critical) | Stored Bytes in fraction (critical threshold) | `string` | `1` | no |
| <a name="input_stored_bytes_threshold_warning"></a> [stored\_bytes\_threshold\_warning](#input\_stored\_bytes\_threshold\_warning) | Stored Bytes in fraction (warning threshold) | `string` | `0` | no |
| <a name="input_stored_bytes_timeframe"></a> [stored\_bytes\_timeframe](#input\_stored\_bytes\_timeframe) | Timeframe for the Stored Bytes monitor | `string` | `"last_5m"` | no |
| <a name="input_table_count_enabled"></a> [table\_count\_enabled](#input\_table\_count\_enabled) | Flag to enable GCP Big Query Table Count monitor | `string` | `"true"` | no |
| <a name="input_table_count_extra_tags"></a> [table\_count\_extra\_tags](#input\_table\_count\_extra\_tags) | Extra tags for GCP Big Query Table Count monitor | `list(string)` | `[]` | no |
| <a name="input_table_count_message"></a> [table\_count\_message](#input\_table\_count\_message) | Custom message for the Table Count monitor | `string` | `""` | no |
| <a name="input_table_count_threshold_critical"></a> [table\_count\_threshold\_critical](#input\_table\_count\_threshold\_critical) | Table Count (critical threshold) | `string` | `1` | no |
| <a name="input_table_count_threshold_warning"></a> [table\_count\_threshold\_warning](#input\_table\_count\_threshold\_warning) | Table Count (warning threshold) | `string` | `0` | no |
| <a name="input_table_count_timeframe"></a> [table\_count\_timeframe](#input\_table\_count\_timeframe) | Timeframe for the Table Count monitor | `string` | `"last_4h"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |
| <a name="input_uploaded_bytes_billed_enabled"></a> [uploaded\_bytes\_billed\_enabled](#input\_uploaded\_bytes\_billed\_enabled) | Flag to enable GCP Big Query Uploaded Bytes Billed monitor | `string` | `"true"` | no |
| <a name="input_uploaded_bytes_billed_extra_tags"></a> [uploaded\_bytes\_billed\_extra\_tags](#input\_uploaded\_bytes\_billed\_extra\_tags) | Extra tags for GCP Big Query Scanned Bytes monitor | `list(string)` | `[]` | no |
| <a name="input_uploaded_bytes_billed_message"></a> [uploaded\_bytes\_billed\_message](#input\_uploaded\_bytes\_billed\_message) | Custom message for the Uploaded Bytes Billed monitor | `string` | `""` | no |
| <a name="input_uploaded_bytes_billed_threshold_critical"></a> [uploaded\_bytes\_billed\_threshold\_critical](#input\_uploaded\_bytes\_billed\_threshold\_critical) | Uploaded Bytes Billed (critical threshold) | `string` | `1` | no |
| <a name="input_uploaded_bytes_billed_threshold_warning"></a> [uploaded\_bytes\_billed\_threshold\_warning](#input\_uploaded\_bytes\_billed\_threshold\_warning) | Uploaded Bytes Billed (warning threshold) | `string` | `0` | no |
| <a name="input_uploaded_bytes_billed_timeframe"></a> [uploaded\_bytes\_billed\_timeframe](#input\_uploaded\_bytes\_billed\_timeframe) | Timeframe for the Uploaded Bytes Billed monitor | `string` | `"last_4h"` | no |
| <a name="input_uploaded_bytes_enabled"></a> [uploaded\_bytes\_enabled](#input\_uploaded\_bytes\_enabled) | Flag to enable GCP Big Query Uploaded Bytes monitor | `string` | `"true"` | no |
| <a name="input_uploaded_bytes_extra_tags"></a> [uploaded\_bytes\_extra\_tags](#input\_uploaded\_bytes\_extra\_tags) | Extra tags for GCP Big Query Uploaded Bytes monitor | `list(string)` | `[]` | no |
| <a name="input_uploaded_bytes_message"></a> [uploaded\_bytes\_message](#input\_uploaded\_bytes\_message) | Custom message for the Uploaded Bytes monitor | `string` | `""` | no |
| <a name="input_uploaded_bytes_threshold_critical"></a> [uploaded\_bytes\_threshold\_critical](#input\_uploaded\_bytes\_threshold\_critical) | Uploaded Bytes (critical threshold) | `string` | `1` | no |
| <a name="input_uploaded_bytes_threshold_warning"></a> [uploaded\_bytes\_threshold\_warning](#input\_uploaded\_bytes\_threshold\_warning) | Uploaded Bytes (warning threshold) | `string` | `0` | no |
| <a name="input_uploaded_bytes_timeframe"></a> [uploaded\_bytes\_timeframe](#input\_uploaded\_bytes\_timeframe) | Timeframe for the Uploaded Bytes monitor | `string` | `"last_4h"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_available_slots_id"></a> [available\_slots\_id](#output\_available\_slots\_id) | id for monitor available\_slots |
| <a name="output_concurrent_queries_id"></a> [concurrent\_queries\_id](#output\_concurrent\_queries\_id) | id for monitor concurrent\_queries |
| <a name="output_execution_time_id"></a> [execution\_time\_id](#output\_execution\_time\_id) | id for monitor execution\_time |
| <a name="output_scanned_bytes_billed_id"></a> [scanned\_bytes\_billed\_id](#output\_scanned\_bytes\_billed\_id) | id for monitor scanned\_bytes\_billed |
| <a name="output_scanned_bytes_id"></a> [scanned\_bytes\_id](#output\_scanned\_bytes\_id) | id for monitor scanned\_bytes |
| <a name="output_stored_bytes_id"></a> [stored\_bytes\_id](#output\_stored\_bytes\_id) | id for monitor stored\_bytes |
| <a name="output_table_count_id"></a> [table\_count\_id](#output\_table\_count\_id) | id for monitor table\_count |
| <a name="output_uploaded_bytes_billed_id"></a> [uploaded\_bytes\_billed\_id](#output\_uploaded\_bytes\_billed\_id) | id for monitor uploaded\_bytes\_billed |
| <a name="output_uploaded_bytes_id"></a> [uploaded\_bytes\_id](#output\_uploaded\_bytes\_id) | id for monitor uploaded\_bytes |
<!-- END_TF_DOCS -->
## Related documentation

* [GCP Big Query monitoring](https://cloud.google.com/bigquery/docs/monitoring)
* [Datadog Integration for GCP Big Query](https://docs.datadoghq.com/integrations/google_cloud_big_query/)
* [GCP Big Query Quotas and Limits](https://cloud.google.com/bigquery/quotas)
