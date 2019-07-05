# CLOUD AZURE MYSQL DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-mysql" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//cloud/azure/mysql?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Mysql Server CPU usage
- Mysql Server IO consumption
- Mysql Server memory usage
- Mysql Server storage

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu\_usage\_enabled | Flag to enable Mysql status monitor | string | `"true"` | no |
| cpu\_usage\_extra\_tags | Extra tags for Mysql status monitor | list(string) | `[]` | no |
| cpu\_usage\_message | Custom message for Mysql CPU monitor | string | `""` | no |
| cpu\_usage\_threshold\_critical | Mysql CPU usage in percent (critical threshold) | string | `"90"` | no |
| cpu\_usage\_threshold\_warning | Mysql CPU usage in percent (warning threshold) | string | `"80"` | no |
| cpu\_usage\_time\_aggregator | Monitor aggregator for Mysql CPU [available values: min, max or avg] | string | `"min"` | no |
| cpu\_usage\_timeframe | Monitor timeframe for Mysql CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| free\_storage\_enabled | Flag to enable Mysql status monitor | string | `"true"` | no |
| free\_storage\_extra\_tags | Extra tags for Mysql status monitor | list(string) | `[]` | no |
| free\_storage\_message | Custom message for Mysql Free Storage monitor | string | `""` | no |
| free\_storage\_threshold\_critical | Mysql Free Storage remaining in percent (critical threshold) | string | `"10"` | no |
| free\_storage\_threshold\_warning | Mysql Free Storage remaining in percent (warning threshold) | string | `"20"` | no |
| free\_storage\_time\_aggregator | Monitor aggregator for Mysql Free Storage [available values: min, max or avg] | string | `"min"` | no |
| free\_storage\_timeframe | Monitor timeframe for Mysql Free Storage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| io\_consumption\_enabled | Flag to enable Mysql status monitor | string | `"true"` | no |
| io\_consumption\_extra\_tags | Extra tags for Mysql status monitor | list(string) | `[]` | no |
| io\_consumption\_message | Custom message for Mysql IO consumption monitor | string | `""` | no |
| io\_consumption\_threshold\_critical | Mysql IO consumption in percent (critical threshold) | string | `"90"` | no |
| io\_consumption\_threshold\_warning | Mysql IO consumption in percent (warning threshold) | string | `"80"` | no |
| io\_consumption\_time\_aggregator | Monitor aggregator for Mysql IO consumption [available values: min, max or avg] | string | `"min"` | no |
| io\_consumption\_timeframe | Monitor timeframe for Mysql IO consumption [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| memory\_usage\_enabled | Flag to enable Mysql status monitor | string | `"true"` | no |
| memory\_usage\_extra\_tags | Extra tags for Mysql status monitor | list(string) | `[]` | no |
| memory\_usage\_message | Custom message for Mysql memory monitor | string | `""` | no |
| memory\_usage\_threshold\_critical | Mysql memory usage in percent (critical threshold) | string | `"90"` | no |
| memory\_usage\_threshold\_warning | Mysql memory usage in percent (warning threshold) | string | `"80"` | no |
| memory\_usage\_time\_aggregator | Monitor aggregator for Mysql memory [available values: min, max or avg] | string | `"min"` | no |
| memory\_usage\_timeframe | Monitor timeframe for Mysql memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_15m"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| mysql\_cpu\_usage\_id | id for monitor mysql_cpu_usage |
| mysql\_free\_storage\_id | id for monitor mysql_free_storage |
| mysql\_io\_consumption\_id | id for monitor mysql_io_consumption |
| mysql\_memory\_usage\_id | id for monitor mysql_memory_usage |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)
You have to search `mysql`

Azure Database for MySQL servers metrics documentation: [https://docs.microsoft.com/en-us/azure/mysql/concepts-monitoring](https://docs.microsoft.com/en-us/azure/mysql/concepts-monitoring)

