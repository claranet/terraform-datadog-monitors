# SYSTEM UNREACHABLE DataDog monitors

## How to use this module

```
module "datadog-monitors-system-unreachable" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//system/unreachable?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Host unreachable

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
| unreachable_enabled | Flag to enable Host unreachable monitor | string | `true` | no |
| unreachable_extra_tags | Extra tags for Host unreachable monitor | list | `[]` | no |
| unreachable_message | Custom message for Host unreachable monitor | string | `` | no |
| unreachable_no_data_timeframe | Timeframe for Host unreachable monitor to alert on no data | string | `20` | no |
| unreachable_silenced | Groups to mute for Host unreachable monitor | map | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| host_unreachable_id | id for monitor host_unreachable |

## Related documentation

