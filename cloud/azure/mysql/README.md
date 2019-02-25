# CLOUD AZURE MYSQL DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-mysql" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors.git//cloud/azure/mysql?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
  
  total_connection_limit = "${var.total_connection_limit}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Mysql Server CPU usage
- Mysql Server has total connection
- Mysql Server IO consumption
- Mysql Server memory usage
- Mysql Server storage

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu_usage_enabled | Flag to enable Mysql status monitor | string | `true` | no |
| cpu_usage_extra_tags | Extra tags for Mysql status monitor | list | `<list>` | no |
| cpu_usage_message | Custom message for Mysql CPU monitor | string | `` | no |
| cpu_usage_silenced | Groups to mute for Mysql CPU monitor | map | `<map>` | no |
| cpu_usage_threshold_critical | Mysql CPU usage in percent (critical threshold) | string | `90` | no |
| cpu_usage_threshold_warning | Mysql CPU usage in percent (warning threshold) | string | `80` | no |
| cpu_usage_time_aggregator | Monitor aggregator for Mysql CPU [available values: min, max or avg] | string | `min` | no |
| cpu_usage_timeframe | Monitor timeframe for Mysql CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| environment | Architecture environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `900` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| free_storage_enabled | Flag to enable Mysql status monitor | string | `true` | no |
| free_storage_extra_tags | Extra tags for Mysql status monitor | list | `<list>` | no |
| free_storage_message | Custom message for Mysql Free Storage monitor | string | `` | no |
| free_storage_silenced | Groups to mute for Mysql Free Storage monitor | map | `<map>` | no |
| free_storage_threshold_critical | Mysql Free Storage remaining in percent (critical threshold) | string | `10` | no |
| free_storage_threshold_warning | Mysql Free Storage remaining in percent (warning threshold) | string | `20` | no |
| free_storage_time_aggregator | Monitor aggregator for Mysql Free Storage [available values: min, max or avg] | string | `min` | no |
| free_storage_timeframe | Monitor timeframe for Mysql Free Storage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| io_consumption_enabled | Flag to enable Mysql status monitor | string | `true` | no |
| io_consumption_extra_tags | Extra tags for Mysql status monitor | list | `<list>` | no |
| io_consumption_message | Custom message for Mysql IO consumption monitor | string | `` | no |
| io_consumption_silenced | Groups to mute for Mysql IO consumption monitor | map | `<map>` | no |
| io_consumption_threshold_critical | Mysql IO consumption in percent (critical threshold) | string | `90` | no |
| io_consumption_threshold_warning | Mysql IO consumption in percent (warning threshold) | string | `80` | no |
| io_consumption_time_aggregator | Monitor aggregator for Mysql IO consumption [available values: min, max or avg] | string | `min` | no |
| io_consumption_timeframe | Monitor timeframe for Mysql IO consumption [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| memory_usage_enabled | Flag to enable Mysql status monitor | string | `true` | no |
| memory_usage_extra_tags | Extra tags for Mysql status monitor | list | `<list>` | no |
| memory_usage_message | Custom message for Mysql memory monitor | string | `` | no |
| memory_usage_silenced | Groups to mute for Mysql memory monitor | map | `<map>` | no |
| memory_usage_threshold_critical | Mysql memory usage in percent (critical threshold) | string | `90` | no |
| memory_usage_threshold_warning | Mysql memory usage in percent (warning threshold) | string | `80` | no |
| memory_usage_time_aggregator | Monitor aggregator for Mysql memory [available values: min, max or avg] | string | `min` | no |
| memory_usage_timeframe | Monitor timeframe for Mysql memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |
| total_connection_enabled | Flag to enable Mysql status monitor | string | `true` | no |
| total_connection_extra_tags | Extra tags for Mysql status monitor | list | `<list>` | no |
| total_connection_limit | Limit for Mysql total connection [See details : https://docs.microsoft.com/en-us/azure/mysql/concepts-limits] | string | `` | no |
| total_connection_message | Custom message for Mysql total connection monitor | string | `` | no |
| total_connection_silenced | Groups to mute for Mysql total connection monitor | map | `<map>` | no |
| total_connection_time_aggregator | Monitor aggregator for Mysql total connection [available values: min, max or avg] | string | `min` | no |
| total_connection_timeframe | Monitor timeframe for Mysql total connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

## Outputs

| Name | Description |
|------|-------------|
| mysql\_cpu\_usage\_id | id for monitor mysql_cpu_usage |
| mysql\_free\_storage\_id | id for monitor mysql_free_storage |
| mysql\_io\_consumption\_id | id for monitor mysql_io_consumption |
| mysql\_memory\_usage\_id | id for monitor mysql_memory_usage |
| mysql\_total\_connection\_id | id for monitor mysql_total_connection |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)
You have to search `mysql`

Azure Database for MySQL servers metrics documentation: [https://docs.microsoft.com/en-us/azure/mysql/concepts-monitoring](https://docs.microsoft.com/en-us/azure/mysql/concepts-monitoring)

