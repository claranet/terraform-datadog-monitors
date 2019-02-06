# CLOUD AZURE SQL-DATABASE DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-sql-database" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors.git//cloud/azure/sql-database?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- SQL Database CPU too high
- SQL Database Deadlocks too high
- SQL Database DTU Consumption too high
- SQL Database is down
- SQL Database low free space
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu\_enabled | Flag to enable SQL CPU monitor | string | `"true"` | no |
| cpu\_extra\_tags | Extra tags for SQL CPU monitor | list | `[]` | no |
| cpu\_message | Custom message for SQL CPU monitor | string | `""` | no |
| cpu\_silenced | Groups to mute for SQL CPU monitor | map | `{}` | no |
| cpu\_threshold\_critical | CPU usage in percent (critical threshold) | string | `"90"` | no |
| cpu\_threshold\_warning | CPU usage in percent (warning threshold) | string | `"80"` | no |
| cpu\_time\_aggregator | Monitor aggregator for SQL CPU [available values: min, max or avg] | string | `"min"` | no |
| cpu\_timeframe | Monitor timeframe for SQL CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| deadlock\_enabled | Flag to enable SQL Deadlock monitor | string | `"true"` | no |
| deadlock\_extra\_tags | Extra tags for SQL Deadlock monitor | list | `[]` | no |
| deadlock\_message | Custom message for SQL Deadlock monitor | string | `""` | no |
| deadlock\_silenced | Groups to mute for SQL Deadlock monitor | map | `{}` | no |
| deadlock\_threshold\_critical | Amount of Deadlocks (critical threshold) | string | `"1"` | no |
| deadlock\_timeframe | Monitor timeframe for SQL Deadlock [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| diskspace\_enabled | Flag to enable SQL disk space monitor | string | `"true"` | no |
| diskspace\_extra\_tags | Extra tags for SQL disk space monitor | list | `[]` | no |
| diskspace\_message | Custom message for SQL disk space monitor | string | `""` | no |
| diskspace\_silenced | Groups to mute for SQL disk space monitor | map | `{}` | no |
| diskspace\_threshold\_critical | Disk space used in percent (critical threshold) | string | `"90"` | no |
| diskspace\_threshold\_warning | Disk space used in percent (warning threshold) | string | `"80"` | no |
| diskspace\_time\_aggregator | Monitor aggregator for SQL disk space [available values: min, max or avg] | string | `"max"` | no |
| diskspace\_timeframe | Monitor timeframe for SQL disk space [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| dtu\_enabled | Flag to enable SQL DTU monitor | string | `"true"` | no |
| dtu\_extra\_tags | Extra tags for SQL DTU monitor | list | `[]` | no |
| dtu\_message | Custom message for SQL DTU monitor | string | `""` | no |
| dtu\_silenced | Groups to mute for SQL DTU monitor | map | `{}` | no |
| dtu\_threshold\_critical | Amount of DTU used (critical threshold) | string | `"90"` | no |
| dtu\_threshold\_warning | Amount of DTU used (warning threshold) | string | `"85"` | no |
| dtu\_time\_aggregator | Monitor aggregator for SQL DTU [available values: min, max or avg] | string | `"avg"` | no |
| dtu\_timeframe | Monitor timeframe for SQL DTU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| environment | Architecture Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| status\_enabled | Flag to enable Redis status monitor | string | `"true"` | no |
| status\_extra\_tags | Extra tags for Redis status monitor | list | `[]` | no |
| status\_message | Custom message for Redis status monitor | string | `""` | no |
| status\_silenced | Groups to mute for Redis status monitor | map | `{}` | no |
| status\_time\_aggregator | Monitor aggregator for Redis status [available values: min, max or avg] | string | `"max"` | no |
| status\_timeframe | Monitor timeframe for Redis status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| sql-database\_cpu\_90\_15min\_id | id for monitor sql-database_cpu_90_15min |
| sql-database\_deadlocks\_count\_id | id for monitor sql-database_deadlocks_count |
| sql-database\_dtu\_consumption\_high\_id | id for monitor sql-database_dtu_consumption_high |
| sql-database\_free\_space\_low\_id | id for monitor sql-database_free_space_low |
| status\_id | id for monitor status |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_sql_database/](https://docs.datadoghq.com/integrations/azure_sql_database/)

Azure SQL Database metrics documentation: [https://docs.microsoft.com/en-us/azure/sql-database/saas-dbpertenant-log-analytics](https://docs.microsoft.com/en-us/azure/sql-database/saas-dbpertenant-log-analytics)

