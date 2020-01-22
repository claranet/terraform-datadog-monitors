# CLOUD AWS BEANSTALK DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-beanstalk" {
  source      = "claranet/monitors/datadog//cloud/aws/beanstalk"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Beanstalk Application 5xx error rate
- Beanstalk Application latency p90
- Beanstalk Environment health
- Beanstalk Instance root file system usage

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| application\_5xx\_error\_rate\_enabled | Flag to enable Beanstalk application 5xx error ratemonitor | `string` | `"true"` | no |
| application\_5xx\_error\_rate\_extra\_tags | Extra tags for application 5xx error rate monitor | `list(string)` | `[]` | no |
| application\_5xx\_error\_rate\_message | Custom message for application 5xx error rate | `string` | `""` | no |
| application\_5xx\_error\_rate\_threshold\_critical | 5xx Error rate critical threshold in percent | `number` | `5` | no |
| application\_5xx\_error\_rate\_threshold\_warning | 5xx Error rate warning threshold in percent | `string` | `3` | no |
| application\_5xx\_error\_rate\_time\_aggregator | Monitor aggregator for beanstalk application 5xx error rate [available values: min, max or avg] | `string` | `"sum"` | no |
| application\_5xx\_error\_rate\_timeframe | Monitor timeframe for beanstalk application 5xx error rate [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| application\_latency\_p90\_enabled | Flag to enable Beanstalk application latency P90 monitor | `string` | `"true"` | no |
| application\_latency\_p90\_extra\_tags | Extra tags for application latency P90 monitor | `list(string)` | `[]` | no |
| application\_latency\_p90\_message | Custom message for application latency P90 monitor | `string` | `""` | no |
| application\_latency\_p90\_threshold\_critical | P90 Latency critical threshold in seconds | `number` | `0.5` | no |
| application\_latency\_p90\_threshold\_warning | P90 Latency warning threshold in seconds | `string` | `0.3` | no |
| application\_latency\_p90\_time\_aggregator | Monitor aggregator for beanstalk application latency P90 [available values: min, max or avg] | `string` | `"min"` | no |
| application\_latency\_p90\_timeframe | Monitor timeframe for beanstalk application latency P90 [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_15m"` | no |
| environment | Architecture Environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| health\_enabled | Flag to enable Beanstalk Health monitor | `string` | `"true"` | no |
| health\_extra\_tags | Extra tags for health monitor | `list(string)` | `[]` | no |
| health\_message | Custom message for health monitor | `string` | `""` | no |
| health\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `""` | no |
| health\_threshold\_critical | Health critical threshold (see the `aws.elasticbeanstalk.environment_health` values in the Datadog documentation) | `number` | `20` | no |
| health\_threshold\_warning | Health critical threshold (see the `aws.elasticbeanstalk.environment_health` values in the Datadog documentation) | `number` | `15` | no |
| health\_time\_aggregator | Monitor aggregator for beanstalk health [available values: min, max or avg] | `string` | `"min"` | no |
| health\_timeframe | Monitor timeframe for beanstalk health [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_10m"` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| root\_filesystem\_usage\_aggregator | Monitor aggregator for beanstalk instance file system usage [available values: min, max or avg] | `string` | `"max"` | no |
| root\_filesystem\_usage\_enabled | Flag to enable Beanstalk instance file system usage monitor | `string` | `"true"` | no |
| root\_filesystem\_usage\_extra\_tags | Extra tags for file system usage monitor | `list(string)` | `[]` | no |
| root\_filesystem\_usage\_message | Custom message for application file system usage | `string` | `""` | no |
| root\_filesystem\_usage\_threshold\_critical | File system usage critical threshold in percent | `string` | `90` | no |
| root\_filesystem\_usage\_threshold\_warning | File system usage warning threshold in percent | `string` | `80` | no |
| root\_filesystem\_usage\_timeframe | Monitor timeframe for beanstalk instance file system usage [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| root\_filesystem\_usage\_timeout\_h | File system usage auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| application\_5xx\_error\_rate\_id | id for monitor application\_5xx\_error\_rate |
| application\_latency\_p90\_id | id for monitor application\_latency\_p90 |
| health\_id | id for monitor health |
| root\_filesystem\_usage\_id | id for monitor root\_filesystem\_usage |

## Related documentation

Datadog documentation: [https://docs.datadoghq.com/integrations/amazon_elasticbeanstalk/](https://docs.datadoghq.com/integrations/amazon_elasticbeanstalk/)

AWS Beanstalk Environment monitoring : [https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environments-health.html](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environments-health.html)
