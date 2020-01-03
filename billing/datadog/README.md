# BILLING DATADOG DataDog monitors

## How to use this module

```
module "datadog-monitors-billing-datadog" {
  source = "claranet/monitors/datadog//billing/datadog"
  version = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Datadog Host estimated usage anomaly detected
- Datadog Host estimated usage daily change alert
- Datadog Host estimated usage daily timeshift alert
- Datadog Host estimated usage seasonal anomaly detected

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"15"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| host\_agile\_anomaly\_alert\_window | Alert window. | string | `"last_4h"` | no |
| host\_agile\_anomaly\_count\_default\_zero | Count default zero | string | `"true"` | no |
| host\_agile\_anomaly\_detection\_algorithm | Anomaly Detection Algorithm used | string | `"agile"` | no |
| host\_agile\_anomaly\_deviations | Deviations to detect the anomaly | string | `"2"` | no |
| host\_agile\_anomaly\_direction | Direction of the anomaly. It can be both, below or above. | string | `"above"` | no |
| host\_agile\_anomaly\_enabled | Flag to enable Host estimated usage agile anomaly monitor | string | `"true"` | no |
| host\_agile\_anomaly\_extra\_tags | Extra tags for Host estimated usage agile anomaly monitor | list(string) | `[]` | no |
| host\_agile\_anomaly\_interval | Interval. | string | `"3600"` | no |
| host\_agile\_anomaly\_message | Custom message for Host estimated usage agile anomaly monitor | string | `""` | no |
| host\_agile\_anomaly\_seasonality | Seasonality of the algorithm | string | `"daily"` | no |
| host\_agile\_anomaly\_threshold\_critical | Host estimated usage agile anomaly  critical threshold | string | `"1"` | no |
| host\_agile\_anomaly\_time\_aggregator | Time aggregator for Host estimated usage agile anomaly monitor | string | `"avg"` | no |
| host\_agile\_anomaly\_timeframe | Timeframe for Host estimated usage agile anomaly monitor | string | `"last_1w"` | no |
| host\_basic\_anomaly\_alert\_window | Alert window. | string | `"last_1d"` | no |
| host\_basic\_anomaly\_count\_default\_zero | Count default zero. | string | `"true"` | no |
| host\_basic\_anomaly\_detection\_algorithm | Anomaly Detection Algorithm used | string | `"basic"` | no |
| host\_basic\_anomaly\_deviations | Deviations to detect the anomaly | string | `"3"` | no |
| host\_basic\_anomaly\_direction | Direction of the anomaly. It can be both, below or above. | string | `"above"` | no |
| host\_basic\_anomaly\_enabled | Flag to enable Host estimated usage basic anomaly monitor | string | `"true"` | no |
| host\_basic\_anomaly\_extra\_tags | Extra tags for Host estimated usage basic anomaly monitor | list(string) | `[]` | no |
| host\_basic\_anomaly\_interval | Interval. | string | `"3600"` | no |
| host\_basic\_anomaly\_message | Custom message for Host estimated usage basic anomaly monitor | string | `""` | no |
| host\_basic\_anomaly\_threshold\_critical | Host estimated usage basic anomaly critical threshold | string | `"1"` | no |
| host\_basic\_anomaly\_time\_aggregator | Time aggregator for Host estimated usage basic anomaly monitor | string | `"avg"` | no |
| host\_basic\_anomaly\_timeframe | Timeframe for Host estimated usage basic anomaly monitor | string | `"last_1w"` | no |
| host\_change\_enabled | Flag to enable Host estimated usage change monitor | string | `"true"` | no |
| host\_change\_extra\_tags | Extra tags for Host estimated usage change monitor | list(string) | `[]` | no |
| host\_change\_message | Custom message for Host estimated usage change monitor | string | `""` | no |
| host\_change\_threshold\_critical | Host estimated usage change critical threshold | string | `"60"` | no |
| host\_change\_threshold\_warning | Host estimated usage change warning threshold | string | `"40"` | no |
| host\_change\_time\_aggregator | Time aggregator for Host estimated usage change monitor | string | `"max"` | no |
| host\_change\_timeframe | Timeframe for Host estimated usage change monitor | string | `"last_15m"` | no |
| host\_timeshift\_enabled | Flag to enable Host estimated usage timeshift monitor | string | `"true"` | no |
| host\_timeshift\_extra\_tags | Extra tags for Host estimated usage timeshift monitor | list(string) | `[]` | no |
| host\_timeshift\_message | Custom message for Host estimated usage timeshift monitor | string | `""` | no |
| host\_timeshift\_threshold\_critical | Host estimated usage timeshift critical threshold | string | `"60"` | no |
| host\_timeshift\_threshold\_warning | Host estimated usage timeshift warning threshold | string | `"40"` | no |
| host\_timeshift\_time\_aggregator | Time aggregator for Host estimated usage timeshift monitor | string | `"max"` | no |
| host\_timeshift\_timeframe | Timeframe for Host estimated usage timeshift monitor | string | `"last_1d"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before begin to monitor new host | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| host\_agile\_anomaly\_id | id for monitor host_agile_anomaly |
| host\_basic\_anomaly\_id | id for monitor host_basic_anomaly |
| host\_change\_id | id for monitor host_change |
| host\_timeshift\_id | id for monitor host_timeshift |

## Related documentation
* [Datadog estimated usage metrics](https://docs.datadoghq.com/account_management/billing/usage_metrics/)
