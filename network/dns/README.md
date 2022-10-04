# NETWORK DNS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-network-dns" {
  source      = "claranet/monitors/datadog//network/dns"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- DNS cannot resolve

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
| [datadog_monitor.cannot_resolve](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cannot_resolve_enabled"></a> [cannot\_resolve\_enabled](#input\_cannot\_resolve\_enabled) | Flag to enable DNS cannot resolve monitor | `string` | `"true"` | no |
| <a name="input_cannot_resolve_extra_tags"></a> [cannot\_resolve\_extra\_tags](#input\_cannot\_resolve\_extra\_tags) | Extra tags for DNS cannot resolve monitor | `list(string)` | `[]` | no |
| <a name="input_cannot_resolve_message"></a> [cannot\_resolve\_message](#input\_cannot\_resolve\_message) | Custom message for DNS cannot resolve monitor | `string` | `""` | no |
| <a name="input_cannot_resolve_no_data_timeframe"></a> [cannot\_resolve\_no\_data\_timeframe](#input\_cannot\_resolve\_no\_data\_timeframe) | DNS cannot resolve monitor no data timeframe | `string` | `10` | no |
| <a name="input_cannot_resolve_threshold_warning"></a> [cannot\_resolve\_threshold\_warning](#input\_cannot\_resolve\_threshold\_warning) | DNS cannot resolve monitor (warning threshold) | `string` | `3` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cannot_resolve_id"></a> [cannot\_resolve\_id](#output\_cannot\_resolve\_id) | id for monitor cannot\_resolve |
<!-- END_TF_DOCS -->
## Related documentation

- [Datadog DNS integration](https://docs.datadoghq.com/integrations/dns_check/)
