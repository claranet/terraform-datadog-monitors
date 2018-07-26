# CLOUD GCP CLOUD-SQL INSTANCE DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-gcp-cloud-sql-instance" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/gcp/cloud-sql/instance?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Cloud SQL CPU Utilization
- Cloud SQL Disk Utilization
- Cloud SQL Memory Utilization
- Cloud SQL Memory Utilization Forecast
- Cloud SQL Failover Unavailable

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu_utilization_extra_tags | Extra tags for GCP Cloud SQL CPU Utilization monitor | list | `<list>` | no |
| cpu_utilization_message | Custom message for the CPU Utilization monitor | string | `` | no |
| cpu_utilization_silenced | Groups to mute for GCP Cloud SQL CPU Utilization monitor | map | `<map>` | no |
| cpu_utilization_threshold_critical | CPU Utilization in fraction (critical threshold) | string | `0.9` | no |
| cpu_utilization_threshold_warning | CPU Utilization in fraction (warning threshold) | string | `0.8` | no |
| cpu_utilization_timeframe | Timeframe for the CPU Utilization monitor | string | `last_30m` | no |
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| disk_utilization_extra_tags | Extra tags for GCP Cloud SQL CPU Utilization monitor | list | `<list>` | no |
| disk_utilization_message | Custom message for the Disk Utilization monitor | string | `` | no |
| disk_utilization_silenced | Groups to mute for GCP Cloud SQL Disk Utilization monitor | map | `<map>` | no |
| disk_utilization_threshold_critical | Disk Utilization in fraction (critical threshold) | string | `0.9` | no |
| disk_utilization_threshold_warning | Disk Utilization in fraction (warning threshold) | string | `0.8` | no |
| disk_utilization_timeframe | Timeframe for the Disk Utilization monitor | string | `last_5m` | no |
| environment | Architecture environment | string | - | yes |
| failover_unavailable_extra_tags | Extra tags for GCP Cloud SQL Failover Unavailable monitor | list | `<list>` | no |
| failover_unavailable_message | Custom message for the Failover Unavailable monitor | string | `` | no |
| failover_unavailable_silenced | Groups to mute for GCP Cloud SQL Failover Unavailable monitor | map | `<map>` | no |
| failover_unavailable_threshold_critical | Failover Unavailable critical threshold | string | `0` | no |
| failover_unavailable_timeframe | Timeframe for the Failover Unavailable monitor | string | `last_5m` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| memory_utilization_extra_tags | Extra tags for GCP Cloud SQL Memory Utilization monitor | list | `<list>` | no |
| memory_utilization_forecast_extra_tags | Extra tags for GCP Cloud SQL Memory Utilization Forecast monitor | list | `<list>` | no |
| memory_utilization_forecast_history | History for the Memory Utilization Forecast monitor | string | `12h` | no |
| memory_utilization_forecast_interval | Interval for the Memory Utilization Forecast monitor | string | `30m` | no |
| memory_utilization_forecast_message | Custom message for the Memory Utilization Forecast monitor | string | `` | no |
| memory_utilization_forecast_silenced | Groups to mute for GCP Cloud SQL Memory Utilization Forecast monitor | map | `<map>` | no |
| memory_utilization_forecast_threshold_critical | Memory Utilization Forecast in fraction (critical threshold) | string | `0.9` | no |
| memory_utilization_forecast_threshold_warning | Memory Utilization Forecast in fraction (warning threshold) | string | `0.8` | no |
| memory_utilization_forecast_timeframe | Timeframe for the Memory Utilization Forecast monitor | string | `next_3d` | no |
| memory_utilization_message | Custom message for the Memory Utilization monitor | string | `` | no |
| memory_utilization_silenced | Groups to mute for GCP Cloud SQL Memory Utilization monitor | map | `<map>` | no |
| memory_utilization_threshold_critical | Memory Utilization in fraction (critical threshold) | string | `0.9` | no |
| memory_utilization_threshold_warning | Memory Utilization in fraction (warning threshold) | string | `0.8` | no |
| memory_utilization_timeframe | Timeframe for the Memory Utilization monitor | string | `last_5m` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| project_id | ID of the GCP Project | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| cpu_utilization_id | id for monitor cpu_utilization |
| disk_utilization_id | id for monitor disk_utilization |
| failover_unavailable_id | id for monitor failover_unavailable |
| memory_utilization_forecast_id | id for monitor memory_utilization_forecast |
| memory_utilization_id | id for monitor memory_utilization |

## Related documentation

* [GCP Metrics for CloudSQL](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-cloudsql)
* [Datadog Useful monitors for GCP CloudSQL](https://www.datadoghq.com/blog/monitor-google-cloud-sql/)
