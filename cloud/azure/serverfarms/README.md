# CLOUD AZURE SERVERFARMS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-serverfarms" {
  source      = "claranet/monitors/datadog//cloud/azure/serverfarms"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Serverfarm CPU percentage is too high
- Serverfarm is down
- Serverfarm memory percentage is too high

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.1.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.cpu_percentage](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.memory_percentage](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu_percentage_enabled"></a> [cpu\_percentage\_enabled](#input\_cpu\_percentage\_enabled) | Flag to enable the serverfarms cpu\_percentage monitor | `string` | `"true"` | no |
| <a name="input_cpu_percentage_extra_tags"></a> [cpu\_percentage\_extra\_tags](#input\_cpu\_percentage\_extra\_tags) | Extra tags for serverfarms cpu\_percentage monitor | `list(string)` | `[]` | no |
| <a name="input_cpu_percentage_message"></a> [cpu\_percentage\_message](#input\_cpu\_percentage\_message) | Custom message for serverfarm cpu\_percentage monitor | `string` | `""` | no |
| <a name="input_cpu_percentage_threshold_critical"></a> [cpu\_percentage\_threshold\_critical](#input\_cpu\_percentage\_threshold\_critical) | CPU percentage (critical threshold) | `number` | `95` | no |
| <a name="input_cpu_percentage_threshold_warning"></a> [cpu\_percentage\_threshold\_warning](#input\_cpu\_percentage\_threshold\_warning) | CPU percentage (warning threshold) | `number` | `90` | no |
| <a name="input_cpu_percentage_time_aggregator"></a> [cpu\_percentage\_time\_aggregator](#input\_cpu\_percentage\_time\_aggregator) | Monitor aggregator for serverfarms cpu\_percentage [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_cpu_percentage_timeframe"></a> [cpu\_percentage\_timeframe](#input\_cpu\_percentage\_timeframe) | Monitor timeframe for serverfarms cpu\_percentage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_10m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_memory_percentage_enabled"></a> [memory\_percentage\_enabled](#input\_memory\_percentage\_enabled) | Flag to enable the serverfarms memory\_percentage monitor | `string` | `"true"` | no |
| <a name="input_memory_percentage_extra_tags"></a> [memory\_percentage\_extra\_tags](#input\_memory\_percentage\_extra\_tags) | Extra tags for serverfarms memory\_percentage monitor | `list(string)` | `[]` | no |
| <a name="input_memory_percentage_message"></a> [memory\_percentage\_message](#input\_memory\_percentage\_message) | Custom message for serverfarm memory\_percentage monitor | `string` | `""` | no |
| <a name="input_memory_percentage_threshold_critical"></a> [memory\_percentage\_threshold\_critical](#input\_memory\_percentage\_threshold\_critical) | Memory percentage (critical threshold) | `number` | `95` | no |
| <a name="input_memory_percentage_threshold_warning"></a> [memory\_percentage\_threshold\_warning](#input\_memory\_percentage\_threshold\_warning) | Memory percentage (warning threshold) | `number` | `90` | no |
| <a name="input_memory_percentage_time_aggregator"></a> [memory\_percentage\_time\_aggregator](#input\_memory\_percentage\_time\_aggregator) | Monitor aggregator for serverfarms memory\_percentage [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_memory_percentage_timeframe"></a> [memory\_percentage\_timeframe](#input\_memory\_percentage\_timeframe) | Monitor timeframe for serverfarms memory\_percentage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a serverfarms monitor is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_status_enabled"></a> [status\_enabled](#input\_status\_enabled) | Flag to enable the serverfarms status monitor | `string` | `"true"` | no |
| <a name="input_status_extra_tags"></a> [status\_extra\_tags](#input\_status\_extra\_tags) | Extra tags for serverfarms status monitor | `list(string)` | `[]` | no |
| <a name="input_status_message"></a> [status\_message](#input\_status\_message) | Custom message for serverfarm status monitor | `string` | `""` | no |
| <a name="input_status_no_data_timeframe"></a> [status\_no\_data\_timeframe](#input\_status\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_status_time_aggregator"></a> [status\_time\_aggregator](#input\_status\_time\_aggregator) | Monitor aggregator for serverfarms status [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_status_timeframe"></a> [status\_timeframe](#input\_status\_timeframe) | Monitor timeframe for serverfarms status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cpu_percentage_id"></a> [cpu\_percentage\_id](#output\_cpu\_percentage\_id) | id for monitor cpu\_percentage |
| <a name="output_memory_percentage_id"></a> [memory\_percentage\_id](#output\_memory\_percentage\_id) | id for monitor memory\_percentage |
| <a name="output_status_id"></a> [status\_id](#output\_status\_id) | id for monitor status |
## Related documentation

