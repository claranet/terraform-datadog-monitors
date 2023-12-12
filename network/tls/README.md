# NETWORK TLS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-network-tls" {
  source      = "claranet/monitors/datadog//network/tls"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- TLS cannot connect
- TLS certificate expiration (disabled by default)
- TLS certificate expiring
- TLS invalid certificate

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
| [datadog_monitor.cannot_connect](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.certificate_expiration_date](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.invalid_tls_certificate](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.tls_certificate_expiration](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cannot_connect_enabled"></a> [cannot\_connect\_enabled](#input\_cannot\_connect\_enabled) | Flag to enable TLS cannot connect monitor | `string` | `"true"` | no |
| <a name="input_cannot_connect_extra_tags"></a> [cannot\_connect\_extra\_tags](#input\_cannot\_connect\_extra\_tags) | Extra tags for TLS cannot connect monitor | `list(string)` | `[]` | no |
| <a name="input_cannot_connect_message"></a> [cannot\_connect\_message](#input\_cannot\_connect\_message) | Custom message for TLS cannot connect monitor | `string` | `""` | no |
| <a name="input_cannot_connect_no_data_timeframe"></a> [cannot\_connect\_no\_data\_timeframe](#input\_cannot\_connect\_no\_data\_timeframe) | TLS cannot connect monitor no data timeframe | `string` | `10` | no |
| <a name="input_cannot_connect_threshold_warning"></a> [cannot\_connect\_threshold\_warning](#input\_cannot\_connect\_threshold\_warning) | TLS cannot connect monitor (warning threshold) | `string` | `3` | no |
| <a name="input_certificate_expiration_date_enabled"></a> [certificate\_expiration\_date\_enabled](#input\_certificate\_expiration\_date\_enabled) | Flag to enable Certificate Expiration Date monitor | `string` | `"false"` | no |
| <a name="input_certificate_expiration_date_extra_tags"></a> [certificate\_expiration\_date\_extra\_tags](#input\_certificate\_expiration\_date\_extra\_tags) | Extra tags for Certificate Expiration Date monitor | `list(string)` | `[]` | no |
| <a name="input_certificate_expiration_date_message"></a> [certificate\_expiration\_date\_message](#input\_certificate\_expiration\_date\_message) | Custom message for the Certificate Expiration Date monitor | `string` | `""` | no |
| <a name="input_certificate_expiration_date_threshold_critical"></a> [certificate\_expiration\_date\_threshold\_critical](#input\_certificate\_expiration\_date\_threshold\_critical) | Container Memory Usage critical threshold | `string` | `15` | no |
| <a name="input_certificate_expiration_date_threshold_warning"></a> [certificate\_expiration\_date\_threshold\_warning](#input\_certificate\_expiration\_date\_threshold\_warning) | Container Memory Usage warning threshold | `string` | `30` | no |
| <a name="input_certificate_expiration_date_time_aggregator"></a> [certificate\_expiration\_date\_time\_aggregator](#input\_certificate\_expiration\_date\_time\_aggregator) | Time aggregator for the Certificate Expiration Date monitor | `string` | `"max"` | no |
| <a name="input_certificate_expiration_date_timeframe"></a> [certificate\_expiration\_date\_timeframe](#input\_certificate\_expiration\_date\_timeframe) | Timeframe for the Certificate Expiration Date monitor | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_invalid_tls_certificate_enabled"></a> [invalid\_tls\_certificate\_enabled](#input\_invalid\_tls\_certificate\_enabled) | Flag to enable TLS certificate expiration monitor | `string` | `"true"` | no |
| <a name="input_invalid_tls_certificate_extra_tags"></a> [invalid\_tls\_certificate\_extra\_tags](#input\_invalid\_tls\_certificate\_extra\_tags) | Extra tags for TLS certificate expiration monitor | `list(string)` | `[]` | no |
| <a name="input_invalid_tls_certificate_message"></a> [invalid\_tls\_certificate\_message](#input\_invalid\_tls\_certificate\_message) | Custom message for TLS certificate expiration monitor | `string` | `""` | no |
| <a name="input_invalid_tls_certificate_threshold_warning"></a> [invalid\_tls\_certificate\_threshold\_warning](#input\_invalid\_tls\_certificate\_threshold\_warning) | TLS certificate expiration monitor (warning threshold) | `string` | `3` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global variables | `list(string)` | <pre>[<br>  "type:network",<br>  "provider:tls",<br>  "resource:webcheck"<br>]</pre> | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `"claranet"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |
| <a name="input_tls_certificate_expiration_enabled"></a> [tls\_certificate\_expiration\_enabled](#input\_tls\_certificate\_expiration\_enabled) | Flag to enable TLS certificate expiration monitor | `string` | `"true"` | no |
| <a name="input_tls_certificate_expiration_extra_tags"></a> [tls\_certificate\_expiration\_extra\_tags](#input\_tls\_certificate\_expiration\_extra\_tags) | Extra tags for TLS certificate expiration monitor | `list(string)` | `[]` | no |
| <a name="input_tls_certificate_expiration_message"></a> [tls\_certificate\_expiration\_message](#input\_tls\_certificate\_expiration\_message) | Custom message for TLS certificate expiration monitor | `string` | `""` | no |
| <a name="input_tls_certificate_expiration_threshold_warning"></a> [tls\_certificate\_expiration\_threshold\_warning](#input\_tls\_certificate\_expiration\_threshold\_warning) | TLS certificate expiration monitor (warning threshold) | `string` | `5` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cannot_connect_id"></a> [cannot\_connect\_id](#output\_cannot\_connect\_id) | id for monitor cannot\_connect |
| <a name="output_certificate_expiration_date_id"></a> [certificate\_expiration\_date\_id](#output\_certificate\_expiration\_date\_id) | id for monitor certificate\_expiration\_date |
| <a name="output_invalid_tls_certificate_id"></a> [invalid\_tls\_certificate\_id](#output\_invalid\_tls\_certificate\_id) | id for monitor invalid\_tls\_certificate |
| <a name="output_tls_certificate_expiration_id"></a> [tls\_certificate\_expiration\_id](#output\_tls\_certificate\_expiration\_id) | id for monitor tls\_certificate\_expiration |
<!-- END_TF_DOCS -->
## Related documentation

- [Datadog TLS integration](https://docs.datadoghq.com/integrations/tls/)

