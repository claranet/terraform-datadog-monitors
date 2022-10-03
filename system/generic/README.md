# SYSTEM GENERIC DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-system-generic" {
  source      = "claranet/monitors/datadog//system/generic"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message

  memory_message = "${module.datadog-message-alerting-bh-only.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- CPU load 5 ratio
- CPU usage
- Disk inodes usage
- Disk space usage
- Disk Space usage forecast
- Usable Memory

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
| <a name="module_filter-tags-disk"></a> [filter-tags-disk](#module\_filter-tags-disk) | ../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.cpu](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.disk_inodes](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.disk_space](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.disk_space_forecast](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.load](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.memory](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu_enabled"></a> [cpu\_enabled](#input\_cpu\_enabled) | Flag to enable CPU high monitor | `string` | `"true"` | no |
| <a name="input_cpu_extra_tags"></a> [cpu\_extra\_tags](#input\_cpu\_extra\_tags) | Extra tags for CPU high monitor | `list(string)` | `[]` | no |
| <a name="input_cpu_message"></a> [cpu\_message](#input\_cpu\_message) | Custom message for CPU high monitor | `string` | `""` | no |
| <a name="input_cpu_threshold_critical"></a> [cpu\_threshold\_critical](#input\_cpu\_threshold\_critical) | CPU high critical threshold | `number` | `90` | no |
| <a name="input_cpu_threshold_warning"></a> [cpu\_threshold\_warning](#input\_cpu\_threshold\_warning) | CPU high warning threshold | `number` | `85` | no |
| <a name="input_cpu_time_aggregator"></a> [cpu\_time\_aggregator](#input\_cpu\_time\_aggregator) | Monitor aggregator for CPU high [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_cpu_timeframe"></a> [cpu\_timeframe](#input\_cpu\_timeframe) | Monitor timeframe for CPU high [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_1h"` | no |
| <a name="input_disk_inodes_enabled"></a> [disk\_inodes\_enabled](#input\_disk\_inodes\_enabled) | Flag to enable Free disk inodes monitor | `string` | `"true"` | no |
| <a name="input_disk_inodes_extra_tags"></a> [disk\_inodes\_extra\_tags](#input\_disk\_inodes\_extra\_tags) | Extra tags for Free disk inodes monitor | `list(string)` | `[]` | no |
| <a name="input_disk_inodes_message"></a> [disk\_inodes\_message](#input\_disk\_inodes\_message) | Custom message for Free disk inodes monitor | `string` | `""` | no |
| <a name="input_disk_inodes_threshold_critical"></a> [disk\_inodes\_threshold\_critical](#input\_disk\_inodes\_threshold\_critical) | Free disk space critical threshold | `number` | `95` | no |
| <a name="input_disk_inodes_threshold_warning"></a> [disk\_inodes\_threshold\_warning](#input\_disk\_inodes\_threshold\_warning) | Free disk space warning threshold | `number` | `90` | no |
| <a name="input_disk_inodes_time_aggregator"></a> [disk\_inodes\_time\_aggregator](#input\_disk\_inodes\_time\_aggregator) | Monitor aggregator for Free disk inodes [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_disk_inodes_timeframe"></a> [disk\_inodes\_timeframe](#input\_disk\_inodes\_timeframe) | Monitor timeframe for Free disk inodes [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_disk_space_enabled"></a> [disk\_space\_enabled](#input\_disk\_space\_enabled) | Flag to enable Free diskspace monitor | `string` | `"true"` | no |
| <a name="input_disk_space_extra_tags"></a> [disk\_space\_extra\_tags](#input\_disk\_space\_extra\_tags) | Extra tags for Free diskspace monitor | `list(string)` | `[]` | no |
| <a name="input_disk_space_forecast_algorithm"></a> [disk\_space\_forecast\_algorithm](#input\_disk\_space\_forecast\_algorithm) | Algorithm for the Free diskspace Forecast monitor [available values: `linear` or `seasonal`] | `string` | `"linear"` | no |
| <a name="input_disk_space_forecast_deviations"></a> [disk\_space\_forecast\_deviations](#input\_disk\_space\_forecast\_deviations) | Deviations for the Free diskspace Forecast monitor [available values: `1`, `2`, `3`, `4` or `5`] | `string` | `1` | no |
| <a name="input_disk_space_forecast_enabled"></a> [disk\_space\_forecast\_enabled](#input\_disk\_space\_forecast\_enabled) | Flag to enable Free diskspace forecast monitor | `string` | `"true"` | no |
| <a name="input_disk_space_forecast_extra_tags"></a> [disk\_space\_forecast\_extra\_tags](#input\_disk\_space\_forecast\_extra\_tags) | Extra tags for Free diskspace forecast monitor | `list(string)` | `[]` | no |
| <a name="input_disk_space_forecast_interval"></a> [disk\_space\_forecast\_interval](#input\_disk\_space\_forecast\_interval) | Interval for the Free diskspace Forecast monitor [available values: `30m`, `60m` or `120m`] | `string` | `"60m"` | no |
| <a name="input_disk_space_forecast_linear_history"></a> [disk\_space\_forecast\_linear\_history](#input\_disk\_space\_forecast\_linear\_history) | History for the Free diskspace Forecast monitor [available values: `12h`, `#d` (1, 2, or 3), `#w` (1, or 2) or `#mo` (1, 2 or 3)] | `string` | `"1w"` | no |
| <a name="input_disk_space_forecast_linear_model"></a> [disk\_space\_forecast\_linear\_model](#input\_disk\_space\_forecast\_linear\_model) | Model for the Free diskspace Forecast monitor [available values: `default`, `simple` or `reactive`] | `string` | `"default"` | no |
| <a name="input_disk_space_forecast_message"></a> [disk\_space\_forecast\_message](#input\_disk\_space\_forecast\_message) | Custom message for Free diskspace forecast monitor | `string` | `""` | no |
| <a name="input_disk_space_forecast_seasonal_seasonality"></a> [disk\_space\_forecast\_seasonal\_seasonality](#input\_disk\_space\_forecast\_seasonal\_seasonality) | Seasonality for the Free diskspace Forecast monitor | `string` | `"weekly"` | no |
| <a name="input_disk_space_forecast_threshold_critical"></a> [disk\_space\_forecast\_threshold\_critical](#input\_disk\_space\_forecast\_threshold\_critical) | Free disk space forecast critical threshold | `number` | `80` | no |
| <a name="input_disk_space_forecast_threshold_critical_recovery"></a> [disk\_space\_forecast\_threshold\_critical\_recovery](#input\_disk\_space\_forecast\_threshold\_critical\_recovery) | Free disk space forecast recovery threshold | `number` | `72` | no |
| <a name="input_disk_space_forecast_time_aggregator"></a> [disk\_space\_forecast\_time\_aggregator](#input\_disk\_space\_forecast\_time\_aggregator) | Monitor aggregator for Free diskspace forecast [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_disk_space_forecast_timeframe"></a> [disk\_space\_forecast\_timeframe](#input\_disk\_space\_forecast\_timeframe) | Monitor timeframe for Free diskspace forecast [available values: `next_12h`, `next_#d` (1, 2, or 3), `next_#w` (1 or 2) or `next_#mo` (1, 2 or 3)] | `string` | `"next_1w"` | no |
| <a name="input_disk_space_message"></a> [disk\_space\_message](#input\_disk\_space\_message) | Custom message for Free diskspace monitor | `string` | `""` | no |
| <a name="input_disk_space_threshold_critical"></a> [disk\_space\_threshold\_critical](#input\_disk\_space\_threshold\_critical) | Free disk space critical threshold | `number` | `90` | no |
| <a name="input_disk_space_threshold_warning"></a> [disk\_space\_threshold\_warning](#input\_disk\_space\_threshold\_warning) | Free disk space warning threshold | `number` | `80` | no |
| <a name="input_disk_space_time_aggregator"></a> [disk\_space\_time\_aggregator](#input\_disk\_space\_time\_aggregator) | Monitor aggregator for Free diskspace [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_disk_space_timeframe"></a> [disk\_space\_timeframe](#input\_disk\_space\_timeframe) | Monitor timeframe for Free diskspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_separator"></a> [filter\_tags\_separator](#input\_filter\_tags\_separator) | Set the filter tags separator (, or AND) | `string` | `","` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_load_enabled"></a> [load\_enabled](#input\_load\_enabled) | Flag to enable CPU load ratio monitor | `string` | `"true"` | no |
| <a name="input_load_extra_tags"></a> [load\_extra\_tags](#input\_load\_extra\_tags) | Extra tags for CPU load ratio monitor | `list(string)` | `[]` | no |
| <a name="input_load_message"></a> [load\_message](#input\_load\_message) | Custom message for CPU load ratio monitor | `string` | `""` | no |
| <a name="input_load_threshold_critical"></a> [load\_threshold\_critical](#input\_load\_threshold\_critical) | CPU load ratio critical threshold | `number` | `2.5` | no |
| <a name="input_load_threshold_warning"></a> [load\_threshold\_warning](#input\_load\_threshold\_warning) | CPU load ratio warning threshold | `number` | `2` | no |
| <a name="input_load_time_aggregator"></a> [load\_time\_aggregator](#input\_load\_time\_aggregator) | Monitor aggregator for CPU load ratio [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_load_timeframe"></a> [load\_timeframe](#input\_load\_timeframe) | Monitor timeframe for CPU load ratio [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_30m"` | no |
| <a name="input_memory_enabled"></a> [memory\_enabled](#input\_memory\_enabled) | Flag to enable Free memory monitor | `string` | `"true"` | no |
| <a name="input_memory_extra_tags"></a> [memory\_extra\_tags](#input\_memory\_extra\_tags) | Extra tags for Free memory monitor | `list(string)` | `[]` | no |
| <a name="input_memory_message"></a> [memory\_message](#input\_memory\_message) | Mandatory message for Free memory monitor to avoid NBH alerting by default | `string` | n/a | yes |
| <a name="input_memory_threshold_critical"></a> [memory\_threshold\_critical](#input\_memory\_threshold\_critical) | Free disk space critical threshold | `number` | `5` | no |
| <a name="input_memory_threshold_warning"></a> [memory\_threshold\_warning](#input\_memory\_threshold\_warning) | Free disk space warning threshold | `number` | `10` | no |
| <a name="input_memory_time_aggregator"></a> [memory\_time\_aggregator](#input\_memory\_time\_aggregator) | Monitor aggregator for Free memory [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_memory_timeframe"></a> [memory\_timeframe](#input\_memory\_timeframe) | Monitor timeframe for Free memory [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cpu_id"></a> [cpu\_id](#output\_cpu\_id) | id for monitor cpu |
| <a name="output_disk_inodes_id"></a> [disk\_inodes\_id](#output\_disk\_inodes\_id) | id for monitor disk\_inodes |
| <a name="output_disk_space_forecast_id"></a> [disk\_space\_forecast\_id](#output\_disk\_space\_forecast\_id) | id for monitor disk\_space\_forecast |
| <a name="output_disk_space_id"></a> [disk\_space\_id](#output\_disk\_space\_id) | id for monitor disk\_space |
| <a name="output_load_id"></a> [load\_id](#output\_load\_id) | id for monitor load |
| <a name="output_memory_id"></a> [memory\_id](#output\_memory\_id) | id for monitor memory |
<!-- END_TF_DOCS -->
## Related documentation

DataDog documentation:
