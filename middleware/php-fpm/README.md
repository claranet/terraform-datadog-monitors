# MIDDLEWARE PHP-FPM DataDog monitors

## How to use this module

```
module "datadog-monitors-middleware-php-fpm" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//middleware/php-fpm?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Php-fpm busy worker
- Php-fpm ping url does not respond

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `15` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |
| php_fpm_busy_enabled | Flag to enable PHP FPM busy worker monitor | string | `true` | no |
| php_fpm_busy_extra_tags | Extra tags for PHP FPM busy worker monitor | list | `<list>` | no |
| php_fpm_busy_message | Custom message for PHP FPM busy worker monitor | string | `` | no |
| php_fpm_busy_silenced | Groups to mute for PHP FPM busy worker monitor | map | `<map>` | no |
| php_fpm_busy_threshold_critical | php fpm busy critical threshold | string | `90` | no |
| php_fpm_busy_threshold_warning | php fpm busy warning threshold | string | `80` | no |
| php_fpm_busy_time_aggregator | Monitor aggregator for PHP FPM busy worker [available values: min, max or avg] | string | `avg` | no |
| php_fpm_busy_timeframe | Monitor timeframe for PHP FPM busy worker [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_10m` | no |
| php_fpm_connect_enabled | Flag to enable PHP FPM process monitor | string | `true` | no |
| php_fpm_connect_extra_tags | Extra tags for PHP FPM process monitor | list | `<list>` | no |
| php_fpm_connect_message | Custom message for PHP FPM process monitor | string | `` | no |
| php_fpm_connect_silenced | Groups to mute for PHP FPM process monitor | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| datadog_fpm_process_id | id for monitor datadog_fpm_process |
| datadog_php_fpm_connect_idle_id | id for monitor datadog_php_fpm_connect_idle |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/php_fpm/](https://docs.datadoghq.com/integrations/php_fpm/)
