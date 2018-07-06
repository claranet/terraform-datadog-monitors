Key Vault Datadog monitor
=========================

How to use this module
----------------------

```
module "datadog-monitors-azure-keyvault" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/keyvault?ref={revision}"

  message = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

Purpose
-------
Creates a Datadog monitor with the following checks :

* Service status check
* API result rate

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| api_result_message | Custom message for Key Vault API result monitor | string | `` | no |
| api_result_silenced | Groups to mute for Key Vault API result monitor | map | `<map>` | no |
| api_result_threshold_critical | Critical threshold for Key Vault API result rate | string | `10` | no |
| api_result_threshold_warning | Warning threshold for Key Vault API result rate | string | `30` | no |
| api_result_timeframe | Monitor timeframe for Key Vault API result [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_30m` | no |
| delay | Delay in seconds for the metric evaluation | string | `900` | no |
| environment | Architecture environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| status_message | Custom message for Key Vault status monitor | string | `` | no |
| status_silenced | Groups to mute for Key Vault status monitor | map | `<map>` | no |
| status_time_aggregator | Monitor aggregator for Key Vault status [available values: min, max or avg] | string | `max` | no |
| status_timeframe | Monitor timeframe for Key Vault status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_15m` | no |

Related documentation
---------------------

DataDog documentation : [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)  
You must search `keyvault`, there is no integration for now.

Azure metrics documentation : [https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftkeyvaultvaults](https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftkeyvaultvaults)
