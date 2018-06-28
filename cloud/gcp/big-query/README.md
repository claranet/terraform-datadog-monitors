GCP Big Query
==============================

How to use this module
----------------------

```
module "datadog-monitors-gcp-big-query" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/gcp/big-query?ref={revision}"

  project_id  = "${var.gcp_project_id}"
  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

Purpose
-------
Creates DataDog monitors with the following checks :

* Query Concurrent Queries
* Query Execution Times (muted by default)
* Query Scanned Bytes (muted by default)   
* Query Scanned Bytes Billed (muted by default) 

* Slots Available

* Storage Stored Bytes (muted by default)
* Storage Table Count per Dataset (muted by default)
* Storage Uploaded Bytes (muted by default)   
* Storage Uploaded Bytes Billed (muted by default) 


Useful links
------------

* [GCP Big Query monitoring](https://cloud.google.com/bigquery/docs/monitoring)
* [Datadog Integration for GCP Big Query](https://docs.datadoghq.com/integrations/google_cloud_big_query/)
* [GCP Big Query Quotas and Limits](https://cloud.google.com/bigquery/quotas)

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| concurrent_queries_message | Custom message for the Concurrent Queries monitor | string | `` | no |
| concurrent_queries_silenced | Groups to mute for GCP Big Query  Concurrent Queries monitor | map | `<map>` | no |
| concurrent_queries_threshold_critical | Concurrent Queries (critical threshold) (hard limit 50) | string | `45` | no |
| concurrent_queries_threshold_warning | Concurrent Queries (warning threshold) (hard limit 50) | string | `40` | no |
| concurrent_queries_timeframe | Timeframe for the Concurrent Queries monitor | string | `last_5m` | no |
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture environment | string | - | yes |
| execution_time_message | Custom message for the Execution Time monitor | string | `` | no |
| execution_time_silenced | Groups to mute for GCP Big Query  Execution Time monitor. Muted by default. | map | `<map>` | no |
| execution_time_threshold_critical | Average Execution Time in seconds (critical threshold) | string | `150` | no |
| execution_time_threshold_warning | Average Execution Time in seconds (warning threshold) | string | `100` | no |
| execution_time_timeframe | Timeframe for the Execution Time monitor | string | `last_5m` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| project_id | ID of the GCP Project | string | - | yes |
| scanned_bytes_billed_message | Custom message for the Scanned Bytes Billed monitor | string | `` | no |
| scanned_bytes_billed_silenced | Groups to mute for GCP Big Query Scanned Bytes Billed monitor. Muted by default. | map | `<map>` | no |
| scanned_bytes_billed_threshold_critical | Scanned Bytes Billed Bytes (critical threshold) | string | `1` | no |
| scanned_bytes_billed_threshold_warning | Scanned Bytes Billed Bytes (warning threshold) | string | `0` | no |
| scanned_bytes_billed_timeframe | Timeframe for the Scanned Bytes Billed monitor | string | `last_4h` | no |
| scanned_bytes_message | Custom message for the Scanned Bytes monitor | string | `` | no |
| scanned_bytes_silenced | Groups to mute for GCP Big Query Scanned Bytes monitor. Muted by default. | map | `<map>` | no |
| scanned_bytes_threshold_critical | Scanned Bytes Bytes (critical threshold) | string | `1` | no |
| scanned_bytes_threshold_warning | Scanned Bytes Bytes (warning threshold) | string | `0` | no |
| scanned_bytes_timeframe | Timeframe for the Scanned Bytes monitor | string | `last_4h` | no |
| slots_available_message | Custom message for the Available Slots monitor | string | `` | no |
| slots_available_silenced | Groups to mute for GCP Big Query Available Slots monitor. | map | `<map>` | no |
| slots_available_threshold_critical | Available Slots (critical threshold) | string | `200` | no |
| slots_available_threshold_warning | Available Slots (warning threshold) | string | `300` | no |
| slots_available_timeframe | Timeframe for the Available Slots monitor | string | `last_5m` | no |
| stored_bytes_message | Custom message for the Stored Bytes monitor | string | `` | no |
| stored_bytes_silenced | Groups to mute for GCP Big Query Stored Bytes monitor. Muted by default. | map | `<map>` | no |
| stored_bytes_threshold_critical | Stored Bytes in fraction (critical threshold) | string | `1` | no |
| stored_bytes_threshold_warning | Stored Bytes in fraction (warning threshold) | string | `0` | no |
| stored_bytes_timeframe | Timeframe for the Stored Bytes monitor | string | `last_5m` | no |
| table_count_message | Custom message for the Table Count monitor | string | `` | no |
| table_count_silenced | Groups to mute for GCP Big Query Table Count monitor. Muted by default. | map | `<map>` | no |
| table_count_threshold_critical | Table Count (critical threshold) | string | `1` | no |
| table_count_threshold_warning | Table Count (warning threshold) | string | `0` | no |
| table_count_timeframe | Timeframe for the Table Count monitor | string | `last_4h` | no |
| uploaded_bytes_billed_message | Custom message for the Uploaded Bytes Billed monitor | string | `` | no |
| uploaded_bytes_billed_silenced | Groups to mute for GCP Big Query Uploaded Bytes Billed monitor. Muted by default. | map | `<map>` | no |
| uploaded_bytes_billed_threshold_critical | Uploaded Bytes Billed in Bytes (critical threshold) | string | `1` | no |
| uploaded_bytes_billed_threshold_warning | Uploaded Bytes Billed in Bytes (warning threshold) | string | `0` | no |
| uploaded_bytes_billed_timeframe | Timeframe for the Uploaded Bytes Billed monitor | string | `last_4h` | no |
| uploaded_bytes_message | Custom message for the Uploaded Bytes monitor | string | `` | no |
| uploaded_bytes_silenced | Groups to mute for GCP Big Query Uploaded Bytes monitor. Muted by default. | map | `<map>` | no |
| uploaded_bytes_threshold_critical | Uploaded Bytes in Bytes (critical threshold) | string | `1` | no |
| uploaded_bytes_threshold_warning | Uploaded Bytes in Bytes (warning threshold) | string | `0` | no |
| uploaded_bytes_timeframe | Timeframe for the Uploaded Bytes monitor | string | `last_4h` | no |

