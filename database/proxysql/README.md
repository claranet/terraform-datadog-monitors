# DATABASE PROXYSQL DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-database-proxysql" {
  source      = "claranet/monitors/datadog//database/proxysql"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- ProxySQL Client connections aborted
- ProxySQL Pool connections failure
- ProxySQL Server connections aborted
- ProxySQL Slow queries
- ProxySQL Thread Worker

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
| [datadog_monitor.proxysql_client_conn_aborted](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.proxysql_pool_conn_failure](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.proxysql_server_conn_aborted](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.proxysql_slow](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.proxysql_thread_worker](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

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
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `false` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_proxysql_client_conn_aborted_enabled"></a> [proxysql\_client\_conn\_aborted\_enabled](#input\_proxysql\_client\_conn\_aborted\_enabled) | Flag to enable ProxySQL client connections aborted monitor | `string` | `"true"` | no |
| <a name="input_proxysql_client_conn_aborted_extra_tags"></a> [proxysql\_client\_conn\_aborted\_extra\_tags](#input\_proxysql\_client\_conn\_aborted\_extra\_tags) | Extra tags for ProxySQL client connections aborted monitor | `list(string)` | `[]` | no |
| <a name="input_proxysql_client_conn_aborted_message"></a> [proxysql\_client\_conn\_aborted\_message](#input\_proxysql\_client\_conn\_aborted\_message) | Custom message for ProxySQL client connections aborted monitor | `string` | `""` | no |
| <a name="input_proxysql_client_conn_aborted_threshold_critical"></a> [proxysql\_client\_conn\_aborted\_threshold\_critical](#input\_proxysql\_client\_conn\_aborted\_threshold\_critical) | Maximum critical acceptable percent of aborted connects | `number` | `10` | no |
| <a name="input_proxysql_client_conn_aborted_threshold_warning"></a> [proxysql\_client\_conn\_aborted\_threshold\_warning](#input\_proxysql\_client\_conn\_aborted\_threshold\_warning) | Maximum warning acceptable percent of aborted connects | `number` | `1` | no |
| <a name="input_proxysql_client_conn_aborted_time_aggregator"></a> [proxysql\_client\_conn\_aborted\_time\_aggregator](#input\_proxysql\_client\_conn\_aborted\_time\_aggregator) | Monitor time aggregator for ProxySQL client connections aborted monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_proxysql_client_conn_aborted_timeframe"></a> [proxysql\_client\_conn\_aborted\_timeframe](#input\_proxysql\_client\_conn\_aborted\_timeframe) | Monitor timeframe for ProxySQL client connections aborted monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_10m"` | no |
| <a name="input_proxysql_pool_conn_failure_enabled"></a> [proxysql\_pool\_conn\_failure\_enabled](#input\_proxysql\_pool\_conn\_failure\_enabled) | Flag to enable ProxySQL pool connections failure monitor | `string` | `"true"` | no |
| <a name="input_proxysql_pool_conn_failure_extra_tags"></a> [proxysql\_pool\_conn\_failure\_extra\_tags](#input\_proxysql\_pool\_conn\_failure\_extra\_tags) | Extra tags for ProxySQL pool connections failure monitor | `list(string)` | `[]` | no |
| <a name="input_proxysql_pool_conn_failure_message"></a> [proxysql\_pool\_conn\_failure\_message](#input\_proxysql\_pool\_conn\_failure\_message) | Custom message for ProxySQL pool connections failure monitor | `string` | `""` | no |
| <a name="input_proxysql_pool_conn_failure_threshold_critical"></a> [proxysql\_pool\_conn\_failure\_threshold\_critical](#input\_proxysql\_pool\_conn\_failure\_threshold\_critical) | Maximum critical acceptable of pool connections failure | `number` | `20` | no |
| <a name="input_proxysql_pool_conn_failure_threshold_warning"></a> [proxysql\_pool\_conn\_failure\_threshold\_warning](#input\_proxysql\_pool\_conn\_failure\_threshold\_warning) | Maximum warning acceptable of pool connections failure | `number` | `1` | no |
| <a name="input_proxysql_pool_conn_failure_time_aggregator"></a> [proxysql\_pool\_conn\_failure\_time\_aggregator](#input\_proxysql\_pool\_conn\_failure\_time\_aggregator) | Monitor time aggregator for ProxySQL pool connections failure monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_proxysql_pool_conn_failure_timeframe"></a> [proxysql\_pool\_conn\_failure\_timeframe](#input\_proxysql\_pool\_conn\_failure\_timeframe) | Monitor timeframe for ProxySQL pool connections failure monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_proxysql_server_conn_aborted_enabled"></a> [proxysql\_server\_conn\_aborted\_enabled](#input\_proxysql\_server\_conn\_aborted\_enabled) | Flag to enable ProxySQL server connections aborted monitor | `string` | `"true"` | no |
| <a name="input_proxysql_server_conn_aborted_extra_tags"></a> [proxysql\_server\_conn\_aborted\_extra\_tags](#input\_proxysql\_server\_conn\_aborted\_extra\_tags) | Extra tags for ProxySQL server connections aborted monitor | `list(string)` | `[]` | no |
| <a name="input_proxysql_server_conn_aborted_message"></a> [proxysql\_server\_conn\_aborted\_message](#input\_proxysql\_server\_conn\_aborted\_message) | Custom message for ProxySQL server connections aborted monitor | `string` | `""` | no |
| <a name="input_proxysql_server_conn_aborted_threshold_critical"></a> [proxysql\_server\_conn\_aborted\_threshold\_critical](#input\_proxysql\_server\_conn\_aborted\_threshold\_critical) | Maximum critical acceptable percent of aborted connects | `number` | `10` | no |
| <a name="input_proxysql_server_conn_aborted_threshold_warning"></a> [proxysql\_server\_conn\_aborted\_threshold\_warning](#input\_proxysql\_server\_conn\_aborted\_threshold\_warning) | Maximum warning acceptable percent of aborted connects | `number` | `1` | no |
| <a name="input_proxysql_server_conn_aborted_time_aggregator"></a> [proxysql\_server\_conn\_aborted\_time\_aggregator](#input\_proxysql\_server\_conn\_aborted\_time\_aggregator) | Monitor time aggregator for ProxySQL server connections aborted monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_proxysql_server_conn_aborted_timeframe"></a> [proxysql\_server\_conn\_aborted\_timeframe](#input\_proxysql\_server\_conn\_aborted\_timeframe) | Monitor timeframe for ProxySQL server connections aborted monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_10m"` | no |
| <a name="input_proxysql_slow_enabled"></a> [proxysql\_slow\_enabled](#input\_proxysql\_slow\_enabled) | Flag to enable ProxySQL slow queries monitor | `string` | `"true"` | no |
| <a name="input_proxysql_slow_extra_tags"></a> [proxysql\_slow\_extra\_tags](#input\_proxysql\_slow\_extra\_tags) | Extra tags for ProxySQL slow queries monitor | `list(string)` | `[]` | no |
| <a name="input_proxysql_slow_message"></a> [proxysql\_slow\_message](#input\_proxysql\_slow\_message) | Custom message for ProxySQL slow queries monitor | `string` | `""` | no |
| <a name="input_proxysql_slow_threshold_critical"></a> [proxysql\_slow\_threshold\_critical](#input\_proxysql\_slow\_threshold\_critical) | Maximum critical acceptable of slow queries | `number` | `20` | no |
| <a name="input_proxysql_slow_threshold_warning"></a> [proxysql\_slow\_threshold\_warning](#input\_proxysql\_slow\_threshold\_warning) | Maximum warning acceptable of slow queries | `number` | `1` | no |
| <a name="input_proxysql_slow_time_aggregator"></a> [proxysql\_slow\_time\_aggregator](#input\_proxysql\_slow\_time\_aggregator) | Monitor time aggregator for ProxySQL slow queries monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_proxysql_slow_timeframe"></a> [proxysql\_slow\_timeframe](#input\_proxysql\_slow\_timeframe) | Monitor timeframe for ProxySQL slow queries monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_proxysql_thread_worker_enabled"></a> [proxysql\_thread\_worker\_enabled](#input\_proxysql\_thread\_worker\_enabled) | Flag to enable ProxySQL thread worker monitor | `string` | `"true"` | no |
| <a name="input_proxysql_thread_worker_extra_tags"></a> [proxysql\_thread\_worker\_extra\_tags](#input\_proxysql\_thread\_worker\_extra\_tags) | Extra tags for ProxySQL thread worker monitor | `list(string)` | `[]` | no |
| <a name="input_proxysql_thread_worker_message"></a> [proxysql\_thread\_worker\_message](#input\_proxysql\_thread\_worker\_message) | Custom message for ProxySQL thread worker monitor | `string` | `""` | no |
| <a name="input_proxysql_thread_worker_threshold_critical"></a> [proxysql\_thread\_worker\_threshold\_critical](#input\_proxysql\_thread\_worker\_threshold\_critical) | Minimum critical acceptable of thread worker running | `number` | `1` | no |
| <a name="input_proxysql_thread_worker_threshold_warning"></a> [proxysql\_thread\_worker\_threshold\_warning](#input\_proxysql\_thread\_worker\_threshold\_warning) | Minimum warning acceptable of thread worker running | `number` | `4` | no |
| <a name="input_proxysql_thread_worker_time_aggregator"></a> [proxysql\_thread\_worker\_time\_aggregator](#input\_proxysql\_thread\_worker\_time\_aggregator) | Monitor time aggregator for ProxySQL thread worker monitor [available values: min, max or avg] | `string` | `"avg"` | no |
| <a name="input_proxysql_thread_worker_timeframe"></a> [proxysql\_thread\_worker\_timeframe](#input\_proxysql\_thread\_worker\_timeframe) | Monitor timeframe for ProxySQL thread worker monitor [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_proxysql_client_conn_aborted_id"></a> [proxysql\_client\_conn\_aborted\_id](#output\_proxysql\_client\_conn\_aborted\_id) | id for monitor proxysql\_client\_conn\_aborted |
| <a name="output_proxysql_pool_conn_failure_id"></a> [proxysql\_pool\_conn\_failure\_id](#output\_proxysql\_pool\_conn\_failure\_id) | id for monitor proxysql\_pool\_conn\_failure |
| <a name="output_proxysql_server_conn_aborted_id"></a> [proxysql\_server\_conn\_aborted\_id](#output\_proxysql\_server\_conn\_aborted\_id) | id for monitor proxysql\_server\_conn\_aborted |
| <a name="output_proxysql_slow_id"></a> [proxysql\_slow\_id](#output\_proxysql\_slow\_id) | id for monitor proxysql\_slow |
| <a name="output_proxysql_thread_worker_id"></a> [proxysql\_thread\_worker\_id](#output\_proxysql\_thread\_worker\_id) | id for monitor proxysql\_thread\_worker |
<!-- END_TF_DOCS -->
## Related documentation

* [Datadog documentation](https://docs.datadoghq.com/integrations/proxysql/)
* [ProxySQL documentation](https://proxysql.com/documentation/)
