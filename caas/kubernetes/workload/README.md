# CAAS KUBERNETES WORKLOAD DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-caas-kubernetes-workload" {
  source      = "claranet/monitors/datadog//caas/kubernetes/workload"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kubernetes Available replicas
- Kubernetes cronjob scheduling failed
- Kubernetes Current replicas
- Kubernetes job failed
- Kubernetes Ready replicas

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
| [datadog_monitor.cronjob](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.job](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.replica_available](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.replica_current](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.replica_ready](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cronjob_enabled"></a> [cronjob\_enabled](#input\_cronjob\_enabled) | Flag to enable Cronjob monitor | `string` | `"true"` | no |
| <a name="input_cronjob_extra_tags"></a> [cronjob\_extra\_tags](#input\_cronjob\_extra\_tags) | Extra tags for Cronjob monitor | `list(string)` | `[]` | no |
| <a name="input_cronjob_message"></a> [cronjob\_message](#input\_cronjob\_message) | Custom message for Cronjob monitor | `string` | `""` | no |
| <a name="input_cronjob_threshold_warning"></a> [cronjob\_threshold\_warning](#input\_cronjob\_threshold\_warning) | Cronjob monitor (warning threshold) | `string` | `3` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `any` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_job_enabled"></a> [job\_enabled](#input\_job\_enabled) | Flag to enable Job monitor | `string` | `"true"` | no |
| <a name="input_job_extra_tags"></a> [job\_extra\_tags](#input\_job\_extra\_tags) | Extra tags for Job monitor | `list(string)` | `[]` | no |
| <a name="input_job_message"></a> [job\_message](#input\_job\_message) | Custom message for Job monitor | `string` | `""` | no |
| <a name="input_job_threshold_warning"></a> [job\_threshold\_warning](#input\_job\_threshold\_warning) | Job monitor (warning threshold) | `string` | `3` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_replica_available_enabled"></a> [replica\_available\_enabled](#input\_replica\_available\_enabled) | Flag to enable Available replica monitor | `string` | `"true"` | no |
| <a name="input_replica_available_extra_tags"></a> [replica\_available\_extra\_tags](#input\_replica\_available\_extra\_tags) | Extra tags for Available replicamonitor | `list(string)` | `[]` | no |
| <a name="input_replica_available_message"></a> [replica\_available\_message](#input\_replica\_available\_message) | Custom message for Available replica monitor | `string` | `""` | no |
| <a name="input_replica_available_threshold_critical"></a> [replica\_available\_threshold\_critical](#input\_replica\_available\_threshold\_critical) | Available replica critical threshold | `number` | `1` | no |
| <a name="input_replica_available_time_aggregator"></a> [replica\_available\_time\_aggregator](#input\_replica\_available\_time\_aggregator) | Monitor aggregator for Available replica [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_replica_available_timeframe"></a> [replica\_available\_timeframe](#input\_replica\_available\_timeframe) | Monitor timeframe for Available replica [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_replica_current_enabled"></a> [replica\_current\_enabled](#input\_replica\_current\_enabled) | Flag to enable Current replica monitor | `string` | `"true"` | no |
| <a name="input_replica_current_extra_tags"></a> [replica\_current\_extra\_tags](#input\_replica\_current\_extra\_tags) | Extra tags for Current replica monitor | `list(string)` | `[]` | no |
| <a name="input_replica_current_message"></a> [replica\_current\_message](#input\_replica\_current\_message) | Custom message for Current replica monitor | `string` | `""` | no |
| <a name="input_replica_current_threshold_critical"></a> [replica\_current\_threshold\_critical](#input\_replica\_current\_threshold\_critical) | Current replica critical threshold | `number` | `1` | no |
| <a name="input_replica_current_time_aggregator"></a> [replica\_current\_time\_aggregator](#input\_replica\_current\_time\_aggregator) | Monitor aggregator for Current replica [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_replica_current_timeframe"></a> [replica\_current\_timeframe](#input\_replica\_current\_timeframe) | Monitor timeframe for Current replica [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_replica_group_by"></a> [replica\_group\_by](#input\_replica\_group\_by) | Select group by element on monitors | `list` | <pre>[<br>  "namespace",<br>  "replicaset"<br>]</pre> | no |
| <a name="input_replica_ready_enabled"></a> [replica\_ready\_enabled](#input\_replica\_ready\_enabled) | Flag to enable Ready replica monitor | `string` | `"true"` | no |
| <a name="input_replica_ready_extra_tags"></a> [replica\_ready\_extra\_tags](#input\_replica\_ready\_extra\_tags) | Extra tags for Ready replica monitor | `list(string)` | `[]` | no |
| <a name="input_replica_ready_message"></a> [replica\_ready\_message](#input\_replica\_ready\_message) | Custom message for Ready replica monitor | `string` | `""` | no |
| <a name="input_replica_ready_threshold_critical"></a> [replica\_ready\_threshold\_critical](#input\_replica\_ready\_threshold\_critical) | Ready replica critical threshold | `number` | `1` | no |
| <a name="input_replica_ready_time_aggregator"></a> [replica\_ready\_time\_aggregator](#input\_replica\_ready\_time\_aggregator) | Monitor aggregator for Ready replica [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_replica_ready_timeframe"></a> [replica\_ready\_timeframe](#input\_replica\_ready\_timeframe) | Monitor timeframe for Ready replica [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cronjob_id"></a> [cronjob\_id](#output\_cronjob\_id) | id for monitor cronjob |
| <a name="output_job_id"></a> [job\_id](#output\_job\_id) | id for monitor job |
| <a name="output_replica_available_id"></a> [replica\_available\_id](#output\_replica\_available\_id) | id for monitor replica\_available |
| <a name="output_replica_current_id"></a> [replica\_current\_id](#output\_replica\_current\_id) | id for monitor replica\_current |
| <a name="output_replica_ready_id"></a> [replica\_ready\_id](#output\_replica\_ready\_id) | id for monitor replica\_ready |
## Related documentation

* [Datadog metrics](https://docs.datadoghq.com/agent/kubernetes/metrics/)
* [Datadog documentation](https://docs.datadoghq.com/integrations/kubernetes/)
* [Datadog Blog](https://www.datadoghq.com/blog/monitor-kubernetes-docker/)

## Requirements

* Datadog Agent > v6.6
