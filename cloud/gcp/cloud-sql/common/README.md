# CLOUD GCP CLOUD-SQL COMMON DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-gcp-cloud-sql-common" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors.git//cloud/gcp/cloud-sql/common?ref={revision}"

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
| cpu_utilization_enabled | Flag to enable GCP Cloud SQL CPU Utilization monitor | string | `true` | no |
| cpu_utilization_extra_tags | Extra tags for GCP Cloud SQL CPU Utilization monitor | list | `[]` | no |
| cpu_utilization_message | Custom message for the CPU Utilization monitor | string | `` | no |
| cpu_utilization_silenced | Groups to mute for GCP Cloud SQL CPU Utilization monitor | map | `{}` | no |
| cpu_utilization_threshold_critical | CPU Utilization in percentage (critical threshold) | string | `90` | no |
| cpu_utilization_threshold_warning | CPU Utilization in percentage (warning threshold) | string | `80` | no |
| cpu_utilization_time_aggregator | Time aggregator for the CPU Utilization monitor | string | `avg` | no |
| cpu_utilization_timeframe | Timeframe for the CPU Utilization monitor | string | `last_15m` | no |
| disk_utilization_enabled | Flag to enable GCP Cloud SQL Disk Utilization monitor | string | `true` | no |
| disk_utilization_extra_tags | Extra tags for GCP Cloud SQL CPU Utilization monitor | list | `[]` | no |
| disk_utilization_forecast_algorithm | Algorithm for the Disk Utilization Forecast monitor | string | `linear` | no |
| disk_utilization_forecast_deviations | Deviations for the Disk Utilization Forecast monitor | string | `1` | no |
| disk_utilization_forecast_enabled | Flag to enable GCP Cloud SQL Disk Utilization Forecast monitor | string | `true` | no |
| disk_utilization_forecast_extra_tags | Extra tags for GCP Cloud SQL Disk Utilization Forecast monitor | list | `[]` | no |
| disk_utilization_forecast_interval | Interval for the Disk Utilization Forecast monitor | string | `60m` | no |
| disk_utilization_forecast_linear_history | History for the Disk Utilization Forecast monitor | string | `3d` | no |
| disk_utilization_forecast_linear_model | Model for the Disk Utilization Forecast monitor | string | `default` | no |
| disk_utilization_forecast_message | Custom message for the Disk Utilization Forecast monitor | string | `` | no |
| disk_utilization_forecast_seasonal_seasonality | Seasonality for the Disk Utilization Forecast monitor | string | `weekly` | no |
| disk_utilization_forecast_silenced | Groups to mute for GCP Cloud SQL Disk Utilization Forecast monitor | map | `{}` | no |
| disk_utilization_forecast_threshold_critical | Disk Utilization Forecast in percentage (critical threshold) | string | `80` | no |
| disk_utilization_forecast_threshold_critical_recovery | Disk Utilization Forecast in percentage (recovery threshold) | string | `72` | no |
| disk_utilization_forecast_time_aggregator | Time aggregator for the Disk Utilization Forecast monitor | string | `max` | no |
| disk_utilization_forecast_timeframe | Timeframe for the Disk Utilization Forecast monitor | string | `next_1w` | no |
| disk_utilization_message | Custom message for the Disk Utilization monitor | string | `` | no |
| disk_utilization_silenced | Groups to mute for GCP Cloud SQL Disk Utilization monitor | map | `{}` | no |
| disk_utilization_threshold_critical | Disk Utilization in percentage (critical threshold) | string | `90` | no |
| disk_utilization_threshold_warning | Disk Utilization in percentage (warning threshold) | string | `80` | no |
| disk_utilization_time_aggregator | Time aggregator for the Disk Utilization monitor | string | `avg` | no |
| disk_utilization_timeframe | Timeframe for the Disk Utilization monitor | string | `last_5m` | no |
| environment | Architecture environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `900` | no |
| failover_unavailable_enabled | Flag to enable GCP Cloud SQL Failover Unavailable monitor | string | `true` | no |
| failover_unavailable_extra_tags | Extra tags for GCP Cloud SQL Failover Unavailable monitor | list | `[]` | no |
| failover_unavailable_message | Custom message for the Failover Unavailable monitor | string | `` | no |
| failover_unavailable_silenced | Groups to mute for GCP Cloud SQL Failover Unavailable monitor | map | `{}` | no |
| failover_unavailable_threshold_critical | Failover Unavailable critical threshold | string | `0` | no |
| failover_unavailable_time_aggregator | Time aggreggator for the Failover Unavailable monitor | string | `max` | no |
| failover_unavailable_timeframe | Timeframe for the Failover Unavailable monitor | string | `last_10m` | no |
| filter_tags | Tags used for filtering | string | `*` | no |
| memory_utilization_enabled | Flag to enable GCP Cloud SQL Memory Utilization monitor | string | `true` | no |
| memory_utilization_extra_tags | Extra tags for GCP Cloud SQL Memory Utilization monitor | list | `[]` | no |
| memory_utilization_forecast_algorithm | Algorithm for the Memory Utilization Forecast monitor | string | `linear` | no |
| memory_utilization_forecast_deviations | Deviations for the Memory Utilization Forecast monitor | string | `1` | no |
| memory_utilization_forecast_enabled | Flag to enable GCP Cloud SQL Memory Utilization Forecast monitor | string | `true` | no |
| memory_utilization_forecast_extra_tags | Extra tags for GCP Cloud SQL Memory Utilization Forecast monitor | list | `[]` | no |
| memory_utilization_forecast_interval | Interval for the Memory Utilization Forecast monitor | string | `30m` | no |
| memory_utilization_forecast_linear_history | History for the Memory Utilization Forecast monitor | string | `12h` | no |
| memory_utilization_forecast_linear_model | Model for the Memory Utilization Forecast monitor | string | `default` | no |
| memory_utilization_forecast_message | Custom message for the Memory Utilization Forecast monitor | string | `` | no |
| memory_utilization_forecast_seasonal_seasonality | Seasonality for the Memory Utilization Forecast monitor | string | `weekly` | no |
| memory_utilization_forecast_silenced | Groups to mute for GCP Cloud SQL Memory Utilization Forecast monitor | map | `{}` | no |
| memory_utilization_forecast_threshold_critical | Memory Utilization Forecast in percentage (warning threshold) | string | `90` | no |
| memory_utilization_forecast_threshold_critical_recovery | Memory Utilization Forecast in percentage (recovery threshold) | string | `81` | no |
| memory_utilization_forecast_time_aggregator | Time aggregator for the Memory Utilization Forecast monitor | string | `max` | no |
| memory_utilization_forecast_timeframe | Timeframe for the Memory Utilization Forecast monitor | string | `next_3d` | no |
| memory_utilization_message | Custom message for the Memory Utilization monitor | string | `` | no |
| memory_utilization_silenced | Groups to mute for GCP Cloud SQL Memory Utilization monitor | map | `{}` | no |
| memory_utilization_threshold_critical | Memory Utilization in percentage (critical threshold) | string | `90` | no |
| memory_utilization_threshold_warning | Memory Utilization in percentage (warning threshold) | string | `80` | no |
| memory_utilization_time_aggregator | Time aggregator for the Memory Utilization monitor | string | `avg` | no |
| memory_utilization_timeframe | Timeframe for the Memory Utilization monitor | string | `last_5m` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| new_host_delay | Delay in seconds for the new host evaluation | string | `300` | no |

## Outputs

| Name | Description |
|------|-------------|
| cpu_utilization_id | id for monitor cpu_utilization |
| disk_utilization_forecast_id | id for monitor disk_utilization_forecast |
| disk_utilization_id | id for monitor disk_utilization |
| failover_unavailable_id | id for monitor failover_unavailable |
| memory_utilization_forecast_id | id for monitor memory_utilization_forecast |
| memory_utilization_id | id for monitor memory_utilization |

## Related documentation

* [GCP Metrics for CloudSQL](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-cloudsql)
* [Datadog Useful monitors for GCP CloudSQL](https://www.datadoghq.com/blog/monitor-google-cloud-sql/)
