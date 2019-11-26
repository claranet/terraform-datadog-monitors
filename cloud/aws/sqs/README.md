# CLOUD AWS SQS DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-aws-sqs" {
  source = "git::ssh://git@github.com/claranet/terraform-datadog-monitors.git//cloud/aws/sqs?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- SQS Age of the oldest message
- SQS Visible messages (disabled by default)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| age\_of\_oldest\_message\_enabled | Flag to enable Age of Oldest Message monitor | string | `"true"` | no |
| age\_of\_oldest\_message\_extra\_tags | Extra tags for Age of Oldest Message monitor | list(string) | `[]` | no |
| age\_of\_oldest\_message\_message | Custom message for Age of Oldest Message monitor | string | `""` | no |
| age\_of\_oldest\_message\_threshold\_critical | Alerting threshold in seconds | string | `"600"` | no |
| age\_of\_oldest\_message\_threshold\_warning | Warning threshold in seconds | string | `"300"` | no |
| age\_of\_oldest\_message\_time\_aggregator | Monitor aggregator for Age of Oldest Message [available values: min, max or avg] | string | `"min"` | no |
| age\_of\_oldest\_message\_timeframe | Monitor timeframe for Age of Oldest Message [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_30m"` | no |
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| visible\_messages\_enabled | Flag to enable Number of Visible Messages monitor | string | `"false"` | no |
| visible\_messages\_extra\_tags | Extra tags for Number of Visible Messages monitor | list(string) | `[]` | no |
| visible\_messages\_message | Custom message for Number of Visible Messages monitor | string | `""` | no |
| visible\_messages\_threshold\_critical | Alerting threshold in number of messages | string | `"2"` | no |
| visible\_messages\_threshold\_warning | Warning threshold in number of messages | string | `"1"` | no |
| visible\_messages\_time\_aggregator | Monitor aggregator for Number of Visible Messages [available values: min, max or avg] | string | `"min"` | no |
| visible\_messages\_timeframe | Monitor timeframe for Number of Visible Messages [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_30m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| age\_of\_oldest\_message\_id | id for monitor age_of_oldest_message |
| visible\_messages\_id | id for monitor visible_messages |

## Related documentation
* [Datadog Documentation](https://docs.datadoghq.com/integrations/amazon_sqs/)
* [Service Documentation](https://docs.aws.amazon.com/sqs/index.html)
