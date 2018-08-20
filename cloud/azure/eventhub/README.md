# CLOUD AZURE EVENTHUB DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-eventhub" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/eventhub?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Event Hub is down
- Event Hub too many failed requests
- Event Hub too many errors

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture environment | string | - | yes |
| errors_rate_message | Custom message for Event Hub errors monitor | string | `` | no |
| errors_rate_silenced | Groups to mute for Event Hub errors monitor | map | `<map>` | no |
| errors_rate_thresold_critical | Errors ratio (percentage) to trigger the critical alert | string | `90` | no |
| errors_rate_thresold_warning | Errors ratio (percentage) to trigger a warning alert | string | `50` | no |
| errors_rate_timeframe | Monitor timeframe for Event Hub errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `900` | no |
| failed_requests_rate_message | Custom message for Event Hub failed requests monitor | string | `` | no |
| failed_requests_rate_silenced | Groups to mute for Event Hub failed requests monitor | map | `<map>` | no |
| failed_requests_rate_thresold_critical | Failed requests ratio (percentage) to trigger the critical alert | string | `90` | no |
| failed_requests_rate_thresold_warning | Failed requests ratio (percentage) to trigger a warning alert | string | `50` | no |
| failed_requests_rate_timeframe | Monitor timeframe for Event Hub failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |
| status_message | Custom message for Event Hub status monitor | string | `` | no |
| status_silenced | Groups to mute for Event Hub status monitor | map | `<map>` | no |
| status_time_aggregator | Monitor aggregator for Event Hub status [available values: min, max or avg] | string | `max` | no |
| status_timeframe | Monitor timeframe for Event Hub status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

## Outputs

| Name | Description |
|------|-------------|
| eventhub_errors_id | id for monitor eventhub_errors |
| eventhub_failed_requests_id | id for monitor eventhub_failed_requests |
| eventhub_status_id | id for monitor eventhub_status |

## Related documentation

Datadog documentation : [https://docs.datadoghq.com/integrations/azure_event_hub/](https://docs.datadoghq.com/integrations/azure_event_hub/)

Azure metrics documentation : [https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-metrics-azure-monitor](https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-metrics-azure-monitor)
