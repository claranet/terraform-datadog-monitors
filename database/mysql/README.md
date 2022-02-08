# DATABASE MYSQL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-mysql" {
  source      = "claranet/monitors/datadog//database/mysql"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Mysql Aborted connects
- Mysql Connections limit
- Mysql Innodb buffer pool efficiency
- Mysql Innodb buffer pool utilization
- Mysql queries changed abnormally
- Mysql replication lag (disabled by default)
- Mysql replication status changed abnormally (disabled by default)
- Mysql server does not respond
- Mysql Slow queries
- Mysql threads changed abnormally

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.1.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.mysql_aborted](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.mysql_availability](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.mysql_connection](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.mysql_pool_efficiency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.mysql_pool_utilization](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.mysql_questions_anomaly](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.mysql_replication_lag](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.mysql_replication_status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.mysql_slow](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.mysql_threads_anomaly](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_mysql_aborted_enabled"></a> [mysql\_aborted\_enabled](#input\_mysql\_aborted\_enabled) | Flag to enable MySQL aborted connects monitor | `string` | `"true"` | no |
| <a name="input_mysql_aborted_extra_tags"></a> [mysql\_aborted\_extra\_tags](#input\_mysql\_aborted\_extra\_tags) | Extra tags for MySQL aborted connects monitor | `list(string)` | `[]` | no |
| <a name="input_mysql_aborted_message"></a> [mysql\_aborted\_message](#input\_mysql\_aborted\_message) | Custom message for MySQL aborted connects monitor | `string` | `""` | no |
| <a name="input_mysql_aborted_threshold_critical"></a> [mysql\_aborted\_threshold\_critical](#input\_mysql\_aborted\_threshold\_critical) | Maximum critical acceptable percent of aborted connects | `number` | `10` | no |
| <a name="input_mysql_aborted_threshold_warning"></a> [mysql\_aborted\_threshold\_warning](#input\_mysql\_aborted\_threshold\_warning) | Maximum warning acceptable percent of aborted connects | `number` | `5` | no |
| <a name="input_mysql_aborted_time_aggregator"></a> [mysql\_aborted\_time\_aggregator](#input\_mysql\_aborted\_time\_aggregator) | Monitor time aggregator for MySQL aborted connects monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_mysql_aborted_timeframe"></a> [mysql\_aborted\_timeframe](#input\_mysql\_aborted\_timeframe) | Monitor timeframe for MySQL aborted connects monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_10m"` | no |
| <a name="input_mysql_availability_enabled"></a> [mysql\_availability\_enabled](#input\_mysql\_availability\_enabled) | Flag to enable Mysql availability monitor | `string` | `"true"` | no |
| <a name="input_mysql_availability_extra_tags"></a> [mysql\_availability\_extra\_tags](#input\_mysql\_availability\_extra\_tags) | Extra tags for Mysql availability monitor | `list(string)` | `[]` | no |
| <a name="input_mysql_availability_message"></a> [mysql\_availability\_message](#input\_mysql\_availability\_message) | Custom message for Mysql availability monitor | `string` | `""` | no |
| <a name="input_mysql_availability_no_data_timeframe"></a> [mysql\_availability\_no\_data\_timeframe](#input\_mysql\_availability\_no\_data\_timeframe) | Mysql availability monitor no data timeframe | `string` | `10` | no |
| <a name="input_mysql_availability_threshold_warning"></a> [mysql\_availability\_threshold\_warning](#input\_mysql\_availability\_threshold\_warning) | Mysql availability monitor (warning threshold) | `string` | `3` | no |
| <a name="input_mysql_connection_enabled"></a> [mysql\_connection\_enabled](#input\_mysql\_connection\_enabled) | Flag to enable MySQL connection monitor | `string` | `"true"` | no |
| <a name="input_mysql_connection_extra_tags"></a> [mysql\_connection\_extra\_tags](#input\_mysql\_connection\_extra\_tags) | Extra tags for MySQL connection monitor | `list(string)` | `[]` | no |
| <a name="input_mysql_connection_message"></a> [mysql\_connection\_message](#input\_mysql\_connection\_message) | Custom message for MySQL connection monitor | `string` | `""` | no |
| <a name="input_mysql_connection_threshold_critical"></a> [mysql\_connection\_threshold\_critical](#input\_mysql\_connection\_threshold\_critical) | Maximum critical acceptable percent of connections | `number` | `80` | no |
| <a name="input_mysql_connection_threshold_warning"></a> [mysql\_connection\_threshold\_warning](#input\_mysql\_connection\_threshold\_warning) | Maximum warning acceptable percent of connections | `number` | `70` | no |
| <a name="input_mysql_connection_time_aggregator"></a> [mysql\_connection\_time\_aggregator](#input\_mysql\_connection\_time\_aggregator) | Monitor time aggregator for MySQL connection monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_mysql_connection_timeframe"></a> [mysql\_connection\_timeframe](#input\_mysql\_connection\_timeframe) | Monitor timeframe for MySQL connection monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_10m"` | no |
| <a name="input_mysql_pool_efficiency_enabled"></a> [mysql\_pool\_efficiency\_enabled](#input\_mysql\_pool\_efficiency\_enabled) | Flag to enable MySQL innodb buffer pool efficiency monitor | `string` | `"true"` | no |
| <a name="input_mysql_pool_efficiency_extra_tags"></a> [mysql\_pool\_efficiency\_extra\_tags](#input\_mysql\_pool\_efficiency\_extra\_tags) | Extra tags for MySQL innodb buffer pool efficiency monitor | `list(string)` | `[]` | no |
| <a name="input_mysql_pool_efficiency_message"></a> [mysql\_pool\_efficiency\_message](#input\_mysql\_pool\_efficiency\_message) | Custom message for MySQL innodb buffer pool efficiency monitor | `string` | `""` | no |
| <a name="input_mysql_pool_efficiency_threshold_critical"></a> [mysql\_pool\_efficiency\_threshold\_critical](#input\_mysql\_pool\_efficiency\_threshold\_critical) | Maximum critical acceptable percent of innodb buffer pool efficiency | `number` | `30` | no |
| <a name="input_mysql_pool_efficiency_threshold_warning"></a> [mysql\_pool\_efficiency\_threshold\_warning](#input\_mysql\_pool\_efficiency\_threshold\_warning) | Maximum warning acceptable percent of innodb buffer pool efficiency | `number` | `20` | no |
| <a name="input_mysql_pool_efficiency_time_aggregator"></a> [mysql\_pool\_efficiency\_time\_aggregator](#input\_mysql\_pool\_efficiency\_time\_aggregator) | Monitor time aggregator for MySQL innodb buffer pool efficiency monitor [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_mysql_pool_efficiency_timeframe"></a> [mysql\_pool\_efficiency\_timeframe](#input\_mysql\_pool\_efficiency\_timeframe) | Monitor timeframe for MySQL innodb buffer pool efficiency monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1h"` | no |
| <a name="input_mysql_pool_utilization_enabled"></a> [mysql\_pool\_utilization\_enabled](#input\_mysql\_pool\_utilization\_enabled) | Flag to enable MySQL innodb buffer pool utilization monitor | `string` | `"true"` | no |
| <a name="input_mysql_pool_utilization_extra_tags"></a> [mysql\_pool\_utilization\_extra\_tags](#input\_mysql\_pool\_utilization\_extra\_tags) | Extra tags for MySQL innodb buffer pool utilization monitor | `list(string)` | `[]` | no |
| <a name="input_mysql_pool_utilization_message"></a> [mysql\_pool\_utilization\_message](#input\_mysql\_pool\_utilization\_message) | Custom message for MySQL innodb buffer pool utilization monitor | `string` | `""` | no |
| <a name="input_mysql_pool_utilization_threshold_critical"></a> [mysql\_pool\_utilization\_threshold\_critical](#input\_mysql\_pool\_utilization\_threshold\_critical) | Maximum critical acceptable percent of innodb buffer pool utilization | `number` | `95` | no |
| <a name="input_mysql_pool_utilization_threshold_warning"></a> [mysql\_pool\_utilization\_threshold\_warning](#input\_mysql\_pool\_utilization\_threshold\_warning) | Maximum warning acceptable percent of innodb buffer pool utilization | `number` | `80` | no |
| <a name="input_mysql_pool_utilization_time_aggregator"></a> [mysql\_pool\_utilization\_time\_aggregator](#input\_mysql\_pool\_utilization\_time\_aggregator) | Monitor time aggregator for MySQL innodb buffer pool utilization monitor [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_mysql_pool_utilization_timeframe"></a> [mysql\_pool\_utilization\_timeframe](#input\_mysql\_pool\_utilization\_timeframe) | Monitor timeframe for MySQL innodb buffer pool utilization monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1h"` | no |
| <a name="input_mysql_questions_alert_window"></a> [mysql\_questions\_alert\_window](#input\_mysql\_questions\_alert\_window) | Alert window. | `string` | `"last_15m"` | no |
| <a name="input_mysql_questions_count_default_zero"></a> [mysql\_questions\_count\_default\_zero](#input\_mysql\_questions\_count\_default\_zero) | Count default zero. | `string` | `"true"` | no |
| <a name="input_mysql_questions_detection_algorithm"></a> [mysql\_questions\_detection\_algorithm](#input\_mysql\_questions\_detection\_algorithm) | Anomaly Detection Algorithm used | `string` | `"agile"` | no |
| <a name="input_mysql_questions_deviations"></a> [mysql\_questions\_deviations](#input\_mysql\_questions\_deviations) | Deviations to detect the anomaly | `string` | `5` | no |
| <a name="input_mysql_questions_direction"></a> [mysql\_questions\_direction](#input\_mysql\_questions\_direction) | Direction of the anomaly. It can be both, below or above. | `string` | `"both"` | no |
| <a name="input_mysql_questions_enabled"></a> [mysql\_questions\_enabled](#input\_mysql\_questions\_enabled) | Flag to enable mysql queries monitor | `string` | `"true"` | no |
| <a name="input_mysql_questions_extra_tags"></a> [mysql\_questions\_extra\_tags](#input\_mysql\_questions\_extra\_tags) | Extra tags for MySQL queries monitor | `list(string)` | `[]` | no |
| <a name="input_mysql_questions_interval"></a> [mysql\_questions\_interval](#input\_mysql\_questions\_interval) | Interval. | `string` | `60` | no |
| <a name="input_mysql_questions_message"></a> [mysql\_questions\_message](#input\_mysql\_questions\_message) | Custom message for MySQL queries monitor | `string` | `""` | no |
| <a name="input_mysql_questions_seasonality"></a> [mysql\_questions\_seasonality](#input\_mysql\_questions\_seasonality) | Seasonality of the algorithm | `string` | `"daily"` | no |
| <a name="input_mysql_questions_threshold_critical"></a> [mysql\_questions\_threshold\_critical](#input\_mysql\_questions\_threshold\_critical) | Maximum critical acceptable number of queries | `number` | `1` | no |
| <a name="input_mysql_questions_time_aggregator"></a> [mysql\_questions\_time\_aggregator](#input\_mysql\_questions\_time\_aggregator) | Monitor time aggregator for MySQL queries monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_mysql_questions_timeframe"></a> [mysql\_questions\_timeframe](#input\_mysql\_questions\_timeframe) | Monitor timeframe for MySQL queries monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_4h"` | no |
| <a name="input_mysql_replication_lag_enabled"></a> [mysql\_replication\_lag\_enabled](#input\_mysql\_replication\_lag\_enabled) | Flag to enable mysql replication lag monitor | `string` | `"false"` | no |
| <a name="input_mysql_replication_lag_extra_tags"></a> [mysql\_replication\_lag\_extra\_tags](#input\_mysql\_replication\_lag\_extra\_tags) | Extra tags for MySQL replication lag monitor | `list(string)` | `[]` | no |
| <a name="input_mysql_replication_lag_message"></a> [mysql\_replication\_lag\_message](#input\_mysql\_replication\_lag\_message) | Custom message for MySQL replication lag monitor | `string` | `""` | no |
| <a name="input_mysql_replication_lag_threshold_critical"></a> [mysql\_replication\_lag\_threshold\_critical](#input\_mysql\_replication\_lag\_threshold\_critical) | Maximum critical acceptable seconds of replication lag | `number` | `200` | no |
| <a name="input_mysql_replication_lag_threshold_warning"></a> [mysql\_replication\_lag\_threshold\_warning](#input\_mysql\_replication\_lag\_threshold\_warning) | Maximum warning acceptable seconds of replication lag | `number` | `100` | no |
| <a name="input_mysql_replication_lag_time_aggregator"></a> [mysql\_replication\_lag\_time\_aggregator](#input\_mysql\_replication\_lag\_time\_aggregator) | Monitor time aggregator for MySQL replication lag monitor [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_mysql_replication_lag_timeframe"></a> [mysql\_replication\_lag\_timeframe](#input\_mysql\_replication\_lag\_timeframe) | Monitor timeframe for MySQL replication lag monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_mysql_replication_status_enabled"></a> [mysql\_replication\_status\_enabled](#input\_mysql\_replication\_status\_enabled) | Flag to enable mysql replication status monitor | `string` | `"false"` | no |
| <a name="input_mysql_replication_status_extra_tags"></a> [mysql\_replication\_status\_extra\_tags](#input\_mysql\_replication\_status\_extra\_tags) | Extra tags for MySQL replication status monitor | `list(string)` | `[]` | no |
| <a name="input_mysql_replication_status_message"></a> [mysql\_replication\_status\_message](#input\_mysql\_replication\_status\_message) | Custom message for MySQL replication status monitor | `string` | `""` | no |
| <a name="input_mysql_replication_status_time_aggregator"></a> [mysql\_replication\_status\_time\_aggregator](#input\_mysql\_replication\_status\_time\_aggregator) | Monitor time aggregator for MySQL replication status monitor [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_mysql_replication_status_timeframe"></a> [mysql\_replication\_status\_timeframe](#input\_mysql\_replication\_status\_timeframe) | Monitor timeframe for MySQL replication status monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_mysql_slow_enabled"></a> [mysql\_slow\_enabled](#input\_mysql\_slow\_enabled) | Flag to enable MySQL slow queries monitor | `string` | `"true"` | no |
| <a name="input_mysql_slow_extra_tags"></a> [mysql\_slow\_extra\_tags](#input\_mysql\_slow\_extra\_tags) | Extra tags for MySQL slow queries monitor | `list(string)` | `[]` | no |
| <a name="input_mysql_slow_message"></a> [mysql\_slow\_message](#input\_mysql\_slow\_message) | Custom message for MySQL slow queries monitor | `string` | `""` | no |
| <a name="input_mysql_slow_threshold_critical"></a> [mysql\_slow\_threshold\_critical](#input\_mysql\_slow\_threshold\_critical) | Maximum critical acceptable percent of slow queries | `number` | `20` | no |
| <a name="input_mysql_slow_threshold_warning"></a> [mysql\_slow\_threshold\_warning](#input\_mysql\_slow\_threshold\_warning) | Maximum warning acceptable percent of slow queries | `number` | `5` | no |
| <a name="input_mysql_slow_time_aggregator"></a> [mysql\_slow\_time\_aggregator](#input\_mysql\_slow\_time\_aggregator) | Monitor time aggregator for MySQL slow queries monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_mysql_slow_timeframe"></a> [mysql\_slow\_timeframe](#input\_mysql\_slow\_timeframe) | Monitor timeframe for MySQL slow queries monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_mysql_threads_alert_window"></a> [mysql\_threads\_alert\_window](#input\_mysql\_threads\_alert\_window) | Alert window. | `string` | `"last_15m"` | no |
| <a name="input_mysql_threads_count_default_zero"></a> [mysql\_threads\_count\_default\_zero](#input\_mysql\_threads\_count\_default\_zero) | Count default zero. | `string` | `"true"` | no |
| <a name="input_mysql_threads_detection_algorithm"></a> [mysql\_threads\_detection\_algorithm](#input\_mysql\_threads\_detection\_algorithm) | Anomaly Detection Algorithm used | `string` | `"basic"` | no |
| <a name="input_mysql_threads_deviations"></a> [mysql\_threads\_deviations](#input\_mysql\_threads\_deviations) | Deviations to detect the anomaly | `string` | `2` | no |
| <a name="input_mysql_threads_direction"></a> [mysql\_threads\_direction](#input\_mysql\_threads\_direction) | Direction of the anomaly. It can be both, below or above. | `string` | `"above"` | no |
| <a name="input_mysql_threads_enabled"></a> [mysql\_threads\_enabled](#input\_mysql\_threads\_enabled) | Flag to enable mysql threads monitor | `string` | `"true"` | no |
| <a name="input_mysql_threads_extra_tags"></a> [mysql\_threads\_extra\_tags](#input\_mysql\_threads\_extra\_tags) | Extra tags for MySQL threads monitor | `list(string)` | `[]` | no |
| <a name="input_mysql_threads_interval"></a> [mysql\_threads\_interval](#input\_mysql\_threads\_interval) | Interval. | `string` | `60` | no |
| <a name="input_mysql_threads_message"></a> [mysql\_threads\_message](#input\_mysql\_threads\_message) | Custom message for MySQL threads monitor | `string` | `""` | no |
| <a name="input_mysql_threads_seasonality"></a> [mysql\_threads\_seasonality](#input\_mysql\_threads\_seasonality) | Seasonality of the algorithm | `string` | `"daily"` | no |
| <a name="input_mysql_threads_threshold_critical"></a> [mysql\_threads\_threshold\_critical](#input\_mysql\_threads\_threshold\_critical) | Maximum critical acceptable number of threads | `number` | `1` | no |
| <a name="input_mysql_threads_time_aggregator"></a> [mysql\_threads\_time\_aggregator](#input\_mysql\_threads\_time\_aggregator) | Monitor time aggregator for MySQL threads monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_mysql_threads_timeframe"></a> [mysql\_threads\_timeframe](#input\_mysql\_threads\_timeframe) | Monitor timeframe for MySQL threads monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_4h"` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds for the metric evaluation | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mysql_aborted_id"></a> [mysql\_aborted\_id](#output\_mysql\_aborted\_id) | id for monitor mysql\_aborted |
| <a name="output_mysql_availability_id"></a> [mysql\_availability\_id](#output\_mysql\_availability\_id) | id for monitor mysql\_availability |
| <a name="output_mysql_connection_id"></a> [mysql\_connection\_id](#output\_mysql\_connection\_id) | id for monitor mysql\_connection |
| <a name="output_mysql_pool_efficiency_id"></a> [mysql\_pool\_efficiency\_id](#output\_mysql\_pool\_efficiency\_id) | id for monitor mysql\_pool\_efficiency |
| <a name="output_mysql_pool_utilization_id"></a> [mysql\_pool\_utilization\_id](#output\_mysql\_pool\_utilization\_id) | id for monitor mysql\_pool\_utilization |
| <a name="output_mysql_questions_anomaly_id"></a> [mysql\_questions\_anomaly\_id](#output\_mysql\_questions\_anomaly\_id) | id for monitor mysql\_questions\_anomaly |
| <a name="output_mysql_replication_lag_id"></a> [mysql\_replication\_lag\_id](#output\_mysql\_replication\_lag\_id) | id for monitor mysql\_replication\_lag |
| <a name="output_mysql_replication_status_id"></a> [mysql\_replication\_status\_id](#output\_mysql\_replication\_status\_id) | id for monitor mysql\_replication\_status |
| <a name="output_mysql_slow_id"></a> [mysql\_slow\_id](#output\_mysql\_slow\_id) | id for monitor mysql\_slow |
| <a name="output_mysql_threads_anomaly_id"></a> [mysql\_threads\_anomaly\_id](#output\_mysql\_threads\_anomaly\_id) | id for monitor mysql\_threads\_anomaly |
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/mysql/](https://docs.datadoghq.com/integrations/mysql/)

## Notes

It could be not possible to modify `innodb_buffer_pool_size` or `innodb_buffer_pool_instances` mysql parameters (i.e. cloudsql).
In this case, InnoDB Pool monitors could be less useful for optimization even if they could inform when an instance should be upsized.
