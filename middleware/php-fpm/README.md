# MIDDLEWARE PHP-FPM DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-middleware-php-fpm" {
  source      = "claranet/monitors/datadog//middleware/php-fpm"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Php-fpm busy worker
- Php-fpm ping url does not respond

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.1.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.php_fpm_connect](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.php_fpm_connect_idle](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_php_fpm_busy_enabled"></a> [php\_fpm\_busy\_enabled](#input\_php\_fpm\_busy\_enabled) | Flag to enable PHP FPM busy worker monitor | `string` | `"true"` | no |
| <a name="input_php_fpm_busy_extra_tags"></a> [php\_fpm\_busy\_extra\_tags](#input\_php\_fpm\_busy\_extra\_tags) | Extra tags for PHP FPM busy worker monitor | `list(string)` | `[]` | no |
| <a name="input_php_fpm_busy_message"></a> [php\_fpm\_busy\_message](#input\_php\_fpm\_busy\_message) | Custom message for PHP FPM busy worker monitor | `string` | `""` | no |
| <a name="input_php_fpm_busy_threshold_critical"></a> [php\_fpm\_busy\_threshold\_critical](#input\_php\_fpm\_busy\_threshold\_critical) | php fpm busy critical threshold | `number` | `90` | no |
| <a name="input_php_fpm_busy_threshold_warning"></a> [php\_fpm\_busy\_threshold\_warning](#input\_php\_fpm\_busy\_threshold\_warning) | php fpm busy warning threshold | `number` | `80` | no |
| <a name="input_php_fpm_busy_time_aggregator"></a> [php\_fpm\_busy\_time\_aggregator](#input\_php\_fpm\_busy\_time\_aggregator) | Monitor aggregator for PHP FPM busy worker [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_php_fpm_busy_timeframe"></a> [php\_fpm\_busy\_timeframe](#input\_php\_fpm\_busy\_timeframe) | Monitor timeframe for PHP FPM busy worker [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_10m"` | no |
| <a name="input_php_fpm_connect_enabled"></a> [php\_fpm\_connect\_enabled](#input\_php\_fpm\_connect\_enabled) | Flag to enable PHP FPM status monitor | `string` | `"true"` | no |
| <a name="input_php_fpm_connect_extra_tags"></a> [php\_fpm\_connect\_extra\_tags](#input\_php\_fpm\_connect\_extra\_tags) | Extra tags for PHP FPM status monitor | `list(string)` | `[]` | no |
| <a name="input_php_fpm_connect_message"></a> [php\_fpm\_connect\_message](#input\_php\_fpm\_connect\_message) | Custom message for PHP FPM status monitor | `string` | `""` | no |
| <a name="input_php_fpm_connect_no_data_timeframe"></a> [php\_fpm\_connect\_no\_data\_timeframe](#input\_php\_fpm\_connect\_no\_data\_timeframe) | PHP FPM status monitor no data timeframe | `string` | `10` | no |
| <a name="input_php_fpm_connect_threshold_warning"></a> [php\_fpm\_connect\_threshold\_warning](#input\_php\_fpm\_connect\_threshold\_warning) | PHP FPM status monitor (warning threshold) | `string` | `3` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_php_fpm_connect_id"></a> [php\_fpm\_connect\_id](#output\_php\_fpm\_connect\_id) | id for monitor php\_fpm\_connect |
| <a name="output_php_fpm_connect_idle_id"></a> [php\_fpm\_connect\_idle\_id](#output\_php\_fpm\_connect\_idle\_id) | id for monitor php\_fpm\_connect\_idle |
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/php_fpm/](https://docs.datadoghq.com/integrations/php_fpm/)
