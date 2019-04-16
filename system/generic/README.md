# SYSTEM GENERIC DataDog monitors

## How to use this module

```
module "datadog-monitors-system-generic" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//system/generic?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"

  free_memory_message = "${module.datadog-message-alerting.alerting-message-bh-only}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- CPU load 5 ratio
- CPU usage
- Disk Space forecast
- Free disk inodes
- Free disk space
- Free memory

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu\_high\_enabled | Flag to enable CPU high monitor | string | `"true"` | no |
| cpu\_high\_extra\_tags | Extra tags for CPU high monitor | list | `[]` | no |
| cpu\_high\_message | Custom message for CPU high monitor | string | `""` | no |
| cpu\_high\_silenced | Groups to mute for CPU high monitor | map | `{}` | no |
| cpu\_high\_threshold\_critical | CPU high critical threshold | string | `"90"` | no |
| cpu\_high\_threshold\_warning | CPU high warning threshold | string | `"85"` | no |
| cpu\_high\_time\_aggregator | Monitor aggregator for CPU high [available values: min, max or avg] | string | `"min"` | no |
| cpu\_high\_timeframe | Monitor timeframe for CPU high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_10m"` | no |
| cpu\_load\_enabled | Flag to enable CPU load ratio monitor | string | `"true"` | no |
| cpu\_load\_extra\_tags | Extra tags for CPU load ratio monitor | list | `[]` | no |
| cpu\_load\_message | Custom message for CPU load ratio monitor | string | `""` | no |
| cpu\_load\_silenced | Groups to mute for CPU load ratio monitor | map | `{}` | no |
| cpu\_load\_threshold\_critical | CPU load ratio critical threshold | string | `"2.5"` | no |
| cpu\_load\_threshold\_warning | CPU load ratio warning threshold | string | `"2"` | no |
| cpu\_load\_time\_aggregator | Monitor aggregator for CPU load ratio [available values: min, max or avg] | string | `"min"` | no |
| cpu\_load\_timeframe | Monitor timeframe for CPU load ratio [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| environment | Architecture Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| free\_disk\_inodes\_enabled | Flag to enable Free disk inodes monitor | string | `"true"` | no |
| free\_disk\_inodes\_extra\_tags | Extra tags for Free disk inodes monitor | list | `[]` | no |
| free\_disk\_inodes\_message | Custom message for Free disk inodes monitor | string | `""` | no |
| free\_disk\_inodes\_silenced | Groups to mute for Free disk inodes monitor | map | `{}` | no |
| free\_disk\_inodes\_threshold\_critical | Free disk space critical threshold | string | `"5"` | no |
| free\_disk\_inodes\_threshold\_warning | Free disk space warning threshold | string | `"10"` | no |
| free\_disk\_inodes\_time\_aggregator | Monitor aggregator for Free disk inodes [available values: min, max or avg] | string | `"min"` | no |
| free\_disk\_inodes\_timeframe | Monitor timeframe for Free disk inodes [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| free\_disk\_space\_enabled | Flag to enable Free diskspace monitor | string | `"true"` | no |
| free\_disk\_space\_extra\_tags | Extra tags for Free diskspace monitor | list | `[]` | no |
| free\_disk\_space\_forecast\_algorithm | Algorithm for the Free diskspace Forecast monitor [available values: `linear` or `seasonal`] | string | `"linear"` | no |
| free\_disk\_space\_forecast\_deviations | Deviations for the Free diskspace Forecast monitor [available values: `1`, `2`, `3`, `4` or `5`] | string | `"1"` | no |
| free\_disk\_space\_forecast\_enabled | Flag to enable Free diskspace forecast monitor | string | `"true"` | no |
| free\_disk\_space\_forecast\_extra\_tags | Extra tags for Free diskspace forecast monitor | list | `[]` | no |
| free\_disk\_space\_forecast\_interval | Interval for the Free diskspace Forecast monitor [available values: `30m`, `60m` or `120m`] | string | `"60m"` | no |
| free\_disk\_space\_forecast\_linear\_history | History for the Free diskspace Forecast monitor [available values: `12h`, `#d` (1, 2, or 3), `#w` (1, or 2) or `#mo` (1, 2 or 3)] | string | `"1w"` | no |
| free\_disk\_space\_forecast\_linear\_model | Model for the Free diskspace Forecast monitor [available values: `default`, `simple` or `reactive`] | string | `"default"` | no |
| free\_disk\_space\_forecast\_message | Custom message for Free diskspace forecast monitor | string | `""` | no |
| free\_disk\_space\_forecast\_seasonal\_seasonality | Seasonality for the Free diskspace Forecast monitor | string | `"weekly"` | no |
| free\_disk\_space\_forecast\_silenced | Groups to mute for Free diskspace forecast monitor | map | `{}` | no |
| free\_disk\_space\_forecast\_threshold\_critical | Free disk space forecast critical threshold | string | `"80"` | no |
| free\_disk\_space\_forecast\_threshold\_critical\_recovery | Free disk space forecast recovery threshold | string | `"72"` | no |
| free\_disk\_space\_forecast\_time\_aggregator | Monitor aggregator for Free diskspace forecast [available values: min, max or avg] | string | `"max"` | no |
| free\_disk\_space\_forecast\_timeframe | Monitor timeframe for Free diskspace forecast [available values: `next_12h`, `next_#d` (1, 2, or 3), `next_#w` (1 or 2) or `next_#mo` (1, 2 or 3)] | string | `"next_1w"` | no |
| free\_disk\_space\_message | Custom message for Free diskspace monitor | string | `""` | no |
| free\_disk\_space\_silenced | Groups to mute for Free diskspace monitor | map | `{}` | no |
| free\_disk\_space\_threshold\_critical | Free disk space critical threshold | string | `"10"` | no |
| free\_disk\_space\_threshold\_warning | Free disk space warning threshold | string | `"20"` | no |
| free\_disk\_space\_time\_aggregator | Monitor aggregator for Free diskspace [available values: min, max or avg] | string | `"min"` | no |
| free\_disk\_space\_timeframe | Monitor timeframe for Free diskspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| free\_memory\_enabled | Flag to enable Free memory monitor | string | `"true"` | no |
| free\_memory\_extra\_tags | Extra tags for Free memory monitor | list | `[]` | no |
| free\_memory\_message | Mandatory message for Free memory monitor to avoid NBH alerting by default | string | n/a | yes |
| free\_memory\_silenced | Groups to mute for Free memory monitor | map | `{}` | no |
| free\_memory\_threshold\_critical | Free disk space critical threshold | string | `"5"` | no |
| free\_memory\_threshold\_warning | Free disk space warning threshold | string | `"10"` | no |
| free\_memory\_time\_aggregator | Monitor aggregator for Free memory [available values: min, max or avg] | string | `"max"` | no |
| free\_memory\_timeframe | Monitor timeframe for Free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |

## Outputs

| Name | Description |
|------|-------------|
| datadog\_cpu\_too\_high\_id | id for monitor datadog_cpu_too_high |
| datadog\_free\_disk\_space\_forecast\_id | id for monitor datadog_free_disk_space_forecast |
| datadog\_free\_disk\_space\_inodes\_too\_low\_id | id for monitor datadog_free_disk_space_inodes_too_low |
| datadog\_free\_disk\_space\_too\_low\_id | id for monitor datadog_free_disk_space_too_low |
| datadog\_free\_memory\_id | id for monitor datadog_free_memory |
| datadog\_load\_too\_high\_id | id for monitor datadog_load_too_high |

## Related documentation

DataDog documentation:
