# CLOUD AWS ELASTICSEARCH DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-elasticsearch" {
  source      = "claranet/monitors/datadog//cloud/aws/elasticsearch"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message

  es_cluster_volume_size = 42
}

```

## Purpose

Creates DataDog monitors with the following checks:

- ElasticSearch cluster CPU high
- ElasticSearch cluster free storage space
- ElasticSearch cluster status is not green

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
| [datadog_monitor.es_cluster_status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.es_cpu_90_15min](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.es_free_space_low](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu_enabled"></a> [cpu\_enabled](#input\_cpu\_enabled) | Flag to enable ES cluster cpu monitor | `string` | `"true"` | no |
| <a name="input_cpu_extra_tags"></a> [cpu\_extra\_tags](#input\_cpu\_extra\_tags) | Extra tags for ES cluster cpu monitor | `list(string)` | `[]` | no |
| <a name="input_cpu_message"></a> [cpu\_message](#input\_cpu\_message) | Custom message for ES cluster cpu monitor | `string` | `""` | no |
| <a name="input_cpu_threshold_critical"></a> [cpu\_threshold\_critical](#input\_cpu\_threshold\_critical) | CPU usage in percent (critical threshold) | `string` | `"90"` | no |
| <a name="input_cpu_threshold_warning"></a> [cpu\_threshold\_warning](#input\_cpu\_threshold\_warning) | CPU usage in percent (warning threshold) | `string` | `"80"` | no |
| <a name="input_cpu_time_aggregator"></a> [cpu\_time\_aggregator](#input\_cpu\_time\_aggregator) | Monitor aggregator for ES cluster cpu [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_cpu_timeframe"></a> [cpu\_timeframe](#input\_cpu\_timeframe) | Monitor timeframe for ES cluster cpu [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_diskspace_enabled"></a> [diskspace\_enabled](#input\_diskspace\_enabled) | Flag to enable ES cluster diskspace monitor | `string` | `"true"` | no |
| <a name="input_diskspace_extra_tags"></a> [diskspace\_extra\_tags](#input\_diskspace\_extra\_tags) | Extra tags for ES cluster diskspace monitor | `list(string)` | `[]` | no |
| <a name="input_diskspace_message"></a> [diskspace\_message](#input\_diskspace\_message) | Custom message for ES cluster diskspace monitor | `string` | `""` | no |
| <a name="input_diskspace_threshold_critical"></a> [diskspace\_threshold\_critical](#input\_diskspace\_threshold\_critical) | Disk free space in percent (critical threshold) | `string` | `"10"` | no |
| <a name="input_diskspace_threshold_warning"></a> [diskspace\_threshold\_warning](#input\_diskspace\_threshold\_warning) | Disk free space in percent (warning threshold) | `string` | `"20"` | no |
| <a name="input_diskspace_time_aggregator"></a> [diskspace\_time\_aggregator](#input\_diskspace\_time\_aggregator) | Monitor aggregator for ES cluster diskspace [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_diskspace_timeframe"></a> [diskspace\_timeframe](#input\_diskspace\_timeframe) | Monitor timeframe for ES cluster diskspace [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_es_cluster_status_enabled"></a> [es\_cluster\_status\_enabled](#input\_es\_cluster\_status\_enabled) | Flag to enable ES cluster status monitor | `string` | `"true"` | no |
| <a name="input_es_cluster_status_extra_tags"></a> [es\_cluster\_status\_extra\_tags](#input\_es\_cluster\_status\_extra\_tags) | Extra tags for ES cluster status monitor | `list(string)` | `[]` | no |
| <a name="input_es_cluster_status_message"></a> [es\_cluster\_status\_message](#input\_es\_cluster\_status\_message) | Custom message for ES cluster status monitor | `string` | `""` | no |
| <a name="input_es_cluster_status_no_data_timeframe"></a> [es\_cluster\_status\_no\_data\_timeframe](#input\_es\_cluster\_status\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `60` | no |
| <a name="input_es_cluster_status_timeframe"></a> [es\_cluster\_status\_timeframe](#input\_es\_cluster\_status\_timeframe) | Monitor timeframe for ES cluster status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_30m"` | no |
| <a name="input_es_cluster_volume_size"></a> [es\_cluster\_volume\_size](#input\_es\_cluster\_volume\_size) | ElasticSearch Domain volume size (in GB) | `any` | n/a | yes |
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
| <a name="output_es_cluster_status_id"></a> [es\_cluster\_status\_id](#output\_es\_cluster\_status\_id) | id for monitor es\_cluster\_status |
| <a name="output_es_cpu_90_15min_id"></a> [es\_cpu\_90\_15min\_id](#output\_es\_cpu\_90\_15min\_id) | id for monitor es\_cpu\_90\_15min |
| <a name="output_es_free_space_low_id"></a> [es\_free\_space\_low\_id](#output\_es\_free\_space\_low\_id) | id for monitor es\_free\_space\_low |
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_es/](https://docs.datadoghq.com/integrations/amazon_es/)

AWS ElasticSearch Service Instance metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/es-metricscollected.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/es-metricscollected.html)
