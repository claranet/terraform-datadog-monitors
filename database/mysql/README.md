# DATABASE MYSQL DataDog monitors

## How to use this module

```
module "datadog-monitors-database-mysql" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//database/mysql?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Mysql Innodb buffer pool efficiency
- Mysql server does not respond
- Mysql Connections limit
- Mysql Innodb buffer pool utilization

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| mysql\_aborted\_enabled | Flag to enable MySQL aborted connects monitor | string | `"true"` | no |
| mysql\_aborted\_extra\_tags | Extra tags for MySQL aborted connects monitor | list(string) | `[]` | no |
| mysql\_aborted\_message | Custom message for MySQL aborted connects monitor | string | `""` | no |
| mysql\_aborted\_threshold\_critical | Maximum critical acceptable percent of aborted connects | string | `"10"` | no |
| mysql\_aborted\_threshold\_warning | Maximum warning acceptable percent of aborted connects | string | `"5"` | no |
| mysql\_aborted\_time\_aggregator | Monitor time aggregator for MySQL aborted connects monitor [available values: min, max or avg] | string | `"avg"` | no |
| mysql\_aborted\_timeframe | Monitor timeframe for MySQL aborted connects monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_10m"` | no |
| mysql\_availability\_enabled | Flag to enable Mysql availability monitor | string | `"true"` | no |
| mysql\_availability\_extra\_tags | Extra tags for Mysql availability monitor | list(string) | `[]` | no |
| mysql\_availability\_message | Custom message for Mysql availability monitor | string | `""` | no |
| mysql\_availability\_no\_data\_timeframe | Mysql availability monitor no data timeframe | string | `"10"` | no |
| mysql\_availability\_threshold\_warning | Mysql availability monitor (warning threshold) | string | `"3"` | no |
| mysql\_connection\_enabled | Flag to enable MySQL connection monitor | string | `"true"` | no |
| mysql\_connection\_extra\_tags | Extra tags for MySQL connection monitor | list(string) | `[]` | no |
| mysql\_connection\_message | Custom message for MySQL connection monitor | string | `""` | no |
| mysql\_connection\_threshold\_critical | Maximum critical acceptable percent of connections | string | `"80"` | no |
| mysql\_connection\_threshold\_warning | Maximum warning acceptable percent of connections | string | `"70"` | no |
| mysql\_connection\_time\_aggregator | Monitor time aggregator for MySQL connection monitor [available values: min, max or avg] | string | `"avg"` | no |
| mysql\_connection\_timeframe | Monitor timeframe for MySQL connection monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_10m"` | no |
| mysql\_pool\_efficiency\_enabled | Flag to enable MySQL innodb buffer pool efficiency monitor | string | `"true"` | no |
| mysql\_pool\_efficiency\_extra\_tags | Extra tags for MySQL innodb buffer pool efficiency monitor | list(string) | `[]` | no |
| mysql\_pool\_efficiency\_message | Custom message for MySQL innodb buffer pool efficiency monitor | string | `""` | no |
| mysql\_pool\_efficiency\_threshold\_critical | Maximum critical acceptable percent of innodb buffer pool efficiency | string | `"30"` | no |
| mysql\_pool\_efficiency\_threshold\_warning | Maximum warning acceptable percent of innodb buffer pool efficiency | string | `"20"` | no |
| mysql\_pool\_efficiency\_time\_aggregator | Monitor time aggregator for MySQL innodb buffer pool efficiency monitor [available values: min, max or avg] | string | `"min"` | no |
| mysql\_pool\_efficiency\_timeframe | Monitor timeframe for MySQL innodb buffer pool efficiency monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_1h"` | no |
| mysql\_pool\_utilization\_enabled | Flag to enable MySQL innodb buffer pool utilization monitor | string | `"true"` | no |
| mysql\_pool\_utilization\_extra\_tags | Extra tags for MySQL innodb buffer pool utilization monitor | list(string) | `[]` | no |
| mysql\_pool\_utilization\_message | Custom message for MySQL innodb buffer pool utilization monitor | string | `""` | no |
| mysql\_pool\_utilization\_threshold\_critical | Maximum critical acceptable percent of innodb buffer pool utilization | string | `"95"` | no |
| mysql\_pool\_utilization\_threshold\_warning | Maximum warning acceptable percent of innodb buffer pool utilization | string | `"80"` | no |
| mysql\_pool\_utilization\_time\_aggregator | Monitor time aggregator for MySQL innodb buffer pool utilization monitor [available values: min, max or avg] | string | `"min"` | no |
| mysql\_pool\_utilization\_timeframe | Monitor timeframe for MySQL innodb buffer pool utilization monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_1h"` | no |
| mysql\_questions\_alert\_window | Alert window. | string | `"last_15m"` | no |
| mysql\_questions\_count\_default\_zero | Count default zero. | string | `"true"` | no |
| mysql\_questions\_detection\_algorithm | Anomaly Detection Algorithm used | string | `"agile"` | no |
| mysql\_questions\_deviations | Deviations to detect the anomaly | string | `"5"` | no |
| mysql\_questions\_direction | Direction of the anomaly. It can be both, below or above. | string | `"both"` | no |
| mysql\_questions\_enabled | Flag to enable mysql queries monitor | string | `"true"` | no |
| mysql\_questions\_extra\_tags | Extra tags for MySQL queries monitor | list(string) | `[]` | no |
| mysql\_questions\_interval | Interval. | string | `"60"` | no |
| mysql\_questions\_message | Custom message for MySQL queries monitor | string | `""` | no |
| mysql\_questions\_seasonality | Seasonality of the algorithm | string | `"daily"` | no |
| mysql\_questions\_threshold\_critical | Maximum critical acceptable number of queries | string | `"1"` | no |
| mysql\_questions\_time\_aggregator | Monitor time aggregator for MySQL queries monitor [available values: min, max or avg] | string | `"avg"` | no |
| mysql\_questions\_timeframe | Monitor timeframe for MySQL queries monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_4h"` | no |
| mysql\_slow\_enabled | Flag to enable MySQL slow queries monitor | string | `"true"` | no |
| mysql\_slow\_extra\_tags | Extra tags for MySQL slow queries monitor | list(string) | `[]` | no |
| mysql\_slow\_message | Custom message for MySQL slow queries monitor | string | `""` | no |
| mysql\_slow\_threshold\_critical | Maximum critical acceptable percent of slow queries | string | `"20"` | no |
| mysql\_slow\_threshold\_warning | Maximum warning acceptable percent of slow queries | string | `"5"` | no |
| mysql\_slow\_time\_aggregator | Monitor time aggregator for MySQL slow queries monitor [available values: min, max or avg] | string | `"avg"` | no |
| mysql\_slow\_timeframe | Monitor timeframe for MySQL slow queries monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| mysql\_threads\_alert\_window | Alert window. | string | `"last_15m"` | no |
| mysql\_threads\_count\_default\_zero | Count default zero. | string | `"true"` | no |
| mysql\_threads\_detection\_algorithm | Anomaly Detection Algorithm used | string | `"basic"` | no |
| mysql\_threads\_deviations | Deviations to detect the anomaly | string | `"2"` | no |
| mysql\_threads\_direction | Direction of the anomaly. It can be both, below or above. | string | `"above"` | no |
| mysql\_threads\_enabled | Flag to enable mysql threads monitor | string | `"true"` | no |
| mysql\_threads\_extra\_tags | Extra tags for MySQL threads monitor | list(string) | `[]` | no |
| mysql\_threads\_interval | Interval. | string | `"60"` | no |
| mysql\_threads\_message | Custom message for MySQL threads monitor | string | `""` | no |
| mysql\_threads\_seasonality | Seasonality of the algorithm | string | `"daily"` | no |
| mysql\_threads\_threshold\_critical | Maximum critical acceptable number of threads | string | `"1"` | no |
| mysql\_threads\_time\_aggregator | Monitor time aggregator for MySQL threads monitor [available values: min, max or avg] | string | `"avg"` | no |
| mysql\_threads\_timeframe | Monitor timeframe for MySQL threads monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_4h"` | no |
| new\_host\_delay | Delay in seconds for the metric evaluation | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| mysql\_aborted\_id | id for monitor mysql_aborted |
| mysql\_availability\_id | id for monitor mysql_availability |
| mysql\_connection\_id | id for monitor mysql_connection |
| mysql\_pool\_efficiency\_id | id for monitor mysql_pool_efficiency |
| mysql\_pool\_utilization\_id | id for monitor mysql_pool_utilization |
| mysql\_questions\_anomaly\_id | id for monitor mysql_questions_anomaly |
| mysql\_slow\_id | id for monitor mysql_slow |
| mysql\_threads\_anomaly\_id | id for monitor mysql_threads_anomaly |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/mysql/](https://docs.datadoghq.com/integrations/mysql/)

## Notes

It could be not possible to modify `innodb_buffer_pool_size` or `innodb_buffer_pool_instances` mysql parameters (i.e. cloudsql).
In this case, InnoDB Pool monitors could be less useful for optimization even if they could inform when an instance should be upsized.
