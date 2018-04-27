Azure SQL Database DataDog monitors
===================================

How to use this module
----------------------

```
module "datadog-monitors-azure-storage" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/sql-database?ref={revision}"

  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :

* CPU High
* Free disk space low
* DTU Consumption high
* SQL deadlocks

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu_aggregator | Monitor aggregator for SQL CPU [available values: min, max, sum or avg] | string | `avg` | no |
| cpu_message | Custom message for SQL CPU monitor | string | `` | no |
| cpu_silenced | Groups to mute for SQL CPU monitor | map | `<map>` | no |
| cpu_threshold_critical | CPU usage in percent (critical threshold) | string | `90` | no |
| cpu_threshold_warning | CPU usage in percent (warning threshold) | string | `80` | no |
| cpu_timeframe | Monitor timeframe for SQL CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| deadlock_aggregator | Monitor aggregator for SQL Deadlock [available values: min, max, sum or avg] | string | `sum` | no |
| deadlock_message | Custom message for SQL Deadlock monitor | string | `` | no |
| deadlock_silenced | Groups to mute for SQL Deadlock monitor | map | `<map>` | no |
| deadlock_threshold_critical | Amount of Deadlocks (critical threshold) | string | `1` | no |
| deadlock_timeframe | Monitor timeframe for SQL Deadlock [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| diskspace_aggregator | Monitor aggregator for SQL disk space [available values: min, max, sum or avg] | string | `avg` | no |
| diskspace_message | Custom message for SQL disk space monitor | string | `` | no |
| diskspace_silenced | Groups to mute for SQL disk space monitor | map | `<map>` | no |
| diskspace_threshold_critical | Disk space used in percent (critical threshold) | string | `90` | no |
| diskspace_threshold_warning | Disk space used in percent (warning threshold) | string | `80` | no |
| diskspace_timeframe | Monitor timeframe for SQL disk space [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| dtu_aggregator | Monitor aggregator for SQL DTU [available values: min, max, sum or avg] | string | `avg` | no |
| dtu_message | Custom message for SQL DTU monitor | string | `` | no |
| dtu_silenced | Groups to mute for SQL DTU monitor | map | `<map>` | no |
| dtu_threshold_critical | Amount of DTU used (critical threshold) | string | `90` | no |
| dtu_threshold_warning | Amount of DTU used (warning threshold) | string | `85` | no |
| dtu_timeframe | Monitor timeframe for SQL DTU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |
| environment | Architecture Environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_sql_database/](https://docs.datadoghq.com/integrations/azure_sql_database/)

Azure SQL Database metrics documentation: [https://docs.microsoft.com/en-us/azure/sql-database/saas-dbpertenant-log-analytics](https://docs.microsoft.com/en-us/azure/sql-database/saas-dbpertenant-log-analytics)

