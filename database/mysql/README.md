# DATABASE MYSQL DataDog monitors

## How to use this module

```
module "datadog-monitors-database-mysql" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//database/mysql?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Mysql server does not respond
- Mysql Connections
- Mysql Aborted connects
- Mysql Slow queries
- Mysql Innodb buffer pool efficiency
- Mysql Innodb buffer pool utilization
- Mysql threads changed abnormally
- Mysql queries changed abnormally

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `15` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| mysql_aborted_extra_tags | Extra tags for MySQL aborted connects monitor | list | `<list>` | no |
| mysql_aborted_message | Custom message for MySQL aborted connects monitor | string | `` | no |
| mysql_aborted_silenced | Groups to mute MySQL aborted connects monitor | map | `<map>` | no |
| mysql_aborted_threshold_critical | Maximum critical acceptable percent of aborted connects | string | `10` | no |
| mysql_aborted_threshold_warning | Maximum warning acceptable percent of aborted connects | string | `5` | no |
| mysql_aborted_time_aggregator | Monitor time aggregator for MySQL aborted connects monitor [available values: min, max or avg] | string | `avg` | no |
| mysql_aborted_timeframe | Monitor timeframe for MySQL aborted connects monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_10m` | no |
| mysql_availability_extra_tags | Extra tags for Mysql availability monitor | list | `<list>` | no |
| mysql_availability_message | Custom message for Mysql availability monitor | string | `` | no |
| mysql_availability_silenced | Groups to mute for Mysql availability monitor | map | `<map>` | no |
| mysql_availability_threshold_critical | Nginx status monitor (critical threshold) | string | `1.1754943508222875e-38` | no |
| mysql_connection_extra_tags | Extra tags for MySQL connection monitor | list | `<list>` | no |
| mysql_connection_message | Custom message for MySQL connection monitor | string | `` | no |
| mysql_connection_silenced | Groups to mute MySQL connection monitor | map | `<map>` | no |
| mysql_connection_threshold_critical | Maximum critical acceptable percent of connections | string | `80` | no |
| mysql_connection_threshold_warning | Maximum warning acceptable percent of connections | string | `70` | no |
| mysql_connection_time_aggregator | Monitor time aggregator for MySQL connection monitor [available values: min, max or avg] | string | `avg` | no |
| mysql_connection_timeframe | Monitor timeframe for MySQL connection monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_10m` | no |
| mysql_pool_efficiency_extra_tags | Extra tags for MySQL innodb buffer pool efficiency monitor | list | `<list>` | no |
| mysql_pool_efficiency_message | Custom message for MySQL innodb buffer pool efficiency monitor | string | `` | no |
| mysql_pool_efficiency_silenced | Groups to mute MySQL innodb buffer pool efficiency monitor | map | `<map>` | no |
| mysql_pool_efficiency_threshold_critical | Maximum critical acceptable percent of innodb buffer pool efficiency | string | `20` | no |
| mysql_pool_efficiency_threshold_warning | Maximum warning acceptable percent of innodb buffer pool efficiency | string | `1` | no |
| mysql_pool_efficiency_time_aggregator | Monitor time aggregator for MySQL innodb buffer pool efficiency monitor [available values: min, max or avg] | string | `sum` | no |
| mysql_pool_efficiency_timeframe | Monitor timeframe for MySQL innodb buffer pool efficiency monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_1h` | no |
| mysql_pool_utilization_extra_tags | Extra tags for MySQL innodb buffer pool utilization monitor | list | `<list>` | no |
| mysql_pool_utilization_message | Custom message for MySQL innodb buffer pool utilization monitor | string | `` | no |
| mysql_pool_utilization_silenced | Groups to mute MySQL innodb buffer pool utilization monitor | map | `<map>` | no |
| mysql_pool_utilization_threshold_critical | Maximum critical acceptable percent of innodb buffer pool utilization | string | `90` | no |
| mysql_pool_utilization_threshold_warning | Maximum warning acceptable percent of innodb buffer pool utilization | string | `75` | no |
| mysql_pool_utilization_time_aggregator | Monitor time aggregator for MySQL innodb buffer pool utilization monitor [available values: min, max or avg] | string | `min` | no |
| mysql_pool_utilization_timeframe | Monitor timeframe for MySQL innodb buffer pool utilization monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_4h` | no |
| mysql_queries_alert_window | Alert window. | string | `last_15m` | no |
| mysql_queries_count_default_zero | Count default zero. | string | `true` | no |
| mysql_queries_detection_algorithm | Anomaly Detection Algorithm used | string | `agile` | no |
| mysql_queries_deviations | Deviations to detect the anomaly | string | `2` | no |
| mysql_queries_direction | Direction of the anomaly. It can be both, below or above. | string | `both` | no |
| mysql_queries_extra_tags | Extra tags for MySQL queries monitor | list | `<list>` | no |
| mysql_queries_interval | Interval. | string | `60` | no |
| mysql_queries_message | Custom message for MySQL queries monitor | string | `` | no |
| mysql_queries_seasonality | Seasonality of the algorithm | string | `daily` | no |
| mysql_queries_silenced | Groups to mute mysql queries monitor | map | `<map>` | no |
| mysql_queries_threshold_critical | Maximum critical acceptable number of queries | string | `1` | no |
| mysql_queries_time_aggregator | Monitor time aggregator for MySQL queries monitor [available values: min, max or avg] | string | `avg` | no |
| mysql_queries_timeframe | Monitor timeframe for MySQL queries monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_4h` | no |
| mysql_slow_extra_tags | Extra tags for MySQL slow queries monitor | list | `<list>` | no |
| mysql_slow_message | Custom message for MySQL slow queries monitor | string | `` | no |
| mysql_slow_silenced | Groups to mute MySQL slow queries monitor | map | `<map>` | no |
| mysql_slow_threshold_critical | Maximum critical acceptable percent of slow queries | string | `20` | no |
| mysql_slow_threshold_warning | Maximum warning acceptable percent of slow queries | string | `5` | no |
| mysql_slow_time_aggregator | Monitor time aggregator for MySQL slow queries monitor [available values: min, max or avg] | string | `avg` | no |
| mysql_slow_timeframe | Monitor timeframe for MySQL slow queries monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| mysql_threads_alert_window | Alert window. | string | `last_15m` | no |
| mysql_threads_count_default_zero | Count default zero. | string | `true` | no |
| mysql_threads_detection_algorithm | Anomaly Detection Algorithm used | string | `basic` | no |
| mysql_threads_deviations | Deviations to detect the anomaly | string | `2` | no |
| mysql_threads_direction | Direction of the anomaly. It can be both, below or above. | string | `above` | no |
| mysql_threads_extra_tags | Extra tags for MySQL threads monitor | list | `<list>` | no |
| mysql_threads_interval | Interval. | string | `60` | no |
| mysql_threads_message | Custom message for MySQL threads monitor | string | `` | no |
| mysql_threads_seasonality | Seasonality of the algorithm | string | `daily` | no |
| mysql_threads_silenced | Groups to mute mysql threads monitor | map | `<map>` | no |
| mysql_threads_threshold_critical | Maximum critical acceptable number of threads | string | `1` | no |
| mysql_threads_time_aggregator | Monitor time aggregator for MySQL threads monitor [available values: min, max or avg] | string | `avg` | no |
| mysql_threads_timeframe | Monitor timeframe for MySQL threads monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_4h` | no |
| new_host_delay | Delay in seconds for the metric evaluation | string | `300` | no |

## Outputs

| Name | Description |
|------|-------------|
| mysql_aborted_id | id for monitor mysql_aborted |
| mysql_availability_id | id for monitor mysql_availability |
| mysql_connection_id | id for monitor mysql_connection |
| mysql_pool_efficiency_id | id for monitor mysql_pool_efficiency |
| mysql_pool_utilization_id | id for monitor mysql_pool_utilization |
| mysql_queries_anomaly_id | id for monitor mysql_queries_anomaly |
| mysql_slow_id | id for monitor mysql_slow |
| mysql_threads_anomaly_id | id for monitor mysql_threads_anomaly |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/mysql/](https://docs.datadoghq.com/integrations/mysql/)
