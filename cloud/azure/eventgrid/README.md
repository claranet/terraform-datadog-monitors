# CLOUD AZURE EVENTGRID DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-eventgrid" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//cloud/azure/eventgrid?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Event Grid no successful message
- Event Grid too many failed messages
- Event Grid too many unmatched events

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| failed\_messages\_rate\_enabled | Flag to enable Event Grid failed messages monitor | string | `"true"` | no |
| failed\_messages\_rate\_extra\_tags | Extra tags for Event Grid failed messages monitor | list | `[]` | no |
| failed\_messages\_rate\_message | Custom message for Event Grid failed messages monitor | string | `""` | no |
| failed\_messages\_rate\_silenced | Groups to mute for Event Grid failed messages monitor | map | `{}` | no |
| failed\_messages\_rate\_thresold\_critical | Failed messages ratio (percentage) to trigger the critical alert | string | `"90"` | no |
| failed\_messages\_rate\_thresold\_warning | Failed messages ratio (percentage) to trigger a warning alert | string | `"50"` | no |
| failed\_messages\_rate\_time\_aggregator | Monitor aggregator for Event Grid failed messages [available values: min, max or avg] | string | `"min"` | no |
| failed\_messages\_rate\_timeframe | Monitor timeframe for Event Grid failed messages [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| message | Message sent when an alert is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| no\_successful\_message\_rate\_enabled | Flag to enable Event Grid no successful message monitor | string | `"true"` | no |
| no\_successful\_message\_rate\_extra\_tags | Extra tags for Event Grid no successful message monitor | list | `[]` | no |
| no\_successful\_message\_rate\_message | Custom message for Event Grid no successful message monitor | string | `""` | no |
| no\_successful\_message\_rate\_silenced | Groups to mute for²id no successful message monitor | map | `{}` | no |
| no\_successful\_message\_rate\_time\_aggregator | Monitor aggregator for Event Grid no successful message [available values: min, max or avg] | string | `"min"` | no |
| no\_successful\_message\_rate\_timeframe | Monitor timeframe for Event Grid no successful message [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| unmatched\_events\_rate\_enabled | Flag to enable Event Grid unmatched events monitor | string | `"true"` | no |
| unmatched\_events\_rate\_extra\_tags | Extra tags for Event Grid unmatched events monitor | list | `[]` | no |
| unmatched\_events\_rate\_message | Custom message for Event Grid unmatched events monitor | string | `""` | no |
| unmatched\_events\_rate\_silenced | Groups to mute for Event Grid unmatched events monitor | map | `{}` | no |
| unmatched\_events\_rate\_thresold\_critical | Unmatched events ratio (percentage) to trigger the critical alert | string | `"90"` | no |
| unmatched\_events\_rate\_thresold\_warning | Unmatched events ratio (percentage) to trigger a warning alert | string | `"50"` | no |
| unmatched\_events\_rate\_time\_aggregator | Monitor aggregator for Event Grid unmatched events [available values: min, max or avg] | string | `"min"` | no |
| unmatched\_events\_rate\_timeframe | Monitor timeframe for Event Grid unmatched events [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| eventgrid\_failed\_messages\_id | id for monitor eventgrid_failed_messages |
| eventgrid\_no\_successful\_message\_id | id for monitor eventgrid_no_successful_message |
| eventgrid\_unmatched\_events\_id | id for monitor eventgrid_unmatched_events |

## Related documentation

Datadog Azure documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)

Azure "Monitor event delivery" documentation: [https://docs.microsoft.com/en-us/azure/event-grid/monitor-event-delivery](https://docs.microsoft.com/en-us/azure/event-grid/monitor-event-delivery)

Azure Monitor metrics: [https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsofteventgridtopics](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsofteventgridtopics)
