# CLOUD AWS ALB DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-alb" {
  source      = "claranet/monitors/datadog//cloud/aws/alb"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- ALB healthy instances
- ALB HTTP code 4xx
- ALB HTTP code 5xx
- ALB latency
- ALB target HTTP code 4xx
- ALB target HTTP code 5xx

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
| [datadog_monitor.ALB_httpcode_4xx](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.ALB_httpcode_5xx](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.ALB_httpcode_target_4xx](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.ALB_httpcode_target_5xx](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.ALB_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.ALB_no_healthy_instances](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_no_healthy_instances_enabled"></a> [alb\_no\_healthy\_instances\_enabled](#input\_alb\_no\_healthy\_instances\_enabled) | Flag to enable ALB no healthy instances monitor | `string` | `"true"` | no |
| <a name="input_alb_no_healthy_instances_extra_tags"></a> [alb\_no\_healthy\_instances\_extra\_tags](#input\_alb\_no\_healthy\_instances\_extra\_tags) | Extra tags for ALB no healthy instances monitor | `list(string)` | `[]` | no |
| <a name="input_alb_no_healthy_instances_message"></a> [alb\_no\_healthy\_instances\_message](#input\_alb\_no\_healthy\_instances\_message) | Custom message for ALB no healthy instances monitor | `string` | `""` | no |
| <a name="input_alb_no_healthy_instances_no_data_timeframe"></a> [alb\_no\_healthy\_instances\_no\_data\_timeframe](#input\_alb\_no\_healthy\_instances\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_alb_no_healthy_instances_threshold_warning"></a> [alb\_no\_healthy\_instances\_threshold\_warning](#input\_alb\_no\_healthy\_instances\_threshold\_warning) | ALB no healthy instances warning threshold in percentage | `number` | `100` | no |
| <a name="input_alb_no_healthy_instances_time_aggregator"></a> [alb\_no\_healthy\_instances\_time\_aggregator](#input\_alb\_no\_healthy\_instances\_time\_aggregator) | Monitor aggregator for ALB no healthy instances [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_alb_no_healthy_instances_timeframe"></a> [alb\_no\_healthy\_instances\_timeframe](#input\_alb\_no\_healthy\_instances\_timeframe) | Monitor timeframe for ALB no healthy instances [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_artificial_requests_count"></a> [artificial\_requests\_count](#input\_artificial\_requests\_count) | Number of false requests used to mitigate false positive in case of low trafic | `number` | `5` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_httpcode_alb_4xx_enabled"></a> [httpcode\_alb\_4xx\_enabled](#input\_httpcode\_alb\_4xx\_enabled) | Flag to enable ALB httpcode 4xx monitor | `string` | `"true"` | no |
| <a name="input_httpcode_alb_4xx_extra_tags"></a> [httpcode\_alb\_4xx\_extra\_tags](#input\_httpcode\_alb\_4xx\_extra\_tags) | Extra tags for ALB httpcode 4xx monitor | `list(string)` | `[]` | no |
| <a name="input_httpcode_alb_4xx_message"></a> [httpcode\_alb\_4xx\_message](#input\_httpcode\_alb\_4xx\_message) | Custom message for ALB httpcode 4xx monitor | `string` | `""` | no |
| <a name="input_httpcode_alb_4xx_threshold_critical"></a> [httpcode\_alb\_4xx\_threshold\_critical](#input\_httpcode\_alb\_4xx\_threshold\_critical) | loadbalancer 4xx critical threshold in percentage | `number` | `80` | no |
| <a name="input_httpcode_alb_4xx_threshold_warning"></a> [httpcode\_alb\_4xx\_threshold\_warning](#input\_httpcode\_alb\_4xx\_threshold\_warning) | loadbalancer 4xx warning threshold in percentage | `number` | `60` | no |
| <a name="input_httpcode_alb_4xx_time_aggregator"></a> [httpcode\_alb\_4xx\_time\_aggregator](#input\_httpcode\_alb\_4xx\_time\_aggregator) | Monitor aggregator for ALB httpcode 4xx [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_httpcode_alb_4xx_timeframe"></a> [httpcode\_alb\_4xx\_timeframe](#input\_httpcode\_alb\_4xx\_timeframe) | Monitor timeframe for ALB httpcode 4xx [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_httpcode_alb_5xx_enabled"></a> [httpcode\_alb\_5xx\_enabled](#input\_httpcode\_alb\_5xx\_enabled) | Flag to enable ALB httpcode 5xx monitor | `string` | `"true"` | no |
| <a name="input_httpcode_alb_5xx_extra_tags"></a> [httpcode\_alb\_5xx\_extra\_tags](#input\_httpcode\_alb\_5xx\_extra\_tags) | Extra tags for ALB httpcode 5xx monitor | `list(string)` | `[]` | no |
| <a name="input_httpcode_alb_5xx_message"></a> [httpcode\_alb\_5xx\_message](#input\_httpcode\_alb\_5xx\_message) | Custom message for ALB httpcode 5xx monitor | `string` | `""` | no |
| <a name="input_httpcode_alb_5xx_threshold_critical"></a> [httpcode\_alb\_5xx\_threshold\_critical](#input\_httpcode\_alb\_5xx\_threshold\_critical) | loadbalancer 5xx critical threshold in percentage | `number` | `80` | no |
| <a name="input_httpcode_alb_5xx_threshold_warning"></a> [httpcode\_alb\_5xx\_threshold\_warning](#input\_httpcode\_alb\_5xx\_threshold\_warning) | loadbalancer 5xx warning threshold in percentage | `number` | `60` | no |
| <a name="input_httpcode_alb_5xx_time_aggregator"></a> [httpcode\_alb\_5xx\_time\_aggregator](#input\_httpcode\_alb\_5xx\_time\_aggregator) | Monitor aggregator for ALB httpcode 5xx [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_httpcode_alb_5xx_timeframe"></a> [httpcode\_alb\_5xx\_timeframe](#input\_httpcode\_alb\_5xx\_timeframe) | Monitor timeframe for ALB httpcode 5xx [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_httpcode_target_4xx_enabled"></a> [httpcode\_target\_4xx\_enabled](#input\_httpcode\_target\_4xx\_enabled) | Flag to enable ALB target httpcode 4xx monitor | `string` | `"true"` | no |
| <a name="input_httpcode_target_4xx_extra_tags"></a> [httpcode\_target\_4xx\_extra\_tags](#input\_httpcode\_target\_4xx\_extra\_tags) | Extra tags for ALB target httpcode 4xx monitor | `list(string)` | `[]` | no |
| <a name="input_httpcode_target_4xx_message"></a> [httpcode\_target\_4xx\_message](#input\_httpcode\_target\_4xx\_message) | Custom message for ALB target httpcode 4xx monitor | `string` | `""` | no |
| <a name="input_httpcode_target_4xx_threshold_critical"></a> [httpcode\_target\_4xx\_threshold\_critical](#input\_httpcode\_target\_4xx\_threshold\_critical) | target 4xx critical threshold in percentage | `number` | `80` | no |
| <a name="input_httpcode_target_4xx_threshold_warning"></a> [httpcode\_target\_4xx\_threshold\_warning](#input\_httpcode\_target\_4xx\_threshold\_warning) | target 4xx warning threshold in percentage | `number` | `60` | no |
| <a name="input_httpcode_target_4xx_time_aggregator"></a> [httpcode\_target\_4xx\_time\_aggregator](#input\_httpcode\_target\_4xx\_time\_aggregator) | Monitor aggregator for ALB target httpcode 4xx [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_httpcode_target_4xx_timeframe"></a> [httpcode\_target\_4xx\_timeframe](#input\_httpcode\_target\_4xx\_timeframe) | Monitor timeframe for ALB target httpcode 4xx [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_httpcode_target_5xx_enabled"></a> [httpcode\_target\_5xx\_enabled](#input\_httpcode\_target\_5xx\_enabled) | Flag to enable ALB target httpcode 5xx monitor | `string` | `"true"` | no |
| <a name="input_httpcode_target_5xx_extra_tags"></a> [httpcode\_target\_5xx\_extra\_tags](#input\_httpcode\_target\_5xx\_extra\_tags) | Extra tags for ALB target httpcode 5xx monitor | `list(string)` | `[]` | no |
| <a name="input_httpcode_target_5xx_message"></a> [httpcode\_target\_5xx\_message](#input\_httpcode\_target\_5xx\_message) | Custom message for ALB target httpcode 5xx monitor | `string` | `""` | no |
| <a name="input_httpcode_target_5xx_threshold_critical"></a> [httpcode\_target\_5xx\_threshold\_critical](#input\_httpcode\_target\_5xx\_threshold\_critical) | target 5xx critical threshold in percentage | `number` | `80` | no |
| <a name="input_httpcode_target_5xx_threshold_warning"></a> [httpcode\_target\_5xx\_threshold\_warning](#input\_httpcode\_target\_5xx\_threshold\_warning) | target 5xx warning threshold in percentage | `number` | `60` | no |
| <a name="input_httpcode_target_5xx_time_aggregator"></a> [httpcode\_target\_5xx\_time\_aggregator](#input\_httpcode\_target\_5xx\_time\_aggregator) | Monitor aggregator for ALB target httpcode 5xx [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_httpcode_target_5xx_timeframe"></a> [httpcode\_target\_5xx\_timeframe](#input\_httpcode\_target\_5xx\_timeframe) | Monitor timeframe for ALB target httpcode 5xx [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_latency_enabled"></a> [latency\_enabled](#input\_latency\_enabled) | Flag to enable ALB latency monitor | `string` | `"true"` | no |
| <a name="input_latency_extra_tags"></a> [latency\_extra\_tags](#input\_latency\_extra\_tags) | Extra tags for ALB latency monitor | `list(string)` | `[]` | no |
| <a name="input_latency_message"></a> [latency\_message](#input\_latency\_message) | Custom message for ALB latency monitor | `string` | `""` | no |
| <a name="input_latency_threshold_critical"></a> [latency\_threshold\_critical](#input\_latency\_threshold\_critical) | latency critical threshold in seconds | `number` | `3` | no |
| <a name="input_latency_threshold_warning"></a> [latency\_threshold\_warning](#input\_latency\_threshold\_warning) | latency warning threshold in seconds | `number` | `1` | no |
| <a name="input_latency_time_aggregator"></a> [latency\_time\_aggregator](#input\_latency\_time\_aggregator) | Monitor aggregator for ALB latency [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_latency_timeframe"></a> [latency\_timeframe](#input\_latency\_timeframe) | Monitor timeframe for ALB latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ALB_httpcode_4xx_id"></a> [ALB\_httpcode\_4xx\_id](#output\_ALB\_httpcode\_4xx\_id) | id for monitor ALB\_httpcode\_4xx |
| <a name="output_ALB_httpcode_5xx_id"></a> [ALB\_httpcode\_5xx\_id](#output\_ALB\_httpcode\_5xx\_id) | id for monitor ALB\_httpcode\_5xx |
| <a name="output_ALB_httpcode_target_4xx_id"></a> [ALB\_httpcode\_target\_4xx\_id](#output\_ALB\_httpcode\_target\_4xx\_id) | id for monitor ALB\_httpcode\_target\_4xx |
| <a name="output_ALB_httpcode_target_5xx_id"></a> [ALB\_httpcode\_target\_5xx\_id](#output\_ALB\_httpcode\_target\_5xx\_id) | id for monitor ALB\_httpcode\_target\_5xx |
| <a name="output_ALB_latency_id"></a> [ALB\_latency\_id](#output\_ALB\_latency\_id) | id for monitor ALB\_latency |
| <a name="output_ALB_no_healthy_instances_id"></a> [ALB\_no\_healthy\_instances\_id](#output\_ALB\_no\_healthy\_instances\_id) | id for monitor ALB\_no\_healthy\_instances |
## Related documentation

DataDog blog: [https://www.datadoghq.com/blog/monitor-application-load-balancer/](https://www.datadoghq.com/blog/monitor-application-load-balancer/)

AWS ALB metrics documentation: [https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-cloudwatch-metrics.html](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-cloudwatch-metrics.html)
