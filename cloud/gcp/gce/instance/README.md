# CLOUD GCP GCE INSTANCE DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-gcp-gce-instance" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//cloud/gcp/gce/instance?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Compute Engine instance CPU Utilization
- Compute Engine instance Disk Throttled Bps

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu\_utilization\_enabled | Flag to enable CPU Utilization monitor | string | `"true"` | no |
| cpu\_utilization\_extra\_tags | Extra tags for CPU Utilization monitor | list(string) | `[]` | no |
| cpu\_utilization\_message | Custom message for the CPU Utilization monitor | string | `""` | no |
| cpu\_utilization\_threshold\_critical | CPU Utilization in percentage (critical threshold) | string | `"90"` | no |
| cpu\_utilization\_threshold\_warning | CPU Utilization in percentage (warning threshold) | string | `"80"` | no |
| cpu\_utilization\_time\_aggregator | Time aggregator for the CPU Utilization monitor | string | `"avg"` | no |
| cpu\_utilization\_timeframe | Timeframe for the CPU Utilization monitor | string | `"last_15m"` | no |
| disk\_throttled\_bps\_enabled | Flag to enable Disk Throttled Bps monitor | string | `"true"` | no |
| disk\_throttled\_bps\_extra\_tags | Extra tags for Disk Throttled Bps monitor | list(string) | `[]` | no |
| disk\_throttled\_bps\_message | Custom message for the Disk Throttled Bps monitor | string | `""` | no |
| disk\_throttled\_bps\_notify\_no\_data | Flag to enable notification for no data on Disk Throttled Bps monitor | string | `"false"` | no |
| disk\_throttled\_bps\_threshold\_critical | Disk Throttled Bps in percentage (critical threshold) | string | `"50"` | no |
| disk\_throttled\_bps\_threshold\_warning | Disk Throttled Bps in percentage (warning threshold) | string | `"30"` | no |
| disk\_throttled\_bps\_time\_aggregator | Time aggregator for the Disk Throttled Bps monitor | string | `"min"` | no |
| disk\_throttled\_bps\_timeframe | Timeframe for the Disk Throttled Bps monitor | string | `"last_15m"` | no |
| disk\_throttled\_ops\_enabled | Flag to enable Disk Throttled OPS monitor | string | `"true"` | no |
| disk\_throttled\_ops\_extra\_tags | Extra tags for Disk Throttled OPS monitor | list(string) | `[]` | no |
| disk\_throttled\_ops\_message | Custom message for the Disk Throttled OPS monitor | string | `""` | no |
| disk\_throttled\_ops\_notify\_no\_data | Flag to enable notification for no data on Disk Throttled OPS monitor | string | `"false"` | no |
| disk\_throttled\_ops\_threshold\_critical | Disk Throttled OPS in percentage (critical threshold) | string | `"50"` | no |
| disk\_throttled\_ops\_threshold\_warning | Disk Throttled OPS in percentage (warning threshold) | string | `"30"` | no |
| disk\_throttled\_ops\_time\_aggregator | Time aggregator for the Disk Throttled OPS monitor | string | `"min"` | no |
| disk\_throttled\_ops\_timeframe | Timeframe for the Disk Throttled OPS monitor | string | `"last_15m"` | no |
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags | Tags used for filtering | string | `"*"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds for the new host evaluation | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| cpu\_utilization\_id | id for monitor cpu_utilization |
| disk\_throttled\_bps\_id | id for monitor disk_throttled_bps |
| disk\_throttled\_ops\_id | id for monitor disk_throttled_ops |

## Related documentation

* [Datadog GCE Instance metrics](https://www.datadoghq.com/blog/monitoring-google-compute-engine-performance/#instance-metrics)
* [GCP Maximum OPS and Bps by device type and size](https://cloud.google.com/compute/docs/disks/)
