# CLOUD AZURE POSTGRESQL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-postgresql" {
  source      = "claranet/monitors/datadog//cloud/azure/postgresql"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Postgresql Server CPU usage
- Postgresql Server has no connection
- Postgresql Server IO consumption
- Postgresql Server memory usage
- Postgresql Server storage

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
| [datadog_monitor.postgresql_cpu_usage](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.postgresql_free_storage](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.postgresql_io_consumption](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.postgresql_memory_usage](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.postgresql_no_connection](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu_usage_enabled"></a> [cpu\_usage\_enabled](#input\_cpu\_usage\_enabled) | Flag to enable PostgreSQL status monitor | `string` | `"true"` | no |
| <a name="input_cpu_usage_extra_tags"></a> [cpu\_usage\_extra\_tags](#input\_cpu\_usage\_extra\_tags) | Extra tags for PostgreSQL status monitor | `list(string)` | `[]` | no |
| <a name="input_cpu_usage_message"></a> [cpu\_usage\_message](#input\_cpu\_usage\_message) | Custom message for PostgreSQL CPU monitor | `string` | `""` | no |
| <a name="input_cpu_usage_threshold_critical"></a> [cpu\_usage\_threshold\_critical](#input\_cpu\_usage\_threshold\_critical) | PostgreSQL CPU usage in percent (critical threshold) | `string` | `"90"` | no |
| <a name="input_cpu_usage_threshold_warning"></a> [cpu\_usage\_threshold\_warning](#input\_cpu\_usage\_threshold\_warning) | PostgreSQL CPU usage in percent (warning threshold) | `string` | `"80"` | no |
| <a name="input_cpu_usage_time_aggregator"></a> [cpu\_usage\_time\_aggregator](#input\_cpu\_usage\_time\_aggregator) | Monitor aggregator for PostgreSQL CPU [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_cpu_usage_timeframe"></a> [cpu\_usage\_timeframe](#input\_cpu\_usage\_timeframe) | Monitor timeframe for PostgreSQL CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_free_storage_enabled"></a> [free\_storage\_enabled](#input\_free\_storage\_enabled) | Flag to enable PostgreSQL status monitor | `string` | `"true"` | no |
| <a name="input_free_storage_extra_tags"></a> [free\_storage\_extra\_tags](#input\_free\_storage\_extra\_tags) | Extra tags for PostgreSQL status monitor | `list(string)` | `[]` | no |
| <a name="input_free_storage_message"></a> [free\_storage\_message](#input\_free\_storage\_message) | Custom message for PostgreSQL Free Storage monitor | `string` | `""` | no |
| <a name="input_free_storage_threshold_critical"></a> [free\_storage\_threshold\_critical](#input\_free\_storage\_threshold\_critical) | PostgreSQL Free Storage remaining in percent (critical threshold) | `string` | `"10"` | no |
| <a name="input_free_storage_threshold_warning"></a> [free\_storage\_threshold\_warning](#input\_free\_storage\_threshold\_warning) | PostgreSQL Free Storage remaining in percent (warning threshold) | `string` | `"20"` | no |
| <a name="input_free_storage_time_aggregator"></a> [free\_storage\_time\_aggregator](#input\_free\_storage\_time\_aggregator) | Monitor aggregator for PostgreSQL Free Storage [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_free_storage_timeframe"></a> [free\_storage\_timeframe](#input\_free\_storage\_timeframe) | Monitor timeframe for PostgreSQL Free Storage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_io_consumption_enabled"></a> [io\_consumption\_enabled](#input\_io\_consumption\_enabled) | Flag to enable PostgreSQL status monitor | `string` | `"true"` | no |
| <a name="input_io_consumption_extra_tags"></a> [io\_consumption\_extra\_tags](#input\_io\_consumption\_extra\_tags) | Extra tags for PostgreSQL status monitor | `list(string)` | `[]` | no |
| <a name="input_io_consumption_message"></a> [io\_consumption\_message](#input\_io\_consumption\_message) | Custom message for PostgreSQL IO consumption monitor | `string` | `""` | no |
| <a name="input_io_consumption_threshold_critical"></a> [io\_consumption\_threshold\_critical](#input\_io\_consumption\_threshold\_critical) | PostgreSQL IO consumption in percent (critical threshold) | `string` | `"90"` | no |
| <a name="input_io_consumption_threshold_warning"></a> [io\_consumption\_threshold\_warning](#input\_io\_consumption\_threshold\_warning) | PostgreSQL IO consumption in percent (warning threshold) | `string` | `"80"` | no |
| <a name="input_io_consumption_time_aggregator"></a> [io\_consumption\_time\_aggregator](#input\_io\_consumption\_time\_aggregator) | Monitor aggregator for PostgreSQL IO consumption [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_io_consumption_timeframe"></a> [io\_consumption\_timeframe](#input\_io\_consumption\_timeframe) | Monitor timeframe for PostgreSQL IO consumption [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_memory_usage_enabled"></a> [memory\_usage\_enabled](#input\_memory\_usage\_enabled) | Flag to enable PostgreSQL status monitor | `string` | `"true"` | no |
| <a name="input_memory_usage_extra_tags"></a> [memory\_usage\_extra\_tags](#input\_memory\_usage\_extra\_tags) | Extra tags for PostgreSQL status monitor | `list(string)` | `[]` | no |
| <a name="input_memory_usage_message"></a> [memory\_usage\_message](#input\_memory\_usage\_message) | Custom message for PostgreSQL memory monitor | `string` | `""` | no |
| <a name="input_memory_usage_threshold_critical"></a> [memory\_usage\_threshold\_critical](#input\_memory\_usage\_threshold\_critical) | PostgreSQL memory usage in percent (critical threshold) | `string` | `"90"` | no |
| <a name="input_memory_usage_threshold_warning"></a> [memory\_usage\_threshold\_warning](#input\_memory\_usage\_threshold\_warning) | PostgreSQL memory usage in percent (warning threshold) | `string` | `"80"` | no |
| <a name="input_memory_usage_time_aggregator"></a> [memory\_usage\_time\_aggregator](#input\_memory\_usage\_time\_aggregator) | Monitor aggregator for PostgreSQL memory [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_memory_usage_timeframe"></a> [memory\_usage\_timeframe](#input\_memory\_usage\_timeframe) | Monitor timeframe for PostgreSQL memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_no_connection_enabled"></a> [no\_connection\_enabled](#input\_no\_connection\_enabled) | Flag to enable PostgreSQL status monitor | `string` | `"true"` | no |
| <a name="input_no_connection_extra_tags"></a> [no\_connection\_extra\_tags](#input\_no\_connection\_extra\_tags) | Extra tags for PostgreSQL status monitor | `list(string)` | `[]` | no |
| <a name="input_no_connection_message"></a> [no\_connection\_message](#input\_no\_connection\_message) | Custom message for PostgreSQL no connection monitor | `string` | `""` | no |
| <a name="input_no_connection_time_aggregator"></a> [no\_connection\_time\_aggregator](#input\_no\_connection\_time\_aggregator) | Monitor aggregator for PostgreSQL no connection [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_no_connection_timeframe"></a> [no\_connection\_timeframe](#input\_no\_connection\_timeframe) | Monitor timeframe for PostgreSQL no connection [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_postgresql_no_connection_no_data_timeframe"></a> [postgresql\_no\_connection\_no\_data\_timeframe](#input\_postgresql\_no\_connection\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_postgresql_cpu_usage_id"></a> [postgresql\_cpu\_usage\_id](#output\_postgresql\_cpu\_usage\_id) | id for monitor postgresql\_cpu\_usage |
| <a name="output_postgresql_free_storage_id"></a> [postgresql\_free\_storage\_id](#output\_postgresql\_free\_storage\_id) | id for monitor postgresql\_free\_storage |
| <a name="output_postgresql_io_consumption_id"></a> [postgresql\_io\_consumption\_id](#output\_postgresql\_io\_consumption\_id) | id for monitor postgresql\_io\_consumption |
| <a name="output_postgresql_memory_usage_id"></a> [postgresql\_memory\_usage\_id](#output\_postgresql\_memory\_usage\_id) | id for monitor postgresql\_memory\_usage |
| <a name="output_postgresql_no_connection_id"></a> [postgresql\_no\_connection\_id](#output\_postgresql\_no\_connection\_id) | id for monitor postgresql\_no\_connection |
<!-- END_TF_DOCS -->
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)
You have to search `mysql`
