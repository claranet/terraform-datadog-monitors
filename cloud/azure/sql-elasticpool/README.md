# CLOUD AZURE SQL-ELASTICPOOL DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-sql-elasticpool" {
  source = "claranet/monitors/datadog//cloud/azure/sql-elasticpool"
  version = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- SQL Elastic Pool CPU too high
- SQL Elastic Pool DTU Consumption too high
- SQL Elastic Pool high disk usage

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| cpu\_enabled | Flag to enable SQL Elastic Pool CPU monitor | `string` | `"true"` | no |
| cpu\_extra\_tags | Extra tags for SQL Elastic Pool CPU monitor | `list(string)` | `[]` | no |
| cpu\_message | Custom message for SQL Elastic Pool CPU monitor | `string` | `""` | no |
| cpu\_threshold\_critical | CPU usage in percent (critical threshold) | `string` | `"90"` | no |
| cpu\_threshold\_warning | CPU usage in percent (warning threshold) | `string` | `"80"` | no |
| cpu\_time\_aggregator | Monitor aggregator for SQL Elastic Pool CPU [available values: min, max or avg] | `string` | `"min"` | no |
| cpu\_timeframe | Monitor timeframe for SQL Elastic Pool CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| diskspace\_enabled | Flag to enable SQL Elastic Pool disk space monitor | `string` | `"true"` | no |
| diskspace\_extra\_tags | Extra tags for SQL Elastic Pool disk space monitor | `list(string)` | `[]` | no |
| diskspace\_message | Custom message for SQL Elastic Pool disk space monitor | `string` | `""` | no |
| diskspace\_threshold\_critical | Disk space used in percent (critical threshold) | `string` | `"90"` | no |
| diskspace\_threshold\_warning | Disk space used in percent (warning threshold) | `string` | `"80"` | no |
| diskspace\_time\_aggregator | Monitor aggregator for SQL Elastic Pool disk space [available values: min, max or avg] | `string` | `"max"` | no |
| diskspace\_timeframe | Monitor timeframe for SQL Elastic Pool disk space [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| dtu\_enabled | Flag to enable SQL Elastic Pool DTU monitor | `string` | `"true"` | no |
| dtu\_extra\_tags | Extra tags for SQL Elastic Pool DTU monitor | `list(string)` | `[]` | no |
| dtu\_message | Custom message for SQL Elastic Pool DTU monitor | `string` | `""` | no |
| dtu\_threshold\_critical | Amount of DTU used (critical threshold) | `string` | `"90"` | no |
| dtu\_threshold\_warning | Amount of DTU used (warning threshold) | `string` | `"85"` | no |
| dtu\_time\_aggregator | Monitor aggregator for SQL Elastic Pool DTU [available values: min, max or avg] | `string` | `"avg"` | no |
| dtu\_timeframe | Monitor timeframe for SQL Elastic Pool DTU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| environment | Architecture Environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| sql\_elasticpool\_cpu\_id | id for monitor sql\_elasticpool\_cpu |
| sql\_elasticpool\_dtu\_consumption\_high\_id | id for monitor sql\_elasticpool\_dtu\_consumption\_high |
| sql\_elasticpool\_free\_space\_low\_id | id for monitor sql\_elasticpool\_free\_space\_low |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_sql_elastic_pool/](https://docs.datadoghq.com/integrations/azure_sql_elastic_pool/)

Azure SQL Elastic Pool metrics documentation: [https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftsqlserverselasticpools](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftsqlserverselasticpools)
