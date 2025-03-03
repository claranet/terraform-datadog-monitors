# CLOUD AWS ECS EC2-CLUSTER DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-ecs-ec2-cluster" {
  source      = "claranet/monitors/datadog//cloud/aws/ecs/ec2-cluster"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- ECS Agent disconnected
- ECS Cluster CPU Utilization High (disabled by default)
- ECS Cluster Memory Reservation High (disabled by default)

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
| [datadog_monitor.cluster_cpu_utilization](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.cluster_memory_reservation](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.ecs_agent_status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agent_status_enabled"></a> [agent\_status\_enabled](#input\_agent\_status\_enabled) | Flag to enable Agent Status monitor | `string` | `"true"` | no |
| <a name="input_agent_status_extra_tags"></a> [agent\_status\_extra\_tags](#input\_agent\_status\_extra\_tags) | Extra tags for Agent Status monitor | `list(string)` | `[]` | no |
| <a name="input_agent_status_message"></a> [agent\_status\_message](#input\_agent\_status\_message) | Custom message for the Agent Status monitor | `string` | `""` | no |
| <a name="input_agent_status_no_data_timeframe"></a> [agent\_status\_no\_data\_timeframe](#input\_agent\_status\_no\_data\_timeframe) | Agent status does not respond monitor no data timeframe | `string` | `10` | no |
| <a name="input_agent_status_threshold_warning"></a> [agent\_status\_threshold\_warning](#input\_agent\_status\_threshold\_warning) | Warning threshold for the Agent Status monitor | `string` | `3` | no |
| <a name="input_cluster_cpu_utilization_enabled"></a> [cluster\_cpu\_utilization\_enabled](#input\_cluster\_cpu\_utilization\_enabled) | Flag to enable Cluster CPU utilization monitor | `string` | `"false"` | no |
| <a name="input_cluster_cpu_utilization_extra_tags"></a> [cluster\_cpu\_utilization\_extra\_tags](#input\_cluster\_cpu\_utilization\_extra\_tags) | Extra tags for Cluster CPU utilization monitor | `list(string)` | `[]` | no |
| <a name="input_cluster_cpu_utilization_message"></a> [cluster\_cpu\_utilization\_message](#input\_cluster\_cpu\_utilization\_message) | Custom message for the Cluster CPU Utilization monitor | `string` | `""` | no |
| <a name="input_cluster_cpu_utilization_threshold_critical"></a> [cluster\_cpu\_utilization\_threshold\_critical](#input\_cluster\_cpu\_utilization\_threshold\_critical) | Critical threshold for the Cluster CPU Utilization monitor | `string` | `90` | no |
| <a name="input_cluster_cpu_utilization_threshold_warning"></a> [cluster\_cpu\_utilization\_threshold\_warning](#input\_cluster\_cpu\_utilization\_threshold\_warning) | Warning threshold for the Cluster CPU Utilization monitor | `string` | `85` | no |
| <a name="input_cluster_cpu_utilization_time_aggregator"></a> [cluster\_cpu\_utilization\_time\_aggregator](#input\_cluster\_cpu\_utilization\_time\_aggregator) | Monitor aggregator for Cluster CPU Utilization [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_cluster_cpu_utilization_timeframe"></a> [cluster\_cpu\_utilization\_timeframe](#input\_cluster\_cpu\_utilization\_timeframe) | Timeframe for the Cluster CPU Utilization monitor | `string` | `"last_5m"` | no |
| <a name="input_cluster_memory_reservation_enabled"></a> [cluster\_memory\_reservation\_enabled](#input\_cluster\_memory\_reservation\_enabled) | Flag to enable Cluster memory reservation monitor | `string` | `"false"` | no |
| <a name="input_cluster_memory_reservation_extra_tags"></a> [cluster\_memory\_reservation\_extra\_tags](#input\_cluster\_memory\_reservation\_extra\_tags) | Extra tags for Cluster Memory Reservation monitor | `list(string)` | `[]` | no |
| <a name="input_cluster_memory_reservation_message"></a> [cluster\_memory\_reservation\_message](#input\_cluster\_memory\_reservation\_message) | Custom message for the Cluster Memory Reservation monitor | `string` | `""` | no |
| <a name="input_cluster_memory_reservation_threshold_critical"></a> [cluster\_memory\_reservation\_threshold\_critical](#input\_cluster\_memory\_reservation\_threshold\_critical) | Critical threshold for the Cluster Memory Reservation monitor | `string` | `90` | no |
| <a name="input_cluster_memory_reservation_threshold_warning"></a> [cluster\_memory\_reservation\_threshold\_warning](#input\_cluster\_memory\_reservation\_threshold\_warning) | Warning threshold for the Cluster Memory Reservation monitor | `string` | `85` | no |
| <a name="input_cluster_memory_reservation_time_aggregator"></a> [cluster\_memory\_reservation\_time\_aggregator](#input\_cluster\_memory\_reservation\_time\_aggregator) | Monitor aggregator for Cluster Memory Reservation [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_cluster_memory_reservation_timeframe"></a> [cluster\_memory\_reservation\_timeframe](#input\_cluster\_memory\_reservation\_timeframe) | Timeframe for the Cluster Memory Reservation monitor | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | Alert severity of monitors from 1 (high) to 5 (low) | `number` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global variables | `list(string)` | <pre>[<br>  "type:cloud",<br>  "provider:aws",<br>  "resource:ecs",<br>  "category:agent"<br>]</pre> | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `"claranet"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_cpu_utilization_id"></a> [cluster\_cpu\_utilization\_id](#output\_cluster\_cpu\_utilization\_id) | id for monitor cluster\_cpu\_utilization |
| <a name="output_cluster_memory_reservation_id"></a> [cluster\_memory\_reservation\_id](#output\_cluster\_memory\_reservation\_id) | id for monitor cluster\_memory\_reservation |
| <a name="output_ecs_agent_status_id"></a> [ecs\_agent\_status\_id](#output\_ecs\_agent\_status\_id) | id for monitor ecs\_agent\_status |
<!-- END_TF_DOCS -->
## Related documentation

