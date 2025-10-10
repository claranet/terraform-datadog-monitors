# CLOUD AWS MQ DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-mq" {
  source      = "claranet/monitors/datadog//cloud/aws/mq"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- AWS MQ Consumer count Low
- AWS MQ CPU Utilization High
- AWS MQ Disk Free limit High
- AWS MQ Memory Utilization High
- AWS MQ Messages ready High

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
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.consumer_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.cpu_utilization](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.disk_free_limit](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.memory_utilization](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.messages_ready](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_consumer_count_enabled"></a> [consumer\_count\_enabled](#input\_consumer\_count\_enabled) | Flag to enable monitor | `string` | `"true"` | no |
| <a name="input_consumer_count_extra_tags"></a> [consumer\_count\_extra\_tags](#input\_consumer\_count\_extra\_tags) | Extra tags for the monitor | `list(string)` | `[]` | no |
| <a name="input_consumer_count_message"></a> [consumer\_count\_message](#input\_consumer\_count\_message) | Custom message for the monitor | `string` | `""` | no |
| <a name="input_consumer_count_threshold_critical"></a> [consumer\_count\_threshold\_critical](#input\_consumer\_count\_threshold\_critical) | Critical threshold for the monitor | `string` | `1` | no |
| <a name="input_consumer_count_time_aggregator"></a> [consumer\_count\_time\_aggregator](#input\_consumer\_count\_time\_aggregator) | Monitor aggregator (min, max or avg) | `string` | `"min"` | no |
| <a name="input_consumer_count_timeframe"></a> [consumer\_count\_timeframe](#input\_consumer\_count\_timeframe) | Timeframe for the monitor | `string` | `"last_5m"` | no |
| <a name="input_cpu_utilization_enabled"></a> [cpu\_utilization\_enabled](#input\_cpu\_utilization\_enabled) | Flag to enable monitor | `string` | `"true"` | no |
| <a name="input_cpu_utilization_extra_tags"></a> [cpu\_utilization\_extra\_tags](#input\_cpu\_utilization\_extra\_tags) | Extra tags for the monitor | `list(string)` | `[]` | no |
| <a name="input_cpu_utilization_message"></a> [cpu\_utilization\_message](#input\_cpu\_utilization\_message) | Custom message for the monitor | `string` | `""` | no |
| <a name="input_cpu_utilization_threshold_critical"></a> [cpu\_utilization\_threshold\_critical](#input\_cpu\_utilization\_threshold\_critical) | Critical threshold for the monitor | `string` | `90` | no |
| <a name="input_cpu_utilization_threshold_warning"></a> [cpu\_utilization\_threshold\_warning](#input\_cpu\_utilization\_threshold\_warning) | Warning threshold for the monitor | `string` | `85` | no |
| <a name="input_cpu_utilization_time_aggregator"></a> [cpu\_utilization\_time\_aggregator](#input\_cpu\_utilization\_time\_aggregator) | Monitor aggregator (min, max or avg) | `string` | `"min"` | no |
| <a name="input_cpu_utilization_timeframe"></a> [cpu\_utilization\_timeframe](#input\_cpu\_utilization\_timeframe) | Timeframe for the monitor | `string` | `"last_5m"` | no |
| <a name="input_disk_free_limit_enabled"></a> [disk\_free\_limit\_enabled](#input\_disk\_free\_limit\_enabled) | Flag to enable monitor | `string` | `"true"` | no |
| <a name="input_disk_free_limit_extra_tags"></a> [disk\_free\_limit\_extra\_tags](#input\_disk\_free\_limit\_extra\_tags) | Extra tags for the monitor | `list(string)` | `[]` | no |
| <a name="input_disk_free_limit_message"></a> [disk\_free\_limit\_message](#input\_disk\_free\_limit\_message) | Custom message for the monitor | `string` | `""` | no |
| <a name="input_disk_free_limit_threshold_critical"></a> [disk\_free\_limit\_threshold\_critical](#input\_disk\_free\_limit\_threshold\_critical) | Critical threshold for the monitor | `string` | `90` | no |
| <a name="input_disk_free_limit_threshold_warning"></a> [disk\_free\_limit\_threshold\_warning](#input\_disk\_free\_limit\_threshold\_warning) | Warning threshold for the monitor | `string` | `85` | no |
| <a name="input_disk_free_limit_time_aggregator"></a> [disk\_free\_limit\_time\_aggregator](#input\_disk\_free\_limit\_time\_aggregator) | Monitor aggregator (min, max or avg) | `string` | `"min"` | no |
| <a name="input_disk_free_limit_timeframe"></a> [disk\_free\_limit\_timeframe](#input\_disk\_free\_limit\_timeframe) | Timeframe for the monitor | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_separator"></a> [filter\_tags\_separator](#input\_filter\_tags\_separator) | Set the filter tags separator (, or AND) | `string` | `","` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_memory_utilization_enabled"></a> [memory\_utilization\_enabled](#input\_memory\_utilization\_enabled) | Flag to enable monitor | `string` | `"true"` | no |
| <a name="input_memory_utilization_extra_tags"></a> [memory\_utilization\_extra\_tags](#input\_memory\_utilization\_extra\_tags) | Extra tags for the monitor | `list(string)` | `[]` | no |
| <a name="input_memory_utilization_message"></a> [memory\_utilization\_message](#input\_memory\_utilization\_message) | Custom message for the monitor | `string` | `""` | no |
| <a name="input_memory_utilization_threshold_critical"></a> [memory\_utilization\_threshold\_critical](#input\_memory\_utilization\_threshold\_critical) | Critical threshold for the monitor | `string` | `90` | no |
| <a name="input_memory_utilization_threshold_warning"></a> [memory\_utilization\_threshold\_warning](#input\_memory\_utilization\_threshold\_warning) | Warning threshold for the monitor | `string` | `85` | no |
| <a name="input_memory_utilization_time_aggregator"></a> [memory\_utilization\_time\_aggregator](#input\_memory\_utilization\_time\_aggregator) | Monitor aggregator (min, max or avg) | `string` | `"min"` | no |
| <a name="input_memory_utilization_timeframe"></a> [memory\_utilization\_timeframe](#input\_memory\_utilization\_timeframe) | Timeframe for the monitor | `string` | `"last_5m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_messages_ready_enabled"></a> [messages\_ready\_enabled](#input\_messages\_ready\_enabled) | Flag to enable monitor | `string` | `"true"` | no |
| <a name="input_messages_ready_extra_tags"></a> [messages\_ready\_extra\_tags](#input\_messages\_ready\_extra\_tags) | Extra tags for the monitor | `list(string)` | `[]` | no |
| <a name="input_messages_ready_message"></a> [messages\_ready\_message](#input\_messages\_ready\_message) | Custom message for the monitor | `string` | `""` | no |
| <a name="input_messages_ready_threshold_critical"></a> [messages\_ready\_threshold\_critical](#input\_messages\_ready\_threshold\_critical) | Critical threshold for the monitor | `string` | `1000` | no |
| <a name="input_messages_ready_threshold_warning"></a> [messages\_ready\_threshold\_warning](#input\_messages\_ready\_threshold\_warning) | Warning threshold for the monitor | `string` | `100` | no |
| <a name="input_messages_ready_time_aggregator"></a> [messages\_ready\_time\_aggregator](#input\_messages\_ready\_time\_aggregator) | Monitor aggregator (min, max or avg) | `string` | `"min"` | no |
| <a name="input_messages_ready_timeframe"></a> [messages\_ready\_timeframe](#input\_messages\_ready\_timeframe) | Timeframe for the monitor | `string` | `"last_5m"` | no |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | Alert severity of monitors from 1 (high) to 5 (low) | `number` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global variables | `list(string)` | <pre>[<br>  "type:cloud",<br>  "provider:aws",<br>  "resource:mq"<br>]</pre> | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `"claranet"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_consumer_count_id"></a> [consumer\_count\_id](#output\_consumer\_count\_id) | id for monitor consumer\_count |
| <a name="output_cpu_utilization_id"></a> [cpu\_utilization\_id](#output\_cpu\_utilization\_id) | id for monitor cpu\_utilization |
| <a name="output_disk_free_limit_id"></a> [disk\_free\_limit\_id](#output\_disk\_free\_limit\_id) | id for monitor disk\_free\_limit |
| <a name="output_memory_utilization_id"></a> [memory\_utilization\_id](#output\_memory\_utilization\_id) | id for monitor memory\_utilization |
| <a name="output_messages_ready_id"></a> [messages\_ready\_id](#output\_messages\_ready\_id) | id for monitor messages\_ready |
<!-- END_TF_DOCS -->
## Related documentation

