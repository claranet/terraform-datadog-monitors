# CLOUD AZURE SQL-ELASTICPOOL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-sql-elasticpool" {
  source      = "claranet/monitors/datadog//cloud/azure/sql-elasticpool"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- SQL Elastic Pool CPU too high
- SQL Elastic Pool DTU Consumption too high
- SQL Elastic Pool high disk usage

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
| [datadog_monitor.sql_elasticpool_cpu](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.sql_elasticpool_dtu_consumption_high](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.sql_elasticpool_free_space_low](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu_enabled"></a> [cpu\_enabled](#input\_cpu\_enabled) | Flag to enable SQL Elastic Pool CPU monitor | `string` | `"true"` | no |
| <a name="input_cpu_extra_tags"></a> [cpu\_extra\_tags](#input\_cpu\_extra\_tags) | Extra tags for SQL Elastic Pool CPU monitor | `list(string)` | `[]` | no |
| <a name="input_cpu_message"></a> [cpu\_message](#input\_cpu\_message) | Custom message for SQL Elastic Pool CPU monitor | `string` | `""` | no |
| <a name="input_cpu_threshold_critical"></a> [cpu\_threshold\_critical](#input\_cpu\_threshold\_critical) | CPU usage in percent (critical threshold) | `string` | `"90"` | no |
| <a name="input_cpu_threshold_warning"></a> [cpu\_threshold\_warning](#input\_cpu\_threshold\_warning) | CPU usage in percent (warning threshold) | `string` | `"80"` | no |
| <a name="input_cpu_time_aggregator"></a> [cpu\_time\_aggregator](#input\_cpu\_time\_aggregator) | Monitor aggregator for SQL Elastic Pool CPU [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_cpu_timeframe"></a> [cpu\_timeframe](#input\_cpu\_timeframe) | Monitor timeframe for SQL Elastic Pool CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_diskspace_enabled"></a> [diskspace\_enabled](#input\_diskspace\_enabled) | Flag to enable SQL Elastic Pool disk space monitor | `string` | `"true"` | no |
| <a name="input_diskspace_extra_tags"></a> [diskspace\_extra\_tags](#input\_diskspace\_extra\_tags) | Extra tags for SQL Elastic Pool disk space monitor | `list(string)` | `[]` | no |
| <a name="input_diskspace_message"></a> [diskspace\_message](#input\_diskspace\_message) | Custom message for SQL Elastic Pool disk space monitor | `string` | `""` | no |
| <a name="input_diskspace_threshold_critical"></a> [diskspace\_threshold\_critical](#input\_diskspace\_threshold\_critical) | Disk space used in percent (critical threshold) | `string` | `"90"` | no |
| <a name="input_diskspace_threshold_warning"></a> [diskspace\_threshold\_warning](#input\_diskspace\_threshold\_warning) | Disk space used in percent (warning threshold) | `string` | `"80"` | no |
| <a name="input_diskspace_time_aggregator"></a> [diskspace\_time\_aggregator](#input\_diskspace\_time\_aggregator) | Monitor aggregator for SQL Elastic Pool disk space [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_diskspace_timeframe"></a> [diskspace\_timeframe](#input\_diskspace\_timeframe) | Monitor timeframe for SQL Elastic Pool disk space [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_dtu_enabled"></a> [dtu\_enabled](#input\_dtu\_enabled) | Flag to enable SQL Elastic Pool DTU monitor | `string` | `"true"` | no |
| <a name="input_dtu_extra_tags"></a> [dtu\_extra\_tags](#input\_dtu\_extra\_tags) | Extra tags for SQL Elastic Pool DTU monitor | `list(string)` | `[]` | no |
| <a name="input_dtu_message"></a> [dtu\_message](#input\_dtu\_message) | Custom message for SQL Elastic Pool DTU monitor | `string` | `""` | no |
| <a name="input_dtu_threshold_critical"></a> [dtu\_threshold\_critical](#input\_dtu\_threshold\_critical) | Amount of DTU used (critical threshold) | `string` | `"90"` | no |
| <a name="input_dtu_threshold_warning"></a> [dtu\_threshold\_warning](#input\_dtu\_threshold\_warning) | Amount of DTU used (warning threshold) | `string` | `"85"` | no |
| <a name="input_dtu_time_aggregator"></a> [dtu\_time\_aggregator](#input\_dtu\_time\_aggregator) | Monitor aggregator for SQL Elastic Pool DTU [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_dtu_timeframe"></a> [dtu\_timeframe](#input\_dtu\_timeframe) | Monitor timeframe for SQL Elastic Pool DTU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_sql_elasticpool_cpu_no_data_timeframe"></a> [sql\_elasticpool\_cpu\_no\_data\_timeframe](#input\_sql\_elasticpool\_cpu\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `30` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sql_elasticpool_cpu_id"></a> [sql\_elasticpool\_cpu\_id](#output\_sql\_elasticpool\_cpu\_id) | id for monitor sql\_elasticpool\_cpu |
| <a name="output_sql_elasticpool_dtu_consumption_high_id"></a> [sql\_elasticpool\_dtu\_consumption\_high\_id](#output\_sql\_elasticpool\_dtu\_consumption\_high\_id) | id for monitor sql\_elasticpool\_dtu\_consumption\_high |
| <a name="output_sql_elasticpool_free_space_low_id"></a> [sql\_elasticpool\_free\_space\_low\_id](#output\_sql\_elasticpool\_free\_space\_low\_id) | id for monitor sql\_elasticpool\_free\_space\_low |
<!-- END_TF_DOCS -->
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_sql_elastic_pool/](https://docs.datadoghq.com/integrations/azure_sql_elastic_pool/)

Azure SQL Elastic Pool metrics documentation: [https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftsqlserverselasticpools](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftsqlserverselasticpools)
