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

- Can't connect to apache vhost status

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| apache_connect_message | Custom message for Apache process monitor | string | `` | no |
| apache_connect_silenced | Groups to mute for Apache process monitor | map | `<map>` | no |
| delay | Delay in seconds for the metric evaluation | string | `15` | no |
| environment | Architecture Environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| datadog_apache_process_id | id for monitor datadog_apache_process |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/apache/](https://docs.datadoghq.com/integrations/apache/)
