System Generic DataDog monitors
===============================

How to use this module
----------------------

```
module "datadog-monitors-system-generic" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//system/generic?ref={revision}"

  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :

* CPU usage
* CPU load ratio
* Free memory
* Free disk inodes
* Free disk space

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu_high_aggregator | Monitor aggregator for CPU high [available values: min, max, sum or avg] | string | `min` | no |
| cpu_high_message | Custom message for CPU high monitor | string | `` | no |
| cpu_high_silenced | Groups to mute for CPU high monitor | map | `<map>` | no |
| cpu_high_threshold_critical | CPU high critical threshold | string | `95` | no |
| cpu_high_threshold_warning | CPU high warning threshold | string | `80` | no |
| cpu_high_timeframe | Monitor timeframe for CPU high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| cpu_load_aggregator | Monitor aggregator for CPU load ratio [available values: min, max, sum or avg] | string | `min` | no |
| cpu_load_message | Custom message for CPU load ratio monitor | string | `` | no |
| cpu_load_silenced | Groups to mute for CPU load ratio monitor | map | `<map>` | no |
| cpu_load_threshold_critical | CPU load ratio critical threshold | string | `4` | no |
| cpu_load_threshold_warning | CPU load ratio warning threshold | string | `3` | no |
| cpu_load_timeframe | Monitor timeframe for CPU load ratio [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| delay | Delay in seconds for the metric evaluation | string | `15` | no |
| environment | Architecture Environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| free_disk_inodes_aggregator | Monitor aggregator for Free disk inodes [available values: min, max, sum or avg] | string | `min` | no |
| free_disk_inodes_message | Custom message for Free disk inodes monitor | string | `` | no |
| free_disk_inodes_silenced | Groups to mute for Free disk inodes monitor | map | `<map>` | no |
| free_disk_inodes_threshold_critical | Free disk space critical threshold | string | `5` | no |
| free_disk_inodes_threshold_warning | Free disk space warning threshold | string | `10` | no |
| free_disk_inodes_timeframe | Monitor timeframe for Free disk inodes [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| free_disk_space_aggregator | Monitor aggregator for Free diskspace [available values: min, max, sum or avg] | string | `min` | no |
| free_disk_space_message | Custom message for Free diskspace monitor | string | `` | no |
| free_disk_space_silenced | Groups to mute for Free diskspace monitor | map | `<map>` | no |
| free_disk_space_threshold_critical | Free disk space critical threshold | string | `5` | no |
| free_disk_space_threshold_warning | Free disk space warning threshold | string | `10` | no |
| free_disk_space_timeframe | Monitor timeframe for Free diskspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| free_memory_aggregator | Monitor aggregator for Free memory [available values: min, max, sum or avg] | string | `min` | no |
| free_memory_message | Custom message for Free memory monitor | string | - | yes |
| free_memory_silenced | Groups to mute for Free memory monitor | map | `<map>` | no |
| free_memory_threshold_critical | Free disk space critical threshold | string | `5` | no |
| free_memory_threshold_warning | Free disk space warning threshold | string | `10` | no |
| free_memory_timeframe | Monitor timeframe for Free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_1m` | no |
| message | Message sent when an alert is triggered | string | - | yes |
