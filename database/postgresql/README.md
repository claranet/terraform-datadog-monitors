# DATABASE POSTGRESQL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-postgresql" {
  source      = "claranet/monitors/datadog//database/postgresql"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- PostgreSQL Connections
- PostgreSQL disk queue depth
- PostgreSQL replication delay on {{host}}:{{port}}
- PostgreSQL server does not respond
- PostgreSQL too many locks

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
| [datadog_monitor.postgresql_availability](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.postgresql_connection_too_high](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.postgresql_disk_queue_depth](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.postgresql_replication_delay](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.postgresql_too_many_locks](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds for the metric evaluation | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_postgresql_availability_enabled"></a> [postgresql\_availability\_enabled](#input\_postgresql\_availability\_enabled) | Flag to enable PostgreSQL availability monitor | `string` | `"true"` | no |
| <a name="input_postgresql_availability_extra_tags"></a> [postgresql\_availability\_extra\_tags](#input\_postgresql\_availability\_extra\_tags) | Extra tags for PostgreSQL availability monitor | `list(string)` | `[]` | no |
| <a name="input_postgresql_availability_message"></a> [postgresql\_availability\_message](#input\_postgresql\_availability\_message) | Custom message for PostgreSQL availability monitor | `string` | `""` | no |
| <a name="input_postgresql_availability_no_data_timeframe"></a> [postgresql\_availability\_no\_data\_timeframe](#input\_postgresql\_availability\_no\_data\_timeframe) | PostgreSQL availability monitor no data timeframe | `string` | `10` | no |
| <a name="input_postgresql_availability_threshold_warning"></a> [postgresql\_availability\_threshold\_warning](#input\_postgresql\_availability\_threshold\_warning) | PostgreSQL availability monitor (warning threshold) | `string` | `3` | no |
| <a name="input_postgresql_connection_enabled"></a> [postgresql\_connection\_enabled](#input\_postgresql\_connection\_enabled) | Flag to enable PostgreSQL connection monitor | `string` | `"true"` | no |
| <a name="input_postgresql_connection_extra_tags"></a> [postgresql\_connection\_extra\_tags](#input\_postgresql\_connection\_extra\_tags) | Extra tags for PostgreSQL connection connects monitor | `list(string)` | `[]` | no |
| <a name="input_postgresql_connection_message"></a> [postgresql\_connection\_message](#input\_postgresql\_connection\_message) | Custom message for PostgreSQL connection monitor | `string` | `""` | no |
| <a name="input_postgresql_connection_threshold_critical"></a> [postgresql\_connection\_threshold\_critical](#input\_postgresql\_connection\_threshold\_critical) | Maximum critical acceptable percent of connections | `number` | `80` | no |
| <a name="input_postgresql_connection_threshold_warning"></a> [postgresql\_connection\_threshold\_warning](#input\_postgresql\_connection\_threshold\_warning) | Maximum warning acceptable percent of connections | `number` | `70` | no |
| <a name="input_postgresql_connection_time_aggregator"></a> [postgresql\_connection\_time\_aggregator](#input\_postgresql\_connection\_time\_aggregator) | Monitor time aggregator for PostgreSQL connection monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_postgresql_connection_timeframe"></a> [postgresql\_connection\_timeframe](#input\_postgresql\_connection\_timeframe) | Monitor timeframe for PostgreSQL connection monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_postgresql_disk_queue_aggregator"></a> [postgresql\_disk\_queue\_aggregator](#input\_postgresql\_disk\_queue\_aggregator) | Monitor time aggregator for PostgreSQL disk queue depth [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_postgresql_disk_queue_enabled"></a> [postgresql\_disk\_queue\_enabled](#input\_postgresql\_disk\_queue\_enabled) | Flag to enable PostgreSQL disk queue | `bool` | `true` | no |
| <a name="input_postgresql_disk_queue_extra_tags"></a> [postgresql\_disk\_queue\_extra\_tags](#input\_postgresql\_disk\_queue\_extra\_tags) | Extra tags for PostgreSQL lock connects monitor | `list(string)` | `[]` | no |
| <a name="input_postgresql_disk_queue_message"></a> [postgresql\_disk\_queue\_message](#input\_postgresql\_disk\_queue\_message) | Custom message for PostgreSQL disk queue monitor | `string` | `""` | no |
| <a name="input_postgresql_disk_queue_threshold_critical"></a> [postgresql\_disk\_queue\_threshold\_critical](#input\_postgresql\_disk\_queue\_threshold\_critical) | Maximum critical acceptable number of locks | `number` | `64` | no |
| <a name="input_postgresql_disk_queue_threshold_warning"></a> [postgresql\_disk\_queue\_threshold\_warning](#input\_postgresql\_disk\_queue\_threshold\_warning) | Maximum warning acceptable number of disk queue | `number` | `48` | no |
| <a name="input_postgresql_disk_queue_timeframe"></a> [postgresql\_disk\_queue\_timeframe](#input\_postgresql\_disk\_queue\_timeframe) | Monitor timeframe for PostgreSQL disk queue depth [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_postgresql_lock_enabled"></a> [postgresql\_lock\_enabled](#input\_postgresql\_lock\_enabled) | Flag to enable PostgreSQL lock monitor | `string` | `"true"` | no |
| <a name="input_postgresql_lock_extra_tags"></a> [postgresql\_lock\_extra\_tags](#input\_postgresql\_lock\_extra\_tags) | Extra tags for PostgreSQL lock connects monitor | `list(string)` | `[]` | no |
| <a name="input_postgresql_lock_message"></a> [postgresql\_lock\_message](#input\_postgresql\_lock\_message) | Custom message for PostgreSQL lock monitor | `string` | `""` | no |
| <a name="input_postgresql_lock_threshold_critical"></a> [postgresql\_lock\_threshold\_critical](#input\_postgresql\_lock\_threshold\_critical) | Maximum critical acceptable number of locks | `number` | `99` | no |
| <a name="input_postgresql_lock_threshold_warning"></a> [postgresql\_lock\_threshold\_warning](#input\_postgresql\_lock\_threshold\_warning) | Maximum warning acceptable number of locks | `number` | `70` | no |
| <a name="input_postgresql_lock_time_aggregator"></a> [postgresql\_lock\_time\_aggregator](#input\_postgresql\_lock\_time\_aggregator) | Monitor time aggregator for PostgreSQL lock monitor [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_postgresql_lock_timeframe"></a> [postgresql\_lock\_timeframe](#input\_postgresql\_lock\_timeframe) | Monitor timeframe for PostgreSQL lock monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_postgresql_replication_delay_aggregator"></a> [postgresql\_replication\_delay\_aggregator](#input\_postgresql\_replication\_delay\_aggregator) | Monitor time aggregator for PostgreSQL replication delay [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_postgresql_replication_delay_enabled"></a> [postgresql\_replication\_delay\_enabled](#input\_postgresql\_replication\_delay\_enabled) | Flag to enable PostgreSQL replication delay monitor | `bool` | `true` | no |
| <a name="input_postgresql_replication_delay_extra_tags"></a> [postgresql\_replication\_delay\_extra\_tags](#input\_postgresql\_replication\_delay\_extra\_tags) | Extra tags for PostgreSQL replication delay monitor | `list(string)` | `[]` | no |
| <a name="input_postgresql_replication_delay_message"></a> [postgresql\_replication\_delay\_message](#input\_postgresql\_replication\_delay\_message) | Custom message for PostgreSQL replication delay monitor | `string` | `""` | no |
| <a name="input_postgresql_replication_delay_threshold_critical"></a> [postgresql\_replication\_delay\_threshold\_critical](#input\_postgresql\_replication\_delay\_threshold\_critical) | Critical threshold in seconds | `number` | `200` | no |
| <a name="input_postgresql_replication_delay_threshold_warning"></a> [postgresql\_replication\_delay\_threshold\_warning](#input\_postgresql\_replication\_delay\_threshold\_warning) | Warning threshold in seconds | `number` | `100` | no |
| <a name="input_postgresql_replication_delay_timeframe"></a> [postgresql\_replication\_delay\_timeframe](#input\_postgresql\_replication\_delay\_timeframe) | Monitor timeframe for PostgreSQL replication delay [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_postgresql_availability_id"></a> [postgresql\_availability\_id](#output\_postgresql\_availability\_id) | id for monitor postgresql\_availability |
| <a name="output_postgresql_connection_too_high_id"></a> [postgresql\_connection\_too\_high\_id](#output\_postgresql\_connection\_too\_high\_id) | id for monitor postgresql\_connection\_too\_high |
| <a name="output_postgresql_disk_queue_depth_id"></a> [postgresql\_disk\_queue\_depth\_id](#output\_postgresql\_disk\_queue\_depth\_id) | id for monitor postgresql\_disk\_queue\_depth |
| <a name="output_postgresql_replication_delay_id"></a> [postgresql\_replication\_delay\_id](#output\_postgresql\_replication\_delay\_id) | id for monitor postgresql\_replication\_delay |
| <a name="output_postgresql_too_many_locks_id"></a> [postgresql\_too\_many\_locks\_id](#output\_postgresql\_too\_many\_locks\_id) | id for monitor postgresql\_too\_many\_locks |
<!-- END_TF_DOCS -->
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/postgres/](https://docs.datadoghq.com/integrations/postgres/)
