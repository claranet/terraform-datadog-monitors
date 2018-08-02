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
- Cloud SQL MySQL Queries Count changed abnormally
- Cloud SQL MySQL Questions Count changed abnormally

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| project_id | ID of the GCP Project | string | - | yes |
| queries_changing_anomaly_alert_window | Alert window. | string | `last_30m` | no |
| queries_changing_anomaly_count_default_zero | Count default zero. | string | `false` | no |
| queries_changing_anomaly_detection_algorithm | Anomaly Detection Algorithm used | string | `agile` | no |
| queries_changing_anomaly_deviations | Deviations to detect the anomaly | string | `4` | no |
| queries_changing_anomaly_direction | Direction of the anomaly. It can be both, below or above. | string | `both` | no |
| queries_changing_anomaly_extra_tags | Extra tags for GCP Cloud SQL Queries Changing monitor | list | `<list>` | no |
| queries_changing_anomaly_interval | Interval. | string | `20` | no |
| queries_changing_anomaly_message | Custom message for the Queries Changing monitor | string | `` | no |
| queries_changing_anomaly_seasonality | Seasonality of the algorithm | string | `weekly` | no |
| queries_changing_anomaly_silenced | Groups to mute for GCP Cloud SQL Queries Changing monitor | map | `<map>` | no |
| queries_changing_anomaly_threshold_critical | Queries Changing critical threshold | string | `1` | no |
| queries_changing_anomaly_threshold_critical_recovery | Queries Changing critical recovery threshold | string | `0.99` | no |
| queries_changing_anomaly_threshold_warning | Queries Changing warning threshold | string | `0.5` | no |
| queries_changing_anomaly_time_aggregator | Time aggregator for the Queries Changing mon monitor | string | `avg` | no |
| queries_changing_anomaly_timeframe | Timeframe for the Queries Changing mon monitor | string | `last_1h` | no |
| questions_changing_anomaly_alert_window | Alert window. | string | `last_30m` | no |
| questions_changing_anomaly_count_default_zero | Count default zero. | string | `false` | no |
| questions_changing_anomaly_detection_algorithm | Anomaly Detection Algorithm used | string | `agile` | no |
| questions_changing_anomaly_deviations | Deviations to detect the anomaly | string | `4` | no |
| questions_changing_anomaly_direction | Direction of the anomaly. It can be both, below or above. | string | `both` | no |
| questions_changing_anomaly_extra_tags | Extra tags for GCP Cloud SQL Questions Changing monitor | list | `<list>` | no |
| questions_changing_anomaly_interval | Interval. | string | `20` | no |
| questions_changing_anomaly_message | Custom message for the Questions Changing monitor | string | `` | no |
| questions_changing_anomaly_seasonality | Seasonality of the algorithm | string | `weekly` | no |
| questions_changing_anomaly_silenced | Groups to mute for GCP Cloud SQL Questions Changing monitor | map | `<map>` | no |
| questions_changing_anomaly_threshold_critical | Questions Changing critical threshold | string | `1` | no |
| questions_changing_anomaly_threshold_critical_recovery | Questions Changing critical recovery threshold | string | `0.99` | no |
| questions_changing_anomaly_threshold_warning | Questions Changing warning threshold | string | `0.5` | no |
| questions_changing_anomaly_time_aggregator | Time aggregator for the Questions Changing monitor | string | `avg` | no |
| questions_changing_anomaly_timeframe | Timeframe for the Questions Changing monitor | string | `last_1h` | no |
| replication_lag_extra_tags | Extra tags for GCP Cloud SQL SQL Replication monitor | list | `<list>` | no |
| replication_lag_message | Custom message for the Replication Lag monitor | string | `` | no |
| replication_lag_silenced | Groups to mute for GCP Cloud SQL Replication Lag monitor | map | `<map>` | no |
| replication_lag_threshold_critical | Seconds behind the master (critical threshold) | string | `180` | no |
| replication_lag_threshold_warning | Seconds behind the master (warning threshold) | string | `90` | no |
| replication_lag_time_aggregator | Time aggregator for the Replication Lag monitor | string | `min` | no |
| replication_lag_timeframe | Timeframe for the Replication Lag monitor | string | `last_10m` | no |

## Outputs

| Name | Description |
|------|-------------|
| queries_changing_anomaly_id | id for monitor queries_changing_anomaly |
| questions_changing_anomaly_id | id for monitor questions_changing_anomaly |
| replication_lag_id | id for monitor replication_lag |

## Related documentation

* [GCP Metrics for CloudSQL](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-cloudsql)
* [Datadog Useful monitors for GCP CloudSQL](https://www.datadoghq.com/blog/monitor-google-cloud-sql/)
* [Max connections depends on the type of the instance](https://cloud.google.com/sql/docs/quotas#fixed-limits)
* [Monitoring Replication Lag](https://cloud.google.com/sql/docs/mysql/high-availability#replication-lag-monitor)
* [Monitoring MySQL Performance Metrics](https://www.datadoghq.com/blog/monitoring-mysql-performance-metrics)
