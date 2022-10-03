# CLOUD AWS LAMBDA DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-lambda" {
  source      = "claranet/monitors/datadog//cloud/aws/lambda"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Lambda Invocations throttled due to concurrent limit reached
- Lambda Number of errors
- Lambda Number of invocations (disabled by default)
- Lambda Percentage of errors

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
| [datadog_monitor.errors](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.invocations](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.pct_errors](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.throttles](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_errors_enabled"></a> [errors\_enabled](#input\_errors\_enabled) | Flag to enable Errors monitor | `string` | `"false"` | no |
| <a name="input_errors_extra_tags"></a> [errors\_extra\_tags](#input\_errors\_extra\_tags) | Extra tags for Errors monitor | `list(string)` | `[]` | no |
| <a name="input_errors_message"></a> [errors\_message](#input\_errors\_message) | Custom message for Errors monitor | `string` | `""` | no |
| <a name="input_errors_threshold_critical"></a> [errors\_threshold\_critical](#input\_errors\_threshold\_critical) | Alerting threshold in milliseconds | `number` | `3` | no |
| <a name="input_errors_threshold_warning"></a> [errors\_threshold\_warning](#input\_errors\_threshold\_warning) | Warning threshold in milliseconds | `number` | `1` | no |
| <a name="input_errors_time_aggregator"></a> [errors\_time\_aggregator](#input\_errors\_time\_aggregator) | Monitor aggregator for Errors [available values: min, max or avg] | `string` | `"sum"` | no |
| <a name="input_errors_timeframe"></a> [errors\_timeframe](#input\_errors\_timeframe) | Monitor timeframe for Errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1h"` | no |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_invocations_enabled"></a> [invocations\_enabled](#input\_invocations\_enabled) | Flag to enable Invocations monitor | `string` | `"false"` | no |
| <a name="input_invocations_extra_tags"></a> [invocations\_extra\_tags](#input\_invocations\_extra\_tags) | Extra tags for Invocations monitor | `list(string)` | `[]` | no |
| <a name="input_invocations_message"></a> [invocations\_message](#input\_invocations\_message) | Custom message for Invocations monitor | `string` | `""` | no |
| <a name="input_invocations_no_data_timeframe"></a> [invocations\_no\_data\_timeframe](#input\_invocations\_no\_data\_timeframe) | Timeframe to check before alerting on no data in minutes | `number` | `120` | no |
| <a name="input_invocations_threshold_critical"></a> [invocations\_threshold\_critical](#input\_invocations\_threshold\_critical) | Alerting threshold in number of invocations | `number` | `1` | no |
| <a name="input_invocations_threshold_warning"></a> [invocations\_threshold\_warning](#input\_invocations\_threshold\_warning) | Warning threshold in number of invocations | `number` | `2` | no |
| <a name="input_invocations_time_aggregator"></a> [invocations\_time\_aggregator](#input\_invocations\_time\_aggregator) | Monitor aggregator for Invocations [available values: min, max or avg] | `string` | `"sum"` | no |
| <a name="input_invocations_timeframe"></a> [invocations\_timeframe](#input\_invocations\_timeframe) | Monitor timeframe for Invocations [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_30m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_pct_errors_enabled"></a> [pct\_errors\_enabled](#input\_pct\_errors\_enabled) | Flag to enable Percentage of errors monitor | `string` | `"true"` | no |
| <a name="input_pct_errors_extra_tags"></a> [pct\_errors\_extra\_tags](#input\_pct\_errors\_extra\_tags) | Extra tags for Percentage of errors monitor | `list(string)` | `[]` | no |
| <a name="input_pct_errors_message"></a> [pct\_errors\_message](#input\_pct\_errors\_message) | Custom message for Percentage of errors monitor | `string` | `""` | no |
| <a name="input_pct_errors_threshold_critical"></a> [pct\_errors\_threshold\_critical](#input\_pct\_errors\_threshold\_critical) | Alerting threshold in percentage | `number` | `30` | no |
| <a name="input_pct_errors_threshold_warning"></a> [pct\_errors\_threshold\_warning](#input\_pct\_errors\_threshold\_warning) | Warning threshold in percentage | `number` | `20` | no |
| <a name="input_pct_errors_time_aggregator"></a> [pct\_errors\_time\_aggregator](#input\_pct\_errors\_time\_aggregator) | Monitor aggregator for Percentage of errors [available values: min, max or avg] | `string` | `"sum"` | no |
| <a name="input_pct_errors_timeframe"></a> [pct\_errors\_timeframe](#input\_pct\_errors\_timeframe) | Monitor timeframe for Percentage of errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1h"` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_throttles_enabled"></a> [throttles\_enabled](#input\_throttles\_enabled) | Flag to enable Throttles monitor | `string` | `"true"` | no |
| <a name="input_throttles_extra_tags"></a> [throttles\_extra\_tags](#input\_throttles\_extra\_tags) | Extra tags for Throttles monitor | `list(string)` | `[]` | no |
| <a name="input_throttles_message"></a> [throttles\_message](#input\_throttles\_message) | Custom message for Throttles monitor | `string` | `""` | no |
| <a name="input_throttles_threshold_critical"></a> [throttles\_threshold\_critical](#input\_throttles\_threshold\_critical) | Alerting threshold in number of throttles | `number` | `3` | no |
| <a name="input_throttles_threshold_warning"></a> [throttles\_threshold\_warning](#input\_throttles\_threshold\_warning) | Warning threshold in number of throttles | `number` | `1` | no |
| <a name="input_throttles_time_aggregator"></a> [throttles\_time\_aggregator](#input\_throttles\_time\_aggregator) | Monitor aggregator for Throttles [available values: min, max or avg] | `string` | `"sum"` | no |
| <a name="input_throttles_timeframe"></a> [throttles\_timeframe](#input\_throttles\_timeframe) | Monitor timeframe for Throttles [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1h"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_errors_id"></a> [errors\_id](#output\_errors\_id) | id for monitor errors |
| <a name="output_invocations_id"></a> [invocations\_id](#output\_invocations\_id) | id for monitor invocations |
| <a name="output_pct_errors_id"></a> [pct\_errors\_id](#output\_pct\_errors\_id) | id for monitor pct\_errors |
| <a name="output_throttles_id"></a> [throttles\_id](#output\_throttles\_id) | id for monitor throttles |
<!-- END_TF_DOCS -->
## Related documentation
* [Datadog Documentation](https://docs.datadoghq.com/integrations/amazon_lambda/)
* [Service documentation](https://docs.aws.amazon.com/lambda/index.html)
