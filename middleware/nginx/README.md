# MIDDLEWARE NGINX DataDog monitors

## How to use this module

```
module "datadog-monitors-middleware-nginx" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//middleware/nginx?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Can't connect to nginx vhost status

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `15` | no |
| environment | Architecture Environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| nginx_connect_message | Custom message for Nginx process monitor | string | `` | no |
| nginx_connect_silenced | Groups to mute for Nginx process monitor | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| datadog_nginx_process_id | id for monitor datadog_nginx_process |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/nginx/](https://docs.datadoghq.com/integrations/nginx/)
