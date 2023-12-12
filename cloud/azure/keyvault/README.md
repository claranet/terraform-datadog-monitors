# CLOUD AZURE KEYVAULT DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-keyvault" {
  source      = "claranet/monitors/datadog//cloud/azure/keyvault"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Key Vault API latency is high
- Key Vault API result rate is low
- Key Vault is down

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
| <a name="module_filter-tags-activity"></a> [filter-tags-activity](#module\_filter-tags-activity) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-status"></a> [filter-tags-status](#module\_filter-tags-status) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-statuscode"></a> [filter-tags-statuscode](#module\_filter-tags-statuscode) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.keyvault_api_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.keyvault_api_result](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.keyvault_status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_latency_enabled"></a> [api\_latency\_enabled](#input\_api\_latency\_enabled) | Flag to enable Key Vault API latency monitor | `string` | `"true"` | no |
| <a name="input_api_latency_extra_tags"></a> [api\_latency\_extra\_tags](#input\_api\_latency\_extra\_tags) | Extra tags for Key Vault API latency monitor | `list(string)` | `[]` | no |
| <a name="input_api_latency_message"></a> [api\_latency\_message](#input\_api\_latency\_message) | Custom message for Key Vault API latency monitor | `string` | `""` | no |
| <a name="input_api_latency_threshold_critical"></a> [api\_latency\_threshold\_critical](#input\_api\_latency\_threshold\_critical) | Critical threshold for Key Vault API latency rate | `number` | `100` | no |
| <a name="input_api_latency_threshold_warning"></a> [api\_latency\_threshold\_warning](#input\_api\_latency\_threshold\_warning) | Warning threshold for Key Vault API latency rate | `number` | `80` | no |
| <a name="input_api_latency_time_aggregator"></a> [api\_latency\_time\_aggregator](#input\_api\_latency\_time\_aggregator) | Monitor aggregator for Key Vault API latency [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_api_latency_timeframe"></a> [api\_latency\_timeframe](#input\_api\_latency\_timeframe) | Monitor timeframe for Key Vault API latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_api_result_enabled"></a> [api\_result\_enabled](#input\_api\_result\_enabled) | Flag to enable Key Vault API result monitor | `string` | `"true"` | no |
| <a name="input_api_result_extra_tags"></a> [api\_result\_extra\_tags](#input\_api\_result\_extra\_tags) | Extra tags for Key Vault API result monitor | `list(string)` | `[]` | no |
| <a name="input_api_result_message"></a> [api\_result\_message](#input\_api\_result\_message) | Custom message for Key Vault API result monitor | `string` | `""` | no |
| <a name="input_api_result_threshold_critical"></a> [api\_result\_threshold\_critical](#input\_api\_result\_threshold\_critical) | Critical threshold for Key Vault API result rate | `number` | `10` | no |
| <a name="input_api_result_threshold_warning"></a> [api\_result\_threshold\_warning](#input\_api\_result\_threshold\_warning) | Warning threshold for Key Vault API result rate | `number` | `30` | no |
| <a name="input_api_result_time_aggregator"></a> [api\_result\_time\_aggregator](#input\_api\_result\_time\_aggregator) | Monitor aggregator for Key Vault API result [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_api_result_timeframe"></a> [api\_result\_timeframe](#input\_api\_result\_timeframe) | Monitor timeframe for Key Vault API result [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_keyvault_status_no_data_timeframe"></a> [keyvault\_status\_no\_data\_timeframe](#input\_keyvault\_status\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_status_enabled"></a> [status\_enabled](#input\_status\_enabled) | Flag to enable Key Vault status monitor | `string` | `"true"` | no |
| <a name="input_status_extra_tags"></a> [status\_extra\_tags](#input\_status\_extra\_tags) | Extra tags for Key Vault status monitor | `list(string)` | `[]` | no |
| <a name="input_status_message"></a> [status\_message](#input\_status\_message) | Custom message for Key Vault status monitor | `string` | `""` | no |
| <a name="input_status_time_aggregator"></a> [status\_time\_aggregator](#input\_status\_time\_aggregator) | Monitor aggregator for Key Vault status [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_status_timeframe"></a> [status\_timeframe](#input\_status\_timeframe) | Monitor timeframe for Key Vault status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global variables | `list(string)` | <pre>[<br>  "type:cloud",<br>  "provider:azure",<br>  "resource:keyvault"<br>]</pre> | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `"claranet"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_keyvault_api_latency_id"></a> [keyvault\_api\_latency\_id](#output\_keyvault\_api\_latency\_id) | id for monitor keyvault\_api\_latency |
| <a name="output_keyvault_api_result_id"></a> [keyvault\_api\_result\_id](#output\_keyvault\_api\_result\_id) | id for monitor keyvault\_api\_result |
| <a name="output_keyvault_status_id"></a> [keyvault\_status\_id](#output\_keyvault\_status\_id) | id for monitor keyvault\_status |
<!-- END_TF_DOCS -->
## Related documentation

DataDog documentation : [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)  
You must search `keyvault`, there is no integration for now.

Azure metrics documentation : [https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftkeyvaultvaults](https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftkeyvaultvaults)
