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
- Kubernetes DaemonSet {{kube_daemon_set}} not ready on {{kube_cluster_name}}
- Kubernetes Deployment {{kube_deployment}} replica too low on {{kube_cluster_name}}
- Kubernetes HPA cannot scale out further {{horizontalpodautoscaler}} on {{kube_cluster_name}}
- Kubernetes job failed
- Kubernetes Pod Disruption Budget {{poddisruptionbudget}} not respected on {{kube_cluster_name}}
- Kubernetes Ready replicas
- Kubernetes StatefulSet {{kube_stateful_set}} not ready on {{kube_cluster_name}}

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
| [datadog_monitor.cronjob](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.daemonset_pods_not_ready](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.deployments_replica_too_low](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.hpa_cannot_scaleup_further](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.job](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.pod_disruption_budget_not_respected](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.replica_available](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.replica_current](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.replica_ready](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.statefulset_pods_not_ready](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cronjob_enabled"></a> [cronjob\_enabled](#input\_cronjob\_enabled) | Flag to enable Cronjob monitor | `string` | `"true"` | no |
| <a name="input_cronjob_extra_tags"></a> [cronjob\_extra\_tags](#input\_cronjob\_extra\_tags) | Extra tags for Cronjob monitor | `list(string)` | `[]` | no |
| <a name="input_cronjob_message"></a> [cronjob\_message](#input\_cronjob\_message) | Custom message for Cronjob monitor | `string` | `""` | no |
| <a name="input_cronjob_threshold_warning"></a> [cronjob\_threshold\_warning](#input\_cronjob\_threshold\_warning) | Cronjob monitor (warning threshold) | `string` | `3` | no |
| <a name="input_cronjobfailed_group_by"></a> [cronjobfailed\_group\_by](#input\_cronjobfailed\_group\_by) | n/a | `list` | <pre>[<br>  "kube_cronjob"<br>]</pre> | no |
| <a name="input_daemonset_pods_not_ready_enabled"></a> [daemonset\_pods\_not\_ready\_enabled](#input\_daemonset\_pods\_not\_ready\_enabled) | Flag to enable DaemonSet pods not ready monitor | `string` | `"true"` | no |
| <a name="input_daemonset_pods_not_ready_extra_tags"></a> [daemonset\_pods\_not\_ready\_extra\_tags](#input\_daemonset\_pods\_not\_ready\_extra\_tags) | Extra tags for DaemonSet pods not ready monitor | `list(string)` | `[]` | no |
| <a name="input_daemonset_pods_not_ready_message"></a> [daemonset\_pods\_not\_ready\_message](#input\_daemonset\_pods\_not\_ready\_message) | Custom message for DaemonSet pods not ready monitor | `string` | `""` | no |
| <a name="input_daemonset_pods_not_ready_threshold_critical"></a> [daemonset\_pods\_not\_ready\_threshold\_critical](#input\_daemonset\_pods\_not\_ready\_threshold\_critical) | DaemonSet pods not ready critical threshold | `number` | `1` | no |
| <a name="input_daemonset_pods_not_ready_time_aggregator"></a> [daemonset\_pods\_not\_ready\_time\_aggregator](#input\_daemonset\_pods\_not\_ready\_time\_aggregator) | Monitor aggregator for DaemonSet pods not ready [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_daemonset_pods_not_ready_timeframe"></a> [daemonset\_pods\_not\_ready\_timeframe](#input\_daemonset\_pods\_not\_ready\_timeframe) | Monitor timeframe for DaemonSet pods not ready [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_30m"` | no |
| <a name="input_deployment_group_by"></a> [deployment\_group\_by](#input\_deployment\_group\_by) | Select group by element on deployment monitors | `list` | <pre>[<br>  "kube_namespace",<br>  "kube_deployment",<br>  "kube_cluster_name"<br>]</pre> | no |
| <a name="input_deployments_replica_too_low_enabled"></a> [deployments\_replica\_too\_low\_enabled](#input\_deployments\_replica\_too\_low\_enabled) | Flag to enable Deployment replica too low monitor | `string` | `"true"` | no |
| <a name="input_deployments_replica_too_low_extra_tags"></a> [deployments\_replica\_too\_low\_extra\_tags](#input\_deployments\_replica\_too\_low\_extra\_tags) | Extra tags for Deployment replica too low monitor | `list(string)` | `[]` | no |
| <a name="input_deployments_replica_too_low_message"></a> [deployments\_replica\_too\_low\_message](#input\_deployments\_replica\_too\_low\_message) | Custom message for Deployment replica too low monitor | `string` | `""` | no |
| <a name="input_deployments_replica_too_low_threshold_critical"></a> [deployments\_replica\_too\_low\_threshold\_critical](#input\_deployments\_replica\_too\_low\_threshold\_critical) | Deployment replica too low critical threshold | `number` | `0` | no |
| <a name="input_deployments_replica_too_low_time_aggregator"></a> [deployments\_replica\_too\_low\_time\_aggregator](#input\_deployments\_replica\_too\_low\_time\_aggregator) | Monitor aggregator for Deployment replica too low [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_deployments_replica_too_low_timeframe"></a> [deployments\_replica\_too\_low\_timeframe](#input\_deployments\_replica\_too\_low\_timeframe) | Monitor timeframe for Deployment replica too low [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_separator"></a> [filter\_tags\_separator](#input\_filter\_tags\_separator) | Set the filter tags separator (, or AND) | `string` | `","` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_hpa_cannot_scaleup_further_enabled"></a> [hpa\_cannot\_scaleup\_further\_enabled](#input\_hpa\_cannot\_scaleup\_further\_enabled) | Flag to enable HPA cannot scale up further monitor | `string` | `"true"` | no |
| <a name="input_hpa_cannot_scaleup_further_extra_tags"></a> [hpa\_cannot\_scaleup\_further\_extra\_tags](#input\_hpa\_cannot\_scaleup\_further\_extra\_tags) | Extra tags for HPA cannot scale up further monitor | `list(string)` | `[]` | no |
| <a name="input_hpa_cannot_scaleup_further_message"></a> [hpa\_cannot\_scaleup\_further\_message](#input\_hpa\_cannot\_scaleup\_further\_message) | Custom message for HPA cannot scale up further monitor | `string` | `""` | no |
| <a name="input_hpa_cannot_scaleup_further_threshold_critical"></a> [hpa\_cannot\_scaleup\_further\_threshold\_critical](#input\_hpa\_cannot\_scaleup\_further\_threshold\_critical) | HPA cannot scale up further critical threshold | `number` | `100` | no |
| <a name="input_hpa_cannot_scaleup_further_threshold_warning"></a> [hpa\_cannot\_scaleup\_further\_threshold\_warning](#input\_hpa\_cannot\_scaleup\_further\_threshold\_warning) | HPA cannot scale up further warning threshold | `number` | `90` | no |
| <a name="input_hpa_cannot_scaleup_further_time_aggregator"></a> [hpa\_cannot\_scaleup\_further\_time\_aggregator](#input\_hpa\_cannot\_scaleup\_further\_time\_aggregator) | Monitor aggregator for HPA cannot scale up further [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_hpa_cannot_scaleup_further_timeframe"></a> [hpa\_cannot\_scaleup\_further\_timeframe](#input\_hpa\_cannot\_scaleup\_further\_timeframe) | Monitor timeframe for HPA cannot scale up further [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_30m"` | no |
| <a name="input_job_enabled"></a> [job\_enabled](#input\_job\_enabled) | Flag to enable Job monitor | `string` | `"true"` | no |
| <a name="input_job_extra_tags"></a> [job\_extra\_tags](#input\_job\_extra\_tags) | Extra tags for Job monitor | `list(string)` | `[]` | no |
| <a name="input_job_message"></a> [job\_message](#input\_job\_message) | Custom message for Job monitor | `string` | `""` | no |
| <a name="input_job_threshold_warning"></a> [job\_threshold\_warning](#input\_job\_threshold\_warning) | Job monitor (warning threshold) | `string` | `3` | no |
| <a name="input_jobfailed_group_by"></a> [jobfailed\_group\_by](#input\_jobfailed\_group\_by) | n/a | `list` | <pre>[<br>  "kube_job",<br>  "kube_cluster_name"<br>]</pre> | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_pod_disruption_budget_not_respected_enabled"></a> [pod\_disruption\_budget\_not\_respected\_enabled](#input\_pod\_disruption\_budget\_not\_respected\_enabled) | Flag to enable Pod Disruption Budget not respected monitor | `string` | `"true"` | no |
| <a name="input_pod_disruption_budget_not_respected_extra_tags"></a> [pod\_disruption\_budget\_not\_respected\_extra\_tags](#input\_pod\_disruption\_budget\_not\_respected\_extra\_tags) | Extra tags for Pod Disruption Budget not respected monitor | `list(string)` | `[]` | no |
| <a name="input_pod_disruption_budget_not_respected_message"></a> [pod\_disruption\_budget\_not\_respected\_message](#input\_pod\_disruption\_budget\_not\_respected\_message) | Custom message for Pod Disruption Budget not respected monitor | `string` | `""` | no |
| <a name="input_pod_disruption_budget_not_respected_threshold_critical"></a> [pod\_disruption\_budget\_not\_respected\_threshold\_critical](#input\_pod\_disruption\_budget\_not\_respected\_threshold\_critical) | Pod Disruption Budget not respected critical threshold | `number` | `0` | no |
| <a name="input_pod_disruption_budget_not_respected_time_aggregator"></a> [pod\_disruption\_budget\_not\_respected\_time\_aggregator](#input\_pod\_disruption\_budget\_not\_respected\_time\_aggregator) | Monitor aggregator for Pod Disruption Budget not respected [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_pod_disruption_budget_not_respected_timeframe"></a> [pod\_disruption\_budget\_not\_respected\_timeframe](#input\_pod\_disruption\_budget\_not\_respected\_timeframe) | Monitor timeframe for Pod Disruption Budget not respected [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
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
| <a name="input_replica_group_by"></a> [replica\_group\_by](#input\_replica\_group\_by) | Select group by element on replicaset monitors | `list` | <pre>[<br>  "kube_namespace",<br>  "kube_replica_set",<br>  "kube_cluster_name"<br>]</pre> | no |
| <a name="input_replica_ready_enabled"></a> [replica\_ready\_enabled](#input\_replica\_ready\_enabled) | Flag to enable Ready replica monitor | `string` | `"true"` | no |
| <a name="input_replica_ready_extra_tags"></a> [replica\_ready\_extra\_tags](#input\_replica\_ready\_extra\_tags) | Extra tags for Ready replica monitor | `list(string)` | `[]` | no |
| <a name="input_replica_ready_message"></a> [replica\_ready\_message](#input\_replica\_ready\_message) | Custom message for Ready replica monitor | `string` | `""` | no |
| <a name="input_replica_ready_threshold_critical"></a> [replica\_ready\_threshold\_critical](#input\_replica\_ready\_threshold\_critical) | Ready replica critical threshold | `number` | `1` | no |
| <a name="input_replica_ready_time_aggregator"></a> [replica\_ready\_time\_aggregator](#input\_replica\_ready\_time\_aggregator) | Monitor aggregator for Ready replica [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_replica_ready_timeframe"></a> [replica\_ready\_timeframe](#input\_replica\_ready\_timeframe) | Monitor timeframe for Ready replica [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_statefulset_pods_not_ready_enabled"></a> [statefulset\_pods\_not\_ready\_enabled](#input\_statefulset\_pods\_not\_ready\_enabled) | Flag to enable StatefulSet pods not ready monitor | `string` | `"true"` | no |
| <a name="input_statefulset_pods_not_ready_extra_tags"></a> [statefulset\_pods\_not\_ready\_extra\_tags](#input\_statefulset\_pods\_not\_ready\_extra\_tags) | Extra tags for StatefulSet pods not ready monitor | `list(string)` | `[]` | no |
| <a name="input_statefulset_pods_not_ready_message"></a> [statefulset\_pods\_not\_ready\_message](#input\_statefulset\_pods\_not\_ready\_message) | Custom message for StatefulSet pods not ready monitor | `string` | `""` | no |
| <a name="input_statefulset_pods_not_ready_threshold_critical"></a> [statefulset\_pods\_not\_ready\_threshold\_critical](#input\_statefulset\_pods\_not\_ready\_threshold\_critical) | StatefulSet pods not ready critical threshold | `number` | `100` | no |
| <a name="input_statefulset_pods_not_ready_time_aggregator"></a> [statefulset\_pods\_not\_ready\_time\_aggregator](#input\_statefulset\_pods\_not\_ready\_time\_aggregator) | Monitor aggregator for StatefulSet pods not ready [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_statefulset_pods_not_ready_timeframe"></a> [statefulset\_pods\_not\_ready\_timeframe](#input\_statefulset\_pods\_not\_ready\_timeframe) | Monitor timeframe for StatefulSet pods not ready [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global variables | `list(string)` | <pre>[<br>  "type:caas",<br>  "provider:kubernetes",<br>  "resource:kubernetes-workload"<br>]</pre> | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `"claranet"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cronjob_id"></a> [cronjob\_id](#output\_cronjob\_id) | id for monitor cronjob |
| <a name="output_daemonset_pods_not_ready_id"></a> [daemonset\_pods\_not\_ready\_id](#output\_daemonset\_pods\_not\_ready\_id) | id for monitor daemonset\_pods\_not\_ready |
| <a name="output_deployments_replica_too_low_id"></a> [deployments\_replica\_too\_low\_id](#output\_deployments\_replica\_too\_low\_id) | id for monitor deployments\_replica\_too\_low |
| <a name="output_hpa_cannot_scaleup_further_id"></a> [hpa\_cannot\_scaleup\_further\_id](#output\_hpa\_cannot\_scaleup\_further\_id) | id for monitor hpa\_cannot\_scaleup\_further |
| <a name="output_job_id"></a> [job\_id](#output\_job\_id) | id for monitor job |
| <a name="output_pod_disruption_budget_not_respected_id"></a> [pod\_disruption\_budget\_not\_respected\_id](#output\_pod\_disruption\_budget\_not\_respected\_id) | id for monitor pod\_disruption\_budget\_not\_respected |
| <a name="output_replica_available_id"></a> [replica\_available\_id](#output\_replica\_available\_id) | id for monitor replica\_available |
| <a name="output_replica_current_id"></a> [replica\_current\_id](#output\_replica\_current\_id) | id for monitor replica\_current |
| <a name="output_replica_ready_id"></a> [replica\_ready\_id](#output\_replica\_ready\_id) | id for monitor replica\_ready |
| <a name="output_statefulset_pods_not_ready_id"></a> [statefulset\_pods\_not\_ready\_id](#output\_statefulset\_pods\_not\_ready\_id) | id for monitor statefulset\_pods\_not\_ready |
<!-- END_TF_DOCS -->
## Related documentation

* [Datadog metrics](https://docs.datadoghq.com/agent/kubernetes/metrics/)
* [Datadog documentation](https://docs.datadoghq.com/integrations/kubernetes/)
* [Datadog Blog](https://www.datadoghq.com/blog/monitor-kubernetes-docker/)

## Requirements

* Datadog Agent > v6.6
