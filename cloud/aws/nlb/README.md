# CLOUD AWS NLB DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-nlb" {
  source      = "claranet/monitors/datadog//cloud/aws/nlb"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- NLB healthy instances

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
| [datadog_monitor.NLB_no_healthy_instances](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_nlb_no_healthy_instances_enabled"></a> [nlb\_no\_healthy\_instances\_enabled](#input\_nlb\_no\_healthy\_instances\_enabled) | Flag to enable NLB no healthy instances monitor | `string` | `"true"` | no |
| <a name="input_nlb_no_healthy_instances_extra_tags"></a> [nlb\_no\_healthy\_instances\_extra\_tags](#input\_nlb\_no\_healthy\_instances\_extra\_tags) | Extra tags for NLB no healthy instances monitor | `list(string)` | `[]` | no |
| <a name="input_nlb_no_healthy_instances_message"></a> [nlb\_no\_healthy\_instances\_message](#input\_nlb\_no\_healthy\_instances\_message) | Custom message for NLB no healthy instances monitor | `string` | `""` | no |
| <a name="input_nlb_no_healthy_instances_no_data_timeframe"></a> [nlb\_no\_healthy\_instances\_no\_data\_timeframe](#input\_nlb\_no\_healthy\_instances\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_nlb_no_healthy_instances_threshold_warning"></a> [nlb\_no\_healthy\_instances\_threshold\_warning](#input\_nlb\_no\_healthy\_instances\_threshold\_warning) | NLB no healthy instances warning threshold in percentage | `number` | `100` | no |
| <a name="input_nlb_no_healthy_instances_time_aggregator"></a> [nlb\_no\_healthy\_instances\_time\_aggregator](#input\_nlb\_no\_healthy\_instances\_time\_aggregator) | Monitor aggregator for NLB no healthy instances [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_nlb_no_healthy_instances_timeframe"></a> [nlb\_no\_healthy\_instances\_timeframe](#input\_nlb\_no\_healthy\_instances\_timeframe) | Monitor timeframe for NLB no healthy instances [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_NLB_no_healthy_instances_id"></a> [NLB\_no\_healthy\_instances\_id](#output\_NLB\_no\_healthy\_instances\_id) | id for monitor NLB\_no\_healthy\_instances |
## Related documentation

DataDog blog: [https://www.datadoghq.com/blog/monitor-aws-network-load-balancer/](https://www.datadoghq.com/blog/monitor-aws-network-load-balancer/)

AWS NLB metrics documentation: [https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-cloudwatch-metrics.html](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-cloudwatch-metrics.html)
