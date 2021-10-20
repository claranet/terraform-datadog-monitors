# CLOUD AZURE APIMANAGEMENT DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-apimanagement" {
  source      = "claranet/monitors/datadog//cloud/azure/apimanagement"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- API Management is down
- API Management successful requests rate too low
- API Management too many failed requests
- API Management too many other requests
- API Management too many unauthorized requests

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
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.apimgt_failed_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.apimgt_other_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.apimgt_status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.apimgt_successful_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.apimgt_unauthorized_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apimgt_status_no_data_timeframe"></a> [apimgt\_status\_no\_data\_timeframe](#input\_apimgt\_status\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_failed_requests_enabled"></a> [failed\_requests\_enabled](#input\_failed\_requests\_enabled) | Flag to enable API Management failed requests monitor | `string` | `"true"` | no |
| <a name="input_failed_requests_extra_tags"></a> [failed\_requests\_extra\_tags](#input\_failed\_requests\_extra\_tags) | Extra tags for API Management failed requests monitor | `list(string)` | `[]` | no |
| <a name="input_failed_requests_message"></a> [failed\_requests\_message](#input\_failed\_requests\_message) | Custom message for API Management failed requests monitor | `string` | `""` | no |
| <a name="input_failed_requests_threshold_critical"></a> [failed\_requests\_threshold\_critical](#input\_failed\_requests\_threshold\_critical) | Maximum acceptable percent of failed requests | `number` | `90` | no |
| <a name="input_failed_requests_threshold_warning"></a> [failed\_requests\_threshold\_warning](#input\_failed\_requests\_threshold\_warning) | Warning regarding acceptable percent of failed requests | `number` | `50` | no |
| <a name="input_failed_requests_time_aggregator"></a> [failed\_requests\_time\_aggregator](#input\_failed\_requests\_time\_aggregator) | Monitor aggregator for API Management failed requests [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_failed_requests_timeframe"></a> [failed\_requests\_timeframe](#input\_failed\_requests\_timeframe) | Monitor timeframe for API Management failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a Redis monitor is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_other_requests_enabled"></a> [other\_requests\_enabled](#input\_other\_requests\_enabled) | Flag to enable API Management other requests monitor | `string` | `"true"` | no |
| <a name="input_other_requests_extra_tags"></a> [other\_requests\_extra\_tags](#input\_other\_requests\_extra\_tags) | Extra tags for API Management other requests monitor | `list(string)` | `[]` | no |
| <a name="input_other_requests_message"></a> [other\_requests\_message](#input\_other\_requests\_message) | Custom message for API Management other requests monitor | `string` | `""` | no |
| <a name="input_other_requests_threshold_critical"></a> [other\_requests\_threshold\_critical](#input\_other\_requests\_threshold\_critical) | Maximum acceptable percent of other requests | `number` | `90` | no |
| <a name="input_other_requests_threshold_warning"></a> [other\_requests\_threshold\_warning](#input\_other\_requests\_threshold\_warning) | Warning regarding acceptable percent of other requests | `number` | `50` | no |
| <a name="input_other_requests_time_aggregator"></a> [other\_requests\_time\_aggregator](#input\_other\_requests\_time\_aggregator) | Monitor aggregator for API Management other requests [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_other_requests_timeframe"></a> [other\_requests\_timeframe](#input\_other\_requests\_timeframe) | Monitor timeframe for API Management other requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_status_enabled"></a> [status\_enabled](#input\_status\_enabled) | Flag to enable API Management status monitor | `string` | `"true"` | no |
| <a name="input_status_extra_tags"></a> [status\_extra\_tags](#input\_status\_extra\_tags) | Extra tags for API Management status monitor | `list(string)` | `[]` | no |
| <a name="input_status_message"></a> [status\_message](#input\_status\_message) | Custom message for API Management status monitor | `string` | `""` | no |
| <a name="input_status_time_aggregator"></a> [status\_time\_aggregator](#input\_status\_time\_aggregator) | Monitor aggregator for API Management status [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_status_timeframe"></a> [status\_timeframe](#input\_status\_timeframe) | Monitor timeframe for API Management status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_successful_requests_enabled"></a> [successful\_requests\_enabled](#input\_successful\_requests\_enabled) | Flag to enable API Management successful requests monitor | `string` | `"true"` | no |
| <a name="input_successful_requests_extra_tags"></a> [successful\_requests\_extra\_tags](#input\_successful\_requests\_extra\_tags) | Extra tags for API Management successful requests monitor | `list(string)` | `[]` | no |
| <a name="input_successful_requests_message"></a> [successful\_requests\_message](#input\_successful\_requests\_message) | Custom message for API Management successful requests monitor | `string` | `""` | no |
| <a name="input_successful_requests_threshold_critical"></a> [successful\_requests\_threshold\_critical](#input\_successful\_requests\_threshold\_critical) | Minimum acceptable percent of successful requests | `number` | `10` | no |
| <a name="input_successful_requests_threshold_warning"></a> [successful\_requests\_threshold\_warning](#input\_successful\_requests\_threshold\_warning) | Warning regarding acceptable percent of successful requests | `number` | `30` | no |
| <a name="input_successful_requests_time_aggregator"></a> [successful\_requests\_time\_aggregator](#input\_successful\_requests\_time\_aggregator) | Monitor aggregator for API Management successful requests [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_successful_requests_timeframe"></a> [successful\_requests\_timeframe](#input\_successful\_requests\_timeframe) | Monitor timeframe for API Management successful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_unauthorized_requests_enabled"></a> [unauthorized\_requests\_enabled](#input\_unauthorized\_requests\_enabled) | Flag to enable API Management unauthorized requests monitor | `string` | `"true"` | no |
| <a name="input_unauthorized_requests_extra_tags"></a> [unauthorized\_requests\_extra\_tags](#input\_unauthorized\_requests\_extra\_tags) | Extra tags for API Management unauthorized requests monitor | `list(string)` | `[]` | no |
| <a name="input_unauthorized_requests_message"></a> [unauthorized\_requests\_message](#input\_unauthorized\_requests\_message) | Custom message for API Management unauthorized requests monitor | `string` | `""` | no |
| <a name="input_unauthorized_requests_threshold_critical"></a> [unauthorized\_requests\_threshold\_critical](#input\_unauthorized\_requests\_threshold\_critical) | Maximum acceptable percent of unauthorized requests | `number` | `90` | no |
| <a name="input_unauthorized_requests_threshold_warning"></a> [unauthorized\_requests\_threshold\_warning](#input\_unauthorized\_requests\_threshold\_warning) | Warning regarding acceptable percent of unauthorized requests | `number` | `50` | no |
| <a name="input_unauthorized_requests_time_aggregator"></a> [unauthorized\_requests\_time\_aggregator](#input\_unauthorized\_requests\_time\_aggregator) | Monitor aggregator for API Management unauthorized requests [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_unauthorized_requests_timeframe"></a> [unauthorized\_requests\_timeframe](#input\_unauthorized\_requests\_timeframe) | Monitor timeframe for API Management unauthorized requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_apimgt_failed_requests_id"></a> [apimgt\_failed\_requests\_id](#output\_apimgt\_failed\_requests\_id) | id for monitor apimgt\_failed\_requests |
| <a name="output_apimgt_other_requests_id"></a> [apimgt\_other\_requests\_id](#output\_apimgt\_other\_requests\_id) | id for monitor apimgt\_other\_requests |
| <a name="output_apimgt_status_id"></a> [apimgt\_status\_id](#output\_apimgt\_status\_id) | id for monitor apimgt\_status |
| <a name="output_apimgt_successful_requests_id"></a> [apimgt\_successful\_requests\_id](#output\_apimgt\_successful\_requests\_id) | id for monitor apimgt\_successful\_requests |
| <a name="output_apimgt_unauthorized_requests_id"></a> [apimgt\_unauthorized\_requests\_id](#output\_apimgt\_unauthorized\_requests\_id) | id for monitor apimgt\_unauthorized\_requests |
## Related documentation

Azure API Management metrics documentation: [https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-use-azure-monitor](https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-use-azure-monitor)
