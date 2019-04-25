# CLOUD AWS NLB DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-aws-nlb" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//cloud/aws/nlb?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- NLB healthy instances
- NLB reset connection too high

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| artificial\_requests\_count | Number of false requests used to mitigate false positive in case of low trafic | string | `"5"` | no |
| nlb\_reset\_enabled | Flag to enable NLB reset monitor | string | `"true"` | no |
| nlb\_reset\_extra\_tags | Extra tags for NLB reset monitor | list | `[]` | no |
| nlb\_reset\_message | Custom message for NLB reset monitor | string | `""` | no |
| nlb\_reset\_silenced | Groups to mute for NLB reset monitor | map | `{}` | no |
| nlb\_reset\_threshold\_critical | newtork loadbalancer reset warning threshold in percentage | string | `"10"` | no |
| nlb\_reset\_threshold\_warning | newtork loadbalancer reset warning threshold in percentage | string | `"5"` | no |
| nlb\_reset\_timeframe | Monitor timeframe for NLB reset [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| nlb\_no\_healthy\_instance\_enabled | Flag to enable NLB no healty instance monitor | string | `"true"` | no |
| nlb\_no\_healthy\_instance\_extra\_tags | Extra tags for NLB no healty instance monitor | list | `[]` | no |
| nlb\_no\_healthy\_instance\_message | Custom message for NLB no healty instance monitor | string | `""` | no |
| nlb\_no\_healthy\_instance\_silenced | Groups to mute for NLB no healty instance monitor | map | `{}` | no |
| nlb\_no\_healthy\_instance\_time\_aggregator | Monitor aggregator for NLB no healty instance [available values: min or max] | string | `"min"` | no |
| nlb\_no\_healthy\_instance\_timeframe | Monitor timeframe for NLB no healty instance [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| environment | Architecture Environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| NLB\_no\_healthy\_instances\_id | id for monitor NLB_no_healthy_instances |
| NLB\_too\_much\_reset\_id | id for monitor NLB_too_much_reset |

## Related documentation

DataDog blog: [https://www.datadoghq.com/blog/monitor-aws-network-load-balancer/](https://www.datadoghq.com/blog/monitor-aws-network-load-balancer/)

AWS NLB metrics documentation: [https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-cloudwatch-metrics.html](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-cloudwatch-metrics.html)
