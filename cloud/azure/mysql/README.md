# CLOUD AZURE MYSQL DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-mysql" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//cloud/azure/mysql?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
  
  total_connection_limit = "${var.total_connection_limit}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Mysql Server CPU usage
- Mysql Server IO consumption
- Mysql Server memory usage
- Mysql Server storage
- Mysql Server total connection reach

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu\_usage\_enabled | Flag to enable Mysql status monitor | string | `"true"` | no |
| cpu\_usage\_extra\_tags | Extra tags for Mysql status monitor | list | `[]` | no |
| cpu\_usage\_message | Custom message for Mysql CPU monitor | string | `""` | no |
| cpu\_usage\_silenced | Groups to mute for Mysql CPU monitor | map | `{}` | no |
| cpu\_usage\_threshold\_critical | Mysql CPU usage in percent (critical threshold) | string | `"90"` | no |
| cpu\_usage\_threshold\_warning | Mysql CPU usage in percent (warning threshold) | string | `"80"` | no |
| cpu\_usage\_time\_aggregator | Monitor aggregator for Mysql CPU [available values: min, max or avg] | string | `"min"` | no |
| cpu\_usage\_timeframe | Monitor timeframe for Mysql CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| free\_storage\_enabled | Flag to enable Mysql status monitor | string | `"true"` | no |
| free\_storage\_extra\_tags | Extra tags for Mysql status monitor | list | `[]` | no |
| free\_storage\_message | Custom message for Mysql Free Storage monitor | string | `""` | no |
| free\_storage\_silenced | Groups to mute for Mysql Free Storage monitor | map | `{}` | no |
| free\_storage\_threshold\_critical | Mysql Free Storage remaining in percent (critical threshold) | string | `"10"` | no |
| free\_storage\_threshold\_warning | Mysql Free Storage remaining in percent (warning threshold) | string | `"20"` | no |
| free\_storage\_time\_aggregator | Monitor aggregator for Mysql Free Storage [available values: min, max or avg] | string | `"min"` | no |
| free\_storage\_timeframe | Monitor timeframe for Mysql Free Storage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| io\_consumption\_enabled | Flag to enable Mysql status monitor | string | `"true"` | no |
| io\_consumption\_extra\_tags | Extra tags for Mysql status monitor | list | `[]` | no |
| io\_consumption\_message | Custom message for Mysql IO consumption monitor | string | `""` | no |
| io\_consumption\_silenced | Groups to mute for Mysql IO consumption monitor | map | `{}` | no |
| io\_consumption\_threshold\_critical | Mysql IO consumption in percent (critical threshold) | string | `"90"` | no |
| io\_consumption\_threshold\_warning | Mysql IO consumption in percent (warning threshold) | string | `"80"` | no |
| io\_consumption\_time\_aggregator | Monitor aggregator for Mysql IO consumption [available values: min, max or avg] | string | `"min"` | no |
| io\_consumption\_timeframe | Monitor timeframe for Mysql IO consumption [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| memory\_usage\_enabled | Flag to enable Mysql status monitor | string | `"true"` | no |
| memory\_usage\_extra\_tags | Extra tags for Mysql status monitor | list | `[]` | no |
| memory\_usage\_message | Custom message for Mysql memory monitor | string | `""` | no |
| memory\_usage\_silenced | Groups to mute for Mysql memory monitor | map | `{}` | no |
| memory\_usage\_threshold\_critical | Mysql memory usage in percent (critical threshold) | string | `"90"` | no |
| memory\_usage\_threshold\_warning | Mysql memory usage in percent (warning threshold) | string | `"80"` | no |
| memory\_usage\_time\_aggregator | Monitor aggregator for Mysql memory [available values: min, max or avg] | string | `"min"` | no |
| memory\_usage\_timeframe | Monitor timeframe for Mysql memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| total\_connection\_enabled | Flag to enable Mysql status monitor | string | `"true"` | no |
| total\_connection\_extra\_tags | Extra tags for Mysql status monitor | list | `[]` | no |
| total\_connection\_limit | Limit for Mysql total connection [See details : https://docs.microsoft.com/en-us/azure/mysql/concepts-limits] | string | n/a | yes |
| total\_connection\_message | Custom message for Mysql total connection monitor | string | `""` | no |
| total\_connection\_silenced | Groups to mute for Mysql total connection monitor | map | `{}` | no |
| total\_connection\_threshold\_critical | Mysql total connection threshold in percent (critical threshold) | string | `"80"` | no |
| total\_connection\_threshold\_warning | Mysql total connection threshold in percent (warning threshold) | string | `"70"` | no |
| total\_connection\_time\_aggregator | Monitor aggregator for Mysql total connection [available values: min, max or avg] | string | `"min"` | no |
| total\_connection\_timeframe | Monitor timeframe for Mysql total connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| mysql\_cpu\_usage\_id | id for monitor mysql_cpu_usage |
| mysql\_free\_storage\_id | id for monitor mysql_free_storage |
| mysql\_io\_consumption\_id | id for monitor mysql_io_consumption |
| mysql\_memory\_usage\_id | id for monitor mysql_memory_usage |
| mysql\_total\_connection\_id | id for monitor mysql_total_connection |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)
You have to search `mysql`

Azure Database for MySQL servers metrics documentation: [https://docs.microsoft.com/en-us/azure/mysql/concepts-monitoring](https://docs.microsoft.com/en-us/azure/mysql/concepts-monitoring)

