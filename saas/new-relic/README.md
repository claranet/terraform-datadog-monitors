# SAAS NEW-RELIC DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-saas-new-relic" {
  source      = "claranet/monitors/datadog//saas/new-relic"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- New Relic Apdex score ratio
- New Relic Error rate

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.app_apdex_score](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.app_error_rate](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_apdex_score_enabled"></a> [app\_apdex\_score\_enabled](#input\_app\_apdex\_score\_enabled) | Flag to enable APP Apdex Score monitor | `string` | `"true"` | no |
| <a name="input_app_apdex_score_extra_tags"></a> [app\_apdex\_score\_extra\_tags](#input\_app\_apdex\_score\_extra\_tags) | Extra tags for New Relic APP Apdex Score monitor | `list(string)` | `[]` | no |
| <a name="input_app_apdex_score_message"></a> [app\_apdex\_score\_message](#input\_app\_apdex\_score\_message) | Custom message for the APP Apdex Score monitor | `string` | `""` | no |
| <a name="input_app_apdex_score_threshold_critical"></a> [app\_apdex\_score\_threshold\_critical](#input\_app\_apdex\_score\_threshold\_critical) | APP Apdex Score critical threshold | `string` | `0.25` | no |
| <a name="input_app_apdex_score_threshold_warning"></a> [app\_apdex\_score\_threshold\_warning](#input\_app\_apdex\_score\_threshold\_warning) | APP Apdex Score warning threshold | `string` | `0.5` | no |
| <a name="input_app_apdex_score_time_aggregator"></a> [app\_apdex\_score\_time\_aggregator](#input\_app\_apdex\_score\_time\_aggregator) | Time aggregator for the APP Apdex Score monitor | `string` | `"avg"` | no |
| <a name="input_app_apdex_score_timeframe"></a> [app\_apdex\_score\_timeframe](#input\_app\_apdex\_score\_timeframe) | Timeframe for the APP Apdex Score monitor | `string` | `"last_15m"` | no |
| <a name="input_app_error_rate_enabled"></a> [app\_error\_rate\_enabled](#input\_app\_error\_rate\_enabled) | Flag to enable APP Error Rate monitor | `string` | `"true"` | no |
| <a name="input_app_error_rate_extra_tags"></a> [app\_error\_rate\_extra\_tags](#input\_app\_error\_rate\_extra\_tags) | Extra tags for New Relic APP Error Rate monitor | `list(string)` | `[]` | no |
| <a name="input_app_error_rate_message"></a> [app\_error\_rate\_message](#input\_app\_error\_rate\_message) | Custom message for the APP Error Rate monitor | `string` | `""` | no |
| <a name="input_app_error_rate_threshold_critical"></a> [app\_error\_rate\_threshold\_critical](#input\_app\_error\_rate\_threshold\_critical) | APP Error Rate  critical threshold | `string` | `5` | no |
| <a name="input_app_error_rate_threshold_warning"></a> [app\_error\_rate\_threshold\_warning](#input\_app\_error\_rate\_threshold\_warning) | APP Error Rate warning threshold | `string` | `1` | no |
| <a name="input_app_error_rate_time_aggregator"></a> [app\_error\_rate\_time\_aggregator](#input\_app\_error\_rate\_time\_aggregator) | Time aggregator for the APP Error Rate monitor | `string` | `"min"` | no |
| <a name="input_app_error_rate_timeframe"></a> [app\_error\_rate\_timeframe](#input\_app\_error\_rate\_timeframe) | Timeframe for the APP Error Rate monitor | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_apdex_score_id"></a> [app\_apdex\_score\_id](#output\_app\_apdex\_score\_id) | id for monitor app\_apdex\_score |
| <a name="output_app_error_rate_id"></a> [app\_error\_rate\_id](#output\_app\_error\_rate\_id) | id for monitor app\_error\_rate |
## Related documentation

* [Datadog New Relic integration](https://docs.datadoghq.com/integrations/new_relic/)


