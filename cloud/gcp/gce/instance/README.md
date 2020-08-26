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

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cpu\_utilization\_enabled | Flag to enable CPU Utilization monitor | `string` | `"true"` | no |
| cpu\_utilization\_extra\_tags | Extra tags for CPU Utilization monitor | `list(string)` | `[]` | no |
| cpu\_utilization\_message | Custom message for the CPU Utilization monitor | `string` | `""` | no |
| cpu\_utilization\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `30` | no |
| cpu\_utilization\_threshold\_critical | CPU Utilization in percentage (critical threshold) | `string` | `90` | no |
| cpu\_utilization\_threshold\_warning | CPU Utilization in percentage (warning threshold) | `string` | `80` | no |
| cpu\_utilization\_time\_aggregator | Time aggregator for the CPU Utilization monitor | `string` | `"avg"` | no |
| cpu\_utilization\_timeframe | Timeframe for the CPU Utilization monitor | `string` | `"last_15m"` | no |
| disk\_throttled\_bps\_enabled | Flag to enable Disk Throttled Bps monitor | `string` | `"true"` | no |
| disk\_throttled\_bps\_extra\_tags | Extra tags for Disk Throttled Bps monitor | `list(string)` | `[]` | no |
| disk\_throttled\_bps\_message | Custom message for the Disk Throttled Bps monitor | `string` | `""` | no |
| disk\_throttled\_bps\_threshold\_critical | Disk Throttled Bps in percentage (critical threshold) | `string` | `50` | no |
| disk\_throttled\_bps\_threshold\_warning | Disk Throttled Bps in percentage (warning threshold) | `string` | `30` | no |
| disk\_throttled\_bps\_time\_aggregator | Time aggregator for the Disk Throttled Bps monitor | `string` | `"min"` | no |
| disk\_throttled\_bps\_timeframe | Timeframe for the Disk Throttled Bps monitor | `string` | `"last_15m"` | no |
| disk\_throttled\_ops\_enabled | Flag to enable Disk Throttled OPS monitor | `string` | `"true"` | no |
| disk\_throttled\_ops\_extra\_tags | Extra tags for Disk Throttled OPS monitor | `list(string)` | `[]` | no |
| disk\_throttled\_ops\_message | Custom message for the Disk Throttled OPS monitor | `string` | `""` | no |
| disk\_throttled\_ops\_threshold\_critical | Disk Throttled OPS in percentage (critical threshold) | `string` | `50` | no |
| disk\_throttled\_ops\_threshold\_warning | Disk Throttled OPS in percentage (warning threshold) | `string` | `30` | no |
| disk\_throttled\_ops\_time\_aggregator | Time aggregator for the Disk Throttled OPS monitor | `string` | `"min"` | no |
| disk\_throttled\_ops\_timeframe | Timeframe for the Disk Throttled OPS monitor | `string` | `"last_15m"` | no |
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags | Tags used for filtering | `string` | `"*"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds for the new host evaluation | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| cpu\_utilization\_id | id for monitor cpu\_utilization |
| disk\_throttled\_bps\_id | id for monitor disk\_throttled\_bps |
| disk\_throttled\_ops\_id | id for monitor disk\_throttled\_ops |

## Related documentation

* [Datadog GCE Instance metrics](https://www.datadoghq.com/blog/monitoring-google-compute-engine-performance/#instance-metrics)
* [GCP Maximum OPS and Bps by device type and size](https://cloud.google.com/compute/docs/disks/)
