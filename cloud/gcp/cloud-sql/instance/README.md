
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu_message | Custom message for the CPU Utilization monitor | string | `` | no |
| cpu_silenced | Groups to mute for GCP Cloud SQL CPU Utilization monitor | map | `<map>` | no |
| cpu_threshold_critical | CPU Utilization in fraction (critical threshold) | string | `0.9` | no |
| cpu_threshold_warning | CPU Utilization in fraction (warning threshold) | string | `0.85` | no |
| cpu_timeframe | Timeframe for the CPU Utilization monitor | string | `last_2h` | no |
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| disk_message | Custom message for the Disk Utilization monitor | string | `` | no |
| disk_silenced | Groups to mute for GCP Cloud SQL Disk Utilization monitor | map | `<map>` | no |
| disk_threshold_critical | Disk Utilization in fraction (critical threshold) | string | `0.9` | no |
| disk_threshold_warning | Disk Utilization in fraction (warning threshold) | string | `0.8` | no |
| disk_timeframe | Timeframe for the Disk Utilization monitor | string | `last_5m` | no |
| environment | Architecture environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| memory_forecast_history | History for the Memory Utilization Forecast monitor | string | `12h` | no |
| memory_forecast_interval | Interval for the Memory Utilization Forecast monitor | string | `30m` | no |
| memory_forecast_message | Custom message for the Memory Utilization Forecast monitor | string | `` | no |
| memory_forecast_silenced | Groups to mute for GCP Cloud SQL Memory Utilization Forecast monitor | map | `<map>` | no |
| memory_forecast_threshold_critical | Memory Utilization Forecast in fraction (critical threshold) | string | `0.9` | no |
| memory_forecast_threshold_warning | Memory Utilization Forecast in fraction (warning threshold) | string | `0.8` | no |
| memory_forecast_timeframe | Timeframe for the Memory Utilization Forecast monitor | string | `next_3d` | no |
| memory_message | Custom message for the Memory Utilization monitor | string | `` | no |
| memory_silenced | Groups to mute for GCP Cloud SQL Memory Utilization monitor | map | `<map>` | no |
| memory_threshold_critical | Memory Utilization in fraction (critical threshold) | string | `0.9` | no |
| memory_threshold_warning | Memory Utilization in fraction (warning threshold) | string | `0.8` | no |
| memory_timeframe | Timeframe for the Memory Utilization monitor | string | `last_5m` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| project_id | ID of the GCP Project | string | - | yes |

