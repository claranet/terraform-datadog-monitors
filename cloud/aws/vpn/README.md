# CLOUD AWS VPN DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-aws-vpn" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/aws/vpn?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- VPN Down

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture Environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| vpn_status_message | Custom message for VPN status monitor | string | `` | no |
| vpn_status_silenced | Groups to mute for VPN status monitor | map | `<map>` | no |
| vpn_status_time_aggregator | Monitor aggregator for VPN status [available values: min, max or avg] | string | `max` | no |
| vpn_status_timeframe | Monitor timeframe for VPN status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

## Outputs

| Name | Description |
|------|-------------|
| VPN_status_id | id for monitor VPN_status |

