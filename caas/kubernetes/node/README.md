# CAAS KUBERNETES NODE DataDog monitors

## How to use this module

```
module "datadog-monitors-caas-kubernetes-node" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//caas/kubernetes/node?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| disk\_out\_enabled | Flag to enable Out of disk monitor | string | `"true"` | no |
| disk\_out\_extra\_tags | Extra tags for Out of disk monitor | list | `[]` | no |
| disk\_out\_message | Custom message for Out of disk monitor | string | `""` | no |
| disk\_out\_silenced | Groups to mute for Out of disk monitor | map | `{}` | no |
| disk\_out\_threshold\_warning | Out of disk monitor (warning threshold) | string | `"3"` | no |
| disk\_pressure\_enabled | Flag to enable Disk pressure monitor | string | `"true"` | no |
| disk\_pressure\_extra\_tags | Extra tags for Disk pressure monitor | list | `[]` | no |
| disk\_pressure\_message | Custom message for Disk pressure monitor | string | `""` | no |
| disk\_pressure\_silenced | Groups to mute for Disk pressure monitor | map | `{}` | no |
| disk\_pressure\_threshold\_warning | Disk pressure monitor (warning threshold) | string | `"3"` | no |
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| kubelet\_ping\_enabled | Flag to enable Kubelet ping monitor | string | `"true"` | no |
| kubelet\_ping\_extra\_tags | Extra tags for Kubelet ping monitor | list | `[]` | no |
| kubelet\_ping\_message | Custom message for Kubelet ping monitor | string | `""` | no |
| kubelet\_ping\_silenced | Groups to mute for Kubelet ping monitor | map | `{}` | no |
| kubelet\_ping\_threshold\_warning | Kubelet ping monitor (warning threshold) | string | `"3"` | no |
| kubelet\_syncloop\_enabled | Flag to enable Kubelet sync loop monitor | string | `"true"` | no |
| kubelet\_syncloop\_extra\_tags | Extra tags for Kubelet sync loop monitor | list | `[]` | no |
| kubelet\_syncloop\_message | Custom message for Kubelet sync loop monitor | string | `""` | no |
| kubelet\_syncloop\_silenced | Groups to mute for Kubelet sync loop monitor | map | `{}` | no |
| kubelet\_syncloop\_threshold\_warning | Kubelet sync loop monitor (warning threshold) | string | `"3"` | no |
| memory\_pressure\_enabled | Flag to enable Memory pressure monitor | string | `"true"` | no |
| memory\_pressure\_extra\_tags | Extra tags for Memory pressure monitor | list | `[]` | no |
| memory\_pressure\_message | Custom message for Memory pressure monitor | string | `""` | no |
| memory\_pressure\_silenced | Groups to mute for Memory pressure monitor | map | `{}` | no |
| memory\_pressure\_threshold\_warning | Memory pressure monitor (warning threshold) | string | `"3"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| node\_unschedulable\_enabled | Flag to enable node unschedulable monitor | string | `"true"` | no |
| node\_unschedulable\_extra\_tags | Extra tags for node unschedulable monitor | list | `[]` | no |
| node\_unschedulable\_message | Custom message for node unschedulable monitor | string | `""` | no |
| node\_unschedulable\_silenced | Groups to mute for node unschedulable monitor | map | `{}` | no |
| node\_unschedulable\_time\_aggregator | Monitor aggregator for node unschedulable [available values: min, max or avg] | string | `"min"` | no |
| node\_unschedulable\_timeframe | Monitor timeframe for node unschedulable [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_1h"` | no |
| ready\_enabled | Flag to enable Node ready monitor | string | `"true"` | no |
| ready\_extra\_tags | Extra tags for Node ready monitor | list | `[]` | no |
| ready\_message | Custom message for Node ready monitor | string | `""` | no |
| ready\_silenced | Groups to mute for Node ready monitor | map | `{}` | no |
| ready\_threshold\_warning | Node ready monitor (warning threshold) | string | `"3"` | no |
| unregister\_net\_device\_enabled | Flag to enable Unregister net device monitor | string | `"true"` | no |
| unregister\_net\_device\_extra\_tags | Extra tags for Unregister net device monitor | list | `[]` | no |
| unregister\_net\_device\_message | Custom message for Unregister net device monitor | string | `""` | no |
| unregister\_net\_device\_silenced | Groups to mute for Unregister net device monitor | map | `{}` | no |
| unregister\_net\_device\_threshold\_critical | Unregister net device critical threshold | string | `"3"` | no |
| unregister\_net\_device\_time\_aggregator | Monitor aggregator for Unregister net device [available values: min, max or avg] | string | `"min"` | no |
| unregister\_net\_device\_timeframe | Monitor timeframe for Unregister net device [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"15m"` | no |

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

## Related documentation

* [Datadog metrics](https://docs.datadoghq.com/agent/kubernetes/metrics/)
* [Datadog documentation](https://docs.datadoghq.com/integrations/kubernetes/)
* [Datadog Blog](https://www.datadoghq.com/blog/monitor-kubernetes-docker/)
