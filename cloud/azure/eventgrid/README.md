# CLOUD AZURE EVENTGRID DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-eventgrid" {
  source      = "claranet/monitors/datadog//cloud/azure/eventgrid"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Event Grid no successful message
- Event Grid too many failed messages
- Event Grid too many unmatched events

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| failed\_messages\_rate\_enabled | Flag to enable Event Grid failed messages monitor | `string` | `"true"` | no |
| failed\_messages\_rate\_extra\_tags | Extra tags for Event Grid failed messages monitor | `list(string)` | `[]` | no |
| failed\_messages\_rate\_message | Custom message for Event Grid failed messages monitor | `string` | `""` | no |
| failed\_messages\_rate\_thresold\_critical | Failed messages ratio (percentage) to trigger the critical alert | `number` | `90` | no |
| failed\_messages\_rate\_thresold\_warning | Failed messages ratio (percentage) to trigger a warning alert | `number` | `50` | no |
| failed\_messages\_rate\_time\_aggregator | Monitor aggregator for Event Grid failed messages [available values: min, max or avg] | `string` | `"min"` | no |
| failed\_messages\_rate\_timeframe | Monitor timeframe for Event Grid failed messages [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when an alert is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| no\_successful\_message\_rate\_enabled | Flag to enable Event Grid no successful message monitor | `string` | `"true"` | no |
| no\_successful\_message\_rate\_extra\_tags | Extra tags for Event Grid no successful message monitor | `list(string)` | `[]` | no |
| no\_successful\_message\_rate\_message | Custom message for Event Grid no successful message monitor | `string` | `""` | no |
| no\_successful\_message\_rate\_time\_aggregator | Monitor aggregator for Event Grid no successful message [available values: min, max or avg] | `string` | `"min"` | no |
| no\_successful\_message\_rate\_timeframe | Monitor timeframe for Event Grid no successful message [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| unmatched\_events\_rate\_enabled | Flag to enable Event Grid unmatched events monitor | `string` | `"true"` | no |
| unmatched\_events\_rate\_extra\_tags | Extra tags for Event Grid unmatched events monitor | `list(string)` | `[]` | no |
| unmatched\_events\_rate\_message | Custom message for Event Grid unmatched events monitor | `string` | `""` | no |
| unmatched\_events\_rate\_thresold\_critical | Unmatched events ratio (percentage) to trigger the critical alert | `number` | `90` | no |
| unmatched\_events\_rate\_thresold\_warning | Unmatched events ratio (percentage) to trigger a warning alert | `number` | `50` | no |
| unmatched\_events\_rate\_time\_aggregator | Monitor aggregator for Event Grid unmatched events [available values: min, max or avg] | `string` | `"min"` | no |
| unmatched\_events\_rate\_timeframe | Monitor timeframe for Event Grid unmatched events [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| eventgrid\_failed\_messages\_id | id for monitor eventgrid\_failed\_messages |
| eventgrid\_no\_successful\_message\_id | id for monitor eventgrid\_no\_successful\_message |
| eventgrid\_unmatched\_events\_id | id for monitor eventgrid\_unmatched\_events |

## Related documentation

Datadog Azure documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)

Azure "Monitor event delivery" documentation: [https://docs.microsoft.com/en-us/azure/event-grid/monitor-event-delivery](https://docs.microsoft.com/en-us/azure/event-grid/monitor-event-delivery)

Azure Monitor metrics: [https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsofteventgridtopics](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported#microsofteventgridtopics)
