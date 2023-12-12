# CLOUD AZURE VIRTUAL-MACHINE DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-virtual-machine" {
  source      = "claranet/monitors/datadog//cloud/azure/virtual-machine"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Virtual Machine CPU usage
- Virtual Machine credit CPU
- Virtual Machine disk space
- Virtual Machine is unreachable
- Virtual Machine RAM reserved
- Virtual Machine requests failed

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
| [datadog_monitor.virtualmachine_cpu_usage](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.virtualmachine_credit_cpu_remaining_too_low](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.virtualmachine_disk_space](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.virtualmachine_ram_reserved](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.virtualmachine_requests_failed](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.virtualmachine_status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu_remaining_rate_enabled"></a> [cpu\_remaining\_rate\_enabled](#input\_cpu\_remaining\_rate\_enabled) | Flag to enable Virtual Machine CPU remaining monitor | `string` | `"true"` | no |
| <a name="input_cpu_remaining_rate_extra_tags"></a> [cpu\_remaining\_rate\_extra\_tags](#input\_cpu\_remaining\_rate\_extra\_tags) | Extra tags for Virtual Machine CPU remaining monitor | `list(string)` | `[]` | no |
| <a name="input_cpu_remaining_rate_message"></a> [cpu\_remaining\_rate\_message](#input\_cpu\_remaining\_rate\_message) | Custom message for Virtual Machine CPU remaining monitor | `string` | `""` | no |
| <a name="input_cpu_remaining_rate_threshold_critical"></a> [cpu\_remaining\_rate\_threshold\_critical](#input\_cpu\_remaining\_rate\_threshold\_critical) | Virtual Machine CPU rate limit (critical threshold) | `number` | `15` | no |
| <a name="input_cpu_remaining_rate_threshold_warning"></a> [cpu\_remaining\_rate\_threshold\_warning](#input\_cpu\_remaining\_rate\_threshold\_warning) | Virtual Machine CPU rate limit (warning threshold) | `number` | `30` | no |
| <a name="input_cpu_remaining_rate_time_aggregator"></a> [cpu\_remaining\_rate\_time\_aggregator](#input\_cpu\_remaining\_rate\_time\_aggregator) | Monitor aggregator for Virtual Machine CPU remaining [available values: min, max, sum or avg] | `string` | `"min"` | no |
| <a name="input_cpu_remaining_rate_timeframe"></a> [cpu\_remaining\_rate\_timeframe](#input\_cpu\_remaining\_rate\_timeframe) | Monitor timeframe for Virtual Machine CPU remaining [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_cpu_usage_enabled"></a> [cpu\_usage\_enabled](#input\_cpu\_usage\_enabled) | Flag to enable Virtual Machine status monitor | `string` | `"true"` | no |
| <a name="input_cpu_usage_extra_tags"></a> [cpu\_usage\_extra\_tags](#input\_cpu\_usage\_extra\_tags) | Extra tags for Virtual Machine status monitor | `list(string)` | `[]` | no |
| <a name="input_cpu_usage_message"></a> [cpu\_usage\_message](#input\_cpu\_usage\_message) | Custom message for Virtual Machine CPU monitor | `string` | `""` | no |
| <a name="input_cpu_usage_threshold_critical"></a> [cpu\_usage\_threshold\_critical](#input\_cpu\_usage\_threshold\_critical) | Virtual Machine CPU usage in percent (critical threshold) | `string` | `"90"` | no |
| <a name="input_cpu_usage_threshold_warning"></a> [cpu\_usage\_threshold\_warning](#input\_cpu\_usage\_threshold\_warning) | Virtual Machine CPU usage in percent (warning threshold) | `string` | `"80"` | no |
| <a name="input_cpu_usage_time_aggregator"></a> [cpu\_usage\_time\_aggregator](#input\_cpu\_usage\_time\_aggregator) | Monitor aggregator for Virtual Machine CPU [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_cpu_usage_timeframe"></a> [cpu\_usage\_timeframe](#input\_cpu\_usage\_timeframe) | Monitor timeframe for Virtual Machine CPU [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_disk_space_enabled"></a> [disk\_space\_enabled](#input\_disk\_space\_enabled) | Flag to enable Virtual Machine status monitor | `string` | `"true"` | no |
| <a name="input_disk_space_extra_tags"></a> [disk\_space\_extra\_tags](#input\_disk\_space\_extra\_tags) | Extra tags for Virtual Machine free disk space monitor | `list(string)` | `[]` | no |
| <a name="input_disk_space_message"></a> [disk\_space\_message](#input\_disk\_space\_message) | Custom message for Virtual Machine CPU free disk space monitor | `string` | `""` | no |
| <a name="input_disk_space_threshold_critical"></a> [disk\_space\_threshold\_critical](#input\_disk\_space\_threshold\_critical) | Virtual Machine free disk space in percent (critical threshold) | `string` | `"95"` | no |
| <a name="input_disk_space_threshold_warning"></a> [disk\_space\_threshold\_warning](#input\_disk\_space\_threshold\_warning) | Virtual Machine free disk space in percent (warning threshold) | `string` | `"90"` | no |
| <a name="input_disk_space_time_aggregator"></a> [disk\_space\_time\_aggregator](#input\_disk\_space\_time\_aggregator) | Monitor aggregator for Virtual Machine free disk space [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_disk_space_timeframe"></a> [disk\_space\_timeframe](#input\_disk\_space\_timeframe) | Monitor timeframe for Virtual Machine free disk space too low [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a Redis monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_ram_reserved_enabled"></a> [ram\_reserved\_enabled](#input\_ram\_reserved\_enabled) | Flag to enable Virtual Machine RAM reserved monitor | `string` | `"true"` | no |
| <a name="input_ram_reserved_extra_tags"></a> [ram\_reserved\_extra\_tags](#input\_ram\_reserved\_extra\_tags) | Extra tags for Virtual Machine RAM reserved monitor | `list(string)` | `[]` | no |
| <a name="input_ram_reserved_message"></a> [ram\_reserved\_message](#input\_ram\_reserved\_message) | Custom message for Virtual Machine RAM reserved monitor | `string` | `""` | no |
| <a name="input_ram_reserved_threshold_critical"></a> [ram\_reserved\_threshold\_critical](#input\_ram\_reserved\_threshold\_critical) | Virtual Machine RAM reserved limit (critical threshold) | `number` | `95` | no |
| <a name="input_ram_reserved_threshold_warning"></a> [ram\_reserved\_threshold\_warning](#input\_ram\_reserved\_threshold\_warning) | Virtual Machine RAM reserved limit (warning threshold) | `number` | `90` | no |
| <a name="input_ram_reserved_time_aggregator"></a> [ram\_reserved\_time\_aggregator](#input\_ram\_reserved\_time\_aggregator) | Monitor aggregator for Virtual Machine RAM reserved [available values: min, max, sum or avg] | `string` | `"min"` | no |
| <a name="input_ram_reserved_timeframe"></a> [ram\_reserved\_timeframe](#input\_ram\_reserved\_timeframe) | Monitor timeframe for Virtual Machine RAM reserved [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_requests_failed_enabled"></a> [requests\_failed\_enabled](#input\_requests\_failed\_enabled) | Flag to enable Virtual Machine requests failed monitor | `string` | `"true"` | no |
| <a name="input_requests_failed_extra_tags"></a> [requests\_failed\_extra\_tags](#input\_requests\_failed\_extra\_tags) | Extra tags for Virtual Machine requests failed monitor | `list(string)` | `[]` | no |
| <a name="input_requests_failed_message"></a> [requests\_failed\_message](#input\_requests\_failed\_message) | Custom message for Virtual Machine requests failed monitor | `string` | `""` | no |
| <a name="input_requests_failed_threshold_critical"></a> [requests\_failed\_threshold\_critical](#input\_requests\_failed\_threshold\_critical) | Virtual Machine requests failed limit (critical threshold) | `number` | `95` | no |
| <a name="input_requests_failed_threshold_warning"></a> [requests\_failed\_threshold\_warning](#input\_requests\_failed\_threshold\_warning) | Virtual Machine requests failed limit (warning threshold) | `number` | `90` | no |
| <a name="input_requests_failed_time_aggregator"></a> [requests\_failed\_time\_aggregator](#input\_requests\_failed\_time\_aggregator) | Monitor aggregator for Virtual Machine requests failed [available values: min, max, sum or avg] | `string` | `"min"` | no |
| <a name="input_requests_failed_timeframe"></a> [requests\_failed\_timeframe](#input\_requests\_failed\_timeframe) | Monitor timeframe for Virtual Machine requests failed [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_10m"` | no |
| <a name="input_status_enabled"></a> [status\_enabled](#input\_status\_enabled) | Flag to enable Virtual Machine status monitor | `string` | `"true"` | no |
| <a name="input_status_extra_tags"></a> [status\_extra\_tags](#input\_status\_extra\_tags) | Extra tags for Virtual Machine status monitor | `list(string)` | `[]` | no |
| <a name="input_status_message"></a> [status\_message](#input\_status\_message) | Custom message for Virtual Machine status monitor | `string` | `""` | no |
| <a name="input_status_time_aggregator"></a> [status\_time\_aggregator](#input\_status\_time\_aggregator) | Monitor aggregator for Virtual Machine status [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_status_timeframe"></a> [status\_timeframe](#input\_status\_timeframe) | Monitor timeframe for Virtual Machine status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global variables | `list(string)` | <pre>[<br>  "type:cloud",<br>  "provider:azure",<br>  "resource:virtualmachine"<br>]</pre> | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `"claranet"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |
| <a name="input_virtualmachine_status_no_data_timeframe"></a> [virtualmachine\_status\_no\_data\_timeframe](#input\_virtualmachine\_status\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_virtualmachine_cpu_usage_id"></a> [virtualmachine\_cpu\_usage\_id](#output\_virtualmachine\_cpu\_usage\_id) | id for monitor virtualmachine\_cpu\_usage |
| <a name="output_virtualmachine_credit_cpu_remaining_too_low_id"></a> [virtualmachine\_credit\_cpu\_remaining\_too\_low\_id](#output\_virtualmachine\_credit\_cpu\_remaining\_too\_low\_id) | id for monitor virtualmachine\_credit\_cpu\_remaining\_too\_low |
| <a name="output_virtualmachine_disk_space_id"></a> [virtualmachine\_disk\_space\_id](#output\_virtualmachine\_disk\_space\_id) | id for monitor virtualmachine\_disk\_space |
| <a name="output_virtualmachine_ram_reserved_id"></a> [virtualmachine\_ram\_reserved\_id](#output\_virtualmachine\_ram\_reserved\_id) | id for monitor virtualmachine\_ram\_reserved |
| <a name="output_virtualmachine_requests_failed_id"></a> [virtualmachine\_requests\_failed\_id](#output\_virtualmachine\_requests\_failed\_id) | id for monitor virtualmachine\_requests\_failed |
| <a name="output_virtualmachine_status_id"></a> [virtualmachine\_status\_id](#output\_virtualmachine\_status\_id) | id for monitor virtualmachine\_status |
<!-- END_TF_DOCS -->
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_vm/](https://docs.datadoghq.com/integrations/azure_vm/)
