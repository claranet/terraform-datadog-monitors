# CLOUD AZURE REDIS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-redis" {
  source      = "claranet/monitors/datadog//cloud/azure/redis"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Redis {{name}} is down
- Redis processor time too high
- Redis server load too high
- Redis too many evictedkeys

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
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.evictedkeys](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.percent_processor_time](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.server_load](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_evictedkeys_limit_enabled"></a> [evictedkeys\_limit\_enabled](#input\_evictedkeys\_limit\_enabled) | Flag to enable Redis evicted keys monitor | `string` | `"true"` | no |
| <a name="input_evictedkeys_limit_extra_tags"></a> [evictedkeys\_limit\_extra\_tags](#input\_evictedkeys\_limit\_extra\_tags) | Extra tags for Redis evicted keys monitor | `list(string)` | `[]` | no |
| <a name="input_evictedkeys_limit_message"></a> [evictedkeys\_limit\_message](#input\_evictedkeys\_limit\_message) | Custom message for Redis evicted keys monitor | `string` | `""` | no |
| <a name="input_evictedkeys_limit_threshold_critical"></a> [evictedkeys\_limit\_threshold\_critical](#input\_evictedkeys\_limit\_threshold\_critical) | Evicted keys limit (critical threshold) | `number` | `100` | no |
| <a name="input_evictedkeys_limit_threshold_warning"></a> [evictedkeys\_limit\_threshold\_warning](#input\_evictedkeys\_limit\_threshold\_warning) | Evicted keys limit (warning threshold) | `number` | `0` | no |
| <a name="input_evictedkeys_limit_time_aggregator"></a> [evictedkeys\_limit\_time\_aggregator](#input\_evictedkeys\_limit\_time\_aggregator) | Monitor aggregator for Redis evicted keys [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_evictedkeys_limit_timeframe"></a> [evictedkeys\_limit\_timeframe](#input\_evictedkeys\_limit\_timeframe) | Monitor timeframe for Redis evicted keys [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a Redis monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_percent_processor_time_enabled"></a> [percent\_processor\_time\_enabled](#input\_percent\_processor\_time\_enabled) | Flag to enable Redis processor monitor | `string` | `"true"` | no |
| <a name="input_percent_processor_time_extra_tags"></a> [percent\_processor\_time\_extra\_tags](#input\_percent\_processor\_time\_extra\_tags) | Extra tags for Redis processor monitor | `list(string)` | `[]` | no |
| <a name="input_percent_processor_time_message"></a> [percent\_processor\_time\_message](#input\_percent\_processor\_time\_message) | Custom message for Redis processor monitor | `string` | `""` | no |
| <a name="input_percent_processor_time_threshold_critical"></a> [percent\_processor\_time\_threshold\_critical](#input\_percent\_processor\_time\_threshold\_critical) | Processor time percent (critical threshold) | `number` | `80` | no |
| <a name="input_percent_processor_time_threshold_warning"></a> [percent\_processor\_time\_threshold\_warning](#input\_percent\_processor\_time\_threshold\_warning) | Processor time percent (warning threshold) | `number` | `60` | no |
| <a name="input_percent_processor_time_time_aggregator"></a> [percent\_processor\_time\_time\_aggregator](#input\_percent\_processor\_time\_time\_aggregator) | Monitor aggregator for Redis processor [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_percent_processor_time_timeframe"></a> [percent\_processor\_time\_timeframe](#input\_percent\_processor\_time\_timeframe) | Monitor timeframe for Redis processor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_server_load_rate_enabled"></a> [server\_load\_rate\_enabled](#input\_server\_load\_rate\_enabled) | Flag to enable Redis server load monitor | `string` | `"true"` | no |
| <a name="input_server_load_rate_extra_tags"></a> [server\_load\_rate\_extra\_tags](#input\_server\_load\_rate\_extra\_tags) | Extra tags for Redis server load monitor | `list(string)` | `[]` | no |
| <a name="input_server_load_rate_message"></a> [server\_load\_rate\_message](#input\_server\_load\_rate\_message) | Custom message for Redis server load monitor | `string` | `""` | no |
| <a name="input_server_load_rate_threshold_critical"></a> [server\_load\_rate\_threshold\_critical](#input\_server\_load\_rate\_threshold\_critical) | Server CPU load rate (critical threshold) | `number` | `90` | no |
| <a name="input_server_load_rate_threshold_warning"></a> [server\_load\_rate\_threshold\_warning](#input\_server\_load\_rate\_threshold\_warning) | Server CPU load rate (warning threshold) | `number` | `70` | no |
| <a name="input_server_load_rate_time_aggregator"></a> [server\_load\_rate\_time\_aggregator](#input\_server\_load\_rate\_time\_aggregator) | Monitor aggregator for Redis server load [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_server_load_rate_timeframe"></a> [server\_load\_rate\_timeframe](#input\_server\_load\_rate\_timeframe) | Monitor timeframe for Redis server load [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_status_enabled"></a> [status\_enabled](#input\_status\_enabled) | Flag to enable Redis status monitor | `string` | `"true"` | no |
| <a name="input_status_extra_tags"></a> [status\_extra\_tags](#input\_status\_extra\_tags) | Extra tags for Redis status monitor | `list(string)` | `[]` | no |
| <a name="input_status_message"></a> [status\_message](#input\_status\_message) | Custom message for Redis status monitor | `string` | `""` | no |
| <a name="input_status_no_data_timeframe"></a> [status\_no\_data\_timeframe](#input\_status\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_status_time_aggregator"></a> [status\_time\_aggregator](#input\_status\_time\_aggregator) | Monitor aggregator for Redis status [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_status_timeframe"></a> [status\_timeframe](#input\_status\_timeframe) | Monitor timeframe for Redis status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_evictedkeys_id"></a> [evictedkeys\_id](#output\_evictedkeys\_id) | id for monitor evictedkeys |
| <a name="output_percent_processor_time_id"></a> [percent\_processor\_time\_id](#output\_percent\_processor\_time\_id) | id for monitor percent\_processor\_time |
| <a name="output_server_load_id"></a> [server\_load\_id](#output\_server\_load\_id) | id for monitor server\_load |
| <a name="output_status_id"></a> [status\_id](#output\_status\_id) | id for monitor status |
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_redis_cache/](https://docs.datadoghq.com/integrations/azure_redis_cache/)

Azure Redis metrics documentation: [https://docs.microsoft.com/en-us/azure/redis-cache/cache-how-to-monitor](https://docs.microsoft.com/en-us/azure/redis-cache/cache-how-to-monitor)
