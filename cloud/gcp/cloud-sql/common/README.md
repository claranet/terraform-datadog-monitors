# CLOUD GCP CLOUD-SQL COMMON DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-gcp-cloud-sql-common" {
  source      = "claranet/monitors/datadog//cloud/gcp/cloud-sql/common"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Cloud SQL CPU Utilization
- Cloud SQL Disk Utilization
- Cloud SQL Disk Utilization forecast
- Cloud SQL Failover Unavailable
- Cloud SQL Memory Utilization
- Cloud SQL Memory Utilization forecast (disabled by default)

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
| [datadog_monitor.disk_utilization](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.disk_utilization_forecast](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.failover_unavailable](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.memory_utilization](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.memory_utilization_forecast](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu_utilization_enabled"></a> [cpu\_utilization\_enabled](#input\_cpu\_utilization\_enabled) | Flag to enable GCP Cloud SQL CPU Utilization monitor | `string` | `"true"` | no |
| <a name="input_cpu_utilization_extra_tags"></a> [cpu\_utilization\_extra\_tags](#input\_cpu\_utilization\_extra\_tags) | Extra tags for GCP Cloud SQL CPU Utilization monitor | `list(string)` | `[]` | no |
| <a name="input_cpu_utilization_message"></a> [cpu\_utilization\_message](#input\_cpu\_utilization\_message) | Custom message for the CPU Utilization monitor | `string` | `""` | no |
| <a name="input_cpu_utilization_threshold_critical"></a> [cpu\_utilization\_threshold\_critical](#input\_cpu\_utilization\_threshold\_critical) | CPU Utilization in percentage (critical threshold) | `string` | `90` | no |
| <a name="input_cpu_utilization_threshold_warning"></a> [cpu\_utilization\_threshold\_warning](#input\_cpu\_utilization\_threshold\_warning) | CPU Utilization in percentage (warning threshold) | `string` | `80` | no |
| <a name="input_cpu_utilization_time_aggregator"></a> [cpu\_utilization\_time\_aggregator](#input\_cpu\_utilization\_time\_aggregator) | Time aggregator for the CPU Utilization monitor | `string` | `"avg"` | no |
| <a name="input_cpu_utilization_timeframe"></a> [cpu\_utilization\_timeframe](#input\_cpu\_utilization\_timeframe) | Timeframe for the CPU Utilization monitor | `string` | `"last_15m"` | no |
| <a name="input_disk_utilization_enabled"></a> [disk\_utilization\_enabled](#input\_disk\_utilization\_enabled) | Flag to enable GCP Cloud SQL Disk Utilization monitor | `string` | `"true"` | no |
| <a name="input_disk_utilization_extra_tags"></a> [disk\_utilization\_extra\_tags](#input\_disk\_utilization\_extra\_tags) | Extra tags for GCP Cloud SQL CPU Utilization monitor | `list(string)` | `[]` | no |
| <a name="input_disk_utilization_forecast_algorithm"></a> [disk\_utilization\_forecast\_algorithm](#input\_disk\_utilization\_forecast\_algorithm) | Algorithm for the Disk Utilization Forecast monitor | `string` | `"linear"` | no |
| <a name="input_disk_utilization_forecast_deviations"></a> [disk\_utilization\_forecast\_deviations](#input\_disk\_utilization\_forecast\_deviations) | Deviations for the Disk Utilization Forecast monitor | `string` | `1` | no |
| <a name="input_disk_utilization_forecast_enabled"></a> [disk\_utilization\_forecast\_enabled](#input\_disk\_utilization\_forecast\_enabled) | Flag to enable GCP Cloud SQL Disk Utilization Forecast monitor | `string` | `"true"` | no |
| <a name="input_disk_utilization_forecast_extra_tags"></a> [disk\_utilization\_forecast\_extra\_tags](#input\_disk\_utilization\_forecast\_extra\_tags) | Extra tags for GCP Cloud SQL Disk Utilization Forecast monitor | `list(string)` | `[]` | no |
| <a name="input_disk_utilization_forecast_interval"></a> [disk\_utilization\_forecast\_interval](#input\_disk\_utilization\_forecast\_interval) | Interval for the Disk Utilization Forecast monitor | `string` | `"60m"` | no |
| <a name="input_disk_utilization_forecast_linear_history"></a> [disk\_utilization\_forecast\_linear\_history](#input\_disk\_utilization\_forecast\_linear\_history) | History for the Disk Utilization Forecast monitor | `string` | `"3d"` | no |
| <a name="input_disk_utilization_forecast_linear_model"></a> [disk\_utilization\_forecast\_linear\_model](#input\_disk\_utilization\_forecast\_linear\_model) | Model for the Disk Utilization Forecast monitor | `string` | `"default"` | no |
| <a name="input_disk_utilization_forecast_message"></a> [disk\_utilization\_forecast\_message](#input\_disk\_utilization\_forecast\_message) | Custom message for the Disk Utilization Forecast monitor | `string` | `""` | no |
| <a name="input_disk_utilization_forecast_seasonal_seasonality"></a> [disk\_utilization\_forecast\_seasonal\_seasonality](#input\_disk\_utilization\_forecast\_seasonal\_seasonality) | Seasonality for the Disk Utilization Forecast monitor | `string` | `"weekly"` | no |
| <a name="input_disk_utilization_forecast_threshold_critical"></a> [disk\_utilization\_forecast\_threshold\_critical](#input\_disk\_utilization\_forecast\_threshold\_critical) | Disk Utilization Forecast in percentage (critical threshold) | `string` | `80` | no |
| <a name="input_disk_utilization_forecast_threshold_critical_recovery"></a> [disk\_utilization\_forecast\_threshold\_critical\_recovery](#input\_disk\_utilization\_forecast\_threshold\_critical\_recovery) | Disk Utilization Forecast in percentage (recovery threshold) | `string` | `72` | no |
| <a name="input_disk_utilization_forecast_time_aggregator"></a> [disk\_utilization\_forecast\_time\_aggregator](#input\_disk\_utilization\_forecast\_time\_aggregator) | Time aggregator for the Disk Utilization Forecast monitor | `string` | `"max"` | no |
| <a name="input_disk_utilization_forecast_timeframe"></a> [disk\_utilization\_forecast\_timeframe](#input\_disk\_utilization\_forecast\_timeframe) | Timeframe for the Disk Utilization Forecast monitor | `string` | `"next_1w"` | no |
| <a name="input_disk_utilization_message"></a> [disk\_utilization\_message](#input\_disk\_utilization\_message) | Custom message for the Disk Utilization monitor | `string` | `""` | no |
| <a name="input_disk_utilization_no_data_timeframe"></a> [disk\_utilization\_no\_data\_timeframe](#input\_disk\_utilization\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_disk_utilization_threshold_critical"></a> [disk\_utilization\_threshold\_critical](#input\_disk\_utilization\_threshold\_critical) | Disk Utilization in percentage (critical threshold) | `string` | `90` | no |
| <a name="input_disk_utilization_threshold_warning"></a> [disk\_utilization\_threshold\_warning](#input\_disk\_utilization\_threshold\_warning) | Disk Utilization in percentage (warning threshold) | `string` | `80` | no |
| <a name="input_disk_utilization_time_aggregator"></a> [disk\_utilization\_time\_aggregator](#input\_disk\_utilization\_time\_aggregator) | Time aggregator for the Disk Utilization monitor | `string` | `"avg"` | no |
| <a name="input_disk_utilization_timeframe"></a> [disk\_utilization\_timeframe](#input\_disk\_utilization\_timeframe) | Timeframe for the Disk Utilization monitor | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_failover_unavailable_enabled"></a> [failover\_unavailable\_enabled](#input\_failover\_unavailable\_enabled) | Flag to enable GCP Cloud SQL Failover Unavailable monitor | `string` | `"true"` | no |
| <a name="input_failover_unavailable_extra_tags"></a> [failover\_unavailable\_extra\_tags](#input\_failover\_unavailable\_extra\_tags) | Extra tags for GCP Cloud SQL Failover Unavailable monitor | `list(string)` | `[]` | no |
| <a name="input_failover_unavailable_message"></a> [failover\_unavailable\_message](#input\_failover\_unavailable\_message) | Custom message for the Failover Unavailable monitor | `string` | `""` | no |
| <a name="input_failover_unavailable_threshold_critical"></a> [failover\_unavailable\_threshold\_critical](#input\_failover\_unavailable\_threshold\_critical) | Failover Unavailable critical threshold | `string` | `0` | no |
| <a name="input_failover_unavailable_time_aggregator"></a> [failover\_unavailable\_time\_aggregator](#input\_failover\_unavailable\_time\_aggregator) | Time aggreggator for the Failover Unavailable monitor | `string` | `"max"` | no |
| <a name="input_failover_unavailable_timeframe"></a> [failover\_unavailable\_timeframe](#input\_failover\_unavailable\_timeframe) | Timeframe for the Failover Unavailable monitor | `string` | `"last_10m"` | no |
| <a name="input_filter_tags"></a> [filter\_tags](#input\_filter\_tags) | Tags used for filtering | `string` | `"*"` | no |
| <a name="input_filter_tags_failover_unavailable"></a> [filter\_tags\_failover\_unavailable](#input\_filter\_tags\_failover\_unavailable) | Tags used for filtering specific to the failover unavailable monitor which is only useful for master instances | `string` | `""` | no |
| <a name="input_memory_utilization_enabled"></a> [memory\_utilization\_enabled](#input\_memory\_utilization\_enabled) | Flag to enable GCP Cloud SQL Memory Utilization monitor | `string` | `"true"` | no |
| <a name="input_memory_utilization_extra_tags"></a> [memory\_utilization\_extra\_tags](#input\_memory\_utilization\_extra\_tags) | Extra tags for GCP Cloud SQL Memory Utilization monitor | `list(string)` | `[]` | no |
| <a name="input_memory_utilization_forecast_algorithm"></a> [memory\_utilization\_forecast\_algorithm](#input\_memory\_utilization\_forecast\_algorithm) | Algorithm for the Memory Utilization Forecast monitor | `string` | `"linear"` | no |
| <a name="input_memory_utilization_forecast_deviations"></a> [memory\_utilization\_forecast\_deviations](#input\_memory\_utilization\_forecast\_deviations) | Deviations for the Memory Utilization Forecast monitor | `string` | `1` | no |
| <a name="input_memory_utilization_forecast_enabled"></a> [memory\_utilization\_forecast\_enabled](#input\_memory\_utilization\_forecast\_enabled) | Flag to enable GCP Cloud SQL Memory Utilization Forecast monitor | `string` | `"false"` | no |
| <a name="input_memory_utilization_forecast_extra_tags"></a> [memory\_utilization\_forecast\_extra\_tags](#input\_memory\_utilization\_forecast\_extra\_tags) | Extra tags for GCP Cloud SQL Memory Utilization Forecast monitor | `list(string)` | `[]` | no |
| <a name="input_memory_utilization_forecast_interval"></a> [memory\_utilization\_forecast\_interval](#input\_memory\_utilization\_forecast\_interval) | Interval for the Memory Utilization Forecast monitor | `string` | `"30m"` | no |
| <a name="input_memory_utilization_forecast_linear_history"></a> [memory\_utilization\_forecast\_linear\_history](#input\_memory\_utilization\_forecast\_linear\_history) | History for the Memory Utilization Forecast monitor | `string` | `"12h"` | no |
| <a name="input_memory_utilization_forecast_linear_model"></a> [memory\_utilization\_forecast\_linear\_model](#input\_memory\_utilization\_forecast\_linear\_model) | Model for the Memory Utilization Forecast monitor | `string` | `"default"` | no |
| <a name="input_memory_utilization_forecast_message"></a> [memory\_utilization\_forecast\_message](#input\_memory\_utilization\_forecast\_message) | Custom message for the Memory Utilization Forecast monitor | `string` | `""` | no |
| <a name="input_memory_utilization_forecast_seasonal_seasonality"></a> [memory\_utilization\_forecast\_seasonal\_seasonality](#input\_memory\_utilization\_forecast\_seasonal\_seasonality) | Seasonality for the Memory Utilization Forecast monitor | `string` | `"weekly"` | no |
| <a name="input_memory_utilization_forecast_threshold_critical"></a> [memory\_utilization\_forecast\_threshold\_critical](#input\_memory\_utilization\_forecast\_threshold\_critical) | Memory Utilization Forecast in percentage (warning threshold) | `number` | `90` | no |
| <a name="input_memory_utilization_forecast_threshold_critical_recovery"></a> [memory\_utilization\_forecast\_threshold\_critical\_recovery](#input\_memory\_utilization\_forecast\_threshold\_critical\_recovery) | Memory Utilization Forecast in percentage (recovery threshold) | `number` | `81` | no |
| <a name="input_memory_utilization_forecast_time_aggregator"></a> [memory\_utilization\_forecast\_time\_aggregator](#input\_memory\_utilization\_forecast\_time\_aggregator) | Time aggregator for the Memory Utilization Forecast monitor | `string` | `"max"` | no |
| <a name="input_memory_utilization_forecast_timeframe"></a> [memory\_utilization\_forecast\_timeframe](#input\_memory\_utilization\_forecast\_timeframe) | Timeframe for the Memory Utilization Forecast monitor | `string` | `"next_3d"` | no |
| <a name="input_memory_utilization_message"></a> [memory\_utilization\_message](#input\_memory\_utilization\_message) | Custom message for the Memory Utilization monitor | `string` | `""` | no |
| <a name="input_memory_utilization_threshold_critical"></a> [memory\_utilization\_threshold\_critical](#input\_memory\_utilization\_threshold\_critical) | Memory Utilization in percentage (critical threshold) | `number` | `90` | no |
| <a name="input_memory_utilization_threshold_warning"></a> [memory\_utilization\_threshold\_warning](#input\_memory\_utilization\_threshold\_warning) | Memory Utilization in percentage (warning threshold) | `number` | `80` | no |
| <a name="input_memory_utilization_time_aggregator"></a> [memory\_utilization\_time\_aggregator](#input\_memory\_utilization\_time\_aggregator) | Time aggregator for the Memory Utilization monitor | `string` | `"avg"` | no |
| <a name="input_memory_utilization_timeframe"></a> [memory\_utilization\_timeframe](#input\_memory\_utilization\_timeframe) | Timeframe for the Memory Utilization monitor | `string` | `"last_5m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | Alert severity of monitors from 1 (high) to 5 (low) | `number` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global variables | `list(string)` | <pre>[<br>  "type:cloud",<br>  "provider:gcp",<br>  "resource:cloud-sql"<br>]</pre> | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `"claranet"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cpu_utilization_id"></a> [cpu\_utilization\_id](#output\_cpu\_utilization\_id) | id for monitor cpu\_utilization |
| <a name="output_disk_utilization_forecast_id"></a> [disk\_utilization\_forecast\_id](#output\_disk\_utilization\_forecast\_id) | id for monitor disk\_utilization\_forecast |
| <a name="output_disk_utilization_id"></a> [disk\_utilization\_id](#output\_disk\_utilization\_id) | id for monitor disk\_utilization |
| <a name="output_failover_unavailable_id"></a> [failover\_unavailable\_id](#output\_failover\_unavailable\_id) | id for monitor failover\_unavailable |
| <a name="output_memory_utilization_forecast_id"></a> [memory\_utilization\_forecast\_id](#output\_memory\_utilization\_forecast\_id) | id for monitor memory\_utilization\_forecast |
| <a name="output_memory_utilization_id"></a> [memory\_utilization\_id](#output\_memory\_utilization\_id) | id for monitor memory\_utilization |
<!-- END_TF_DOCS -->
## Related documentation

* [GCP Metrics for CloudSQL](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-cloudsql)
* [Datadog Useful monitors for GCP CloudSQL](https://www.datadoghq.com/blog/monitor-google-cloud-sql/)
