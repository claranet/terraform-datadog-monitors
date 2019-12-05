# CAAS KUBERNETES NODE DataDog monitors

## How to use this module

```
module "datadog-monitors-caas-kubernetes-node" {
  source = "claranet/monitors/datadog//caas/kubernetes/node"
  version = "{revision}"

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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| disk\_out\_enabled | Flag to enable Out of disk monitor | string | `"true"` | no |
| disk\_out\_extra\_tags | Extra tags for Out of disk monitor | list(string) | `[]` | no |
| disk\_out\_message | Custom message for Out of disk monitor | string | `""` | no |
| disk\_out\_threshold\_warning | Out of disk monitor (warning threshold) | string | `"3"` | no |
| disk\_pressure\_enabled | Flag to enable Disk pressure monitor | string | `"true"` | no |
| disk\_pressure\_extra\_tags | Extra tags for Disk pressure monitor | list(string) | `[]` | no |
| disk\_pressure\_message | Custom message for Disk pressure monitor | string | `""` | no |
| disk\_pressure\_threshold\_warning | Disk pressure monitor (warning threshold) | string | `"3"` | no |
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| kubelet\_ping\_enabled | Flag to enable Kubelet ping monitor | string | `"true"` | no |
| kubelet\_ping\_extra\_tags | Extra tags for Kubelet ping monitor | list(string) | `[]` | no |
| kubelet\_ping\_message | Custom message for Kubelet ping monitor | string | `""` | no |
| kubelet\_ping\_threshold\_warning | Kubelet ping monitor (warning threshold) | string | `"3"` | no |
| kubelet\_syncloop\_enabled | Flag to enable Kubelet sync loop monitor | string | `"true"` | no |
| kubelet\_syncloop\_extra\_tags | Extra tags for Kubelet sync loop monitor | list(string) | `[]` | no |
| kubelet\_syncloop\_message | Custom message for Kubelet sync loop monitor | string | `""` | no |
| kubelet\_syncloop\_threshold\_warning | Kubelet sync loop monitor (warning threshold) | string | `"3"` | no |
| memory\_pressure\_enabled | Flag to enable Memory pressure monitor | string | `"true"` | no |
| memory\_pressure\_extra\_tags | Extra tags for Memory pressure monitor | list(string) | `[]` | no |
| memory\_pressure\_message | Custom message for Memory pressure monitor | string | `""` | no |
| memory\_pressure\_threshold\_warning | Memory pressure monitor (warning threshold) | string | `"3"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| node\_unschedulable\_enabled | Flag to enable node unschedulable monitor | string | `"true"` | no |
| node\_unschedulable\_extra\_tags | Extra tags for node unschedulable monitor | list(string) | `[]` | no |
| node\_unschedulable\_message | Custom message for node unschedulable monitor | string | `""` | no |
| node\_unschedulable\_time\_aggregator | Monitor aggregator for node unschedulable [available values: min, max or avg] | string | `"min"` | no |
| node\_unschedulable\_timeframe | Monitor timeframe for node unschedulable [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_1h"` | no |
| notify\_no\_data | Will raise no data alert if set to true | string | `"true"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| ready\_enabled | Flag to enable Node ready monitor | string | `"true"` | no |
| ready\_extra\_tags | Extra tags for Node ready monitor | list(string) | `[]` | no |
| ready\_message | Custom message for Node ready monitor | string | `""` | no |
| ready\_threshold\_warning | Node ready monitor (warning threshold) | string | `"3"` | no |
| unregister\_net\_device\_enabled | Flag to enable Unregister net device monitor | string | `"true"` | no |
| unregister\_net\_device\_extra\_tags | Extra tags for Unregister net device monitor | list(string) | `[]` | no |
| unregister\_net\_device\_message | Custom message for Unregister net device monitor | string | `""` | no |
| unregister\_net\_device\_threshold\_critical | Unregister net device critical threshold | string | `"3"` | no |
| unregister\_net\_device\_time\_aggregator | Monitor aggregator for Unregister net device [available values: min, max or avg] | string | `"min"` | no |
| unregister\_net\_device\_timeframe | Monitor timeframe for Unregister net device [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"15m"` | no |
| volume\_inodes\_enabled | Flag to enable Volume inodes monitor | string | `"true"` | no |
| volume\_inodes\_extra\_tags | Extra tags for Volume inodes monitor | list(string) | `[]` | no |
| volume\_inodes\_message | Custom message for Volume inodes monitor | string | `""` | no |
| volume\_inodes\_threshold\_critical | Volume inodes critical threshold | string | `"95"` | no |
| volume\_inodes\_threshold\_warning | Volume inodes warning threshold | string | `"90"` | no |
| volume\_inodes\_time\_aggregator | Monitor aggregator for Volume inodes [available values: min, max or avg] | string | `"min"` | no |
| volume\_inodes\_timeframe | Monitor timeframe for Volume inodes [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| volume\_space\_enabled | Flag to enable Volume space monitor | string | `"true"` | no |
| volume\_space\_extra\_tags | Extra tags for Volume space monitor | list(string) | `[]` | no |
| volume\_space\_message | Custom message for Volume space monitor | string | `""` | no |
| volume\_space\_threshold\_critical | Volume space critical threshold | string | `"95"` | no |
| volume\_space\_threshold\_warning | Volume space warning threshold | string | `"90"` | no |
| volume\_space\_time\_aggregator | Monitor aggregator for Volume space [available values: min, max or avg] | string | `"min"` | no |
| volume\_space\_timeframe | Monitor timeframe for Volume space [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| disk\_out\_id | id for monitor disk_out |
| disk\_pressure\_id | id for monitor disk_pressure |
| kubelet\_ping\_id | id for monitor kubelet_ping |
| kubelet\_syncloop\_id | id for monitor kubelet_syncloop |
| memory\_pressure\_id | id for monitor memory_pressure |
| node\_unschedulable\_id | id for monitor node_unschedulable |
| ready\_id | id for monitor ready |
| unregister\_net\_device\_id | id for monitor unregister_net_device |
| volume\_inodes\_id | id for monitor volume_inodes |
| volume\_space\_id | id for monitor volume_space |

## Related documentation

* [Datadog metrics](https://docs.datadoghq.com/agent/kubernetes/metrics/)
* [Datadog documentation](https://docs.datadoghq.com/integrations/kubernetes/)
* [Datadog Blog](https://www.datadoghq.com/blog/monitor-kubernetes-docker/)

## Requirements

* Datadog Agent > v6.6
