# CLOUD AWS ALB DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-aws-alb" {
  source = "claranet/monitors/datadog//cloud/aws/alb"
  version = "{revision}"

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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alb\_no\_healthy\_instances\_enabled | Flag to enable ALB no healthy instances monitor | string | `"true"` | no |
| alb\_no\_healthy\_instances\_extra\_tags | Extra tags for ALB no healthy instances monitor | list(string) | `[]` | no |
| alb\_no\_healthy\_instances\_message | Custom message for ALB no healthy instances monitor | string | `""` | no |
| alb\_no\_healthy\_instances\_threshold\_warning | ALB no healthy instances warning threshold in percentage | string | `"100"` | no |
| alb\_no\_healthy\_instances\_time\_aggregator | Monitor aggregator for ALB no healthy instances [available values: min, max or avg] | string | `"min"` | no |
| alb\_no\_healthy\_instances\_timeframe | Monitor timeframe for ALB no healthy instances [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| artificial\_requests\_count | Number of false requests used to mitigate false positive in case of low trafic | string | `"5"` | no |
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| httpcode\_alb\_4xx\_enabled | Flag to enable ALB httpcode 4xx monitor | string | `"true"` | no |
| httpcode\_alb\_4xx\_extra\_tags | Extra tags for ALB httpcode 4xx monitor | list(string) | `[]` | no |
| httpcode\_alb\_4xx\_message | Custom message for ALB httpcode 4xx monitor | string | `""` | no |
| httpcode\_alb\_4xx\_threshold\_critical | loadbalancer 4xx critical threshold in percentage | string | `"80"` | no |
| httpcode\_alb\_4xx\_threshold\_warning | loadbalancer 4xx warning threshold in percentage | string | `"60"` | no |
| httpcode\_alb\_4xx\_time\_aggregator | Monitor aggregator for ALB httpcode 4xx [available values: min, max or avg] | string | `"min"` | no |
| httpcode\_alb\_4xx\_timeframe | Monitor timeframe for ALB httpcode 4xx [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| httpcode\_alb\_5xx\_enabled | Flag to enable ALB httpcode 5xx monitor | string | `"true"` | no |
| httpcode\_alb\_5xx\_extra\_tags | Extra tags for ALB httpcode 5xx monitor | list(string) | `[]` | no |
| httpcode\_alb\_5xx\_message | Custom message for ALB httpcode 5xx monitor | string | `""` | no |
| httpcode\_alb\_5xx\_threshold\_critical | loadbalancer 5xx critical threshold in percentage | string | `"80"` | no |
| httpcode\_alb\_5xx\_threshold\_warning | loadbalancer 5xx warning threshold in percentage | string | `"60"` | no |
| httpcode\_alb\_5xx\_time\_aggregator | Monitor aggregator for ALB httpcode 5xx [available values: min, max or avg] | string | `"min"` | no |
| httpcode\_alb\_5xx\_timeframe | Monitor timeframe for ALB httpcode 5xx [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| httpcode\_target\_4xx\_enabled | Flag to enable ALB target httpcode 4xx monitor | string | `"true"` | no |
| httpcode\_target\_4xx\_extra\_tags | Extra tags for ALB target httpcode 4xx monitor | list(string) | `[]` | no |
| httpcode\_target\_4xx\_message | Custom message for ALB target httpcode 4xx monitor | string | `""` | no |
| httpcode\_target\_4xx\_threshold\_critical | target 4xx critical threshold in percentage | string | `"80"` | no |
| httpcode\_target\_4xx\_threshold\_warning | target 4xx warning threshold in percentage | string | `"60"` | no |
| httpcode\_target\_4xx\_time\_aggregator | Monitor aggregator for ALB target httpcode 4xx [available values: min, max or avg] | string | `"min"` | no |
| httpcode\_target\_4xx\_timeframe | Monitor timeframe for ALB target httpcode 4xx [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| httpcode\_target\_5xx\_enabled | Flag to enable ALB target httpcode 5xx monitor | string | `"true"` | no |
| httpcode\_target\_5xx\_extra\_tags | Extra tags for ALB target httpcode 5xx monitor | list(string) | `[]` | no |
| httpcode\_target\_5xx\_message | Custom message for ALB target httpcode 5xx monitor | string | `""` | no |
| httpcode\_target\_5xx\_threshold\_critical | target 5xx critical threshold in percentage | string | `"80"` | no |
| httpcode\_target\_5xx\_threshold\_warning | target 5xx warning threshold in percentage | string | `"60"` | no |
| httpcode\_target\_5xx\_time\_aggregator | Monitor aggregator for ALB target httpcode 5xx [available values: min, max or avg] | string | `"min"` | no |
| httpcode\_target\_5xx\_timeframe | Monitor timeframe for ALB target httpcode 5xx [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| latency\_enabled | Flag to enable ALB latency monitor | string | `"true"` | no |
| latency\_extra\_tags | Extra tags for ALB latency monitor | list(string) | `[]` | no |
| latency\_message | Custom message for ALB latency monitor | string | `""` | no |
| latency\_threshold\_critical | latency critical threshold in seconds | string | `"3"` | no |
| latency\_threshold\_warning | latency warning threshold in seconds | string | `"1"` | no |
| latency\_time\_aggregator | Monitor aggregator for ALB latency [available values: min, max or avg] | string | `"min"` | no |
| latency\_timeframe | Monitor timeframe for ALB latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| notify\_no\_data | Will raise no data alert if set to true | string | `"true"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| ALB\_httpcode\_4xx\_id | id for monitor ALB_httpcode_4xx |
| ALB\_httpcode\_5xx\_id | id for monitor ALB_httpcode_5xx |
| ALB\_httpcode\_target\_4xx\_id | id for monitor ALB_httpcode_target_4xx |
| ALB\_httpcode\_target\_5xx\_id | id for monitor ALB_httpcode_target_5xx |
| ALB\_latency\_id | id for monitor ALB_latency |
| ALB\_no\_healthy\_instances\_id | id for monitor ALB_no_healthy_instances |

## Related documentation

DataDog blog: [https://www.datadoghq.com/blog/monitor-application-load-balancer/](https://www.datadoghq.com/blog/monitor-application-load-balancer/)

AWS ALB metrics documentation: [https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-cloudwatch-metrics.html](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-cloudwatch-metrics.html)
