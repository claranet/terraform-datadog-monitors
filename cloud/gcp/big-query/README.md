# CLOUD GCP BIG-QUERY DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-gcp-big-query" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/gcp/big-query?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- GCP Big Query Available Slots
- GCP Big Query Concurrent Queries
- GCP Big Query Execution Time
- GCP Big Query Scanned Bytes Billed
- GCP Big Query Scanned Bytes
- GCP Big Query Stored Bytes
- GCP Big Query Table Count
- GCP Big Query Uploaded Bytes Billed
- GCP Big Query Uploaded Bytes

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| available_slots_extra_tags | Extra tags for GCP Big Query Available Slots monitor | list | `<list>` | no |
| available_slots_message | Custom message for the Available Slots monitor | string | `` | no |
| available_slots_silenced | Groups to mute for GCP Big Query Available Slots monitor. | map | `<map>` | no |
| available_slots_threshold_critical | Available Slots (critical threshold) | string | `200` | no |
| available_slots_threshold_warning | Available Slots (warning threshold) | string | `300` | no |
| available_slots_timeframe | Timeframe for the Available Slots monitor | string | `last_5m` | no |
| concurrent_queries_extra_tags | Extra tags for GCP Big Query Concurrent Queries monitor | list | `<list>` | no |
| concurrent_queries_message | Custom message for the Concurrent Queries monitor | string | `` | no |
| concurrent_queries_silenced | Groups to mute for GCP Big Query Concurrent Queries monitor | map | `<map>` | no |
| concurrent_queries_threshold_critical | Concurrent Queries (critical threshold) (hard limit 50) | string | `45` | no |
| concurrent_queries_threshold_warning | Concurrent Queries (warning threshold) (hard limit 50) | string | `40` | no |
| concurrent_queries_timeframe | Timeframe for the Concurrent Queries monitor | string | `last_5m` | no |
| environment | Architecture environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `900` | no |
| execution_time_extra_tags | Extra tags for GCP Big Query Execution Time monitor | list | `<list>` | no |
| execution_time_message | Custom message for the Execution Time monitor | string | `` | no |
| execution_time_silenced | Groups to mute for GCP Big Query Execution Time monitor. Muted by default. | map | `<map>` | no |
| execution_time_threshold_critical | Average Execution Time in seconds (critical threshold) | string | `150` | no |
| execution_time_threshold_warning | Average Execution Time in seconds (warning threshold) | string | `100` | no |
| execution_time_timeframe | Timeframe for the Execution Time monitor | string | `last_5m` | no |
| filter_tags | Tags used for filtering | string | `*` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| new_host_delay | Delay in seconds for the new host evaluation | string | `300` | no |
| scanned_bytes_billed_extra_tags | Extra tags for GCP Big Query Scanned Bytes Billed monitor | list | `<list>` | no |
| scanned_bytes_billed_message | Custom message for the Scanned Bytes Billed monitor | string | `` | no |
| scanned_bytes_billed_silenced | Groups to mute for GCP Big Query Scanned Bytes Billed monitor. Muted by default. | map | `<map>` | no |
| scanned_bytes_billed_threshold_critical | Scanned Bytes Billed Bytes (critical threshold) | string | `1` | no |
| scanned_bytes_billed_threshold_warning | Scanned Bytes Billed Bytes (warning threshold) | string | `0` | no |
| scanned_bytes_billed_timeframe | Timeframe for the Scanned Bytes Billed monitor | string | `last_4h` | no |
| scanned_bytes_extra_tags | Extra tags for GCP Big Query Scanned Bytes monitor | list | `<list>` | no |
| scanned_bytes_message | Custom message for the Scanned Bytes monitor | string | `` | no |
| scanned_bytes_silenced | Groups to mute for GCP Big Query Scanned Bytes monitor. Muted by default. | map | `<map>` | no |
| scanned_bytes_threshold_critical | Scanned Bytes Bytes (critical threshold) | string | `1` | no |
| scanned_bytes_threshold_warning | Scanned Bytes Bytes (warning threshold) | string | `0` | no |
| scanned_bytes_timeframe | Timeframe for the Scanned Bytes monitor | string | `last_4h` | no |
| stored_bytes_extra_tags | Extra tags for GCP Big Query Stored Bytes monitor | list | `<list>` | no |
| stored_bytes_message | Custom message for the Stored Bytes monitor | string | `` | no |
| stored_bytes_silenced | Groups to mute for GCP Big Query Stored Bytes monitor. Muted by default. | map | `<map>` | no |
| stored_bytes_threshold_critical | Stored Bytes in fraction (critical threshold) | string | `1` | no |
| stored_bytes_threshold_warning | Stored Bytes in fraction (warning threshold) | string | `0` | no |
| stored_bytes_timeframe | Timeframe for the Stored Bytes monitor | string | `last_5m` | no |
| table_count_extra_tags | Extra tags for GCP Big Query Table Count monitor | list | `<list>` | no |
| table_count_message | Custom message for the Table Count monitor | string | `` | no |
| table_count_silenced | Groups to mute for GCP Big Query Table Count monitor. Muted by default. | map | `<map>` | no |
| table_count_threshold_critical | Table Count (critical threshold) | string | `1` | no |
| table_count_threshold_warning | Table Count (warning threshold) | string | `0` | no |
| table_count_timeframe | Timeframe for the Table Count monitor | string | `last_4h` | no |
| uploaded_bytes_billed_extra_tags | Extra tags for GCP Big Query Scanned Bytes monitor | list | `<list>` | no |
| uploaded_bytes_billed_message | Custom message for the Uploaded Bytes Billed monitor | string | `` | no |
| uploaded_bytes_billed_silenced | Groups to mute for GCP Big Query Uploaded Bytes Billed monitor. Muted by default. | map | `<map>` | no |
| uploaded_bytes_billed_threshold_critical | Uploaded Bytes Billed in Bytes (critical threshold) | string | `1` | no |
| uploaded_bytes_billed_threshold_warning | Uploaded Bytes Billed in Bytes (warning threshold) | string | `0` | no |
| uploaded_bytes_billed_timeframe | Timeframe for the Uploaded Bytes Billed monitor | string | `last_4h` | no |
| uploaded_bytes_extra_tags | Extra tags for GCP Big Query Uploaded Bytes monitor | list | `<list>` | no |
| uploaded_bytes_message | Custom message for the Uploaded Bytes monitor | string | `` | no |
| uploaded_bytes_silenced | Groups to mute for GCP Big Query Uploaded Bytes monitor. Muted by default. | map | `<map>` | no |
| uploaded_bytes_threshold_critical | Uploaded Bytes in Bytes (critical threshold) | string | `1` | no |
| uploaded_bytes_threshold_warning | Uploaded Bytes in Bytes (warning threshold) | string | `0` | no |
| uploaded_bytes_timeframe | Timeframe for the Uploaded Bytes monitor | string | `last_4h` | no |

## Outputs

| Name | Description |
|------|-------------|
| available_slots_id | id for monitor available_slots |
| concurrent_queries_id | id for monitor concurrent_queries |
| execution_time_id | id for monitor execution_time |
| scanned_bytes_billed_id | id for monitor scanned_bytes_billed |
| scanned_bytes_id | id for monitor scanned_bytes |
| stored_bytes_id | id for monitor stored_bytes |
| table_count_id | id for monitor table_count |
| uploaded_bytes_billed_id | id for monitor uploaded_bytes_billed |
| uploaded_bytes_id | id for monitor uploaded_bytes |

## Related documentation

* [GCP Big Query monitoring](https://cloud.google.com/bigquery/docs/monitoring)
* [Datadog Integration for GCP Big Query](https://docs.datadoghq.com/integrations/google_cloud_big_query/)
* [GCP Big Query Quotas and Limits](https://cloud.google.com/bigquery/quotas)
