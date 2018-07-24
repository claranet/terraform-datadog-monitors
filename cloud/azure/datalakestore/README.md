# CLOUD AZURE DATALAKESTORE DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-datalakestore" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/datalakestore?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Datalake Store is down

## Inputs

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

## Outputs

| Name | Description |
|------|-------------|
| datalakestore_status_id | id for monitor datalakestore_status |

Related documentation
---------------------

DataDog documentation : [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)  
You must search `datalake`, there is no integration for now.

Azure metrics documentation : [https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftdatalakestoreaccounts](https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftdatalakestoreaccounts)
