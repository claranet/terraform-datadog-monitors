# DATABASE ZOOKEEPER DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-zookeeper" {
  source      = "claranet/monitors/datadog//database/zookeeper"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Zookeeper latency
- Zookeeper service does not respond

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
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.datadog_monitor_zookeeper_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.not_responding](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before begin to monitor new host | `number` | `300` | no |
| <a name="input_not_responding_group_by"></a> [not\_responding\_group\_by](#input\_not\_responding\_group\_by) | List of tags to use to group data | `list(string)` | <pre>[<br>  "host",<br>  "server"<br>]</pre> | no |
| <a name="input_not_responding_no_data_timeframe"></a> [not\_responding\_no\_data\_timeframe](#input\_not\_responding\_no\_data\_timeframe) | Zookeeper monitor no\_data\_timeframe | `number` | `10` | no |
| <a name="input_not_responding_notify_no_data"></a> [not\_responding\_notify\_no\_data](#input\_not\_responding\_notify\_no\_data) | Send notification if not\_responding monitor does not retrieve data | `bool` | `true` | no |
| <a name="input_not_responding_threshold_warning"></a> [not\_responding\_threshold\_warning](#input\_not\_responding\_threshold\_warning) | Zookeeper not responding limit (warning threshold) | `number` | `3` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_zookeeper_latency_availability_extra_tags"></a> [zookeeper\_latency\_availability\_extra\_tags](#input\_zookeeper\_latency\_availability\_extra\_tags) | Extra tags for zookeeper read latency monitor | `list(string)` | `[]` | no |
| <a name="input_zookeeper_latency_enabled"></a> [zookeeper\_latency\_enabled](#input\_zookeeper\_latency\_enabled) | Flag to enable Zookeeper read latency monitor | `string` | `"true"` | no |
| <a name="input_zookeeper_latency_group_by"></a> [zookeeper\_latency\_group\_by](#input\_zookeeper\_latency\_group\_by) | Tags to use to group datas | `list(string)` | <pre>[<br>  "host"<br>]</pre> | no |
| <a name="input_zookeeper_latency_status_message"></a> [zookeeper\_latency\_status\_message](#input\_zookeeper\_latency\_status\_message) | Custom message for Zookeeper read latency monitor | `string` | `""` | no |
| <a name="input_zookeeper_latency_threshold_critical"></a> [zookeeper\_latency\_threshold\_critical](#input\_zookeeper\_latency\_threshold\_critical) | Maximum critical acceptable ms of zookeeper latency monitor | `number` | `300000` | no |
| <a name="input_zookeeper_latency_threshold_warning"></a> [zookeeper\_latency\_threshold\_warning](#input\_zookeeper\_latency\_threshold\_warning) | Maximum warning acceptable ms of zookeeper latency monitor | `number` | `250000` | no |
| <a name="input_zookeeper_latency_time_aggregator"></a> [zookeeper\_latency\_time\_aggregator](#input\_zookeeper\_latency\_time\_aggregator) | Monitor time aggregator for Zookeeper read latency monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_zookeeper_latency_timeframe"></a> [zookeeper\_latency\_timeframe](#input\_zookeeper\_latency\_timeframe) | Monitor timeframe for Zookeeper read latency monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_zookeeper_not_responding_enabled"></a> [zookeeper\_not\_responding\_enabled](#input\_zookeeper\_not\_responding\_enabled) | Flag to enable Zookeeper does not respond monitor | `string` | `"true"` | no |
| <a name="input_zookeeper_not_responding_extra_tags"></a> [zookeeper\_not\_responding\_extra\_tags](#input\_zookeeper\_not\_responding\_extra\_tags) | Extra tags for Zookeeper does not respond monitor | `list(string)` | `[]` | no |
| <a name="input_zookeeper_not_responding_message"></a> [zookeeper\_not\_responding\_message](#input\_zookeeper\_not\_responding\_message) | Custom message for Zookeeper does not respond monitor | `string` | `""` | no |
| <a name="input_zookeeper_not_responding_time_aggregator"></a> [zookeeper\_not\_responding\_time\_aggregator](#input\_zookeeper\_not\_responding\_time\_aggregator) | Time aggregator for the Zookeeper does not respond monitor | `string` | `"avg"` | no |
| <a name="input_zookeeper_not_responding_timeframe"></a> [zookeeper\_not\_responding\_timeframe](#input\_zookeeper\_not\_responding\_timeframe) | Timeframe for the does not respond monitor | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_datadog_monitor_zookeeper_latency_id"></a> [datadog\_monitor\_zookeeper\_latency\_id](#output\_datadog\_monitor\_zookeeper\_latency\_id) | id for monitor datadog\_monitor\_zookeeper\_latency |
| <a name="output_not_responding_id"></a> [not\_responding\_id](#output\_not\_responding\_id) | id for monitor not\_responding |
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/zk/](https://docs.datadoghq.com/integrations/zk/)
