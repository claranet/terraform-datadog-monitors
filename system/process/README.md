# SYSTEM PROCESS DataDog monitors

## How to use this module

```
module "datadog-monitors-system-process" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//system/process?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Process is down

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `15` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_custom_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |
| process_check_enabled | Flag to enable process check monitor | string | `true` | no |
| process_check_extra_tags | Extra tags for process check monitor | list | `[]` | no |
| process_check_message | Custom message for process check monitor | string | `` | no |
| process_check_no_data_timeframe | Timeframe for process check monitor to alert on no data | string | `20` | no |
| process_check_silenced | Groups to mute for process check monitor | map | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| datadog_process_check_id | id for monitor datadog_process_check |

## Related documentation

