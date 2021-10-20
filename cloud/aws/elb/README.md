# CLOUD AWS ELB DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-elb" {
  source      = "claranet/monitors/datadog//cloud/aws/elb"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- ELB 4xx errors too high
- ELB 5xx errors too high
- ELB backend 4xx errors too high
- ELB backend 5xx errors too high
- ELB healthy instances
- ELB latency too high

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
| [datadog_monitor.ELB_backend_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.ELB_no_healthy_instances](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.ELB_too_much_4xx](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.ELB_too_much_4xx_backend](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.ELB_too_much_5xx](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.ELB_too_much_5xx_backend](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_artificial_requests_count"></a> [artificial\_requests\_count](#input\_artificial\_requests\_count) | Number of false requests used to mitigate false positive in case of low trafic | `number` | `5` | no |
| <a name="input_elb_4xx_enabled"></a> [elb\_4xx\_enabled](#input\_elb\_4xx\_enabled) | Flag to enable ELB 4xx errors monitor | `string` | `"true"` | no |
| <a name="input_elb_4xx_extra_tags"></a> [elb\_4xx\_extra\_tags](#input\_elb\_4xx\_extra\_tags) | Extra tags for ELB 4xx errors monitor | `list(string)` | `[]` | no |
| <a name="input_elb_4xx_message"></a> [elb\_4xx\_message](#input\_elb\_4xx\_message) | Custom message for ELB 4xx errors monitor | `string` | `""` | no |
| <a name="input_elb_4xx_threshold_critical"></a> [elb\_4xx\_threshold\_critical](#input\_elb\_4xx\_threshold\_critical) | loadbalancer 4xx critical threshold in percentage | `number` | `10` | no |
| <a name="input_elb_4xx_threshold_warning"></a> [elb\_4xx\_threshold\_warning](#input\_elb\_4xx\_threshold\_warning) | loadbalancer 4xx warning threshold in percentage | `number` | `5` | no |
| <a name="input_elb_4xx_timeframe"></a> [elb\_4xx\_timeframe](#input\_elb\_4xx\_timeframe) | Monitor timeframe for ELB 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_elb_5xx_enabled"></a> [elb\_5xx\_enabled](#input\_elb\_5xx\_enabled) | Flag to enable ELB 5xx errors monitor | `string` | `"true"` | no |
| <a name="input_elb_5xx_extra_tags"></a> [elb\_5xx\_extra\_tags](#input\_elb\_5xx\_extra\_tags) | Extra tags for ELB 5xx errors monitor | `list(string)` | `[]` | no |
| <a name="input_elb_5xx_message"></a> [elb\_5xx\_message](#input\_elb\_5xx\_message) | Custom message for ELB 5xx errors monitor | `string` | `""` | no |
| <a name="input_elb_5xx_threshold_critical"></a> [elb\_5xx\_threshold\_critical](#input\_elb\_5xx\_threshold\_critical) | loadbalancer 5xx critical threshold in percentage | `number` | `10` | no |
| <a name="input_elb_5xx_threshold_warning"></a> [elb\_5xx\_threshold\_warning](#input\_elb\_5xx\_threshold\_warning) | loadbalancer 5xx warning threshold in percentage | `number` | `5` | no |
| <a name="input_elb_5xx_timeframe"></a> [elb\_5xx\_timeframe](#input\_elb\_5xx\_timeframe) | Monitor timeframe for ELB 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_elb_backend_4xx_enabled"></a> [elb\_backend\_4xx\_enabled](#input\_elb\_backend\_4xx\_enabled) | Flag to enable ELB backend 4xx errors monitor | `string` | `"true"` | no |
| <a name="input_elb_backend_4xx_extra_tags"></a> [elb\_backend\_4xx\_extra\_tags](#input\_elb\_backend\_4xx\_extra\_tags) | Extra tags for ELB backend 4xx errors monitor | `list(string)` | `[]` | no |
| <a name="input_elb_backend_4xx_message"></a> [elb\_backend\_4xx\_message](#input\_elb\_backend\_4xx\_message) | Custom message for ELB backend 4xx errors monitor | `string` | `""` | no |
| <a name="input_elb_backend_4xx_threshold_critical"></a> [elb\_backend\_4xx\_threshold\_critical](#input\_elb\_backend\_4xx\_threshold\_critical) | loadbalancer backend 4xx critical threshold in percentage | `number` | `10` | no |
| <a name="input_elb_backend_4xx_threshold_warning"></a> [elb\_backend\_4xx\_threshold\_warning](#input\_elb\_backend\_4xx\_threshold\_warning) | loadbalancer backend 4xx warning threshold in percentage | `number` | `5` | no |
| <a name="input_elb_backend_4xx_timeframe"></a> [elb\_backend\_4xx\_timeframe](#input\_elb\_backend\_4xx\_timeframe) | Monitor timeframe for ELB backend 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_elb_backend_5xx_enabled"></a> [elb\_backend\_5xx\_enabled](#input\_elb\_backend\_5xx\_enabled) | Flag to enable ELB backend 5xx errors monitor | `string` | `"true"` | no |
| <a name="input_elb_backend_5xx_extra_tags"></a> [elb\_backend\_5xx\_extra\_tags](#input\_elb\_backend\_5xx\_extra\_tags) | Extra tags for ELB backend 5xx errors monitor | `list(string)` | `[]` | no |
| <a name="input_elb_backend_5xx_message"></a> [elb\_backend\_5xx\_message](#input\_elb\_backend\_5xx\_message) | Custom message for ELB backend 5xx errors monitor | `string` | `""` | no |
| <a name="input_elb_backend_5xx_threshold_critical"></a> [elb\_backend\_5xx\_threshold\_critical](#input\_elb\_backend\_5xx\_threshold\_critical) | loadbalancer backend 5xx critical threshold in percentage | `number` | `10` | no |
| <a name="input_elb_backend_5xx_threshold_warning"></a> [elb\_backend\_5xx\_threshold\_warning](#input\_elb\_backend\_5xx\_threshold\_warning) | loadbalancer backend 5xx warning threshold in percentage | `number` | `5` | no |
| <a name="input_elb_backend_5xx_timeframe"></a> [elb\_backend\_5xx\_timeframe](#input\_elb\_backend\_5xx\_timeframe) | Monitor timeframe for ELB backend 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_elb_backend_latency_critical"></a> [elb\_backend\_latency\_critical](#input\_elb\_backend\_latency\_critical) | latency critical threshold in seconds | `number` | `3` | no |
| <a name="input_elb_backend_latency_enabled"></a> [elb\_backend\_latency\_enabled](#input\_elb\_backend\_latency\_enabled) | Flag to enable ELB backend latency monitor | `string` | `"true"` | no |
| <a name="input_elb_backend_latency_extra_tags"></a> [elb\_backend\_latency\_extra\_tags](#input\_elb\_backend\_latency\_extra\_tags) | Extra tags for ELB backend latency monitor | `list(string)` | `[]` | no |
| <a name="input_elb_backend_latency_message"></a> [elb\_backend\_latency\_message](#input\_elb\_backend\_latency\_message) | Custom message for ELB backend latency monitor | `string` | `""` | no |
| <a name="input_elb_backend_latency_time_aggregator"></a> [elb\_backend\_latency\_time\_aggregator](#input\_elb\_backend\_latency\_time\_aggregator) | Monitor aggregator for ELB backend latency [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_elb_backend_latency_timeframe"></a> [elb\_backend\_latency\_timeframe](#input\_elb\_backend\_latency\_timeframe) | Monitor timeframe for ELB backend latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_elb_backend_latency_warning"></a> [elb\_backend\_latency\_warning](#input\_elb\_backend\_latency\_warning) | latency warning threshold in seconds | `number` | `1` | no |
| <a name="input_elb_no_healthy_instance_enabled"></a> [elb\_no\_healthy\_instance\_enabled](#input\_elb\_no\_healthy\_instance\_enabled) | Flag to enable ELB no healty instance monitor | `string` | `"true"` | no |
| <a name="input_elb_no_healthy_instance_extra_tags"></a> [elb\_no\_healthy\_instance\_extra\_tags](#input\_elb\_no\_healthy\_instance\_extra\_tags) | Extra tags for ELB no healty instance monitor | `list(string)` | `[]` | no |
| <a name="input_elb_no_healthy_instance_message"></a> [elb\_no\_healthy\_instance\_message](#input\_elb\_no\_healthy\_instance\_message) | Custom message for ELB no healty instance monitor | `string` | `""` | no |
| <a name="input_elb_no_healthy_instance_no_data_timeframe"></a> [elb\_no\_healthy\_instance\_no\_data\_timeframe](#input\_elb\_no\_healthy\_instance\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_elb_no_healthy_instance_threshold_warning"></a> [elb\_no\_healthy\_instance\_threshold\_warning](#input\_elb\_no\_healthy\_instance\_threshold\_warning) | ELB no healthy instances warning threshold in percentage | `number` | `100` | no |
| <a name="input_elb_no_healthy_instance_time_aggregator"></a> [elb\_no\_healthy\_instance\_time\_aggregator](#input\_elb\_no\_healthy\_instance\_time\_aggregator) | Monitor aggregator for ELB no healty instance [available values: min or max] | `string` | `"min"` | no |
| <a name="input_elb_no_healthy_instance_timeframe"></a> [elb\_no\_healthy\_instance\_timeframe](#input\_elb\_no\_healthy\_instance\_timeframe) | Monitor timeframe for ELB no healty instance [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture Environment | `string` | n/a | yes |
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
| <a name="output_ELB_backend_latency_id"></a> [ELB\_backend\_latency\_id](#output\_ELB\_backend\_latency\_id) | id for monitor ELB\_backend\_latency |
| <a name="output_ELB_no_healthy_instances_id"></a> [ELB\_no\_healthy\_instances\_id](#output\_ELB\_no\_healthy\_instances\_id) | id for monitor ELB\_no\_healthy\_instances |
| <a name="output_ELB_too_much_4xx_backend_id"></a> [ELB\_too\_much\_4xx\_backend\_id](#output\_ELB\_too\_much\_4xx\_backend\_id) | id for monitor ELB\_too\_much\_4xx\_backend |
| <a name="output_ELB_too_much_4xx_id"></a> [ELB\_too\_much\_4xx\_id](#output\_ELB\_too\_much\_4xx\_id) | id for monitor ELB\_too\_much\_4xx |
| <a name="output_ELB_too_much_5xx_backend_id"></a> [ELB\_too\_much\_5xx\_backend\_id](#output\_ELB\_too\_much\_5xx\_backend\_id) | id for monitor ELB\_too\_much\_5xx\_backend |
| <a name="output_ELB_too_much_5xx_id"></a> [ELB\_too\_much\_5xx\_id](#output\_ELB\_too\_much\_5xx\_id) | id for monitor ELB\_too\_much\_5xx |
## Related documentation

DataDog blog: [https://www.datadoghq.com/blog/monitor-application-load-balancer/](https://www.datadoghq.com/blog/monitor-application-load-balancer/)

AWS ELB metrics documentation: [https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-cloudwatch-metrics.html](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-cloudwatch-metrics.html)
