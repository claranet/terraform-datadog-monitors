# MIDDLEWARE KONG DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-middleware-kong" {
  source      = "claranet/monitors/datadog//middleware/kong"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Kong does not respond
- Kong exceeded its treatment limit

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
| [datadog_monitor.not_responding](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.treatment_limit](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

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
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_not_responding_enabled"></a> [not\_responding\_enabled](#input\_not\_responding\_enabled) | Flag to enable Kong does not respond monitor | `string` | `"true"` | no |
| <a name="input_not_responding_extra_tags"></a> [not\_responding\_extra\_tags](#input\_not\_responding\_extra\_tags) | Extra tags for Kong does not respond monitor | `list(string)` | `[]` | no |
| <a name="input_not_responding_message"></a> [not\_responding\_message](#input\_not\_responding\_message) | Custom message for Kong does not respond monitor | `string` | `""` | no |
| <a name="input_not_responding_no_data_timeframe"></a> [not\_responding\_no\_data\_timeframe](#input\_not\_responding\_no\_data\_timeframe) | Kong does not respond monitor no data timeframe | `string` | `10` | no |
| <a name="input_not_responding_threshold_warning"></a> [not\_responding\_threshold\_warning](#input\_not\_responding\_threshold\_warning) | Warning threshold for the service check | `string` | `3` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |
| <a name="input_treatment_limit_enabled"></a> [treatment\_limit\_enabled](#input\_treatment\_limit\_enabled) | Flag to enable Kong Treatment Limit monitor | `string` | `"true"` | no |
| <a name="input_treatment_limit_extra_tags"></a> [treatment\_limit\_extra\_tags](#input\_treatment\_limit\_extra\_tags) | Extra tags for Kong Treatment Limit monitor | `list(string)` | `[]` | no |
| <a name="input_treatment_limit_message"></a> [treatment\_limit\_message](#input\_treatment\_limit\_message) | Custom message for the Kong Treatment Limit monitor | `string` | `""` | no |
| <a name="input_treatment_limit_threshold_critical"></a> [treatment\_limit\_threshold\_critical](#input\_treatment\_limit\_threshold\_critical) | Docker Container Memory Usage  critical threshold | `string` | `20` | no |
| <a name="input_treatment_limit_threshold_warning"></a> [treatment\_limit\_threshold\_warning](#input\_treatment\_limit\_threshold\_warning) | Docker Container Memory Usage warning threshold | `string` | `0` | no |
| <a name="input_treatment_limit_time_aggregator"></a> [treatment\_limit\_time\_aggregator](#input\_treatment\_limit\_time\_aggregator) | Time aggregator for the Kong Treatment Limit monitor | `string` | `"min"` | no |
| <a name="input_treatment_limit_timeframe"></a> [treatment\_limit\_timeframe](#input\_treatment\_limit\_timeframe) | Timeframe for the Kong Treatment Limit monitor | `string` | `"last_15m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_not_responding_id"></a> [not\_responding\_id](#output\_not\_responding\_id) | id for monitor not\_responding |
| <a name="output_treatment_limit_id"></a> [treatment\_limit\_id](#output\_treatment\_limit\_id) | id for monitor treatment\_limit |
<!-- END_TF_DOCS -->
## Related documentation

* [Datadog Kong integration](https://docs.datadoghq.com/integrations/kong/)

