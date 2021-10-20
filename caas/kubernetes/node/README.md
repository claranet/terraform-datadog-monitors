# CAAS KUBERNETES NODE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-caas-kubernetes-node" {
  source      = "claranet/monitors/datadog//caas/kubernetes/node"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kubernetes Node Disk pressure
- Kubernetes Node Frequent unregister net device
- Kubernetes Node Kubelet API does not respond
- Kubernetes Node Kubelet sync loop that updates containers does not work
- Kubernetes Node Memory pressure
- Kubernetes Node not ready
- Kubernetes Node Out of disk
- Kubernetes Node unschedulable
- Kubernetes Node volume inodes usage
- Kubernetes Node volume space usage

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
| <a name="module_filter-tags-unschedulable"></a> [filter-tags-unschedulable](#module\_filter-tags-unschedulable) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.disk_out](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.disk_pressure](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.kubelet_ping](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.kubelet_syncloop](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.memory_pressure](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.node_unschedulable](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.ready](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.unregister_net_device](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.volume_inodes](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.volume_space](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disk_out_enabled"></a> [disk\_out\_enabled](#input\_disk\_out\_enabled) | Flag to enable Out of disk monitor | `string` | `"true"` | no |
| <a name="input_disk_out_extra_tags"></a> [disk\_out\_extra\_tags](#input\_disk\_out\_extra\_tags) | Extra tags for Out of disk monitor | `list(string)` | `[]` | no |
| <a name="input_disk_out_message"></a> [disk\_out\_message](#input\_disk\_out\_message) | Custom message for Out of disk monitor | `string` | `""` | no |
| <a name="input_disk_out_threshold_warning"></a> [disk\_out\_threshold\_warning](#input\_disk\_out\_threshold\_warning) | Out of disk monitor (warning threshold) | `string` | `3` | no |
| <a name="input_disk_pressure_enabled"></a> [disk\_pressure\_enabled](#input\_disk\_pressure\_enabled) | Flag to enable Disk pressure monitor | `string` | `"true"` | no |
| <a name="input_disk_pressure_extra_tags"></a> [disk\_pressure\_extra\_tags](#input\_disk\_pressure\_extra\_tags) | Extra tags for Disk pressure monitor | `list(string)` | `[]` | no |
| <a name="input_disk_pressure_message"></a> [disk\_pressure\_message](#input\_disk\_pressure\_message) | Custom message for Disk pressure monitor | `string` | `""` | no |
| <a name="input_disk_pressure_threshold_warning"></a> [disk\_pressure\_threshold\_warning](#input\_disk\_pressure\_threshold\_warning) | Disk pressure monitor (warning threshold) | `string` | `3` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `any` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_kubelet_ping_enabled"></a> [kubelet\_ping\_enabled](#input\_kubelet\_ping\_enabled) | Flag to enable Kubelet ping monitor | `string` | `"true"` | no |
| <a name="input_kubelet_ping_extra_tags"></a> [kubelet\_ping\_extra\_tags](#input\_kubelet\_ping\_extra\_tags) | Extra tags for Kubelet ping monitor | `list(string)` | `[]` | no |
| <a name="input_kubelet_ping_message"></a> [kubelet\_ping\_message](#input\_kubelet\_ping\_message) | Custom message for Kubelet ping monitor | `string` | `""` | no |
| <a name="input_kubelet_ping_no_data_timeframe"></a> [kubelet\_ping\_no\_data\_timeframe](#input\_kubelet\_ping\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_kubelet_ping_threshold_warning"></a> [kubelet\_ping\_threshold\_warning](#input\_kubelet\_ping\_threshold\_warning) | Kubelet ping monitor (warning threshold) | `string` | `3` | no |
| <a name="input_kubelet_syncloop_enabled"></a> [kubelet\_syncloop\_enabled](#input\_kubelet\_syncloop\_enabled) | Flag to enable Kubelet sync loop monitor | `string` | `"true"` | no |
| <a name="input_kubelet_syncloop_extra_tags"></a> [kubelet\_syncloop\_extra\_tags](#input\_kubelet\_syncloop\_extra\_tags) | Extra tags for Kubelet sync loop monitor | `list(string)` | `[]` | no |
| <a name="input_kubelet_syncloop_message"></a> [kubelet\_syncloop\_message](#input\_kubelet\_syncloop\_message) | Custom message for Kubelet sync loop monitor | `string` | `""` | no |
| <a name="input_kubelet_syncloop_threshold_warning"></a> [kubelet\_syncloop\_threshold\_warning](#input\_kubelet\_syncloop\_threshold\_warning) | Kubelet sync loop monitor (warning threshold) | `string` | `3` | no |
| <a name="input_memory_pressure_enabled"></a> [memory\_pressure\_enabled](#input\_memory\_pressure\_enabled) | Flag to enable Memory pressure monitor | `string` | `"true"` | no |
| <a name="input_memory_pressure_extra_tags"></a> [memory\_pressure\_extra\_tags](#input\_memory\_pressure\_extra\_tags) | Extra tags for Memory pressure monitor | `list(string)` | `[]` | no |
| <a name="input_memory_pressure_message"></a> [memory\_pressure\_message](#input\_memory\_pressure\_message) | Custom message for Memory pressure monitor | `string` | `""` | no |
| <a name="input_memory_pressure_threshold_warning"></a> [memory\_pressure\_threshold\_warning](#input\_memory\_pressure\_threshold\_warning) | Memory pressure monitor (warning threshold) | `string` | `3` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_node_unschedulable_enabled"></a> [node\_unschedulable\_enabled](#input\_node\_unschedulable\_enabled) | Flag to enable node unschedulable monitor | `string` | `"true"` | no |
| <a name="input_node_unschedulable_extra_tags"></a> [node\_unschedulable\_extra\_tags](#input\_node\_unschedulable\_extra\_tags) | Extra tags for node unschedulable monitor | `list(string)` | `[]` | no |
| <a name="input_node_unschedulable_message"></a> [node\_unschedulable\_message](#input\_node\_unschedulable\_message) | Custom message for node unschedulable monitor | `string` | `""` | no |
| <a name="input_node_unschedulable_time_aggregator"></a> [node\_unschedulable\_time\_aggregator](#input\_node\_unschedulable\_time\_aggregator) | Monitor aggregator for node unschedulable [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_node_unschedulable_timeframe"></a> [node\_unschedulable\_timeframe](#input\_node\_unschedulable\_timeframe) | Monitor timeframe for node unschedulable [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1h"` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_ready_enabled"></a> [ready\_enabled](#input\_ready\_enabled) | Flag to enable Node ready monitor | `string` | `"true"` | no |
| <a name="input_ready_extra_tags"></a> [ready\_extra\_tags](#input\_ready\_extra\_tags) | Extra tags for Node ready monitor | `list(string)` | `[]` | no |
| <a name="input_ready_message"></a> [ready\_message](#input\_ready\_message) | Custom message for Node ready monitor | `string` | `""` | no |
| <a name="input_ready_threshold_warning"></a> [ready\_threshold\_warning](#input\_ready\_threshold\_warning) | Node ready monitor (warning threshold) | `string` | `3` | no |
| <a name="input_unregister_net_device_enabled"></a> [unregister\_net\_device\_enabled](#input\_unregister\_net\_device\_enabled) | Flag to enable Unregister net device monitor | `string` | `"true"` | no |
| <a name="input_unregister_net_device_extra_tags"></a> [unregister\_net\_device\_extra\_tags](#input\_unregister\_net\_device\_extra\_tags) | Extra tags for Unregister net device monitor | `list(string)` | `[]` | no |
| <a name="input_unregister_net_device_message"></a> [unregister\_net\_device\_message](#input\_unregister\_net\_device\_message) | Custom message for Unregister net device monitor | `string` | `""` | no |
| <a name="input_unregister_net_device_threshold_critical"></a> [unregister\_net\_device\_threshold\_critical](#input\_unregister\_net\_device\_threshold\_critical) | Unregister net device critical threshold | `number` | `3` | no |
| <a name="input_unregister_net_device_time_aggregator"></a> [unregister\_net\_device\_time\_aggregator](#input\_unregister\_net\_device\_time\_aggregator) | Monitor aggregator for Unregister net device [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_unregister_net_device_timeframe"></a> [unregister\_net\_device\_timeframe](#input\_unregister\_net\_device\_timeframe) | Monitor timeframe for Unregister net device [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"15m"` | no |
| <a name="input_volume_inodes_enabled"></a> [volume\_inodes\_enabled](#input\_volume\_inodes\_enabled) | Flag to enable Volume inodes monitor | `string` | `"true"` | no |
| <a name="input_volume_inodes_extra_tags"></a> [volume\_inodes\_extra\_tags](#input\_volume\_inodes\_extra\_tags) | Extra tags for Volume inodes monitor | `list(string)` | `[]` | no |
| <a name="input_volume_inodes_message"></a> [volume\_inodes\_message](#input\_volume\_inodes\_message) | Custom message for Volume inodes monitor | `string` | `""` | no |
| <a name="input_volume_inodes_threshold_critical"></a> [volume\_inodes\_threshold\_critical](#input\_volume\_inodes\_threshold\_critical) | Volume inodes critical threshold | `number` | `95` | no |
| <a name="input_volume_inodes_threshold_warning"></a> [volume\_inodes\_threshold\_warning](#input\_volume\_inodes\_threshold\_warning) | Volume inodes warning threshold | `number` | `90` | no |
| <a name="input_volume_inodes_time_aggregator"></a> [volume\_inodes\_time\_aggregator](#input\_volume\_inodes\_time\_aggregator) | Monitor aggregator for Volume inodes [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_volume_inodes_timeframe"></a> [volume\_inodes\_timeframe](#input\_volume\_inodes\_timeframe) | Monitor timeframe for Volume inodes [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_volume_space_enabled"></a> [volume\_space\_enabled](#input\_volume\_space\_enabled) | Flag to enable Volume space monitor | `string` | `"true"` | no |
| <a name="input_volume_space_extra_tags"></a> [volume\_space\_extra\_tags](#input\_volume\_space\_extra\_tags) | Extra tags for Volume space monitor | `list(string)` | `[]` | no |
| <a name="input_volume_space_message"></a> [volume\_space\_message](#input\_volume\_space\_message) | Custom message for Volume space monitor | `string` | `""` | no |
| <a name="input_volume_space_threshold_critical"></a> [volume\_space\_threshold\_critical](#input\_volume\_space\_threshold\_critical) | Volume space critical threshold | `number` | `95` | no |
| <a name="input_volume_space_threshold_warning"></a> [volume\_space\_threshold\_warning](#input\_volume\_space\_threshold\_warning) | Volume space warning threshold | `number` | `90` | no |
| <a name="input_volume_space_time_aggregator"></a> [volume\_space\_time\_aggregator](#input\_volume\_space\_time\_aggregator) | Monitor aggregator for Volume space [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_volume_space_timeframe"></a> [volume\_space\_timeframe](#input\_volume\_space\_timeframe) | Monitor timeframe for Volume space [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_disk_out_id"></a> [disk\_out\_id](#output\_disk\_out\_id) | id for monitor disk\_out |
| <a name="output_disk_pressure_id"></a> [disk\_pressure\_id](#output\_disk\_pressure\_id) | id for monitor disk\_pressure |
| <a name="output_kubelet_ping_id"></a> [kubelet\_ping\_id](#output\_kubelet\_ping\_id) | id for monitor kubelet\_ping |
| <a name="output_kubelet_syncloop_id"></a> [kubelet\_syncloop\_id](#output\_kubelet\_syncloop\_id) | id for monitor kubelet\_syncloop |
| <a name="output_memory_pressure_id"></a> [memory\_pressure\_id](#output\_memory\_pressure\_id) | id for monitor memory\_pressure |
| <a name="output_node_unschedulable_id"></a> [node\_unschedulable\_id](#output\_node\_unschedulable\_id) | id for monitor node\_unschedulable |
| <a name="output_ready_id"></a> [ready\_id](#output\_ready\_id) | id for monitor ready |
| <a name="output_unregister_net_device_id"></a> [unregister\_net\_device\_id](#output\_unregister\_net\_device\_id) | id for monitor unregister\_net\_device |
| <a name="output_volume_inodes_id"></a> [volume\_inodes\_id](#output\_volume\_inodes\_id) | id for monitor volume\_inodes |
| <a name="output_volume_space_id"></a> [volume\_space\_id](#output\_volume\_space\_id) | id for monitor volume\_space |
## Related documentation

* [Datadog metrics](https://docs.datadoghq.com/agent/kubernetes/metrics/)
* [Datadog documentation](https://docs.datadoghq.com/integrations/kubernetes/)
* [Datadog Blog](https://www.datadoghq.com/blog/monitor-kubernetes-docker/)

## Requirements

* Datadog Agent > v6.6
