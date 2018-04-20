Event Hub Datadog monitor
=========================

How to use this module
----------------------

```
module "datadog-monitors-azure-eventhub" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/eventhub?ref={revision}"

  message = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

Purpose
-------
Creates a Datadog monitor with the following checks :

* Service status check
* Failed request ratio
* Erroneous requests ratio

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture environment | string | - | yes |
| errors_rate_message | Custom message for Event Hub errors monitor | string | `` | no |
| errors_rate_silenced | Groups to mute for Event Hub errors monitor | map | `<map>` | no |
| errors_rate_thresold_critical | Errors ratio (percentage) to trigger the critical alert | string | `90` | no |
| errors_rate_thresold_warning | Errors ratio (percentage) to trigger a warning alert | string | `50` | no |
| failed_requests_rate_message | Custom message for Event Hub failed requests monitor | string | `` | no |
| failed_requests_rate_silenced | Groups to mute for Event Hub failed requests monitor | map | `<map>` | no |
| failed_requests_rate_thresold_critical | Failed requests ratio (percentage) to trigger the critical alert | string | `90` | no |
| failed_requests_rate_thresold_warning | Failed requests ratio (percentage) to trigger a warning alert | string | `50` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| status_message | Custom message for Event Hub status monitor | string | `` | no |
| status_silenced | Groups to mute for Event Hub status monitor | map | `<map>` | no |

Related documentation
---------------------

Datadog documentation : [https://docs.datadoghq.com/integrations/azure_event_hub/](https://docs.datadoghq.com/integrations/azure_event_hub/)

Azure metrics documentation : [https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-metrics-azure-monitor](https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-metrics-azure-monitor)
