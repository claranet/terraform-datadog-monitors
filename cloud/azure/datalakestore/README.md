Service Bus Datadog monitor
===========================

How to use this module
----------------------

```
module "datadog-monitors-azure-datalakestore" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/datalakestore?ref={revision}"

  message = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

Purpose
-------
Creates a Datadog monitor with the following checks :

* Service status check

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| status_message | Custom message for Datalake Store status monitor | string | `` | no |
| status_silenced | Groups to mute for Datalake Store status monitor | map | `<map>` | no |
| status_time_aggregator | Monitor aggregator for Datalake Store status [available values: min, max or avg] | string | `max` | no |
| status_timeframe | Monitor timeframe for Datalake Store status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |

Related documentation
---------------------

DataDog documentation : [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)  
You must search `datalake`, there is no integration for now.

Azure metrics documentation : [https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftdatalakestoreaccounts](https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftdatalakestoreaccounts)
