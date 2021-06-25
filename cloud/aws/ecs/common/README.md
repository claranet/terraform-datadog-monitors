# CLOUD AWS ECS COMMON DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-ecs-common" {
  source      = "claranet/monitors/datadog//cloud/aws/ecs/common"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- ECS Service CPU Utilization High (disabled by default)
- ECS Service Memory Utilization High (disabled by default)
- ECS Service not healthy enough

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.1.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.service_cpu_utilization](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.service_memory_utilization](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.service_missing_tasks](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags"></a> [filter\_tags](#input\_filter\_tags) | Tags used for filtering | `string` | `"*"` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_service_cpu_utilization_enabled"></a> [service\_cpu\_utilization\_enabled](#input\_service\_cpu\_utilization\_enabled) | Flag to enable Service CPU Utilization monitor | `string` | `"false"` | no |
| <a name="input_service_cpu_utilization_extra_tags"></a> [service\_cpu\_utilization\_extra\_tags](#input\_service\_cpu\_utilization\_extra\_tags) | Extra tags for Service CPU Utilization monitor | `list(string)` | `[]` | no |
| <a name="input_service_cpu_utilization_message"></a> [service\_cpu\_utilization\_message](#input\_service\_cpu\_utilization\_message) | Custom message for the Service CPU Utilization monitor | `string` | `""` | no |
| <a name="input_service_cpu_utilization_threshold_critical"></a> [service\_cpu\_utilization\_threshold\_critical](#input\_service\_cpu\_utilization\_threshold\_critical) | Critical threshold for the Service CPU Utilization monitor | `string` | `"90"` | no |
| <a name="input_service_cpu_utilization_threshold_warning"></a> [service\_cpu\_utilization\_threshold\_warning](#input\_service\_cpu\_utilization\_threshold\_warning) | Warning threshold for the Service CPU Utilization monitor | `string` | `"80"` | no |
| <a name="input_service_cpu_utilization_time_aggregator"></a> [service\_cpu\_utilization\_time\_aggregator](#input\_service\_cpu\_utilization\_time\_aggregator) | Monitor aggregator for Service CPU Utilization [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_service_cpu_utilization_timeframe"></a> [service\_cpu\_utilization\_timeframe](#input\_service\_cpu\_utilization\_timeframe) | Timeframe for the Service CPU Utilization monitor | `string` | `"last_5m"` | no |
| <a name="input_service_memory_utilization_enabled"></a> [service\_memory\_utilization\_enabled](#input\_service\_memory\_utilization\_enabled) | Flag to enable Service Memory Utilization monitor | `string` | `"false"` | no |
| <a name="input_service_memory_utilization_extra_tags"></a> [service\_memory\_utilization\_extra\_tags](#input\_service\_memory\_utilization\_extra\_tags) | Extra tags for Service Memory Utilization monitor | `list(string)` | `[]` | no |
| <a name="input_service_memory_utilization_message"></a> [service\_memory\_utilization\_message](#input\_service\_memory\_utilization\_message) | Custom message for the Service Memory Utilization monitor | `string` | `""` | no |
| <a name="input_service_memory_utilization_threshold_critical"></a> [service\_memory\_utilization\_threshold\_critical](#input\_service\_memory\_utilization\_threshold\_critical) | Critical threshold for the Service Memory Utilization monitor | `string` | `90` | no |
| <a name="input_service_memory_utilization_threshold_warning"></a> [service\_memory\_utilization\_threshold\_warning](#input\_service\_memory\_utilization\_threshold\_warning) | Warning threshold for the Service Memory Utilization monitor | `string` | `85` | no |
| <a name="input_service_memory_utilization_time_aggregator"></a> [service\_memory\_utilization\_time\_aggregator](#input\_service\_memory\_utilization\_time\_aggregator) | Monitor aggregator for Service Memory Utilization [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_service_memory_utilization_timeframe"></a> [service\_memory\_utilization\_timeframe](#input\_service\_memory\_utilization\_timeframe) | Timeframe for the Service Memory Utilization monitor | `string` | `"last_5m"` | no |
| <a name="input_service_missing_tasks_enabled"></a> [service\_missing\_tasks\_enabled](#input\_service\_missing\_tasks\_enabled) | Flag to enable Service Missing Tasks monitor | `string` | `"true"` | no |
| <a name="input_service_missing_tasks_extra_tags"></a> [service\_missing\_tasks\_extra\_tags](#input\_service\_missing\_tasks\_extra\_tags) | Extra tags for Service Missing Tasks monitor | `list(string)` | `[]` | no |
| <a name="input_service_missing_tasks_message"></a> [service\_missing\_tasks\_message](#input\_service\_missing\_tasks\_message) | Custom message for the Service Missing Tasks monitor | `string` | `""` | no |
| <a name="input_service_missing_tasks_threshold_critical"></a> [service\_missing\_tasks\_threshold\_critical](#input\_service\_missing\_tasks\_threshold\_critical) | Critical threshold for the Service Missing Tasks monitor | `string` | `60` | no |
| <a name="input_service_missing_tasks_threshold_warning"></a> [service\_missing\_tasks\_threshold\_warning](#input\_service\_missing\_tasks\_threshold\_warning) | Warning threshold for the Service Missing Tasks monitor | `string` | `80` | no |
| <a name="input_service_missing_tasks_time_aggregator"></a> [service\_missing\_tasks\_time\_aggregator](#input\_service\_missing\_tasks\_time\_aggregator) | Monitor aggregator for Service Missing Tasks [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_service_missing_tasks_timeframe"></a> [service\_missing\_tasks\_timeframe](#input\_service\_missing\_tasks\_timeframe) | Timeframe for the Service Missing Tasks monitor | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_cpu_utilization_id"></a> [service\_cpu\_utilization\_id](#output\_service\_cpu\_utilization\_id) | id for monitor service\_cpu\_utilization |
| <a name="output_service_memory_utilization_id"></a> [service\_memory\_utilization\_id](#output\_service\_memory\_utilization\_id) | id for monitor service\_memory\_utilization |
| <a name="output_service_missing_tasks_id"></a> [service\_missing\_tasks\_id](#output\_service\_missing\_tasks\_id) | id for monitor service\_missing\_tasks |
## Related documentation

