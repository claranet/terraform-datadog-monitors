# CLOUD AZURE MYSQL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-mysql" {
  source      = "claranet/monitors/datadog//cloud/azure/mysql"
  version     = "{revision}"

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
| [datadog_monitor.mysql_cpu_usage](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.mysql_free_storage](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.mysql_io_consumption](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.mysql_memory_usage](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu_usage_enabled"></a> [cpu\_usage\_enabled](#input\_cpu\_usage\_enabled) | Flag to enable Mysql status monitor | `string` | `"true"` | no |
| <a name="input_cpu_usage_extra_tags"></a> [cpu\_usage\_extra\_tags](#input\_cpu\_usage\_extra\_tags) | Extra tags for Mysql status monitor | `list(string)` | `[]` | no |
| <a name="input_cpu_usage_message"></a> [cpu\_usage\_message](#input\_cpu\_usage\_message) | Custom message for Mysql CPU monitor | `string` | `""` | no |
| <a name="input_cpu_usage_threshold_critical"></a> [cpu\_usage\_threshold\_critical](#input\_cpu\_usage\_threshold\_critical) | Mysql CPU usage in percent (critical threshold) | `string` | `"90"` | no |
| <a name="input_cpu_usage_threshold_warning"></a> [cpu\_usage\_threshold\_warning](#input\_cpu\_usage\_threshold\_warning) | Mysql CPU usage in percent (warning threshold) | `string` | `"80"` | no |
| <a name="input_cpu_usage_time_aggregator"></a> [cpu\_usage\_time\_aggregator](#input\_cpu\_usage\_time\_aggregator) | Monitor aggregator for Mysql CPU [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_cpu_usage_timeframe"></a> [cpu\_usage\_timeframe](#input\_cpu\_usage\_timeframe) | Monitor timeframe for Mysql CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_free_storage_enabled"></a> [free\_storage\_enabled](#input\_free\_storage\_enabled) | Flag to enable Mysql status monitor | `string` | `"true"` | no |
| <a name="input_free_storage_extra_tags"></a> [free\_storage\_extra\_tags](#input\_free\_storage\_extra\_tags) | Extra tags for Mysql status monitor | `list(string)` | `[]` | no |
| <a name="input_free_storage_message"></a> [free\_storage\_message](#input\_free\_storage\_message) | Custom message for Mysql Free Storage monitor | `string` | `""` | no |
| <a name="input_free_storage_threshold_critical"></a> [free\_storage\_threshold\_critical](#input\_free\_storage\_threshold\_critical) | Mysql Free Storage remaining in percent (critical threshold) | `string` | `"10"` | no |
| <a name="input_free_storage_threshold_warning"></a> [free\_storage\_threshold\_warning](#input\_free\_storage\_threshold\_warning) | Mysql Free Storage remaining in percent (warning threshold) | `string` | `"20"` | no |
| <a name="input_free_storage_time_aggregator"></a> [free\_storage\_time\_aggregator](#input\_free\_storage\_time\_aggregator) | Monitor aggregator for Mysql Free Storage [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_free_storage_timeframe"></a> [free\_storage\_timeframe](#input\_free\_storage\_timeframe) | Monitor timeframe for Mysql Free Storage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_io_consumption_enabled"></a> [io\_consumption\_enabled](#input\_io\_consumption\_enabled) | Flag to enable Mysql status monitor | `string` | `"true"` | no |
| <a name="input_io_consumption_extra_tags"></a> [io\_consumption\_extra\_tags](#input\_io\_consumption\_extra\_tags) | Extra tags for Mysql status monitor | `list(string)` | `[]` | no |
| <a name="input_io_consumption_message"></a> [io\_consumption\_message](#input\_io\_consumption\_message) | Custom message for Mysql IO consumption monitor | `string` | `""` | no |
| <a name="input_io_consumption_threshold_critical"></a> [io\_consumption\_threshold\_critical](#input\_io\_consumption\_threshold\_critical) | Mysql IO consumption in percent (critical threshold) | `string` | `"90"` | no |
| <a name="input_io_consumption_threshold_warning"></a> [io\_consumption\_threshold\_warning](#input\_io\_consumption\_threshold\_warning) | Mysql IO consumption in percent (warning threshold) | `string` | `"80"` | no |
| <a name="input_io_consumption_time_aggregator"></a> [io\_consumption\_time\_aggregator](#input\_io\_consumption\_time\_aggregator) | Monitor aggregator for Mysql IO consumption [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_io_consumption_timeframe"></a> [io\_consumption\_timeframe](#input\_io\_consumption\_timeframe) | Monitor timeframe for Mysql IO consumption [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_memory_usage_enabled"></a> [memory\_usage\_enabled](#input\_memory\_usage\_enabled) | Flag to enable Mysql status monitor | `string` | `"true"` | no |
| <a name="input_memory_usage_extra_tags"></a> [memory\_usage\_extra\_tags](#input\_memory\_usage\_extra\_tags) | Extra tags for Mysql status monitor | `list(string)` | `[]` | no |
| <a name="input_memory_usage_message"></a> [memory\_usage\_message](#input\_memory\_usage\_message) | Custom message for Mysql memory monitor | `string` | `""` | no |
| <a name="input_memory_usage_threshold_critical"></a> [memory\_usage\_threshold\_critical](#input\_memory\_usage\_threshold\_critical) | Mysql memory usage in percent (critical threshold) | `string` | `"90"` | no |
| <a name="input_memory_usage_threshold_warning"></a> [memory\_usage\_threshold\_warning](#input\_memory\_usage\_threshold\_warning) | Mysql memory usage in percent (warning threshold) | `string` | `"80"` | no |
| <a name="input_memory_usage_time_aggregator"></a> [memory\_usage\_time\_aggregator](#input\_memory\_usage\_time\_aggregator) | Monitor aggregator for Mysql memory [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_memory_usage_timeframe"></a> [memory\_usage\_timeframe](#input\_memory\_usage\_timeframe) | Monitor timeframe for Mysql memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mysql_cpu_usage_id"></a> [mysql\_cpu\_usage\_id](#output\_mysql\_cpu\_usage\_id) | id for monitor mysql\_cpu\_usage |
| <a name="output_mysql_free_storage_id"></a> [mysql\_free\_storage\_id](#output\_mysql\_free\_storage\_id) | id for monitor mysql\_free\_storage |
| <a name="output_mysql_io_consumption_id"></a> [mysql\_io\_consumption\_id](#output\_mysql\_io\_consumption\_id) | id for monitor mysql\_io\_consumption |
| <a name="output_mysql_memory_usage_id"></a> [mysql\_memory\_usage\_id](#output\_mysql\_memory\_usage\_id) | id for monitor mysql\_memory\_usage |
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)
You have to search `mysql`

Azure Database for MySQL servers metrics documentation: [https://docs.microsoft.com/en-us/azure/mysql/concepts-monitoring](https://docs.microsoft.com/en-us/azure/mysql/concepts-monitoring)

