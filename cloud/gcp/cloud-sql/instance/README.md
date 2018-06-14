
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu_message | Custom message for the CPU Utilization monitor | string | `` | no |
| cpu_silenced | Groups to mute for GCP Cloud SQL CPU Utilization monitor | map | `<map>` | no |
| cpu_tags | Tags to add to the CPU Utilization monitors | map | `` | no |
| cpu_threshold_critical | CPU Utilization in fraction (critical threshold) | string | `0.9` | no |
| cpu_threshold_warning | CPU Utilization in fraction (warning threshold) | string | `0.85` | no |
| cpu_timeframe | Timeframe for the CPU Utilization monitor | string | `last_2h` | no |
| database_id | ID of the Cloud SQL Database Instance | string | - | yes |
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| disk_message | Custom message for the Disk Utilization monitor | string | `` | no |
| disk_silenced | Groups to mute for GCP Cloud SQL Disk Utilization monitor | map | `<map>` | no |
| disk_tags | Tags to add to the Disk Utilization monitors | map | `` | no |
| disk_threshold_critical | Disk Utilization in fraction (critical threshold) | string | `0.9` | no |
| disk_threshold_warning | Disk Utilization in fraction (warning threshold) | string | `0.8` | no |
| disk_timeframe | Timeframe for the Disk Utilization monitor | string | `last_5m` | no |
| environment | Architecture environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| network_connections_hard_limit | Max number of network connections | string | - | yes |
| network_connections_message | Custom message for the Netowork Connections monitor | string | `` | no |
| network_connections_silenced | Groups to mute for GCP Cloud SQL Network Connections monitor | map | `<map>` | no |
| network_connections_tags | Tags to add to the Network Connections monitors | map | `` | no |
| network_connections_threshold_critical | Fraction of network connections (warning threshold) | string | `0.9` | no |
| network_connections_threshold_warning | Fraction of network connections (warning threshold) | string | `0.8` | no |
| network_connections_timeframe | Timeframe for the Network Connections monitor | string | `last_5m` | no |
| project_id | ID of the GCP Project | string | - | yes |

