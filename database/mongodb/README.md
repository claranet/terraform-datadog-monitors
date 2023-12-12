# DATABASE MONGODB DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-mongodb" {
  source      = "claranet/monitors/datadog//database/mongodb"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- MongoDB primary state
- MongoDB replication lag
- MongoDB secondary missing
- MongoDB too much servers or wrong monitoring config

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
| <a name="module_filter-tags-secondary"></a> [filter-tags-secondary](#module\_filter-tags-secondary) | ../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.mongodb_primary](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.mongodb_replication](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.mongodb_secondary](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.mongodb_server_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_separator"></a> [filter\_tags\_separator](#input\_filter\_tags\_separator) | Set the filter tags separator (, or AND) | `string` | `","` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_mongodb_desired_servers_count"></a> [mongodb\_desired\_servers\_count](#input\_mongodb\_desired\_servers\_count) | Number of servers that should be instanciated for this cluster | `number` | `3` | no |
| <a name="input_mongodb_lag_critical"></a> [mongodb\_lag\_critical](#input\_mongodb\_lag\_critical) | Critical replication lag in s | `number` | `5` | no |
| <a name="input_mongodb_lag_warning"></a> [mongodb\_lag\_warning](#input\_mongodb\_lag\_warning) | Warn replication lag in s | `number` | `2` | no |
| <a name="input_mongodb_primary_aggregator"></a> [mongodb\_primary\_aggregator](#input\_mongodb\_primary\_aggregator) | Monitor aggregator for MongoDB primary state [available values: min, max] | `string` | `"max"` | no |
| <a name="input_mongodb_primary_enabled"></a> [mongodb\_primary\_enabled](#input\_mongodb\_primary\_enabled) | Flag to enable MongoDB primary state monitor | `string` | `"true"` | no |
| <a name="input_mongodb_primary_extra_tags"></a> [mongodb\_primary\_extra\_tags](#input\_mongodb\_primary\_extra\_tags) | Extra tags for MongoDB primary state monitor | `list(string)` | `[]` | no |
| <a name="input_mongodb_primary_message"></a> [mongodb\_primary\_message](#input\_mongodb\_primary\_message) | Custom message for MongoDB primary monitor | `string` | `""` | no |
| <a name="input_mongodb_primary_no_data_timeframe"></a> [mongodb\_primary\_no\_data\_timeframe](#input\_mongodb\_primary\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_mongodb_primary_timeframe"></a> [mongodb\_primary\_timeframe](#input\_mongodb\_primary\_timeframe) | Monitor timeframe for MongoDB wrong state for primary node [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1m"` | no |
| <a name="input_mongodb_replication_aggregator"></a> [mongodb\_replication\_aggregator](#input\_mongodb\_replication\_aggregator) | Monitor aggregator for MongoDB replication lag [available values: min, max, sum or avg] | `string` | `"avg"` | no |
| <a name="input_mongodb_replication_enabled"></a> [mongodb\_replication\_enabled](#input\_mongodb\_replication\_enabled) | Flag to enable MongoDB replication lag monitor | `string` | `"true"` | no |
| <a name="input_mongodb_replication_extra_tags"></a> [mongodb\_replication\_extra\_tags](#input\_mongodb\_replication\_extra\_tags) | Extra tags for MongoDB replication lag monitor | `list(string)` | `[]` | no |
| <a name="input_mongodb_replication_message"></a> [mongodb\_replication\_message](#input\_mongodb\_replication\_message) | Custom message for MongoDB replication monitor | `string` | `""` | no |
| <a name="input_mongodb_replication_timeframe"></a> [mongodb\_replication\_timeframe](#input\_mongodb\_replication\_timeframe) | Monitor timeframe for MongoDB replication lag  [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1m"` | no |
| <a name="input_mongodb_secondary_aggregator"></a> [mongodb\_secondary\_aggregator](#input\_mongodb\_secondary\_aggregator) | Monitor aggregator for MongoDB secondary state [available values: min, max] | `string` | `"max"` | no |
| <a name="input_mongodb_secondary_enabled"></a> [mongodb\_secondary\_enabled](#input\_mongodb\_secondary\_enabled) | Flag to enable MongoDB secondary state monitor | `string` | `"true"` | no |
| <a name="input_mongodb_secondary_extra_tags"></a> [mongodb\_secondary\_extra\_tags](#input\_mongodb\_secondary\_extra\_tags) | Extra tags for MongoDB secondary state monitor | `list(string)` | `[]` | no |
| <a name="input_mongodb_secondary_message"></a> [mongodb\_secondary\_message](#input\_mongodb\_secondary\_message) | Custom message for MongoDB secondary monitor | `string` | `""` | no |
| <a name="input_mongodb_secondary_timeframe"></a> [mongodb\_secondary\_timeframe](#input\_mongodb\_secondary\_timeframe) | Monitor timeframe for MongoDB wrong state for secondaries nodes [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_mongodb_server_count_aggregator"></a> [mongodb\_server\_count\_aggregator](#input\_mongodb\_server\_count\_aggregator) | Monitor aggregator for MongoDB server count [available values: min, max] | `string` | `"min"` | no |
| <a name="input_mongodb_server_count_enabled"></a> [mongodb\_server\_count\_enabled](#input\_mongodb\_server\_count\_enabled) | Flag to enable MongoDB server count monitor | `string` | `"true"` | no |
| <a name="input_mongodb_server_count_message"></a> [mongodb\_server\_count\_message](#input\_mongodb\_server\_count\_message) | Custom message for MongoDB server count | `string` | `""` | no |
| <a name="input_mongodb_server_count_timeframe"></a> [mongodb\_server\_count\_timeframe](#input\_mongodb\_server\_count\_timeframe) | Monitor timeframe for MongoDB wrong server count [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global variables | `list(string)` | <pre>[<br>  "type:database",<br>  "provider:mongo",<br>  "resource:mongodb"<br>]</pre> | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `"claranet"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mongodb_primary_id"></a> [mongodb\_primary\_id](#output\_mongodb\_primary\_id) | id for monitor mongodb\_primary |
| <a name="output_mongodb_replication_id"></a> [mongodb\_replication\_id](#output\_mongodb\_replication\_id) | id for monitor mongodb\_replication |
| <a name="output_mongodb_secondary_id"></a> [mongodb\_secondary\_id](#output\_mongodb\_secondary\_id) | id for monitor mongodb\_secondary |
| <a name="output_mongodb_server_count_id"></a> [mongodb\_server\_count\_id](#output\_mongodb\_server\_count\_id) | id for monitor mongodb\_server\_count |
<!-- END_TF_DOCS -->
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/mongo/](https://docs.datadoghq.com/integrations/mongo/)
MongoDB documentation: [https://docs.mongodb.com/manual/administration/monitoring/](https://docs.mongodb.com/manual/administration/monitoring/)
