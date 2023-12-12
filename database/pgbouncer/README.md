# DATABASE PGBOUNCER DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-pgbouncer" {
  source      = "claranet/monitors/datadog//database/pgbouncer"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- PGBouncer database connection limit
- PGBouncer does not respond
- PGBouncer pool connection limit
- PGBouncer wait time

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
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.pgbouncer_availability](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.pgbouncer_database_connection_limit](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.pgbouncer_pool_connection_limit](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.pgbouncer_wait_time](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds for the metric evaluation | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_pgbouncer_availability_enabled"></a> [pgbouncer\_availability\_enabled](#input\_pgbouncer\_availability\_enabled) | Flag to enable PGBouncer availability monitor | `bool` | `true` | no |
| <a name="input_pgbouncer_availability_extra_tags"></a> [pgbouncer\_availability\_extra\_tags](#input\_pgbouncer\_availability\_extra\_tags) | Extra tags for PGBouncer availability monitor | `list(string)` | `[]` | no |
| <a name="input_pgbouncer_availability_message"></a> [pgbouncer\_availability\_message](#input\_pgbouncer\_availability\_message) | Custom message for PGBouncer availability monitor | `string` | `""` | no |
| <a name="input_pgbouncer_availability_no_data_timeframe"></a> [pgbouncer\_availability\_no\_data\_timeframe](#input\_pgbouncer\_availability\_no\_data\_timeframe) | PGBouncer availability monitor no data timeframe | `string` | `10` | no |
| <a name="input_pgbouncer_availability_threshold_warning"></a> [pgbouncer\_availability\_threshold\_warning](#input\_pgbouncer\_availability\_threshold\_warning) | PGBouncer availability monitor (warning threshold) | `string` | `3` | no |
| <a name="input_pgbouncer_database_connection_limit_enabled"></a> [pgbouncer\_database\_connection\_limit\_enabled](#input\_pgbouncer\_database\_connection\_limit\_enabled) | Flag to enable PGBouncer connection limit monitor | `bool` | `true` | no |
| <a name="input_pgbouncer_database_connection_limit_extra_tags"></a> [pgbouncer\_database\_connection\_limit\_extra\_tags](#input\_pgbouncer\_database\_connection\_limit\_extra\_tags) | Extra tags for PGBouncer connection limit monitor | `list(string)` | `[]` | no |
| <a name="input_pgbouncer_database_connection_limit_message"></a> [pgbouncer\_database\_connection\_limit\_message](#input\_pgbouncer\_database\_connection\_limit\_message) | Custom message for PGBouncer connection monitor | `string` | `""` | no |
| <a name="input_pgbouncer_database_connection_limit_threshold_critical"></a> [pgbouncer\_database\_connection\_limit\_threshold\_critical](#input\_pgbouncer\_database\_connection\_limit\_threshold\_critical) | Critical number of connection limit monitor | `number` | `100` | no |
| <a name="input_pgbouncer_database_connection_limit_threshold_warning"></a> [pgbouncer\_database\_connection\_limit\_threshold\_warning](#input\_pgbouncer\_database\_connection\_limit\_threshold\_warning) | Warning number of connections limit monitor | `number` | `70` | no |
| <a name="input_pgbouncer_database_connection_limit_time_aggregator"></a> [pgbouncer\_database\_connection\_limit\_time\_aggregator](#input\_pgbouncer\_database\_connection\_limit\_time\_aggregator) | Monitor time aggregator for PGBouncer connection monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_pgbouncer_database_connection_limit_timeframe"></a> [pgbouncer\_database\_connection\_limit\_timeframe](#input\_pgbouncer\_database\_connection\_limit\_timeframe) | Monitor timeframe for PGBouncer connection monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_pgbouncer_pool_connection_limit_enabled"></a> [pgbouncer\_pool\_connection\_limit\_enabled](#input\_pgbouncer\_pool\_connection\_limit\_enabled) | Flag to enable PGBouncer connection limit monitor | `bool` | `true` | no |
| <a name="input_pgbouncer_pool_connection_limit_extra_tags"></a> [pgbouncer\_pool\_connection\_limit\_extra\_tags](#input\_pgbouncer\_pool\_connection\_limit\_extra\_tags) | Extra tags for PGBouncer connection limit monitor | `list(string)` | `[]` | no |
| <a name="input_pgbouncer_pool_connection_limit_message"></a> [pgbouncer\_pool\_connection\_limit\_message](#input\_pgbouncer\_pool\_connection\_limit\_message) | Custom message for PGBouncer connection monitor | `string` | `""` | no |
| <a name="input_pgbouncer_pool_connection_limit_threshold_critical"></a> [pgbouncer\_pool\_connection\_limit\_threshold\_critical](#input\_pgbouncer\_pool\_connection\_limit\_threshold\_critical) | Critical number of connection limit monitor | `number` | `100` | no |
| <a name="input_pgbouncer_pool_connection_limit_threshold_warning"></a> [pgbouncer\_pool\_connection\_limit\_threshold\_warning](#input\_pgbouncer\_pool\_connection\_limit\_threshold\_warning) | Warning number of connections limit monitor | `number` | `70` | no |
| <a name="input_pgbouncer_pool_connection_limit_time_aggregator"></a> [pgbouncer\_pool\_connection\_limit\_time\_aggregator](#input\_pgbouncer\_pool\_connection\_limit\_time\_aggregator) | Monitor time aggregator for PGBouncer connection monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_pgbouncer_pool_connection_limit_timeframe"></a> [pgbouncer\_pool\_connection\_limit\_timeframe](#input\_pgbouncer\_pool\_connection\_limit\_timeframe) | Monitor timeframe for PGBouncer connection monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_pgbouncer_wait_time_enabled"></a> [pgbouncer\_wait\_time\_enabled](#input\_pgbouncer\_wait\_time\_enabled) | Flag to enable PGBouncer wait time monitor | `bool` | `true` | no |
| <a name="input_pgbouncer_wait_time_extra_tags"></a> [pgbouncer\_wait\_time\_extra\_tags](#input\_pgbouncer\_wait\_time\_extra\_tags) | Extra tags for PGBouncer wait time monitor | `list(string)` | `[]` | no |
| <a name="input_pgbouncer_wait_time_message"></a> [pgbouncer\_wait\_time\_message](#input\_pgbouncer\_wait\_time\_message) | Custom message for PGBouncer connection monitor | `string` | `""` | no |
| <a name="input_pgbouncer_wait_time_threshold_critical"></a> [pgbouncer\_wait\_time\_threshold\_critical](#input\_pgbouncer\_wait\_time\_threshold\_critical) | Critical number in μs of wait time monitor | `number` | `100000` | no |
| <a name="input_pgbouncer_wait_time_threshold_warning"></a> [pgbouncer\_wait\_time\_threshold\_warning](#input\_pgbouncer\_wait\_time\_threshold\_warning) | Warning number in μs of wait time monitor | `number` | `70000` | no |
| <a name="input_pgbouncer_wait_time_time_aggregator"></a> [pgbouncer\_wait\_time\_time\_aggregator](#input\_pgbouncer\_wait\_time\_time\_aggregator) | Monitor time aggregator for PGBouncer connection monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_pgbouncer_wait_time_timeframe"></a> [pgbouncer\_wait\_time\_timeframe](#input\_pgbouncer\_wait\_time\_timeframe) | Monitor timeframe for PGBouncer connection monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global variables | `list(string)` | <pre>[<br>  "type:database",<br>  "provider:pgbouncer",<br>  "resource:pgbouncer"<br>]</pre> | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `"claranet"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pgbouncer_availability_id"></a> [pgbouncer\_availability\_id](#output\_pgbouncer\_availability\_id) | id for monitor pgbouncer\_availability |
| <a name="output_pgbouncer_database_connection_limit_id"></a> [pgbouncer\_database\_connection\_limit\_id](#output\_pgbouncer\_database\_connection\_limit\_id) | id for monitor pgbouncer\_database\_connection\_limit |
| <a name="output_pgbouncer_pool_connection_limit_id"></a> [pgbouncer\_pool\_connection\_limit\_id](#output\_pgbouncer\_pool\_connection\_limit\_id) | id for monitor pgbouncer\_pool\_connection\_limit |
| <a name="output_pgbouncer_wait_time_id"></a> [pgbouncer\_wait\_time\_id](#output\_pgbouncer\_wait\_time\_id) | id for monitor pgbouncer\_wait\_time |
<!-- END_TF_DOCS -->
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/postgres/](https://docs.datadoghq.com/integrations/postgres/)
