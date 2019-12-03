# CLOUD AWS LAMBDA DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-aws-lambda" {
  source = "claranet/monitors/datadog//cloud/aws/lambda"
  version = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Lambda Invocations throttled due to concurrent limit reached
- Lambda Number of errors
- Lambda Number of invocations (disabled by default)
- Lambda Percentage of errors

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture environment | string | n/a | yes |
| errors\_enabled | Flag to enable Errors monitor | string | `"false"` | no |
| errors\_extra\_tags | Extra tags for Errors monitor | list(string) | `[]` | no |
| errors\_message | Custom message for Errors monitor | string | `""` | no |
| errors\_threshold\_critical | Alerting threshold in milliseconds | string | `"3"` | no |
| errors\_threshold\_warning | Warning threshold in milliseconds | string | `"1"` | no |
| errors\_time\_aggregator | Monitor aggregator for Errors [available values: min, max or avg] | string | `"sum"` | no |
| errors\_timeframe | Monitor timeframe for Errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_1h"` | no |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| invocations\_enabled | Flag to enable Invocations monitor | string | `"false"` | no |
| invocations\_extra\_tags | Extra tags for Invocations monitor | list(string) | `[]` | no |
| invocations\_message | Custom message for Invocations monitor | string | `""` | no |
| invocations\_no\_data\_timeframe | Timeframe to check before alerting on no data in minutes | string | `"120"` | no |
| invocations\_threshold\_critical | Alerting threshold in number of invocations | string | `"1"` | no |
| invocations\_threshold\_warning | Warning threshold in number of invocations | string | `"2"` | no |
| invocations\_time\_aggregator | Monitor aggregator for Invocations [available values: min, max or avg] | string | `"sum"` | no |
| invocations\_timeframe | Monitor timeframe for Invocations [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_30m"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| notify\_no\_data | Will raise no data alert if set to true | string | `"true"` | no |
| pct\_errors\_enabled | Flag to enable Percentage of errors monitor | string | `"true"` | no |
| pct\_errors\_extra\_tags | Extra tags for Percentage of errors monitor | list(string) | `[]` | no |
| pct\_errors\_message | Custom message for Percentage of errors monitor | string | `""` | no |
| pct\_errors\_threshold\_critical | Alerting threshold in percentage | string | `"30"` | no |
| pct\_errors\_threshold\_warning | Warning threshold in percentage | string | `"20"` | no |
| pct\_errors\_time\_aggregator | Monitor aggregator for Percentage of errors [available values: min, max or avg] | string | `"sum"` | no |
| pct\_errors\_timeframe | Monitor timeframe for Percentage of errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_1h"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| throttles\_enabled | Flag to enable Throttles monitor | string | `"true"` | no |
| throttles\_extra\_tags | Extra tags for Throttles monitor | list(string) | `[]` | no |
| throttles\_message | Custom message for Throttles monitor | string | `""` | no |
| throttles\_threshold\_critical | Alerting threshold in number of throttles | string | `"3"` | no |
| throttles\_threshold\_warning | Warning threshold in number of throttles | string | `"1"` | no |
| throttles\_time\_aggregator | Monitor aggregator for Throttles [available values: min, max or avg] | string | `"sum"` | no |
| throttles\_timeframe | Monitor timeframe for Throttles [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_1h"` | no |

## Outputs

| Name | Description |
|------|-------------|
| errors\_id | id for monitor errors |
| invocations\_id | id for monitor invocations |
| pct\_errors\_id | id for monitor pct_errors |
| throttles\_id | id for monitor throttles |

## Related documentation
* [Datadog Documentation](https://docs.datadoghq.com/integrations/amazon_lambda/)
* [Service documentation](https://docs.aws.amazon.com/lambda/index.html)
