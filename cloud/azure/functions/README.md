# CLOUD AZURE FUNCTIONS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-functions" {
  source      = "claranet/monitors/datadog//cloud/azure/functions"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Function App connections count too high
- Function App HTTP 5xx errors too high
- Function App threads count too high

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
| [datadog_monitor.function_high_connections_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.function_high_threads_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.function_http_5xx_errors_rate](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_high_connections_count_enabled"></a> [high\_connections\_count\_enabled](#input\_high\_connections\_count\_enabled) | Flag to enable Functions high connections count monitor | `string` | `"true"` | no |
| <a name="input_high_connections_count_extra_tags"></a> [high\_connections\_count\_extra\_tags](#input\_high\_connections\_count\_extra\_tags) | Extra tags for Functions high connections count monitor | `list(string)` | `[]` | no |
| <a name="input_high_connections_count_message"></a> [high\_connections\_count\_message](#input\_high\_connections\_count\_message) | Custom message for Functions high connections count monitor | `string` | `""` | no |
| <a name="input_high_connections_count_threshold_critical"></a> [high\_connections\_count\_threshold\_critical](#input\_high\_connections\_count\_threshold\_critical) | Alerting threshold for Functions high connections count | `number` | `590` | no |
| <a name="input_high_connections_count_threshold_warning"></a> [high\_connections\_count\_threshold\_warning](#input\_high\_connections\_count\_threshold\_warning) | Warning threshold for Functions high connections count | `number` | `550` | no |
| <a name="input_high_connections_count_time_aggregator"></a> [high\_connections\_count\_time\_aggregator](#input\_high\_connections\_count\_time\_aggregator) | Monitor aggregator for Functions high connections count [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_high_connections_count_timeframe"></a> [high\_connections\_count\_timeframe](#input\_high\_connections\_count\_timeframe) | Monitor timeframe for Functions high connections count [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_high_threads_count_enabled"></a> [high\_threads\_count\_enabled](#input\_high\_threads\_count\_enabled) | Flag to enable Functions high threads count monitor | `string` | `"true"` | no |
| <a name="input_high_threads_count_extra_tags"></a> [high\_threads\_count\_extra\_tags](#input\_high\_threads\_count\_extra\_tags) | Extra tags for Functions high threads count monitor | `list(string)` | `[]` | no |
| <a name="input_high_threads_count_message"></a> [high\_threads\_count\_message](#input\_high\_threads\_count\_message) | Custom message for Functions high threads count monitor | `string` | `""` | no |
| <a name="input_high_threads_count_threshold_critical"></a> [high\_threads\_count\_threshold\_critical](#input\_high\_threads\_count\_threshold\_critical) | Alerting threshold for Functions high threads count | `number` | `510` | no |
| <a name="input_high_threads_count_threshold_warning"></a> [high\_threads\_count\_threshold\_warning](#input\_high\_threads\_count\_threshold\_warning) | Warning threshold for Functions high threads count | `number` | `490` | no |
| <a name="input_high_threads_count_time_aggregator"></a> [high\_threads\_count\_time\_aggregator](#input\_high\_threads\_count\_time\_aggregator) | Monitor aggregator for Functions high threads count [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_high_threads_count_timeframe"></a> [high\_threads\_count\_timeframe](#input\_high\_threads\_count\_timeframe) | Monitor timeframe for Functions high threads count [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_http_5xx_errors_rate_enabled"></a> [http\_5xx\_errors\_rate\_enabled](#input\_http\_5xx\_errors\_rate\_enabled) | Flag to enable Functions Http 5xx errors rate monitor | `string` | `"true"` | no |
| <a name="input_http_5xx_errors_rate_extra_tags"></a> [http\_5xx\_errors\_rate\_extra\_tags](#input\_http\_5xx\_errors\_rate\_extra\_tags) | Extra tags for Functions Http 5xx errors rate monitor | `list(string)` | `[]` | no |
| <a name="input_http_5xx_errors_rate_message"></a> [http\_5xx\_errors\_rate\_message](#input\_http\_5xx\_errors\_rate\_message) | Custom message for Functions Http 5xx errors rate monitor | `string` | `""` | no |
| <a name="input_http_5xx_errors_rate_threshold_critical"></a> [http\_5xx\_errors\_rate\_threshold\_critical](#input\_http\_5xx\_errors\_rate\_threshold\_critical) | Alerting threshold for Functions Http 5xx errors rate | `number` | `20` | no |
| <a name="input_http_5xx_errors_rate_threshold_warning"></a> [http\_5xx\_errors\_rate\_threshold\_warning](#input\_http\_5xx\_errors\_rate\_threshold\_warning) | Warning threshold for Functions Http 5xx errors rate | `number` | `10` | no |
| <a name="input_http_5xx_errors_rate_time_aggregator"></a> [http\_5xx\_errors\_rate\_time\_aggregator](#input\_http\_5xx\_errors\_rate\_time\_aggregator) | Monitor aggregator for Functions Http 5xx errors rate [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_http_5xx_errors_rate_timeframe"></a> [http\_5xx\_errors\_rate\_timeframe](#input\_http\_5xx\_errors\_rate\_timeframe) | Monitor timeframe for Functions Http 5xx errors rate [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | Alert severity of monitors from 1 (high) to 5 (low) | `number` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global variables | `list(string)` | <pre>[<br>  "type:cloud",<br>  "provider:azure",<br>  "resource:azure_functions"<br>]</pre> | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `"claranet"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_function_high_connections_count_id"></a> [function\_high\_connections\_count\_id](#output\_function\_high\_connections\_count\_id) | id for monitor function\_high\_connections\_count |
| <a name="output_function_high_threads_count_id"></a> [function\_high\_threads\_count\_id](#output\_function\_high\_threads\_count\_id) | id for monitor function\_high\_threads\_count |
| <a name="output_function_http_5xx_errors_rate_id"></a> [function\_http\_5xx\_errors\_rate\_id](#output\_function\_http\_5xx\_errors\_rate\_id) | id for monitor function\_http\_5xx\_errors\_rate |
<!-- END_TF_DOCS -->
## Related documentation

Datadog Azure documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)

Azure Monitor metrics: [https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftwebsites-functions](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsoftwebsites-functions)

Azure Functions connections limits: [https://docs.microsoft.com/en-us/azure/azure-functions/manage-connections#connections-limit](https://docs.microsoft.com/en-us/azure/azure-functions/manage-connections#connections-limit)
