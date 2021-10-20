# CLOUD AWS ELASTICACHE COMMON DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-elasticache-common" {
  source      = "claranet/monitors/datadog//cloud/aws/elasticache/common"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Elasticache connections
- Elasticache eviction
- Elasticache evictions is growing
- Elasticache free memory
- Elasticache max connections reached
- Elasticache swap

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.elasticache_eviction](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.elasticache_eviction_growing](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.elasticache_free_memory](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.elasticache_max_connection](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.elasticache_no_connection](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.elasticache_swap](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_elasticache_max_connection_no_data_timeframe"></a> [elasticache\_max\_connection\_no\_data\_timeframe](#input\_elasticache\_max\_connection\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Infrastructure Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_eviction_enabled"></a> [eviction\_enabled](#input\_eviction\_enabled) | Flag to enable Elasticache eviction monitor | `string` | `"true"` | no |
| <a name="input_eviction_extra_tags"></a> [eviction\_extra\_tags](#input\_eviction\_extra\_tags) | Extra tags for Elasticache eviction monitor | `list(string)` | `[]` | no |
| <a name="input_eviction_growing_condition_timeframe"></a> [eviction\_growing\_condition\_timeframe](#input\_eviction\_growing\_condition\_timeframe) | Monitor condition timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_eviction_growing_enabled"></a> [eviction\_growing\_enabled](#input\_eviction\_growing\_enabled) | Flag to enable Elasticache eviction growing monitor | `string` | `"true"` | no |
| <a name="input_eviction_growing_extra_tags"></a> [eviction\_growing\_extra\_tags](#input\_eviction\_growing\_extra\_tags) | Extra tags for Elasticache eviction growing monitor | `list(string)` | `[]` | no |
| <a name="input_eviction_growing_message"></a> [eviction\_growing\_message](#input\_eviction\_growing\_message) | Custom message for Elasticache eviction growing monitor | `string` | `""` | no |
| <a name="input_eviction_growing_threshold_critical"></a> [eviction\_growing\_threshold\_critical](#input\_eviction\_growing\_threshold\_critical) | Elasticache eviction growing critical threshold in percentage | `string` | `30` | no |
| <a name="input_eviction_growing_threshold_warning"></a> [eviction\_growing\_threshold\_warning](#input\_eviction\_growing\_threshold\_warning) | Elasticache eviction growing warning threshold in percentage | `string` | `10` | no |
| <a name="input_eviction_growing_timeframe"></a> [eviction\_growing\_timeframe](#input\_eviction\_growing\_timeframe) | Monitor timeframe for Elasticache eviction growing [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_eviction_message"></a> [eviction\_message](#input\_eviction\_message) | Custom message for Elasticache eviction monitor | `string` | `""` | no |
| <a name="input_eviction_threshold_critical"></a> [eviction\_threshold\_critical](#input\_eviction\_threshold\_critical) | Elasticache free memory critical threshold in percentage | `string` | `30` | no |
| <a name="input_eviction_threshold_warning"></a> [eviction\_threshold\_warning](#input\_eviction\_threshold\_warning) | Elasticache free memory warning threshold in percentage | `string` | `0` | no |
| <a name="input_eviction_timeframe"></a> [eviction\_timeframe](#input\_eviction\_timeframe) | Monitor timeframe for Elasticache eviction [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_free_memory_condition_timeframe"></a> [free\_memory\_condition\_timeframe](#input\_free\_memory\_condition\_timeframe) | Monitor condition timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_free_memory_enabled"></a> [free\_memory\_enabled](#input\_free\_memory\_enabled) | Flag to enable Elasticache free memory monitor | `string` | `"true"` | no |
| <a name="input_free_memory_extra_tags"></a> [free\_memory\_extra\_tags](#input\_free\_memory\_extra\_tags) | Extra tags for Elasticache free memory monitor | `list(string)` | `[]` | no |
| <a name="input_free_memory_message"></a> [free\_memory\_message](#input\_free\_memory\_message) | Custom message for Elasticache free memory monitor | `string` | `""` | no |
| <a name="input_free_memory_threshold_critical"></a> [free\_memory\_threshold\_critical](#input\_free\_memory\_threshold\_critical) | Elasticache free memory critical threshold in percentage | `string` | `-70` | no |
| <a name="input_free_memory_threshold_warning"></a> [free\_memory\_threshold\_warning](#input\_free\_memory\_threshold\_warning) | Elasticache free memory warning threshold in percentage | `string` | `-50` | no |
| <a name="input_free_memory_timeframe"></a> [free\_memory\_timeframe](#input\_free\_memory\_timeframe) | Monitor timeframe for Elasticache free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_max_connection_enabled"></a> [max\_connection\_enabled](#input\_max\_connection\_enabled) | Flag to enable Elasticache max connection monitor | `string` | `"true"` | no |
| <a name="input_max_connection_extra_tags"></a> [max\_connection\_extra\_tags](#input\_max\_connection\_extra\_tags) | Extra tags for Elasticache max connection monitor | `list(string)` | `[]` | no |
| <a name="input_max_connection_message"></a> [max\_connection\_message](#input\_max\_connection\_message) | Custom message for Elasticache max connection monitor | `string` | `""` | no |
| <a name="input_max_connection_time_aggregator"></a> [max\_connection\_time\_aggregator](#input\_max\_connection\_time\_aggregator) | Monitor aggregator for Elasticache max connection [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_max_connection_timeframe"></a> [max\_connection\_timeframe](#input\_max\_connection\_timeframe) | Monitor timeframe for Elasticache max connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_no_connection_enabled"></a> [no\_connection\_enabled](#input\_no\_connection\_enabled) | Flag to enable Elasticache no connection monitor | `string` | `"true"` | no |
| <a name="input_no_connection_extra_tags"></a> [no\_connection\_extra\_tags](#input\_no\_connection\_extra\_tags) | Extra tags for Elasticache no connection monitor | `list(string)` | `[]` | no |
| <a name="input_no_connection_message"></a> [no\_connection\_message](#input\_no\_connection\_message) | Custom message for Elasticache no connection monitor | `string` | `""` | no |
| <a name="input_no_connection_time_aggregator"></a> [no\_connection\_time\_aggregator](#input\_no\_connection\_time\_aggregator) | Monitor aggregator for Elasticache no connection [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_no_connection_timeframe"></a> [no\_connection\_timeframe](#input\_no\_connection\_timeframe) | Monitor timeframe for Elasticache no connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_swap_enabled"></a> [swap\_enabled](#input\_swap\_enabled) | Flag to enable Elasticache swap monitor | `string` | `"true"` | no |
| <a name="input_swap_extra_tags"></a> [swap\_extra\_tags](#input\_swap\_extra\_tags) | Extra tags for Elasticache swap monitor | `list(string)` | `[]` | no |
| <a name="input_swap_message"></a> [swap\_message](#input\_swap\_message) | Custom message for Elasticache swap monitor | `string` | `""` | no |
| <a name="input_swap_threshold_critical"></a> [swap\_threshold\_critical](#input\_swap\_threshold\_critical) | Elasticache swap critical threshold in bytes | `string` | `50000000` | no |
| <a name="input_swap_threshold_warning"></a> [swap\_threshold\_warning](#input\_swap\_threshold\_warning) | Elasticache swap warning threshold in bytes | `string` | `0` | no |
| <a name="input_swap_time_aggregator"></a> [swap\_time\_aggregator](#input\_swap\_time\_aggregator) | Monitor aggregator for Elasticache memcached swap [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_swap_timeframe"></a> [swap\_timeframe](#input\_swap\_timeframe) | Monitor timeframe for Elasticache swap [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elasticache_eviction_growing_id"></a> [elasticache\_eviction\_growing\_id](#output\_elasticache\_eviction\_growing\_id) | id for monitor elasticache\_eviction\_growing |
| <a name="output_elasticache_eviction_id"></a> [elasticache\_eviction\_id](#output\_elasticache\_eviction\_id) | id for monitor elasticache\_eviction |
| <a name="output_elasticache_free_memory_id"></a> [elasticache\_free\_memory\_id](#output\_elasticache\_free\_memory\_id) | id for monitor elasticache\_free\_memory |
| <a name="output_elasticache_max_connection_id"></a> [elasticache\_max\_connection\_id](#output\_elasticache\_max\_connection\_id) | id for monitor elasticache\_max\_connection |
| <a name="output_elasticache_no_connection_id"></a> [elasticache\_no\_connection\_id](#output\_elasticache\_no\_connection\_id) | id for monitor elasticache\_no\_connection |
| <a name="output_elasticache_swap_id"></a> [elasticache\_swap\_id](#output\_elasticache\_swap\_id) | id for monitor elasticache\_swap |
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)

