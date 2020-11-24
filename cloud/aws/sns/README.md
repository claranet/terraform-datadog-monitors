# CLOUD AWS SQS DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-sns" {
  source      = "claranet/monitors/datadog//cloud/aws/sns"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- SNS percentage of notification failure

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| notification\_failure\_enabled | Flag to enable Number of Notification Failure monitor | `string` | `"false"` | no |
| notification\_failure\_extra\_tags | Extra tags for Number of Notification Failure monitor | `list(string)` | `[]` | no |
| notification\_failure\_message | Custom message for Number of Notification Failure monitor | `string` | `""` | no |
| notification\_failure\_threshold\_critical | Alerting threshold in number of notification failure percentage | `number` | `10` | no |
| notification\_failure\_threshold\_warning | Warning threshold in number of notification failure percentage | `number` | `5` | no |
| notification\_failure\_time\_aggregator | Monitor aggregator for Number of Notification Failure [available values: min, max or avg] | `string` | `"min"` | no |
| notification\_failure\_timeframe | Monitor timeframe for Number of Notification Failure [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_30m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| notification\_failure\_id | id for monitor notification\_failure |

## Related documentation
* [Datadog Documentation](https://docs.datadoghq.com/integrations/amazon_sns/)
* [Service Documentation](https://docs.aws.amazon.com/sns/index.html)
