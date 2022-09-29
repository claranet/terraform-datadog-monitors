# MIDDLEWARE NGINX DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-middleware-nginx" {
  source      = "claranet/monitors/datadog//middleware/nginx"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Nginx dropped connections
- Nginx vhost status does not respond

<!-- BEGIN_TF_DOCS -->
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
| [datadog_monitor.datadog_nginx_dropped_connections](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.datadog_nginx_process](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_nginx_connect_enabled"></a> [nginx\_connect\_enabled](#input\_nginx\_connect\_enabled) | Flag to enable Nginx status monitor | `string` | `"true"` | no |
| <a name="input_nginx_connect_extra_tags"></a> [nginx\_connect\_extra\_tags](#input\_nginx\_connect\_extra\_tags) | Extra tags for Nginx process monitor | `list(string)` | `[]` | no |
| <a name="input_nginx_connect_message"></a> [nginx\_connect\_message](#input\_nginx\_connect\_message) | Custom message for Nginx status monitor | `string` | `""` | no |
| <a name="input_nginx_connect_no_data_timeframe"></a> [nginx\_connect\_no\_data\_timeframe](#input\_nginx\_connect\_no\_data\_timeframe) | Nginx status monitor no data timeframe | `string` | `10` | no |
| <a name="input_nginx_connect_threshold_warning"></a> [nginx\_connect\_threshold\_warning](#input\_nginx\_connect\_threshold\_warning) | Nginx status monitor (warning threshold) | `string` | `3` | no |
| <a name="input_nginx_dropped_enabled"></a> [nginx\_dropped\_enabled](#input\_nginx\_dropped\_enabled) | Flag to enable Nginx dropped monitor | `string` | `"true"` | no |
| <a name="input_nginx_dropped_extra_tags"></a> [nginx\_dropped\_extra\_tags](#input\_nginx\_dropped\_extra\_tags) | Extra tags for Nginx dropped connections monitor | `list(string)` | `[]` | no |
| <a name="input_nginx_dropped_message"></a> [nginx\_dropped\_message](#input\_nginx\_dropped\_message) | Custom message for Nginx dropped connections monitor | `string` | `""` | no |
| <a name="input_nginx_dropped_threshold_critical"></a> [nginx\_dropped\_threshold\_critical](#input\_nginx\_dropped\_threshold\_critical) | Nginx dropped connections critical threshold | `number` | `0` | no |
| <a name="input_nginx_dropped_time_aggregator"></a> [nginx\_dropped\_time\_aggregator](#input\_nginx\_dropped\_time\_aggregator) | Monitor aggregator for Nginx dropped connections [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_nginx_dropped_timeframe"></a> [nginx\_dropped\_timeframe](#input\_nginx\_dropped\_timeframe) | Monitor timeframe for Nginx dropped connections [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_datadog_nginx_dropped_connections_id"></a> [datadog\_nginx\_dropped\_connections\_id](#output\_datadog\_nginx\_dropped\_connections\_id) | id for monitor datadog\_nginx\_dropped\_connections |
| <a name="output_datadog_nginx_process_id"></a> [datadog\_nginx\_process\_id](#output\_datadog\_nginx\_process\_id) | id for monitor datadog\_nginx\_process |
<!-- END_TF_DOCS -->
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/nginx/](https://docs.datadoghq.com/integrations/nginx/)
