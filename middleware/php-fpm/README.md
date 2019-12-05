# MIDDLEWARE PHP-FPM DataDog monitors

## How to use this module

```
module "datadog-monitors-middleware-php-fpm" {
  source = "claranet/monitors/datadog//middleware/php-fpm"
  version = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Php-fpm busy worker
- Php-fpm ping url does not respond

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| notify\_no\_data | Will raise no data alert if set to true | string | `"true"` | no |
| php\_fpm\_busy\_enabled | Flag to enable PHP FPM busy worker monitor | string | `"true"` | no |
| php\_fpm\_busy\_extra\_tags | Extra tags for PHP FPM busy worker monitor | list(string) | `[]` | no |
| php\_fpm\_busy\_message | Custom message for PHP FPM busy worker monitor | string | `""` | no |
| php\_fpm\_busy\_threshold\_critical | php fpm busy critical threshold | string | `"90"` | no |
| php\_fpm\_busy\_threshold\_warning | php fpm busy warning threshold | string | `"80"` | no |
| php\_fpm\_busy\_time\_aggregator | Monitor aggregator for PHP FPM busy worker [available values: min, max or avg] | string | `"avg"` | no |
| php\_fpm\_busy\_timeframe | Monitor timeframe for PHP FPM busy worker [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_10m"` | no |
| php\_fpm\_connect\_enabled | Flag to enable PHP FPM status monitor | string | `"true"` | no |
| php\_fpm\_connect\_extra\_tags | Extra tags for PHP FPM status monitor | list(string) | `[]` | no |
| php\_fpm\_connect\_message | Custom message for PHP FPM status monitor | string | `""` | no |
| php\_fpm\_connect\_no\_data\_timeframe | PHP FPM status monitor no data timeframe | string | `"10"` | no |
| php\_fpm\_connect\_threshold\_warning | PHP FPM status monitor (warning threshold) | string | `"3"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| php\_fpm\_connect\_id | id for monitor php_fpm_connect |
| php\_fpm\_connect\_idle\_id | id for monitor php_fpm_connect_idle |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/php_fpm/](https://docs.datadoghq.com/integrations/php_fpm/)
