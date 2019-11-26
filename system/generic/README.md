# SYSTEM GENERIC DataDog monitors

## How to use this module

```
module "datadog-monitors-system-generic" {
  source = "git::ssh://git@github.com/claranet/terraform-datadog-monitors.git//system/generic?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message

  memory_message = "${module.datadog-message-alerting-bh-only.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- CPU load 5 ratio
- CPU usage
- Disk inodes usage
- Disk space usage
- Disk Space usage forecast
- Usable Memory

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu\_enabled | Flag to enable CPU high monitor | string | `"true"` | no |
| cpu\_extra\_tags | Extra tags for CPU high monitor | list(string) | `[]` | no |
| cpu\_message | Custom message for CPU high monitor | string | `""` | no |
| cpu\_threshold\_critical | CPU high critical threshold | string | `"90"` | no |
| cpu\_threshold\_warning | CPU high warning threshold | string | `"85"` | no |
| cpu\_time\_aggregator | Monitor aggregator for CPU high [available values: min, max or avg] | string | `"min"` | no |
| cpu\_timeframe | Monitor timeframe for CPU high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_1h"` | no |
| disk\_inodes\_enabled | Flag to enable Free disk inodes monitor | string | `"true"` | no |
| disk\_inodes\_extra\_tags | Extra tags for Free disk inodes monitor | list(string) | `[]` | no |
| disk\_inodes\_message | Custom message for Free disk inodes monitor | string | `""` | no |
| disk\_inodes\_threshold\_critical | Free disk space critical threshold | string | `"95"` | no |
| disk\_inodes\_threshold\_warning | Free disk space warning threshold | string | `"90"` | no |
| disk\_inodes\_time\_aggregator | Monitor aggregator for Free disk inodes [available values: min, max or avg] | string | `"min"` | no |
| disk\_inodes\_timeframe | Monitor timeframe for Free disk inodes [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| disk\_space\_enabled | Flag to enable Free diskspace monitor | string | `"true"` | no |
| disk\_space\_extra\_tags | Extra tags for Free diskspace monitor | list(string) | `[]` | no |
| disk\_space\_forecast\_algorithm | Algorithm for the Free diskspace Forecast monitor [available values: `linear` or `seasonal`] | string | `"linear"` | no |
| disk\_space\_forecast\_deviations | Deviations for the Free diskspace Forecast monitor [available values: `1`, `2`, `3`, `4` or `5`] | string | `"1"` | no |
| disk\_space\_forecast\_enabled | Flag to enable Free diskspace forecast monitor | string | `"true"` | no |
| disk\_space\_forecast\_extra\_tags | Extra tags for Free diskspace forecast monitor | list(string) | `[]` | no |
| disk\_space\_forecast\_interval | Interval for the Free diskspace Forecast monitor [available values: `30m`, `60m` or `120m`] | string | `"60m"` | no |
| disk\_space\_forecast\_linear\_history | History for the Free diskspace Forecast monitor [available values: `12h`, `#d` (1, 2, or 3), `#w` (1, or 2) or `#mo` (1, 2 or 3)] | string | `"1w"` | no |
| disk\_space\_forecast\_linear\_model | Model for the Free diskspace Forecast monitor [available values: `default`, `simple` or `reactive`] | string | `"default"` | no |
| disk\_space\_forecast\_message | Custom message for Free diskspace forecast monitor | string | `""` | no |
| disk\_space\_forecast\_seasonal\_seasonality | Seasonality for the Free diskspace Forecast monitor | string | `"weekly"` | no |
| disk\_space\_forecast\_threshold\_critical | Free disk space forecast critical threshold | string | `"80"` | no |
| disk\_space\_forecast\_threshold\_critical\_recovery | Free disk space forecast recovery threshold | string | `"72"` | no |
| disk\_space\_forecast\_time\_aggregator | Monitor aggregator for Free diskspace forecast [available values: min, max or avg] | string | `"max"` | no |
| disk\_space\_forecast\_timeframe | Monitor timeframe for Free diskspace forecast [available values: `next_12h`, `next_#d` (1, 2, or 3), `next_#w` (1 or 2) or `next_#mo` (1, 2 or 3)] | string | `"next_1w"` | no |
| disk\_space\_message | Custom message for Free diskspace monitor | string | `""` | no |
| disk\_space\_threshold\_critical | Free disk space critical threshold | string | `"90"` | no |
| disk\_space\_threshold\_warning | Free disk space warning threshold | string | `"80"` | no |
| disk\_space\_time\_aggregator | Monitor aggregator for Free diskspace [available values: min, max or avg] | string | `"max"` | no |
| disk\_space\_timeframe | Monitor timeframe for Free diskspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| environment | Architecture Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| load\_enabled | Flag to enable CPU load ratio monitor | string | `"true"` | no |
| load\_extra\_tags | Extra tags for CPU load ratio monitor | list(string) | `[]` | no |
| load\_message | Custom message for CPU load ratio monitor | string | `""` | no |
| load\_threshold\_critical | CPU load ratio critical threshold | string | `"2.5"` | no |
| load\_threshold\_warning | CPU load ratio warning threshold | string | `"2"` | no |
| load\_time\_aggregator | Monitor aggregator for CPU load ratio [available values: min, max or avg] | string | `"min"` | no |
| load\_timeframe | Monitor timeframe for CPU load ratio [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_30m"` | no |
| memory\_enabled | Flag to enable Free memory monitor | string | `"true"` | no |
| memory\_extra\_tags | Extra tags for Free memory monitor | list(string) | `[]` | no |
| memory\_message | Mandatory message for Free memory monitor to avoid NBH alerting by default | string | n/a | yes |
| memory\_threshold\_critical | Free disk space critical threshold | string | `"5"` | no |
| memory\_threshold\_warning | Free disk space warning threshold | string | `"10"` | no |
| memory\_time\_aggregator | Monitor aggregator for Free memory [available values: min, max or avg] | string | `"max"` | no |
| memory\_timeframe | Monitor timeframe for Free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| cpu\_id | id for monitor cpu |
| disk\_inodes\_id | id for monitor disk_inodes |
| disk\_space\_forecast\_id | id for monitor disk_space_forecast |
| disk\_space\_id | id for monitor disk_space |
| load\_id | id for monitor load |
| memory\_id | id for monitor memory |

## Related documentation

DataDog documentation:
