# CLOUD AZURE SQL-DATABASE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-sql-database" {
  source      = "claranet/monitors/datadog//cloud/azure/sql-database"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- SQL Database CPU too high
- SQL Database Deadlocks too high
- SQL Database DTU Consumption too high
- SQL Database high disk usage
- SQL Database is down

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.sql-database_cpu](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.sql-database_deadlocks_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.sql-database_dtu_consumption_high](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.sql-database_free_space_low](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu_enabled"></a> [cpu\_enabled](#input\_cpu\_enabled) | Flag to enable SQL CPU monitor | `string` | `"true"` | no |
| <a name="input_cpu_extra_tags"></a> [cpu\_extra\_tags](#input\_cpu\_extra\_tags) | Extra tags for SQL CPU monitor | `list(string)` | `[]` | no |
| <a name="input_cpu_message"></a> [cpu\_message](#input\_cpu\_message) | Custom message for SQL CPU monitor | `string` | `""` | no |
| <a name="input_cpu_threshold_critical"></a> [cpu\_threshold\_critical](#input\_cpu\_threshold\_critical) | CPU usage in percent (critical threshold) | `string` | `"90"` | no |
| <a name="input_cpu_threshold_warning"></a> [cpu\_threshold\_warning](#input\_cpu\_threshold\_warning) | CPU usage in percent (warning threshold) | `string` | `"80"` | no |
| <a name="input_cpu_time_aggregator"></a> [cpu\_time\_aggregator](#input\_cpu\_time\_aggregator) | Monitor aggregator for SQL CPU [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_cpu_timeframe"></a> [cpu\_timeframe](#input\_cpu\_timeframe) | Monitor timeframe for SQL CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_deadlock_enabled"></a> [deadlock\_enabled](#input\_deadlock\_enabled) | Flag to enable SQL Deadlock monitor | `string` | `"true"` | no |
| <a name="input_deadlock_extra_tags"></a> [deadlock\_extra\_tags](#input\_deadlock\_extra\_tags) | Extra tags for SQL Deadlock monitor | `list(string)` | `[]` | no |
| <a name="input_deadlock_message"></a> [deadlock\_message](#input\_deadlock\_message) | Custom message for SQL Deadlock monitor | `string` | `""` | no |
| <a name="input_deadlock_threshold_critical"></a> [deadlock\_threshold\_critical](#input\_deadlock\_threshold\_critical) | Amount of Deadlocks (critical threshold) | `string` | `"1"` | no |
| <a name="input_deadlock_timeframe"></a> [deadlock\_timeframe](#input\_deadlock\_timeframe) | Monitor timeframe for SQL Deadlock [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_diskspace_enabled"></a> [diskspace\_enabled](#input\_diskspace\_enabled) | Flag to enable SQL disk space monitor | `string` | `"true"` | no |
| <a name="input_diskspace_extra_tags"></a> [diskspace\_extra\_tags](#input\_diskspace\_extra\_tags) | Extra tags for SQL disk space monitor | `list(string)` | `[]` | no |
| <a name="input_diskspace_message"></a> [diskspace\_message](#input\_diskspace\_message) | Custom message for SQL disk space monitor | `string` | `""` | no |
| <a name="input_diskspace_threshold_critical"></a> [diskspace\_threshold\_critical](#input\_diskspace\_threshold\_critical) | Disk space used in percent (critical threshold) | `string` | `"90"` | no |
| <a name="input_diskspace_threshold_warning"></a> [diskspace\_threshold\_warning](#input\_diskspace\_threshold\_warning) | Disk space used in percent (warning threshold) | `string` | `"80"` | no |
| <a name="input_diskspace_time_aggregator"></a> [diskspace\_time\_aggregator](#input\_diskspace\_time\_aggregator) | Monitor aggregator for SQL disk space [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_diskspace_timeframe"></a> [diskspace\_timeframe](#input\_diskspace\_timeframe) | Monitor timeframe for SQL disk space [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_dtu_enabled"></a> [dtu\_enabled](#input\_dtu\_enabled) | Flag to enable SQL DTU monitor | `string` | `"true"` | no |
| <a name="input_dtu_extra_tags"></a> [dtu\_extra\_tags](#input\_dtu\_extra\_tags) | Extra tags for SQL DTU monitor | `list(string)` | `[]` | no |
| <a name="input_dtu_message"></a> [dtu\_message](#input\_dtu\_message) | Custom message for SQL DTU monitor | `string` | `""` | no |
| <a name="input_dtu_threshold_critical"></a> [dtu\_threshold\_critical](#input\_dtu\_threshold\_critical) | Amount of DTU used (critical threshold) | `string` | `"90"` | no |
| <a name="input_dtu_threshold_warning"></a> [dtu\_threshold\_warning](#input\_dtu\_threshold\_warning) | Amount of DTU used (warning threshold) | `string` | `"85"` | no |
| <a name="input_dtu_time_aggregator"></a> [dtu\_time\_aggregator](#input\_dtu\_time\_aggregator) | Monitor aggregator for SQL DTU [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_dtu_timeframe"></a> [dtu\_timeframe](#input\_dtu\_timeframe) | Monitor timeframe for SQL DTU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_status_enabled"></a> [status\_enabled](#input\_status\_enabled) | Flag to enable Redis status monitor | `string` | `"true"` | no |
| <a name="input_status_extra_tags"></a> [status\_extra\_tags](#input\_status\_extra\_tags) | Extra tags for Redis status monitor | `list(string)` | `[]` | no |
| <a name="input_status_message"></a> [status\_message](#input\_status\_message) | Custom message for Redis status monitor | `string` | `""` | no |
| <a name="input_status_no_data_timeframe"></a> [status\_no\_data\_timeframe](#input\_status\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_status_time_aggregator"></a> [status\_time\_aggregator](#input\_status\_time\_aggregator) | Monitor aggregator for Redis status [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_status_timeframe"></a> [status\_timeframe](#input\_status\_timeframe) | Monitor timeframe for Redis status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sql-database_cpu_id"></a> [sql-database\_cpu\_id](#output\_sql-database\_cpu\_id) | id for monitor sql-database\_cpu |
| <a name="output_sql-database_deadlocks_count_id"></a> [sql-database\_deadlocks\_count\_id](#output\_sql-database\_deadlocks\_count\_id) | id for monitor sql-database\_deadlocks\_count |
| <a name="output_sql-database_dtu_consumption_high_id"></a> [sql-database\_dtu\_consumption\_high\_id](#output\_sql-database\_dtu\_consumption\_high\_id) | id for monitor sql-database\_dtu\_consumption\_high |
| <a name="output_sql-database_free_space_low_id"></a> [sql-database\_free\_space\_low\_id](#output\_sql-database\_free\_space\_low\_id) | id for monitor sql-database\_free\_space\_low |
| <a name="output_status_id"></a> [status\_id](#output\_status\_id) | id for monitor status |
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_sql_database/](https://docs.datadoghq.com/integrations/azure_sql_database/)

Azure SQL Database metrics documentation: [https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftsqlserversdatabases](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftsqlserversdatabases)

