# SYSTEM GENERIC DataDog monitors

## How to use this module

```
module "datadog-monitors-system-generic" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//system/generic?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- CPU usage
- CPU load 5
- Free disk space
- Disk Space could reach
- Free disk inodes
- Free memory

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu_high_extra_tags | Extra tags for CPU high monitor | list | `<list>` | no |
| cpu_high_message | Custom message for CPU high monitor | string | `` | no |
| cpu_high_silenced | Groups to mute for CPU high monitor | map | `<map>` | no |
| cpu_high_threshold_critical | CPU high critical threshold | string | `90` | no |
| cpu_high_threshold_warning | CPU high warning threshold | string | `85` | no |
| cpu_high_time_aggregator | Monitor aggregator for CPU high [available values: min, max or avg] | string | `min` | no |
| cpu_high_timeframe | Monitor timeframe for CPU high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_10m` | no |
| cpu_load_extra_tags | Extra tags for CPU load ratio monitor | list | `<list>` | no |
| cpu_load_message | Custom message for CPU load ratio monitor | string | `` | no |
| cpu_load_silenced | Groups to mute for CPU load ratio monitor | map | `<map>` | no |
| cpu_load_threshold_critical | CPU load ratio critical threshold | string | `2.5` | no |
| cpu_load_threshold_warning | CPU load ratio warning threshold | string | `2` | no |
| cpu_load_time_aggregator | Monitor aggregator for CPU load ratio [available values: min, max or avg] | string | `min` | no |
| cpu_load_timeframe | Monitor timeframe for CPU load ratio [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| environment | Architecture Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `15` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| free_disk_inodes_extra_tags | Extra tags for Free disk inodes monitor | list | `<list>` | no |
| free_disk_inodes_message | Custom message for Free disk inodes monitor | string | `` | no |
| free_disk_inodes_silenced | Groups to mute for Free disk inodes monitor | map | `<map>` | no |
| free_disk_inodes_threshold_critical | Free disk space critical threshold | string | `5` | no |
| free_disk_inodes_threshold_warning | Free disk space warning threshold | string | `10` | no |
| free_disk_inodes_time_aggregator | Monitor aggregator for Free disk inodes [available values: min, max or avg] | string | `min` | no |
| free_disk_inodes_timeframe | Monitor timeframe for Free disk inodes [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| free_disk_space_forecast_algorithm | Algorithm for the Free diskspace Forecast monitor | string | `linear` | no |
| free_disk_space_forecast_deviations | Deviations for the Free diskspace Forecast monitor | string | `1` | no |
| free_disk_space_forecast_interval | Interval for the Free diskspace Forecast monitor | string | `60m` | no |
| free_disk_space_forecast_linear_history | History for the Free diskspace Forecast monitor | string | `1w` | no |
| free_disk_space_forecast_linear_model | Model for the Free diskspace Forecast monitor | string | `default` | no |
| free_disk_space_forecast_message | Custom message for Free diskspace monitor | string | `` | no |
| free_disk_space_forecast_seasonal_seasonality | Seasonality for the Free diskspace Forecast monitor | string | `weekly` | no |
| free_disk_space_forecast_silenced | Groups to mute for Free diskspace monitor | map | `<map>` | no |
| free_disk_space_forecast_threshold_critical | Free disk space critical threshold | string | `80` | no |
| free_disk_space_forecast_threshold_critical_recovery | Free disk space warning threshold | string | `72` | no |
| free_disk_space_forecast_time_aggregator | Monitor aggregator for Free diskspace [available values: min, max or avg] | string | `max` | no |
| free_disk_space_forecast_timeframe | Monitor timeframe for Free diskspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `next_1w` | no |
| free_disk_space_extra_tags | Extra tags for Free diskspace monitor | list | `<list>` | no |
| free_disk_space_message | Custom message for Free diskspace monitor | string | `` | no |
| free_disk_space_silenced | Groups to mute for Free diskspace monitor | map | `<map>` | no |
| free_disk_space_threshold_critical | Free disk space critical threshold | string | `10` | no |
| free_disk_space_threshold_warning | Free disk space warning threshold | string | `20` | no |
| free_disk_space_time_aggregator | Monitor aggregator for Free diskspace [available values: min, max or avg] | string | `min` | no |
| free_disk_space_timeframe | Monitor timeframe for Free diskspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| free_memory_extra_tags | Extra tags for Free memory monitor | list | `<list>` | no |
| free_memory_message | Custom message for Free memory monitor | string | - | yes |
| free_memory_silenced | Groups to mute for Free memory monitor | map | `<map>` | no |
| free_memory_threshold_critical | Free disk space critical threshold | string | `5` | no |
| free_memory_threshold_warning | Free disk space warning threshold | string | `10` | no |
| free_memory_time_aggregator | Monitor aggregator for Free memory [available values: min, max or avg] | string | `max` | no |
| free_memory_timeframe | Monitor timeframe for Free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |

## Outputs

| Name | Description |
|------|-------------|
| datadog_cpu_too_high_id | id for monitor datadog_cpu_too_high |
| datadog_free_disk_space_forecast_id | id for monitor datadog_free_disk_space_forecast |
| datadog_free_disk_space_inodes_too_low_id | id for monitor datadog_free_disk_space_inodes_too_low |
| datadog_free_disk_space_too_low_id | id for monitor datadog_free_disk_space_too_low |
| datadog_free_memory_id | id for monitor datadog_free_memory |
| datadog_load_too_high_id | id for monitor datadog_load_too_high |

## Related documentation

DataDog documentation:
