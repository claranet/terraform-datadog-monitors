# CLOUD GCP BIG-QUERY DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-gcp-big-query" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//cloud/gcp/big-query?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- GCP Big Query Available Slots
- GCP Big Query Concurrent Queries
- GCP Big Query Uploaded Bytes Billed
- GCP Big Query Execution Time
- GCP Big Query Stored Bytes

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| available\_slots\_enabled | Flag to enable GCP Big Query Available Slots monitor | string | `"true"` | no |
| available\_slots\_extra\_tags | Extra tags for GCP Big Query Available Slots monitor | list(string) | `[]` | no |
| available\_slots\_message | Custom message for the Available Slots monitor | string | `""` | no |
| available\_slots\_threshold\_critical | Available Slots (critical threshold) | string | `"200"` | no |
| available\_slots\_threshold\_warning | Available Slots (warning threshold) | string | `"300"` | no |
| available\_slots\_timeframe | Timeframe for the Available Slots monitor | string | `"last_5m"` | no |
| concurrent\_queries\_enabled | Flag to enable GCP Big Query Concurrent Queries monitor | string | `"true"` | no |
| concurrent\_queries\_extra\_tags | Extra tags for GCP Big Query Concurrent Queries monitor | list(string) | `[]` | no |
| concurrent\_queries\_message | Custom message for the Concurrent Queries monitor | string | `""` | no |
| concurrent\_queries\_threshold\_critical | Concurrent Queries (critical threshold) (hard limit 50) | string | `"45"` | no |
| concurrent\_queries\_threshold\_warning | Concurrent Queries (warning threshold) (hard limit 50) | string | `"40"` | no |
| concurrent\_queries\_timeframe | Timeframe for the Concurrent Queries monitor | string | `"last_5m"` | no |
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| execution\_time\_enabled | Flag to enable GCP Big Query Execution Time monitor | string | `"true"` | no |
| execution\_time\_extra\_tags | Extra tags for GCP Big Query Execution Time monitor | list(string) | `[]` | no |
| execution\_time\_message | Custom message for the Execution Time monitor | string | `""` | no |
| execution\_time\_threshold\_critical | Average Execution Time in seconds (critical threshold) | string | `"150"` | no |
| execution\_time\_threshold\_warning | Average Execution Time in seconds (warning threshold) | string | `"100"` | no |
| execution\_time\_timeframe | Timeframe for the Execution Time monitor | string | `"last_5m"` | no |
| filter\_tags | Tags used for filtering | string | `"*"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds for the new host evaluation | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| scanned\_bytes\_billed\_enabled | Flag to enable GCP Big Query Scanned Bytes Billed monitor | string | `"true"` | no |
| scanned\_bytes\_billed\_extra\_tags | Extra tags for GCP Big Query Scanned Bytes Billed monitor | list(string) | `[]` | no |
| scanned\_bytes\_billed\_message | Custom message for the Scanned Bytes Billed monitor | string | `""` | no |
| scanned\_bytes\_billed\_threshold\_critical | Scanned Bytes Billed (critical threshold) | string | `"1"` | no |
| scanned\_bytes\_billed\_threshold\_warning | Scanned Bytes Billed (warning threshold) | string | `"0"` | no |
| scanned\_bytes\_billed\_timeframe | Timeframe for the Scanned Bytes Billed monitor | string | `"last_4h"` | no |
| scanned\_bytes\_enabled | Flag to enable GCP Big Query Scanned Bytes monitor | string | `"true"` | no |
| scanned\_bytes\_extra\_tags | Extra tags for GCP Big Query Scanned Bytes monitor | list(string) | `[]` | no |
| scanned\_bytes\_message | Custom message for the Scanned Bytes monitor | string | `""` | no |
| scanned\_bytes\_threshold\_critical | Scanned Bytes (critical threshold) | string | `"1"` | no |
| scanned\_bytes\_threshold\_warning | Scanned Bytes (warning threshold) | string | `"0"` | no |
| scanned\_bytes\_timeframe | Timeframe for the Scanned Bytes monitor | string | `"last_4h"` | no |
| stored\_bytes\_enabled | Flag to enable GCP Big Query Stored Bytes monitor | string | `"true"` | no |
| stored\_bytes\_extra\_tags | Extra tags for GCP Big Query Stored Bytes monitor | list(string) | `[]` | no |
| stored\_bytes\_message | Custom message for the Stored Bytes monitor | string | `""` | no |
| stored\_bytes\_threshold\_critical | Stored Bytes in fraction (critical threshold) | string | `"1"` | no |
| stored\_bytes\_threshold\_warning | Stored Bytes in fraction (warning threshold) | string | `"0"` | no |
| stored\_bytes\_timeframe | Timeframe for the Stored Bytes monitor | string | `"last_5m"` | no |
| table\_count\_enabled | Flag to enable GCP Big Query Table Count monitor | string | `"true"` | no |
| table\_count\_extra\_tags | Extra tags for GCP Big Query Table Count monitor | list(string) | `[]` | no |
| table\_count\_message | Custom message for the Table Count monitor | string | `""` | no |
| table\_count\_threshold\_critical | Table Count (critical threshold) | string | `"1"` | no |
| table\_count\_threshold\_warning | Table Count (warning threshold) | string | `"0"` | no |
| table\_count\_timeframe | Timeframe for the Table Count monitor | string | `"last_4h"` | no |
| uploaded\_bytes\_billed\_enabled | Flag to enable GCP Big Query Uploaded Bytes Billed monitor | string | `"true"` | no |
| uploaded\_bytes\_billed\_extra\_tags | Extra tags for GCP Big Query Scanned Bytes monitor | list(string) | `[]` | no |
| uploaded\_bytes\_billed\_message | Custom message for the Uploaded Bytes Billed monitor | string | `""` | no |
| uploaded\_bytes\_billed\_threshold\_critical | Uploaded Bytes Billed (critical threshold) | string | `"1"` | no |
| uploaded\_bytes\_billed\_threshold\_warning | Uploaded Bytes Billed (warning threshold) | string | `"0"` | no |
| uploaded\_bytes\_billed\_timeframe | Timeframe for the Uploaded Bytes Billed monitor | string | `"last_4h"` | no |
| uploaded\_bytes\_enabled | Flag to enable GCP Big Query Uploaded Bytes monitor | string | `"true"` | no |
| uploaded\_bytes\_extra\_tags | Extra tags for GCP Big Query Uploaded Bytes monitor | list(string) | `[]` | no |
| uploaded\_bytes\_message | Custom message for the Uploaded Bytes monitor | string | `""` | no |
| uploaded\_bytes\_threshold\_critical | Uploaded Bytes (critical threshold) | string | `"1"` | no |
| uploaded\_bytes\_threshold\_warning | Uploaded Bytes (warning threshold) | string | `"0"` | no |
| uploaded\_bytes\_timeframe | Timeframe for the Uploaded Bytes monitor | string | `"last_4h"` | no |

## Outputs

| Name | Description |
|------|-------------|
| available\_slots\_id | id for monitor available_slots |
| concurrent\_queries\_id | id for monitor concurrent_queries |
| execution\_time\_id | id for monitor execution_time |
| scanned\_bytes\_billed\_id | id for monitor scanned_bytes_billed |
| scanned\_bytes\_id | id for monitor scanned_bytes |
| stored\_bytes\_id | id for monitor stored_bytes |
| table\_count\_id | id for monitor table_count |
| uploaded\_bytes\_billed\_id | id for monitor uploaded_bytes_billed |
| uploaded\_bytes\_id | id for monitor uploaded_bytes |

## Related documentation

* [GCP Big Query monitoring](https://cloud.google.com/bigquery/docs/monitoring)
* [Datadog Integration for GCP Big Query](https://docs.datadoghq.com/integrations/google_cloud_big_query/)
* [GCP Big Query Quotas and Limits](https://cloud.google.com/bigquery/quotas)
