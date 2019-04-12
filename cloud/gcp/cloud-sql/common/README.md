# CLOUD GCP CLOUD-SQL COMMON DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-gcp-cloud-sql-common" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//cloud/gcp/cloud-sql/common?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Cloud SQL CPU Utilization
- Cloud SQL Disk Utilization forecast
- Cloud SQL Disk Utilization
- Cloud SQL Failover Unavailable
- Cloud SQL Memory Utilization forecast
- Cloud SQL Memory Utilization

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu\_utilization\_enabled | Flag to enable GCP Cloud SQL CPU Utilization monitor | string | `"true"` | no |
| cpu\_utilization\_extra\_tags | Extra tags for GCP Cloud SQL CPU Utilization monitor | list | `[]` | no |
| cpu\_utilization\_message | Custom message for the CPU Utilization monitor | string | `""` | no |
| cpu\_utilization\_silenced | Groups to mute for GCP Cloud SQL CPU Utilization monitor | map | `{}` | no |
| cpu\_utilization\_threshold\_critical | CPU Utilization in percentage (critical threshold) | string | `"90"` | no |
| cpu\_utilization\_threshold\_warning | CPU Utilization in percentage (warning threshold) | string | `"80"` | no |
| cpu\_utilization\_time\_aggregator | Time aggregator for the CPU Utilization monitor | string | `"avg"` | no |
| cpu\_utilization\_timeframe | Timeframe for the CPU Utilization monitor | string | `"last_15m"` | no |
| disk\_utilization\_enabled | Flag to enable GCP Cloud SQL Disk Utilization monitor | string | `"true"` | no |
| disk\_utilization\_extra\_tags | Extra tags for GCP Cloud SQL CPU Utilization monitor | list | `[]` | no |
| disk\_utilization\_forecast\_algorithm | Algorithm for the Disk Utilization Forecast monitor | string | `"linear"` | no |
| disk\_utilization\_forecast\_deviations | Deviations for the Disk Utilization Forecast monitor | string | `"1"` | no |
| disk\_utilization\_forecast\_enabled | Flag to enable GCP Cloud SQL Disk Utilization Forecast monitor | string | `"true"` | no |
| disk\_utilization\_forecast\_extra\_tags | Extra tags for GCP Cloud SQL Disk Utilization Forecast monitor | list | `[]` | no |
| disk\_utilization\_forecast\_interval | Interval for the Disk Utilization Forecast monitor | string | `"60m"` | no |
| disk\_utilization\_forecast\_linear\_history | History for the Disk Utilization Forecast monitor | string | `"3d"` | no |
| disk\_utilization\_forecast\_linear\_model | Model for the Disk Utilization Forecast monitor | string | `"default"` | no |
| disk\_utilization\_forecast\_message | Custom message for the Disk Utilization Forecast monitor | string | `""` | no |
| disk\_utilization\_forecast\_seasonal\_seasonality | Seasonality for the Disk Utilization Forecast monitor | string | `"weekly"` | no |
| disk\_utilization\_forecast\_silenced | Groups to mute for GCP Cloud SQL Disk Utilization Forecast monitor | map | `{}` | no |
| disk\_utilization\_forecast\_threshold\_critical | Disk Utilization Forecast in percentage (critical threshold) | string | `"80"` | no |
| disk\_utilization\_forecast\_threshold\_critical\_recovery | Disk Utilization Forecast in percentage (recovery threshold) | string | `"72"` | no |
| disk\_utilization\_forecast\_time\_aggregator | Time aggregator for the Disk Utilization Forecast monitor | string | `"max"` | no |
| disk\_utilization\_forecast\_timeframe | Timeframe for the Disk Utilization Forecast monitor | string | `"next_1w"` | no |
| disk\_utilization\_message | Custom message for the Disk Utilization monitor | string | `""` | no |
| disk\_utilization\_silenced | Groups to mute for GCP Cloud SQL Disk Utilization monitor | map | `{}` | no |
| disk\_utilization\_threshold\_critical | Disk Utilization in percentage (critical threshold) | string | `"90"` | no |
| disk\_utilization\_threshold\_warning | Disk Utilization in percentage (warning threshold) | string | `"80"` | no |
| disk\_utilization\_time\_aggregator | Time aggregator for the Disk Utilization monitor | string | `"avg"` | no |
| disk\_utilization\_timeframe | Timeframe for the Disk Utilization monitor | string | `"last_5m"` | no |
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| failover\_unavailable\_enabled | Flag to enable GCP Cloud SQL Failover Unavailable monitor | string | `"true"` | no |
| failover\_unavailable\_extra\_tags | Extra tags for GCP Cloud SQL Failover Unavailable monitor | list | `[]` | no |
| failover\_unavailable\_message | Custom message for the Failover Unavailable monitor | string | `""` | no |
| failover\_unavailable\_silenced | Groups to mute for GCP Cloud SQL Failover Unavailable monitor | map | `{}` | no |
| failover\_unavailable\_threshold\_critical | Failover Unavailable critical threshold | string | `"0"` | no |
| failover\_unavailable\_time\_aggregator | Time aggreggator for the Failover Unavailable monitor | string | `"max"` | no |
| failover\_unavailable\_timeframe | Timeframe for the Failover Unavailable monitor | string | `"last_10m"` | no |
| filter\_tags | Tags used for filtering | string | `"*"` | no |
| memory\_utilization\_enabled | Flag to enable GCP Cloud SQL Memory Utilization monitor | string | `"true"` | no |
| memory\_utilization\_extra\_tags | Extra tags for GCP Cloud SQL Memory Utilization monitor | list | `[]` | no |
| memory\_utilization\_forecast\_algorithm | Algorithm for the Memory Utilization Forecast monitor | string | `"linear"` | no |
| memory\_utilization\_forecast\_deviations | Deviations for the Memory Utilization Forecast monitor | string | `"1"` | no |
| memory\_utilization\_forecast\_enabled | Flag to enable GCP Cloud SQL Memory Utilization Forecast monitor | string | `"true"` | no |
| memory\_utilization\_forecast\_extra\_tags | Extra tags for GCP Cloud SQL Memory Utilization Forecast monitor | list | `[]` | no |
| memory\_utilization\_forecast\_interval | Interval for the Memory Utilization Forecast monitor | string | `"30m"` | no |
| memory\_utilization\_forecast\_linear\_history | History for the Memory Utilization Forecast monitor | string | `"12h"` | no |
| memory\_utilization\_forecast\_linear\_model | Model for the Memory Utilization Forecast monitor | string | `"default"` | no |
| memory\_utilization\_forecast\_message | Custom message for the Memory Utilization Forecast monitor | string | `""` | no |
| memory\_utilization\_forecast\_seasonal\_seasonality | Seasonality for the Memory Utilization Forecast monitor | string | `"weekly"` | no |
| memory\_utilization\_forecast\_silenced | Groups to mute for GCP Cloud SQL Memory Utilization Forecast monitor | map | `{}` | no |
| memory\_utilization\_forecast\_threshold\_critical | Memory Utilization Forecast in percentage (warning threshold) | string | `"90"` | no |
| memory\_utilization\_forecast\_threshold\_critical\_recovery | Memory Utilization Forecast in percentage (recovery threshold) | string | `"81"` | no |
| memory\_utilization\_forecast\_time\_aggregator | Time aggregator for the Memory Utilization Forecast monitor | string | `"max"` | no |
| memory\_utilization\_forecast\_timeframe | Timeframe for the Memory Utilization Forecast monitor | string | `"next_3d"` | no |
| memory\_utilization\_message | Custom message for the Memory Utilization monitor | string | `""` | no |
| memory\_utilization\_silenced | Groups to mute for GCP Cloud SQL Memory Utilization monitor | map | `{}` | no |
| memory\_utilization\_threshold\_critical | Memory Utilization in percentage (critical threshold) | string | `"90"` | no |
| memory\_utilization\_threshold\_warning | Memory Utilization in percentage (warning threshold) | string | `"80"` | no |
| memory\_utilization\_time\_aggregator | Time aggregator for the Memory Utilization monitor | string | `"avg"` | no |
| memory\_utilization\_timeframe | Timeframe for the Memory Utilization monitor | string | `"last_5m"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds for the new host evaluation | string | `"300"` | no |

## Outputs

| Name | Description |
|------|-------------|
| cpu\_utilization\_id | id for monitor cpu_utilization |
| disk\_utilization\_forecast\_id | id for monitor disk_utilization_forecast |
| disk\_utilization\_id | id for monitor disk_utilization |
| failover\_unavailable\_id | id for monitor failover_unavailable |
| memory\_utilization\_forecast\_id | id for monitor memory_utilization_forecast |
| memory\_utilization\_id | id for monitor memory_utilization |

## Related documentation

* [GCP Metrics for CloudSQL](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-cloudsql)
* [Datadog Useful monitors for GCP CloudSQL](https://www.datadoghq.com/blog/monitor-google-cloud-sql/)
