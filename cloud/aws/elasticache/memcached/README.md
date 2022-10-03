# CLOUD AWS ELASTICACHE MEMCACHED DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-elasticache-memcached" {
  source      = "claranet/monitors/datadog//cloud/aws/elasticache/memcached"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Elasticache memcached cache hit ratio
- Elasticache memcached CPU

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
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.memcached_cpu_high](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.memcached_get_hits](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu_high_enabled"></a> [cpu\_high\_enabled](#input\_cpu\_high\_enabled) | Flag to enable Elasticache memcached cpu high monitor | `string` | `"true"` | no |
| <a name="input_cpu_high_extra_tags"></a> [cpu\_high\_extra\_tags](#input\_cpu\_high\_extra\_tags) | Extra tags for Elasticache memcached cpu high monitor | `list(string)` | `[]` | no |
| <a name="input_cpu_high_message"></a> [cpu\_high\_message](#input\_cpu\_high\_message) | Custom message for Elasticache memcached cpu high monitor | `string` | `""` | no |
| <a name="input_cpu_high_threshold_critical"></a> [cpu\_high\_threshold\_critical](#input\_cpu\_high\_threshold\_critical) | Elasticache memcached cpu high critical threshold in percentage | `string` | `90` | no |
| <a name="input_cpu_high_threshold_warning"></a> [cpu\_high\_threshold\_warning](#input\_cpu\_high\_threshold\_warning) | Elasticache memcached cpu high warning threshold in percentage | `string` | `75` | no |
| <a name="input_cpu_high_time_aggregator"></a> [cpu\_high\_time\_aggregator](#input\_cpu\_high\_time\_aggregator) | Monitor aggregator for Elasticache memcached cpu high [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_cpu_high_timeframe"></a> [cpu\_high\_timeframe](#input\_cpu\_high\_timeframe) | Monitor timeframe for Elasticache memcached cpu high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Infrastructure Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_get_hits_enabled"></a> [get\_hits\_enabled](#input\_get\_hits\_enabled) | Flag to enable Elasticache memcached get hits monitor | `string` | `"true"` | no |
| <a name="input_get_hits_extra_tags"></a> [get\_hits\_extra\_tags](#input\_get\_hits\_extra\_tags) | Extra tags for Elasticache memcached get hits monitor | `list(string)` | `[]` | no |
| <a name="input_get_hits_message"></a> [get\_hits\_message](#input\_get\_hits\_message) | Custom message for Elasticache memcached get hits monitor | `string` | `""` | no |
| <a name="input_get_hits_threshold_critical"></a> [get\_hits\_threshold\_critical](#input\_get\_hits\_threshold\_critical) | Elasticache memcached get hits critical threshold in percentage | `string` | `60` | no |
| <a name="input_get_hits_threshold_warning"></a> [get\_hits\_threshold\_warning](#input\_get\_hits\_threshold\_warning) | Elasticache memcached get hits warning threshold in percentage | `string` | `80` | no |
| <a name="input_get_hits_time_aggregator"></a> [get\_hits\_time\_aggregator](#input\_get\_hits\_time\_aggregator) | Monitor aggregator for Elasticache memcached get hits [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_get_hits_timeframe"></a> [get\_hits\_timeframe](#input\_get\_hits\_timeframe) | Monitor timeframe for Elasticache memcached get hits [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_memcached_cpu_high_no_data_timeframe"></a> [memcached\_cpu\_high\_no\_data\_timeframe](#input\_memcached\_cpu\_high\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `30` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_memcached_cpu_high_id"></a> [memcached\_cpu\_high\_id](#output\_memcached\_cpu\_high\_id) | id for monitor memcached\_cpu\_high |
| <a name="output_memcached_get_hits_id"></a> [memcached\_get\_hits\_id](#output\_memcached\_get\_hits\_id) | id for monitor memcached\_get\_hits |
<!-- END_TF_DOCS -->
## Related documentation

DataDog documentation:

* [https://docs.datadoghq.com/integrations/amazon_elasticache/](https://docs.datadoghq.com/integrations/amazon_elasticache/)
* [https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/](https://www.datadoghq.com/blog/monitoring-elasticache-performance-metrics-with-redis-or-memcached/)


