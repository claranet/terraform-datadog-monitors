# MIDDLEWARE APACHE DataDog monitors

## How to use this module

```
module "datadog-monitors-middleware-apache" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//middleware/apache?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Apache vhost status does not respond

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| apache_connect_enabled | Flag to enable Apache status monitor | string | `true` | no |
| apache_connect_extra_tags | Extra tags for Apache process monitor | list | `[]` | no |
| apache_connect_message | Custom message for Apache status monitor | string | `` | no |
| apache_connect_silenced | Groups to mute for Apache status monitor | map | `{}` | no |
| apache_connect_threshold_critical | Apache status monitor (critical threshold) | string | `1.1754943508222875e-38` | no |
| environment | Architecture Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `15` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_custom_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |

## Outputs

| Name | Description |
|------|-------------|
| datadog_apache_process_id | id for monitor datadog_apache_process |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/apache/](https://docs.datadoghq.com/integrations/apache/)
