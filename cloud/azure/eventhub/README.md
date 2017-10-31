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
| delay | Delay in seconds for the metric evaluation | string | `600` | no |
| environment | Architecture environment | string | - | yes |
| errors_rate_thresold_critical | Errors ratio (percentage) to trigger the critical alert | string | `3` | no |
| errors_rate_thresold_warning | Errors ratio (percentage) to trigger a warning alert | string | `1` | no |
| failed_requests_rate_thresold_critical | Failed requests ratio (percentage) to trigger the critical alert | string | `3` | no |
| failed_requests_rate_thresold_warning | Failed requests ratio (percentage) to trigger a warning alert | string | `1` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| use_filter_tags | Filter the data with service tags if true | string | `true` | no |

Outputs
-------

| Name | Description |
|------|-------------|
| errors_monitor_id | Id of the `errors` monitor |
| failed_requests_monitor_id | Id of the `failed requests` monitor |
| status_monitor_id | Id of the `status` monitor |

Related documentation
---------------------

Datadog documentation : [https://docs.datadoghq.com/integrations/azure_event_hub/](https://docs.datadoghq.com/integrations/azure_event_hub/)

Azure metrics documentation : [https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-metrics-azure-monitor](https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-metrics-azure-monitor)
