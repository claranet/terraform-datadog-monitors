# CLOUD GCP GCE INSTANCE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-gcp-gce-instance" {
  source      = "claranet/monitors/datadog//cloud/gcp/gce/instance"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Compute Engine instance CPU Utilization
- Compute Engine instance Disk Throttled Bps
- Compute Engine instance Disk Throttled OPS

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

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.cpu_utilization](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.disk_throttled_bps](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.disk_throttled_ops](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu_utilization_enabled"></a> [cpu\_utilization\_enabled](#input\_cpu\_utilization\_enabled) | Flag to enable CPU Utilization monitor | `string` | `"true"` | no |
| <a name="input_cpu_utilization_extra_tags"></a> [cpu\_utilization\_extra\_tags](#input\_cpu\_utilization\_extra\_tags) | Extra tags for CPU Utilization monitor | `list(string)` | `[]` | no |
| <a name="input_cpu_utilization_message"></a> [cpu\_utilization\_message](#input\_cpu\_utilization\_message) | Custom message for the CPU Utilization monitor | `string` | `""` | no |
| <a name="input_cpu_utilization_no_data_timeframe"></a> [cpu\_utilization\_no\_data\_timeframe](#input\_cpu\_utilization\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `30` | no |
| <a name="input_cpu_utilization_threshold_critical"></a> [cpu\_utilization\_threshold\_critical](#input\_cpu\_utilization\_threshold\_critical) | CPU Utilization in percentage (critical threshold) | `string` | `90` | no |
| <a name="input_cpu_utilization_threshold_warning"></a> [cpu\_utilization\_threshold\_warning](#input\_cpu\_utilization\_threshold\_warning) | CPU Utilization in percentage (warning threshold) | `string` | `80` | no |
| <a name="input_cpu_utilization_time_aggregator"></a> [cpu\_utilization\_time\_aggregator](#input\_cpu\_utilization\_time\_aggregator) | Time aggregator for the CPU Utilization monitor | `string` | `"avg"` | no |
| <a name="input_cpu_utilization_timeframe"></a> [cpu\_utilization\_timeframe](#input\_cpu\_utilization\_timeframe) | Timeframe for the CPU Utilization monitor | `string` | `"last_15m"` | no |
| <a name="input_disk_throttled_bps_enabled"></a> [disk\_throttled\_bps\_enabled](#input\_disk\_throttled\_bps\_enabled) | Flag to enable Disk Throttled Bps monitor | `string` | `"true"` | no |
| <a name="input_disk_throttled_bps_extra_tags"></a> [disk\_throttled\_bps\_extra\_tags](#input\_disk\_throttled\_bps\_extra\_tags) | Extra tags for Disk Throttled Bps monitor | `list(string)` | `[]` | no |
| <a name="input_disk_throttled_bps_message"></a> [disk\_throttled\_bps\_message](#input\_disk\_throttled\_bps\_message) | Custom message for the Disk Throttled Bps monitor | `string` | `""` | no |
| <a name="input_disk_throttled_bps_threshold_critical"></a> [disk\_throttled\_bps\_threshold\_critical](#input\_disk\_throttled\_bps\_threshold\_critical) | Disk Throttled Bps in percentage (critical threshold) | `string` | `50` | no |
| <a name="input_disk_throttled_bps_threshold_warning"></a> [disk\_throttled\_bps\_threshold\_warning](#input\_disk\_throttled\_bps\_threshold\_warning) | Disk Throttled Bps in percentage (warning threshold) | `string` | `30` | no |
| <a name="input_disk_throttled_bps_time_aggregator"></a> [disk\_throttled\_bps\_time\_aggregator](#input\_disk\_throttled\_bps\_time\_aggregator) | Time aggregator for the Disk Throttled Bps monitor | `string` | `"min"` | no |
| <a name="input_disk_throttled_bps_timeframe"></a> [disk\_throttled\_bps\_timeframe](#input\_disk\_throttled\_bps\_timeframe) | Timeframe for the Disk Throttled Bps monitor | `string` | `"last_15m"` | no |
| <a name="input_disk_throttled_ops_enabled"></a> [disk\_throttled\_ops\_enabled](#input\_disk\_throttled\_ops\_enabled) | Flag to enable Disk Throttled OPS monitor | `string` | `"true"` | no |
| <a name="input_disk_throttled_ops_extra_tags"></a> [disk\_throttled\_ops\_extra\_tags](#input\_disk\_throttled\_ops\_extra\_tags) | Extra tags for Disk Throttled OPS monitor | `list(string)` | `[]` | no |
| <a name="input_disk_throttled_ops_message"></a> [disk\_throttled\_ops\_message](#input\_disk\_throttled\_ops\_message) | Custom message for the Disk Throttled OPS monitor | `string` | `""` | no |
| <a name="input_disk_throttled_ops_threshold_critical"></a> [disk\_throttled\_ops\_threshold\_critical](#input\_disk\_throttled\_ops\_threshold\_critical) | Disk Throttled OPS in percentage (critical threshold) | `string` | `50` | no |
| <a name="input_disk_throttled_ops_threshold_warning"></a> [disk\_throttled\_ops\_threshold\_warning](#input\_disk\_throttled\_ops\_threshold\_warning) | Disk Throttled OPS in percentage (warning threshold) | `string` | `30` | no |
| <a name="input_disk_throttled_ops_time_aggregator"></a> [disk\_throttled\_ops\_time\_aggregator](#input\_disk\_throttled\_ops\_time\_aggregator) | Time aggregator for the Disk Throttled OPS monitor | `string` | `"min"` | no |
| <a name="input_disk_throttled_ops_timeframe"></a> [disk\_throttled\_ops\_timeframe](#input\_disk\_throttled\_ops\_timeframe) | Timeframe for the Disk Throttled OPS monitor | `string` | `"last_15m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags"></a> [filter\_tags](#input\_filter\_tags) | Tags used for filtering | `string` | `"*"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds for the new host evaluation | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global variables | `list(string)` | <pre>[<br>  "type:cloud",<br>  "provider:gcp",<br>  "resource:gce-instance"<br>]</pre> | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `"claranet"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cpu_utilization_id"></a> [cpu\_utilization\_id](#output\_cpu\_utilization\_id) | id for monitor cpu\_utilization |
| <a name="output_disk_throttled_bps_id"></a> [disk\_throttled\_bps\_id](#output\_disk\_throttled\_bps\_id) | id for monitor disk\_throttled\_bps |
| <a name="output_disk_throttled_ops_id"></a> [disk\_throttled\_ops\_id](#output\_disk\_throttled\_ops\_id) | id for monitor disk\_throttled\_ops |
<!-- END_TF_DOCS -->
## Related documentation

* [Datadog GCE Instance metrics](https://www.datadoghq.com/blog/monitoring-google-compute-engine-performance/#instance-metrics)
* [GCP Maximum OPS and Bps by device type and size](https://cloud.google.com/compute/docs/disks/)
