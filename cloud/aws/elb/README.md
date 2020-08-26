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
| terraform | >= 0.12.26 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| artificial\_requests\_count | Number of false requests used to mitigate false positive in case of low trafic | `number` | `5` | no |
| elb\_4xx\_enabled | Flag to enable ELB 4xx errors monitor | `string` | `"true"` | no |
| elb\_4xx\_extra\_tags | Extra tags for ELB 4xx errors monitor | `list(string)` | `[]` | no |
| elb\_4xx\_message | Custom message for ELB 4xx errors monitor | `string` | `""` | no |
| elb\_4xx\_threshold\_critical | loadbalancer 4xx critical threshold in percentage | `number` | `10` | no |
| elb\_4xx\_threshold\_warning | loadbalancer 4xx warning threshold in percentage | `number` | `5` | no |
| elb\_4xx\_timeframe | Monitor timeframe for ELB 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| elb\_5xx\_enabled | Flag to enable ELB 5xx errors monitor | `string` | `"true"` | no |
| elb\_5xx\_extra\_tags | Extra tags for ELB 5xx errors monitor | `list(string)` | `[]` | no |
| elb\_5xx\_message | Custom message for ELB 5xx errors monitor | `string` | `""` | no |
| elb\_5xx\_threshold\_critical | loadbalancer 5xx critical threshold in percentage | `number` | `10` | no |
| elb\_5xx\_threshold\_warning | loadbalancer 5xx warning threshold in percentage | `number` | `5` | no |
| elb\_5xx\_timeframe | Monitor timeframe for ELB 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| elb\_backend\_4xx\_enabled | Flag to enable ELB backend 4xx errors monitor | `string` | `"true"` | no |
| elb\_backend\_4xx\_extra\_tags | Extra tags for ELB backend 4xx errors monitor | `list(string)` | `[]` | no |
| elb\_backend\_4xx\_message | Custom message for ELB backend 4xx errors monitor | `string` | `""` | no |
| elb\_backend\_4xx\_threshold\_critical | loadbalancer backend 4xx critical threshold in percentage | `number` | `10` | no |
| elb\_backend\_4xx\_threshold\_warning | loadbalancer backend 4xx warning threshold in percentage | `number` | `5` | no |
| elb\_backend\_4xx\_timeframe | Monitor timeframe for ELB backend 4xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| elb\_backend\_5xx\_enabled | Flag to enable ELB backend 5xx errors monitor | `string` | `"true"` | no |
| elb\_backend\_5xx\_extra\_tags | Extra tags for ELB backend 5xx errors monitor | `list(string)` | `[]` | no |
| elb\_backend\_5xx\_message | Custom message for ELB backend 5xx errors monitor | `string` | `""` | no |
| elb\_backend\_5xx\_threshold\_critical | loadbalancer backend 5xx critical threshold in percentage | `number` | `10` | no |
| elb\_backend\_5xx\_threshold\_warning | loadbalancer backend 5xx warning threshold in percentage | `number` | `5` | no |
| elb\_backend\_5xx\_timeframe | Monitor timeframe for ELB backend 5xx errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| elb\_backend\_latency\_critical | latency critical threshold in seconds | `number` | `3` | no |
| elb\_backend\_latency\_enabled | Flag to enable ELB backend latency monitor | `string` | `"true"` | no |
| elb\_backend\_latency\_extra\_tags | Extra tags for ELB backend latency monitor | `list(string)` | `[]` | no |
| elb\_backend\_latency\_message | Custom message for ELB backend latency monitor | `string` | `""` | no |
| elb\_backend\_latency\_time\_aggregator | Monitor aggregator for ELB backend latency [available values: min, max or avg] | `string` | `"min"` | no |
| elb\_backend\_latency\_timeframe | Monitor timeframe for ELB backend latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| elb\_backend\_latency\_warning | latency warning threshold in seconds | `number` | `1` | no |
| elb\_no\_healthy\_instance\_enabled | Flag to enable ELB no healty instance monitor | `string` | `"true"` | no |
| elb\_no\_healthy\_instance\_extra\_tags | Extra tags for ELB no healty instance monitor | `list(string)` | `[]` | no |
| elb\_no\_healthy\_instance\_message | Custom message for ELB no healty instance monitor | `string` | `""` | no |
| elb\_no\_healthy\_instance\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `10` | no |
| elb\_no\_healthy\_instance\_threshold\_warning | ELB no healthy instances warning threshold in percentage | `number` | `100` | no |
| elb\_no\_healthy\_instance\_time\_aggregator | Monitor aggregator for ELB no healty instance [available values: min or max] | `string` | `"min"` | no |
| elb\_no\_healthy\_instance\_timeframe | Monitor timeframe for ELB no healty instance [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| environment | Architecture Environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| ELB\_backend\_latency\_id | id for monitor ELB\_backend\_latency |
| ELB\_no\_healthy\_instances\_id | id for monitor ELB\_no\_healthy\_instances |
| ELB\_too\_much\_4xx\_backend\_id | id for monitor ELB\_too\_much\_4xx\_backend |
| ELB\_too\_much\_4xx\_id | id for monitor ELB\_too\_much\_4xx |
| ELB\_too\_much\_5xx\_backend\_id | id for monitor ELB\_too\_much\_5xx\_backend |
| ELB\_too\_much\_5xx\_id | id for monitor ELB\_too\_much\_5xx |

## Related documentation

DataDog blog: [https://www.datadoghq.com/blog/monitor-application-load-balancer/](https://www.datadoghq.com/blog/monitor-application-load-balancer/)

AWS ELB metrics documentation: [https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-cloudwatch-metrics.html](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-cloudwatch-metrics.html)
