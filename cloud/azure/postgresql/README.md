# CLOUD AZURE POSTGRESQL DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-postgresql" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/postgresql?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Postgresql Server compute consumption is high
- Postgresql Server CPU usage is high
- Postgresql Server has no connection
- Postgresql Server IO consumption is high
- Postgresql Server memory usage is high
- Postgresql Server storage is running low

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| compute_consumption_message | Custom message for Postgresql compute consumption monitor | string | `` | no |
| compute_consumption_silenced | Groups to mute for Postgresql compute consumption monitor | map | `{}` | no |
| compute_consumption_threshold_critical | Postgresql compute consumption in percent (critical threshold) | string | `90` | no |
| compute_consumption_threshold_warning | Postgresql compute consumption in percent (warning threshold) | string | `80` | no |
| compute_consumption_time_aggregator | Monitor aggregator for Postgresql compute consumption [available values: min, max or avg] | string | `min` | no |
| compute_consumption_timeframe | Monitor timeframe for Postgresql compute consumption [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| cpu_usage_message | Custom message for Postgresql CPU monitor | string | `` | no |
| cpu_usage_silenced | Groups to mute for Postgresql CPU monitor | map | `{}` | no |
| cpu_usage_threshold_critical | Postgresql CPU usage in percent (critical threshold) | string | `90` | no |
| cpu_usage_threshold_warning | Postgresql CPU usage in percent (warning threshold) | string | `80` | no |
| cpu_usage_time_aggregator | Monitor aggregator for Postgresql CPU [available values: min, max or avg] | string | `min` | no |
| cpu_usage_timeframe | Monitor timeframe for Postgresql CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| free_storage_message | Custom message for Postgresql Free Storage monitor | string | `` | no |
| free_storage_silenced | Groups to mute for Postgresql Free Storage monitor | map | `{}` | no |
| free_storage_threshold_critical | Postgresql Free Storage remaining in percent (critical threshold) | string | `10` | no |
| free_storage_threshold_warning | Postgresql Free Storage remaining in percent (warning threshold) | string | `20` | no |
| free_storage_time_aggregator | Monitor aggregator for Postgresql Free Storage [available values: min, max or avg] | string | `min` | no |
| free_storage_timeframe | Monitor timeframe for Postgresql Free Storage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| io_consumption_message | Custom message for Postgresql IO consumption monitor | string | `` | no |
| io_consumption_silenced | Groups to mute for Postgresql IO consumption monitor | map | `{}` | no |
| io_consumption_threshold_critical | Postgresql IO consumption in percent (critical threshold) | string | `90` | no |
| io_consumption_threshold_warning | Postgresql IO consumption in percent (warning threshold) | string | `80` | no |
| io_consumption_time_aggregator | Monitor aggregator for Postgresql IO consumption [available values: min, max or avg] | string | `min` | no |
| io_consumption_timeframe | Monitor timeframe for Postgresql IO consumption [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| memory_usage_message | Custom message for Postgresql memory monitor | string | `` | no |
| memory_usage_silenced | Groups to mute for Postgresql memory monitor | map | `{}` | no |
| memory_usage_threshold_critical | Postgresql memory usage in percent (critical threshold) | string | `90` | no |
| memory_usage_threshold_warning | Postgresql memory usage in percent (warning threshold) | string | `80` | no |
| memory_usage_time_aggregator | Monitor aggregator for Postgresql memory [available values: min, max or avg] | string | `min` | no |
| memory_usage_timeframe | Monitor timeframe for Postgresql memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| message | Message sent when a Redis monitor is triggered | string | - | yes |
| no_connection_message | Custom message for Postgresql no connection monitor | string | `` | no |
| no_connection_silenced | Groups to mute for Postgresql no connection monitor | map | `{}` | no |
| no_connection_time_aggregator | Monitor aggregator for Postgresql no connection [available values: min, max or avg] | string | `min` | no |
| no_connection_timeframe | Monitor timeframe for Postgresql no connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

## Outputs

| Name | Description |
|------|-------------|
| postgresql_compute_consumption_id | id for monitor postgresql_compute_consumption |
| postgresql_cpu_usage_id | id for monitor postgresql_cpu_usage |
| postgresql_free_storage_id | id for monitor postgresql_free_storage |
| postgresql_io_consumption_id | id for monitor postgresql_io_consumption |
| postgresql_memory_usage_id | id for monitor postgresql_memory_usage |
| postgresql_no_connection_id | id for monitor postgresql_no_connection |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)
You have to search `mysql`
