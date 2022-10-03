# CLOUD AWS ECS FARGATE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-ecs-fargate" {
  source      = "claranet/monitors/datadog//cloud/aws/ecs/fargate"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Fargate CPU Utilization High (disabled by default)
- Fargate memory Utilization High (disabled by default)
- Fargate service does not respond.

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
| [datadog_monitor.cpu_utilization](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.memory_utilization](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.service_check](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu_utilization_enabled"></a> [cpu\_utilization\_enabled](#input\_cpu\_utilization\_enabled) | Flag to enable monitor | `string` | `"false"` | no |
| <a name="input_cpu_utilization_extra_tags"></a> [cpu\_utilization\_extra\_tags](#input\_cpu\_utilization\_extra\_tags) | Extra tags for the monitor | `list(string)` | `[]` | no |
| <a name="input_cpu_utilization_message"></a> [cpu\_utilization\_message](#input\_cpu\_utilization\_message) | Custom message for the monitor | `string` | `""` | no |
| <a name="input_cpu_utilization_threshold_critical"></a> [cpu\_utilization\_threshold\_critical](#input\_cpu\_utilization\_threshold\_critical) | Critical threshold for the monitor | `string` | `90` | no |
| <a name="input_cpu_utilization_threshold_warning"></a> [cpu\_utilization\_threshold\_warning](#input\_cpu\_utilization\_threshold\_warning) | Warning threshold for the monitor | `string` | `85` | no |
| <a name="input_cpu_utilization_time_aggregator"></a> [cpu\_utilization\_time\_aggregator](#input\_cpu\_utilization\_time\_aggregator) | Monitor aggregator (min, max or avg) | `string` | `"min"` | no |
| <a name="input_cpu_utilization_timeframe"></a> [cpu\_utilization\_timeframe](#input\_cpu\_utilization\_timeframe) | Timeframe for the monitor | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_separator"></a> [filter\_tags\_separator](#input\_filter\_tags\_separator) | Set the filter tags separator (, or AND) | `string` | `","` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `bool` | `true` | no |
| <a name="input_memory_utilization_enabled"></a> [memory\_utilization\_enabled](#input\_memory\_utilization\_enabled) | Flag to enable Fargate Memory utilization monitor | `string` | `"false"` | no |
| <a name="input_memory_utilization_extra_tags"></a> [memory\_utilization\_extra\_tags](#input\_memory\_utilization\_extra\_tags) | Extra tags for Fargate Memory utilization monitor | `list(string)` | `[]` | no |
| <a name="input_memory_utilization_message"></a> [memory\_utilization\_message](#input\_memory\_utilization\_message) | Custom message for the Fargate Memory Utilization monitor | `string` | `""` | no |
| <a name="input_memory_utilization_threshold_critical"></a> [memory\_utilization\_threshold\_critical](#input\_memory\_utilization\_threshold\_critical) | Critical threshold for the Fargate Memory Utilization monitor | `string` | `90` | no |
| <a name="input_memory_utilization_threshold_warning"></a> [memory\_utilization\_threshold\_warning](#input\_memory\_utilization\_threshold\_warning) | Warning threshold for the Fargate Memory Utilization monitor | `string` | `85` | no |
| <a name="input_memory_utilization_time_aggregator"></a> [memory\_utilization\_time\_aggregator](#input\_memory\_utilization\_time\_aggregator) | Monitor aggregator for Fargate Memory Utilization [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_memory_utilization_timeframe"></a> [memory\_utilization\_timeframe](#input\_memory\_utilization\_timeframe) | Timeframe for the Fargate Memory Utilization monitor | `string` | `"last_5m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `string` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_service_check_enabled"></a> [service\_check\_enabled](#input\_service\_check\_enabled) | Flag to enable monitor | `bool` | `true` | no |
| <a name="input_service_check_extra_tags"></a> [service\_check\_extra\_tags](#input\_service\_check\_extra\_tags) | Extra tags for the monitor | `list(string)` | `[]` | no |
| <a name="input_service_check_message"></a> [service\_check\_message](#input\_service\_check\_message) | Custom message for the monitor | `string` | `""` | no |
| <a name="input_service_check_no_data_timeframe"></a> [service\_check\_no\_data\_timeframe](#input\_service\_check\_no\_data\_timeframe) | No data timeframe in minutes | `number` | `10` | no |
| <a name="input_service_check_threshold_warning"></a> [service\_check\_threshold\_warning](#input\_service\_check\_threshold\_warning) | Warning threshold | `number` | `3` | no |
| <a name="input_service_group_by"></a> [service\_group\_by](#input\_service\_group\_by) | Service check grouping by | `string` | `"*"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cpu_utilization_id"></a> [cpu\_utilization\_id](#output\_cpu\_utilization\_id) | id for monitor cpu\_utilization |
| <a name="output_memory_utilization_id"></a> [memory\_utilization\_id](#output\_memory\_utilization\_id) | id for monitor memory\_utilization |
| <a name="output_service_check_id"></a> [service\_check\_id](#output\_service\_check\_id) | id for monitor service\_check |
<!-- END_TF_DOCS -->
## Related documentation

[Official DataDog documentation on ECS Fargate](https://docs.datadoghq.com/integrations/ecs_fargate/)

### Specific configuration due to agent limitations

CPU & memory monitors will be usable only when deploying datadog agent as a sidecar in task definitions.

In order to avoid clutter on monitors, datadog agent & ECS internal containers are always excluded from filtering to be on par with Kubernetes way of work. A bug is [currently opened](https://github.com/DataDog/datadog-agent/issues/2722) on agent repository on this matter.
