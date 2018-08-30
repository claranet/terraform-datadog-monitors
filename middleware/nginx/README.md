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

- Nginx dropped connections
- Nginx vhost status does not respond

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `15` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |
| nginx_connect_enabled | Flag to enable Nginx status monitor | string | `true` | no |
| nginx_connect_extra_tags | Extra tags for Nginx process monitor | list | `<list>` | no |
| nginx_connect_message | Custom message for Nginx status monitor | string | `` | no |
| nginx_connect_silenced | Groups to mute for Nginx status monitor | map | `<map>` | no |
| nginx_connect_threshold_critical | Nginx status monitor (critical threshold) | string | `1.1754943508222875e-38` | no |
| nginx_dropped_extra_tags | Extra tags for Nginx dropped connections monitor | list | `<list>` | no |
| nginx_dropped_message | Custom message for Nginx dropped connections monitor | string | `` | no |
| nginx_dropped_silenced | Groups to mute for Nginx dropped connections monitor | map | `<map>` | no |
| nginx_dropped_threshold_critical | Nginx dropped connections critical threshold | string | `0` | no |
| nginx_dropped_time_aggregator | Monitor aggregator for Nginx dropped connections [available values: min, max or avg] | string | `min` | no |
| nginx_dropped_timeframe | Monitor timeframe for Nginx dropped connections [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

## Outputs

| Name | Description |
|------|-------------|
| datadog_nginx_dropped_connections_id | id for monitor datadog_nginx_dropped_connections |
| datadog_nginx_process_id | id for monitor datadog_nginx_process |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/nginx/](https://docs.datadoghq.com/integrations/nginx/)
