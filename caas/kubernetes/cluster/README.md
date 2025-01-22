# CAAS KUBERNETES CLUSTER DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-caas-kubernetes-cluster" {
  source      = "claranet/monitors/datadog//caas/kubernetes/cluster"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kubernetes API server does not respond on {{kube_cluster_name}} (disabled by default)
- Kubernetes cluster heartbeat alert on {{kube_cluster_name}}

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
| [datadog_monitor.apiserver](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.heartbeat](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apiserver_enabled"></a> [apiserver\_enabled](#input\_apiserver\_enabled) | Flag to enable API server monitor | `string` | `"false"` | no |
| <a name="input_apiserver_extra_tags"></a> [apiserver\_extra\_tags](#input\_apiserver\_extra\_tags) | Extra tags for API server monitor | `list(string)` | `[]` | no |
| <a name="input_apiserver_message"></a> [apiserver\_message](#input\_apiserver\_message) | Custom message for API server monitor | `string` | `""` | no |
| <a name="input_apiserver_no_data_timeframe"></a> [apiserver\_no\_data\_timeframe](#input\_apiserver\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_apiserver_threshold_warning"></a> [apiserver\_threshold\_warning](#input\_apiserver\_threshold\_warning) | API server monitor (warning threshold) | `string` | `3` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_separator"></a> [filter\_tags\_separator](#input\_filter\_tags\_separator) | Set the filter tags separator (, or AND) | `string` | `","` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_heartbeat_enabled"></a> [heartbeat\_enabled](#input\_heartbeat\_enabled) | Flag to enable heartbeat monitor | `string` | `"true"` | no |
| <a name="input_heartbeat_extra_tags"></a> [heartbeat\_extra\_tags](#input\_heartbeat\_extra\_tags) | Extra tags for heartbeat monitor | `list(string)` | `[]` | no |
| <a name="input_heartbeat_message"></a> [heartbeat\_message](#input\_heartbeat\_message) | Custom message for heartbeat monitor | `string` | `""` | no |
| <a name="input_heartbeat_no_data_timeframe"></a> [heartbeat\_no\_data\_timeframe](#input\_heartbeat\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `20` | no |
| <a name="input_heartbeat_time_aggregator"></a> [heartbeat\_time\_aggregator](#input\_heartbeat\_time\_aggregator) | Time aggregator for heartbeat monitor | `string` | `"min"` | no |
| <a name="input_heartbeat_timeframe"></a> [heartbeat\_timeframe](#input\_heartbeat\_timeframe) | Timeframe for heartbeat monitor | `string` | `"last_30m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global variables | `list(string)` | <pre>[<br>  "type:caas",<br>  "provider:kubernetes",<br>  "resource:kubernetes-node"<br>]</pre> | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `"claranet"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_apiserver_id"></a> [apiserver\_id](#output\_apiserver\_id) | id for monitor apiserver |
| <a name="output_heartbeat_id"></a> [heartbeat\_id](#output\_heartbeat\_id) | id for monitor heartbeat |
<!-- END_TF_DOCS -->
## Related documentation

* [Datadog metrics](https://docs.datadoghq.com/agent/kubernetes/metrics/)
* [Datadog documentation](https://docs.datadoghq.com/integrations/kubernetes/)
* [Datadog Blog](https://www.datadoghq.com/blog/monitor-kubernetes-docker/)

## Requirements

* Datadog Agent > v6.6
