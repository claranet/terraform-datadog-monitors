# CAAS DOCKER DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-caas-docker" {
  source      = "claranet/monitors/datadog//caas/docker"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Docker Container Memory Used (disabled by default)
- Docker does not respond

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
| [datadog_monitor.memory_used](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.not_responding](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `15` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_memory_used_enabled"></a> [memory\_used\_enabled](#input\_memory\_used\_enabled) | Flag to enable Container Memory Usage monitor | `string` | `"false"` | no |
| <a name="input_memory_used_extra_tags"></a> [memory\_used\_extra\_tags](#input\_memory\_used\_extra\_tags) | Extra tags for Container Memory Usage monitor | `list(string)` | `[]` | no |
| <a name="input_memory_used_message"></a> [memory\_used\_message](#input\_memory\_used\_message) | Custom message for the Container Memory Usage monitor | `string` | `""` | no |
| <a name="input_memory_used_threshold_critical"></a> [memory\_used\_threshold\_critical](#input\_memory\_used\_threshold\_critical) | Container Memory Usage critical threshold | `string` | `90` | no |
| <a name="input_memory_used_threshold_warning"></a> [memory\_used\_threshold\_warning](#input\_memory\_used\_threshold\_warning) | Container Memory Usage warning threshold | `string` | `85` | no |
| <a name="input_memory_used_time_aggregator"></a> [memory\_used\_time\_aggregator](#input\_memory\_used\_time\_aggregator) | Time aggregator for the Container Memory Usage monitor | `string` | `"min"` | no |
| <a name="input_memory_used_timeframe"></a> [memory\_used\_timeframe](#input\_memory\_used\_timeframe) | Timeframe for the Container Memory Usage monitor | `string` | `"last_5m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when an alert is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_not_responding_enabled"></a> [not\_responding\_enabled](#input\_not\_responding\_enabled) | Flag to enable Docker does not respond monitor | `string` | `"true"` | no |
| <a name="input_not_responding_extra_tags"></a> [not\_responding\_extra\_tags](#input\_not\_responding\_extra\_tags) | Extra tags for Docker does not respond monitor | `list(string)` | `[]` | no |
| <a name="input_not_responding_message"></a> [not\_responding\_message](#input\_not\_responding\_message) | Custom message for Docker does not respond monitor | `string` | `""` | no |
| <a name="input_not_responding_no_data_timeframe"></a> [not\_responding\_no\_data\_timeframe](#input\_not\_responding\_no\_data\_timeframe) | Docker does not respond monitor no data timeframe | `string` | `10` | no |
| <a name="input_not_responding_threshold_warning"></a> [not\_responding\_threshold\_warning](#input\_not\_responding\_threshold\_warning) | Docker does not respond monitor (warning threshold) | `string` | `3` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_memory_used_id"></a> [memory\_used\_id](#output\_memory\_used\_id) | id for monitor memory\_used |
| <a name="output_not_responding_id"></a> [not\_responding\_id](#output\_not\_responding\_id) | id for monitor not\_responding |
<!-- END_TF_DOCS -->
## Related documentation

* [Datadog Docker integration](https://docs.datadoghq.com/integrations/docker_daemon/)
