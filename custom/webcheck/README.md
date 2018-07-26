# CUSTOM WEBCHECK DataDog monitors

## How to use this module

```
module "datadog-monitors-custom-webcheck" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//custom/webcheck?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Custom WebCheck has error(s)
- Custom WebCheck latency is too high

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| custom_webcheck_error_aggregator | Monitor aggregator for custom_webcheck_error monitor [available values: min, max, sum or avg] | string | `min` | no |
| custom_webcheck_error_message | Custom message for custom_webcheck_error monitor | string | `` | no |
| custom_webcheck_error_silenced | Groups to mute for custom_webcheck_error monitor | map | `<map>` | no |
| custom_webcheck_error_timeframe | Monitor timeframe for custom_webcheck_error monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| custom_webcheck_latency_aggregator | Monitor aggregator for custom_webcheck_latency monitor [available values: min, max, sum or avg] | string | `min` | no |
| custom_webcheck_latency_critical | Critical latency in s | string | `1` | no |
| custom_webcheck_latency_message | Custom message for custom_webcheck_latency monitor | string | `` | no |
| custom_webcheck_latency_silenced | Groups to mute for custom_webcheck_latency monitor | map | `<map>` | no |
| custom_webcheck_latency_timeframe | Monitor timeframe for custom_webcheck_latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| custom_webcheck_latency_warning | Warn latency in s | string | `0.5` | no |
| delay | Delay in seconds for the metric evaluation | string | `15` | no |
| environment | Architecture Environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| custom_webcheck_error_id | id for monitor custom_webcheck_error |
| custom_webcheck_latency_id | id for monitor custom_webcheck_latency |

## Related documentation

