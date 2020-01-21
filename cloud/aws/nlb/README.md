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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| nlb\_no\_healthy\_instances\_enabled | Flag to enable NLB no healthy instances monitor | `string` | `"true"` | no |
| nlb\_no\_healthy\_instances\_extra\_tags | Extra tags for NLB no healthy instances monitor | `list(string)` | `[]` | no |
| nlb\_no\_healthy\_instances\_message | Custom message for NLB no healthy instances monitor | `string` | `""` | no |
| nlb\_no\_healthy\_instances\_threshold\_warning | NLB no healthy instances warning threshold in percentage | `number` | `100` | no |
| nlb\_no\_healthy\_instances\_time\_aggregator | Monitor aggregator for NLB no healthy instances [available values: min, max or avg] | `string` | `"min"` | no |
| nlb\_no\_healthy\_instances\_timeframe | Monitor timeframe for NLB no healthy instances [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| NLB\_no\_healthy\_instances\_id | id for monitor NLB\_no\_healthy\_instances |

## Related documentation

DataDog blog: [https://www.datadoghq.com/blog/monitor-aws-network-load-balancer/](https://www.datadoghq.com/blog/monitor-aws-network-load-balancer/)

AWS NLB metrics documentation: [https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-cloudwatch-metrics.html](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-cloudwatch-metrics.html)
