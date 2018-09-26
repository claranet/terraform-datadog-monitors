# CLOUD GCP CLOUD-SQL MYSQL DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-gcp-cloud-sql-mysql" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/gcp/cloud-sql/mysql?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Cloud SQL MySQL Replication Lag

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `900` | no |
| filter_tags | Tags used for filtering | string | `*` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| new_host_delay | Delay in seconds for the new host evaluation | string | `300` | no |
| replication_lag_enabled | Flag to enable GCP Cloud SQL Replication Lag monitor | string | `true` | no |
| replication_lag_extra_tags | Extra tags for GCP Cloud SQL SQL Replication monitor | list | `[]` | no |
| replication_lag_message | Custom message for the Replication Lag monitor | string | `` | no |
| replication_lag_silenced | Groups to mute for GCP Cloud SQL Replication Lag monitor | map | `{}` | no |
| replication_lag_threshold_critical | Seconds behind the master (critical threshold) | string | `180` | no |
| replication_lag_threshold_warning | Seconds behind the master (warning threshold) | string | `90` | no |
| replication_lag_time_aggregator | Time aggregator for the Replication Lag monitor | string | `min` | no |
| replication_lag_timeframe | Timeframe for the Replication Lag monitor | string | `last_10m` | no |

## Outputs

| Name | Description |
|------|-------------|
| replication_lag_id | id for monitor replication_lag |

## Related documentation

* [GCP Metrics for CloudSQL](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-cloudsql)
* [Datadog Useful monitors for GCP CloudSQL](https://www.datadoghq.com/blog/monitor-google-cloud-sql/)
* [Max connections depends on the type of the instance](https://cloud.google.com/sql/docs/quotas#fixed-limits)
* [Monitoring Replication Lag](https://cloud.google.com/sql/docs/mysql/high-availability#replication-lag-monitor)
* [Monitoring MySQL Performance Metrics](https://www.datadoghq.com/blog/monitoring-mysql-performance-metrics)
