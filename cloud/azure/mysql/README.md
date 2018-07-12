Azure Database for MySQL servers DataDog monitors
=================================================

How to use this module
----------------------

```
module "datadog-monitors-azure-mysql" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/mysql?ref={revision}"

  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :

* CPU Usage
* Memory Usage
* Free disk space
* No active connection
* IO consumption

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu_usage_message | Custom message for Mysql CPU monitor | string | `` | no |
| cpu_usage_silenced | Groups to mute for Mysql CPU monitor | map | `<map>` | no |
| cpu_usage_threshold_critical | Mysql CPU usage in percent (critical threshold) | string | `90` | no |
| cpu_usage_threshold_warning | Mysql CPU usage in percent (warning threshold) | string | `80` | no |
| cpu_usage_time_aggregator | Monitor aggregator for Mysql CPU [available values: min, max or avg] | string | `min` | no |
| cpu_usage_timeframe | Monitor timeframe for Mysql CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| free_storage_message | Custom message for Mysql Free Storage monitor | string | `` | no |
| free_storage_silenced | Groups to mute for Mysql Free Storage monitor | map | `<map>` | no |
| free_storage_threshold_critical | Mysql Free Storage remaining in percent (critical threshold) | string | `10` | no |
| free_storage_threshold_warning | Mysql Free Storage remaining in percent (warning threshold) | string | `20` | no |
| free_storage_time_aggregator | Monitor aggregator for Mysql Free Storage [available values: min, max or avg] | string | `min` | no |
| free_storage_timeframe | Monitor timeframe for Mysql Free Storage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| io_consumption_message | Custom message for Mysql IO consumption monitor | string | `` | no |
| io_consumption_silenced | Groups to mute for Mysql IO consumption monitor | map | `<map>` | no |
| io_consumption_threshold_critical | Mysql IO consumption in percent (critical threshold) | string | `90` | no |
| io_consumption_threshold_warning | Mysql IO consumption in percent (warning threshold) | string | `80` | no |
| io_consumption_time_aggregator | Monitor aggregator for Mysql IO consumption [available values: min, max or avg] | string | `min` | no |
| io_consumption_timeframe | Monitor timeframe for Mysql IO consumption [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| memory_usage_message | Custom message for Mysql memory monitor | string | `` | no |
| memory_usage_silenced | Groups to mute for Mysql memory monitor | map | `<map>` | no |
| memory_usage_threshold_critical | Mysql memory usage in percent (critical threshold) | string | `90` | no |
| memory_usage_threshold_warning | Mysql memory usage in percent (warning threshold) | string | `80` | no |
| memory_usage_time_aggregator | Monitor aggregator for Mysql memory [available values: min, max or avg] | string | `min` | no |
| memory_usage_timeframe | Monitor timeframe for Mysql memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| message | Message sent when a Redis monitor is triggered | string | - | yes |
| no_connection_message | Custom message for Mysql no connection monitor | string | `` | no |
| no_connection_silenced | Groups to mute for Mysql no connection monitor | map | `<map>` | no |
| no_connection_time_aggregator | Monitor aggregator for Mysql no connection [available values: min, max or avg] | string | `min` | no |
| no_connection_timeframe | Monitor timeframe for Mysql no connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)
You have to search `mysql`

Azure Database for MySQL servers metrics documentation: [https://docs.microsoft.com/en-us/azure/mysql/concepts-monitoring](https://docs.microsoft.com/en-us/azure/mysql/concepts-monitoring)

