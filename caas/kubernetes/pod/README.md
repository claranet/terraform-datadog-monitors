# CAAS KUBERNETES POD DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-caas-kubernetes-pod" {
  source      = "claranet/monitors/datadog//caas/kubernetes/pod"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kubernetes Pod phase status failed
- Kubernetes Pod terminated abnormally
- Kubernetes Pod waiting errors

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
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-nocontainercreating"></a> [filter-tags-nocontainercreating](#module\_filter-tags-nocontainercreating) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-phase"></a> [filter-tags-phase](#module\_filter-tags-phase) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.error](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.pod_phase_status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.terminated](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `any` | n/a | yes |
| <a name="input_error_enabled"></a> [error\_enabled](#input\_error\_enabled) | Flag to enable Pod errors monitor | `string` | `"true"` | no |
| <a name="input_error_extra_tags"></a> [error\_extra\_tags](#input\_error\_extra\_tags) | Extra tags for Pod errors monitor | `list(string)` | `[]` | no |
| <a name="input_error_message"></a> [error\_message](#input\_error\_message) | Custom message for Pod errors monitor | `string` | `""` | no |
| <a name="input_error_threshold_critical"></a> [error\_threshold\_critical](#input\_error\_threshold\_critical) | error critical threshold | `number` | `0.5` | no |
| <a name="input_error_threshold_warning"></a> [error\_threshold\_warning](#input\_error\_threshold\_warning) | error warning threshold | `number` | `0` | no |
| <a name="input_error_time_aggregator"></a> [error\_time\_aggregator](#input\_error\_time\_aggregator) | Monitor aggregator for Pod errors [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_error_timeframe"></a> [error\_timeframe](#input\_error\_timeframe) | Monitor timeframe for Pod errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_pod_phase_status_enabled"></a> [pod\_phase\_status\_enabled](#input\_pod\_phase\_status\_enabled) | Flag to enable Pod phase status monitor | `string` | `"true"` | no |
| <a name="input_pod_phase_status_extra_tags"></a> [pod\_phase\_status\_extra\_tags](#input\_pod\_phase\_status\_extra\_tags) | Extra tags for Pod phase status monitor | `list(string)` | `[]` | no |
| <a name="input_pod_phase_status_message"></a> [pod\_phase\_status\_message](#input\_pod\_phase\_status\_message) | Custom message for Pod phase status monitor | `string` | `""` | no |
| <a name="input_pod_phase_status_time_aggregator"></a> [pod\_phase\_status\_time\_aggregator](#input\_pod\_phase\_status\_time\_aggregator) | Monitor aggregator for Pod phase status [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_pod_phase_status_timeframe"></a> [pod\_phase\_status\_timeframe](#input\_pod\_phase\_status\_timeframe) | Monitor timeframe for Pod phase status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_terminated_enabled"></a> [terminated\_enabled](#input\_terminated\_enabled) | Flag to enable Pod terminated monitor | `string` | `"true"` | no |
| <a name="input_terminated_extra_tags"></a> [terminated\_extra\_tags](#input\_terminated\_extra\_tags) | Extra tags for Pod terminated monitor | `list(string)` | `[]` | no |
| <a name="input_terminated_message"></a> [terminated\_message](#input\_terminated\_message) | Custom message for Pod terminated monitor | `string` | `""` | no |
| <a name="input_terminated_threshold_critical"></a> [terminated\_threshold\_critical](#input\_terminated\_threshold\_critical) | terminated critical threshold | `number` | `0.5` | no |
| <a name="input_terminated_threshold_warning"></a> [terminated\_threshold\_warning](#input\_terminated\_threshold\_warning) | terminated warning threshold | `number` | `0` | no |
| <a name="input_terminated_time_aggregator"></a> [terminated\_time\_aggregator](#input\_terminated\_time\_aggregator) | Monitor aggregator for Pod terminated [available values: min, max or avg] | `string` | `"sum"` | no |
| <a name="input_terminated_timeframe"></a> [terminated\_timeframe](#input\_terminated\_timeframe) | Monitor timeframe for Pod terminated [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_error_id"></a> [error\_id](#output\_error\_id) | id for monitor error |
| <a name="output_pod_phase_status_id"></a> [pod\_phase\_status\_id](#output\_pod\_phase\_status\_id) | id for monitor pod\_phase\_status |
| <a name="output_terminated_id"></a> [terminated\_id](#output\_terminated\_id) | id for monitor terminated |
## Related documentation

* [Datadog metrics](https://docs.datadoghq.com/agent/kubernetes/metrics/)
* [Datadog documentation](https://docs.datadoghq.com/integrations/kubernetes/)
* [Datadog Blog](https://www.datadoghq.com/blog/monitor-kubernetes-docker/)

## Requirements

* Datadog Agent > v7.2
