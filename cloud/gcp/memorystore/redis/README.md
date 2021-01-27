# CLOUD GCP MEMORYSTORE REDIS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-gcp-memorystore-redis" {
  source      = "claranet/monitors/datadog//cloud/gcp/memorystore/redis"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Memorystore Redis system memory usage ratio

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags | Tags used for filtering | `string` | `"*"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds for the new host evaluation | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| system\_memory\_usage\_ratio\_enabled | Flag to enable GCP Memorystore Redis System memory usage ratio monitor | `string` | `"true"` | no |
| system\_memory\_usage\_ratio\_extra\_tags | Extra tags for GCP Memorystore Redis System memory usage ratio monitor | `list(string)` | `[]` | no |
| system\_memory\_usage\_ratio\_message | Custom message for Memorystore Redis System memory usage ratio monitor | `string` | `""` | no |
| system\_memory\_usage\_ratio\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `20` | no |
| system\_memory\_usage\_ratio\_threshold\_critical | Memorystore Redis System memory usage ratio critical threshold | `string` | `90` | no |
| system\_memory\_usage\_ratio\_threshold\_warning | Memorystore Redis System memory usage ratio warning threshold | `string` | `80` | no |
| system\_memory\_usage\_ratio\_time\_aggregator | Time aggregator for Memorystore Redis System memory usage ratio monitor | `string` | `"min"` | no |
| system\_memory\_usage\_ratio\_timeframe | Timeframe for Memorystore Redis System memory usage ratio monitor | `string` | `"last_10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| system\_memory\_usage\_ratio\_id | id for monitor system\_memory\_usage\_ratio |

## Related documentation

* [GCP Metrics for Memorystore Redis](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-redis)
* [Datadog integration for GCP Memorystore Redis](https://docs.datadoghq.com/integrations/google_cloud_redis/)
* [Memory management best practices](https://cloud.google.com/memorystore/docs/redis/memory-management-best-practices#monitor_your_instances_memory_usage)
* [Monitoring System memory usage ratio](https://cloud.google.com/memorystore/docs/redis/memory-management-best-practices#system_memory_usage_ratio_2)
