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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.system_memory_usage_ratio](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags"></a> [filter\_tags](#input\_filter\_tags) | Tags used for filtering | `string` | `"*"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds for the new host evaluation | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_system_memory_usage_ratio_enabled"></a> [system\_memory\_usage\_ratio\_enabled](#input\_system\_memory\_usage\_ratio\_enabled) | Flag to enable GCP Memorystore Redis System memory usage ratio monitor | `string` | `"true"` | no |
| <a name="input_system_memory_usage_ratio_extra_tags"></a> [system\_memory\_usage\_ratio\_extra\_tags](#input\_system\_memory\_usage\_ratio\_extra\_tags) | Extra tags for GCP Memorystore Redis System memory usage ratio monitor | `list(string)` | `[]` | no |
| <a name="input_system_memory_usage_ratio_message"></a> [system\_memory\_usage\_ratio\_message](#input\_system\_memory\_usage\_ratio\_message) | Custom message for Memorystore Redis System memory usage ratio monitor | `string` | `""` | no |
| <a name="input_system_memory_usage_ratio_no_data_timeframe"></a> [system\_memory\_usage\_ratio\_no\_data\_timeframe](#input\_system\_memory\_usage\_ratio\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `20` | no |
| <a name="input_system_memory_usage_ratio_threshold_critical"></a> [system\_memory\_usage\_ratio\_threshold\_critical](#input\_system\_memory\_usage\_ratio\_threshold\_critical) | Memorystore Redis System memory usage ratio critical threshold | `string` | `90` | no |
| <a name="input_system_memory_usage_ratio_threshold_warning"></a> [system\_memory\_usage\_ratio\_threshold\_warning](#input\_system\_memory\_usage\_ratio\_threshold\_warning) | Memorystore Redis System memory usage ratio warning threshold | `string` | `80` | no |
| <a name="input_system_memory_usage_ratio_time_aggregator"></a> [system\_memory\_usage\_ratio\_time\_aggregator](#input\_system\_memory\_usage\_ratio\_time\_aggregator) | Time aggregator for Memorystore Redis System memory usage ratio monitor | `string` | `"min"` | no |
| <a name="input_system_memory_usage_ratio_timeframe"></a> [system\_memory\_usage\_ratio\_timeframe](#input\_system\_memory\_usage\_ratio\_timeframe) | Timeframe for Memorystore Redis System memory usage ratio monitor | `string` | `"last_10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_system_memory_usage_ratio_id"></a> [system\_memory\_usage\_ratio\_id](#output\_system\_memory\_usage\_ratio\_id) | id for monitor system\_memory\_usage\_ratio |
## Related documentation

* [GCP Metrics for Memorystore Redis](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-redis)
* [Datadog integration for GCP Memorystore Redis](https://docs.datadoghq.com/integrations/google_cloud_redis/)
* [Memory management best practices](https://cloud.google.com/memorystore/docs/redis/memory-management-best-practices#monitor_your_instances_memory_usage)
* [Monitoring System memory usage ratio](https://cloud.google.com/memorystore/docs/redis/memory-management-best-practices#system_memory_usage_ratio_2)
