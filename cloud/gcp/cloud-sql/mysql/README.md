GCP CloudSQL MySQL Monitors
==============================

How to use this module
----------------------

```
module "datadog-monitors-gcp-cloudsql-mysql" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/gcp/clouds-sql/mysql?ref={revision}"

  project_id  = "${var.gcp_project_id}"
  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

Purpose
-------
Creates DataDog monitors with the following checks :

* CloudSQL MySQL Network Connections
* CloudSQL MySQL Replication Lag
* CloudSQL MySQL Failover Lag

Useful links
------------

* [GCP Metrics for CloudSQL](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-cloudsql)
* [Datadog Useful monitors for GCP CloudSQL](https://www.datadoghq.com/blog/monitor-google-cloud-sql/)
* [Max connections depends on the type of the instance](https://cloud.google.com/sql/docs/quotas#fixed-limits)
* [Monitoring Replication Lag](https://cloud.google.com/sql/docs/mysql/high-availability#replication-lag-monitor)
* [Monitoring MySQL Performance Metrics](https://www.datadoghq.com/blog/monitoring-mysql-performance-metrics)

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| network_connections_hard_limit | Max number of connections for the CloudSQL Instance. Default value is the max value on https://cloud.google.com/sql/docs/quotas#fixed-limits for MySQL | string | `4000` | no |
| network_connections_message | Custom message for the Network Connections monitor | string | `` | no |
| network_connections_silenced | Groups to mute for GCP Cloud SQL Network Connections monitor | map | `<map>` | no |
| network_connections_threshold_critical | Number of network connections (critical threshold) | string | `3600` | no |
| network_connections_threshold_warning | Number of network connections (warning threshold) | string | `3200` | no |
| network_connections_timeframe | Timeframe for the Network Connections monitor | string | `last_5m` | no |
| project_id | ID of the GCP Project | string | - | yes |
| queries_changing_anomaly_detection_algorithm | Anomaly Detection Algorithm used | string | `robust` | no |
| queries_changing_database_ids | Queries Changing Abnormally | list | `<list>` | no |
| queries_changing_deviations | Deviations to detect the anomaly | string | `4` | no |
| queries_changing_direction | Direction of the anomaly. It can be both, below or above. | string | `both` | no |
| queries_changing_message | Custom message for the Queries Changing monitor | string | `` | no |
| queries_changing_region |  | string | `` | no |
| queries_changing_seasonality | Seasonality of the algorithm | string | `weekly` | no |
| queries_changing_silenced | Groups to mute for GCP Cloud SQL Queries Changing monitor | map | `<map>` | no |
| queries_changing_threshold_critical | Queries Changing critical threshold | string | `1` | no |
| queries_changing_threshold_warning | Queries Changing warning threshold | string | `0.5` | no |
| queries_changing_timeframe | Timeframe for the Queries Changing mon monitor | string | `last_10m` | no |
| questions_changing_anomaly_detection_algorithm | Anomaly Detection Algorithm used | string | `robust` | no |
| questions_changing_database_ids |  | list | `<list>` | no |
| questions_changing_deviations | Deviations to detect the anomaly | string | `4` | no |
| questions_changing_direction | Direction of the anomaly. It can be both, below or above. | string | `both` | no |
| questions_changing_message | Custom message for the Questions Changing monitor | string | `` | no |
| questions_changing_region |  | string | `` | no |
| questions_changing_seasonality | Seasonality of the algorithm | string | `weekly` | no |
| questions_changing_silenced | Groups to mute for GCP Cloud SQL Network Connections monitor | map | `<map>` | no |
| questions_changing_threshold_critical | Questions Changing critical threshold | string | `1` | no |
| questions_changing_threshold_warning | Questions Changing warning threshold | string | `0.5` | no |
| questions_changing_timeframe | Timeframe for the Questions Changing mon monitor | string | `last_10m` | no |
| replication_lag_message | Custom message for the Replication Lag monitor | string | `` | no |
| replication_lag_silenced | Groups to mute for GCP Cloud SQL Replication Lag monitor | map | `<map>` | no |
| replication_lag_threshold_critical | Seconds behind the master (critical threshold) | string | `2700` | no |
| replication_lag_threshold_warning | Seconds behind the master (warning threshold) | string | `2000` | no |
| replication_lag_timeframe | Timeframe for the Replication Lag monitor | string | `last_10m` | no |
