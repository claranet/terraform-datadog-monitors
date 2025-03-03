# CLOUD AWS RDS COMMON DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-rds-common" {
  source      = "claranet/monitors/datadog//cloud/aws/rds/common"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- RDS connection variance
- RDS instance CPU high
- RDS instance free space
- RDS replica lag

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
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.rds_connection_variance](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.rds_cpu_90_15min](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.rds_free_space_low](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.rds_replica_lag](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_connection_variance_enabled"></a> [connection\_variance\_enabled](#input\_connection\_variance\_enabled) | Flag to enable RDS connection variance monitor | `bool` | `true` | no |
| <a name="input_connection_variance_extra_tags"></a> [connection\_variance\_extra\_tags](#input\_connection\_variance\_extra\_tags) | Extra tags for RDS connection variance monitor | `list(string)` | `[]` | no |
| <a name="input_connection_variance_message"></a> [connection\_variance\_message](#input\_connection\_variance\_message) | Custom message for RDS connection variance monitor | `string` | `""` | no |
| <a name="input_connection_variance_threshold_critical"></a> [connection\_variance\_threshold\_critical](#input\_connection\_variance\_threshold\_critical) | connection variance (critical threshold) | `string` | `"1"` | no |
| <a name="input_connection_variance_threshold_warning"></a> [connection\_variance\_threshold\_warning](#input\_connection\_variance\_threshold\_warning) | connection variance (warning threshold) | `string` | `"0"` | no |
| <a name="input_connection_variance_time_aggregator"></a> [connection\_variance\_time\_aggregator](#input\_connection\_variance\_time\_aggregator) | Monitor aggregator for connection variance [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_connection_variance_timeframe"></a> [connection\_variance\_timeframe](#input\_connection\_variance\_timeframe) | Monitor timeframe for RDS connection variance monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_4h"` | no |
| <a name="input_cpu_enabled"></a> [cpu\_enabled](#input\_cpu\_enabled) | Flag to enable RDS CPU usage monitor | `string` | `"true"` | no |
| <a name="input_cpu_extra_tags"></a> [cpu\_extra\_tags](#input\_cpu\_extra\_tags) | Extra tags for RDS CPU usage monitor | `list(string)` | `[]` | no |
| <a name="input_cpu_message"></a> [cpu\_message](#input\_cpu\_message) | Custom message for RDS CPU usage monitor | `string` | `""` | no |
| <a name="input_cpu_threshold_critical"></a> [cpu\_threshold\_critical](#input\_cpu\_threshold\_critical) | CPU usage in percent (critical threshold) | `string` | `"90"` | no |
| <a name="input_cpu_threshold_warning"></a> [cpu\_threshold\_warning](#input\_cpu\_threshold\_warning) | CPU usage in percent (warning threshold) | `string` | `"80"` | no |
| <a name="input_cpu_time_aggregator"></a> [cpu\_time\_aggregator](#input\_cpu\_time\_aggregator) | Monitor aggregator for RDS CPU usage [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_cpu_timeframe"></a> [cpu\_timeframe](#input\_cpu\_timeframe) | Monitor timeframe for RDS CPU usage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_diskspace_enabled"></a> [diskspace\_enabled](#input\_diskspace\_enabled) | Flag to enable RDS free diskspace monitor | `string` | `"true"` | no |
| <a name="input_diskspace_extra_tags"></a> [diskspace\_extra\_tags](#input\_diskspace\_extra\_tags) | Extra tags for RDS free diskspace monitor | `list(string)` | `[]` | no |
| <a name="input_diskspace_message"></a> [diskspace\_message](#input\_diskspace\_message) | Custom message for RDS free diskspace monitor | `string` | `""` | no |
| <a name="input_diskspace_threshold_critical"></a> [diskspace\_threshold\_critical](#input\_diskspace\_threshold\_critical) | Disk free space in percent (critical threshold) | `string` | `"10"` | no |
| <a name="input_diskspace_threshold_warning"></a> [diskspace\_threshold\_warning](#input\_diskspace\_threshold\_warning) | Disk free space in percent (warning threshold) | `string` | `"20"` | no |
| <a name="input_diskspace_time_aggregator"></a> [diskspace\_time\_aggregator](#input\_diskspace\_time\_aggregator) | Monitor aggregator for RDS free diskspace [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_diskspace_timeframe"></a> [diskspace\_timeframe](#input\_diskspace\_timeframe) | Monitor timeframe for RDS free diskspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_separator"></a> [filter\_tags\_separator](#input\_filter\_tags\_separator) | Set the filter tags separator (, or AND) | `string` | `","` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | Alert severity of monitors from 1 (high) to 5 (low) | `number` | `null` | no |
| <a name="input_rds_free_space_low_no_data_timeframe"></a> [rds\_free\_space\_low\_no\_data\_timeframe](#input\_rds\_free\_space\_low\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `30` | no |
| <a name="input_replicalag_enabled"></a> [replicalag\_enabled](#input\_replicalag\_enabled) | Flag to enable RDS replica lag monitor | `string` | `"true"` | no |
| <a name="input_replicalag_extra_tags"></a> [replicalag\_extra\_tags](#input\_replicalag\_extra\_tags) | Extra tags for RDS replica lag monitor | `list(string)` | `[]` | no |
| <a name="input_replicalag_message"></a> [replicalag\_message](#input\_replicalag\_message) | Custom message for RDS replica lag monitor | `string` | `""` | no |
| <a name="input_replicalag_threshold_critical"></a> [replicalag\_threshold\_critical](#input\_replicalag\_threshold\_critical) | replica lag in seconds (critical threshold) | `string` | `"300"` | no |
| <a name="input_replicalag_threshold_warning"></a> [replicalag\_threshold\_warning](#input\_replicalag\_threshold\_warning) | replica lag in seconds (warning threshold) | `string` | `"200"` | no |
| <a name="input_replicalag_time_aggregator"></a> [replicalag\_time\_aggregator](#input\_replicalag\_time\_aggregator) | Monitor aggregator for RDS replica lag [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_replicalag_timeframe"></a> [replicalag\_timeframe](#input\_replicalag\_timeframe) | Monitor timeframe for RDS replica lag monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global variables | `list(string)` | <pre>[<br>  "type:cloud",<br>  "provider:aws",<br>  "resource:rds"<br>]</pre> | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `"claranet"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rds_connection_variance_id"></a> [rds\_connection\_variance\_id](#output\_rds\_connection\_variance\_id) | id for monitor rds\_connection\_variance |
| <a name="output_rds_cpu_90_15min_id"></a> [rds\_cpu\_90\_15min\_id](#output\_rds\_cpu\_90\_15min\_id) | id for monitor rds\_cpu\_90\_15min |
| <a name="output_rds_free_space_low_id"></a> [rds\_free\_space\_low\_id](#output\_rds\_free\_space\_low\_id) | id for monitor rds\_free\_space\_low |
| <a name="output_rds_replica_lag_id"></a> [rds\_replica\_lag\_id](#output\_rds\_replica\_lag\_id) | id for monitor rds\_replica\_lag |
<!-- END_TF_DOCS -->
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_rds/](https://docs.datadoghq.com/integrations/amazon_rds/)

AWS RDS Instance metrics documentation: [https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MonitoringOverview.html#monitoring-cloudwatch](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MonitoringOverview.html#monitoring-cloudwatch)
