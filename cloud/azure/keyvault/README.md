# CLOUD AZURE KEYVAULT DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-keyvault" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/keyvault?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Key Vault API latency is high
- Key Vault API result rate is low
- Key Vault is down

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| api_latency_enabled | Flag to enable Key Vault API latency monitor | string | `true` | no |
| api_latency_extra_tags | Extra tags for Key Vault API latency monitor | list | `[]` | no |
| api_latency_message | Custom message for Key Vault API latency monitor | string | `` | no |
| api_latency_silenced | Groups to mute for Key Vault API latency monitor | map | `{}` | no |
| api_latency_threshold_critical | Critical threshold for Key Vault API latency rate | string | `100` | no |
| api_latency_threshold_warning | Warning threshold for Key Vault API latency rate | string | `80` | no |
| api_latency_time_aggregator | Monitor aggregator for Key Vault API latency [available values: min, max or avg] | string | `min` | no |
| api_latency_timeframe | Monitor timeframe for Key Vault API latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| api_result_enabled | Flag to enable Key Vault API result monitor | string | `true` | no |
| api_result_extra_tags | Extra tags for Key Vault API result monitor | list | `[]` | no |
| api_result_message | Custom message for Key Vault API result monitor | string | `` | no |
| api_result_silenced | Groups to mute for Key Vault API result monitor | map | `{}` | no |
| api_result_threshold_critical | Critical threshold for Key Vault API result rate | string | `10` | no |
| api_result_threshold_warning | Warning threshold for Key Vault API result rate | string | `30` | no |
| api_result_time_aggregator | Monitor aggregator for Key Vault API result [available values: min, max or avg] | string | `sum` | no |
| api_result_timeframe | Monitor timeframe for Key Vault API result [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| environment | Architecture environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `900` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |
| status_enabled | Flag to enable Key Vault status monitor | string | `true` | no |
| status_extra_tags | Extra tags for Key Vault status monitor | list | `[]` | no |
| status_message | Custom message for Key Vault status monitor | string | `` | no |
| status_silenced | Groups to mute for Key Vault status monitor | map | `{}` | no |
| status_time_aggregator | Monitor aggregator for Key Vault status [available values: min, max or avg] | string | `max` | no |
| status_timeframe | Monitor timeframe for Key Vault status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

## Outputs

| Name | Description |
|------|-------------|
| keyvault_api_latency_id | id for monitor keyvault_api_latency |
| keyvault_api_result_id | id for monitor keyvault_api_result |
| keyvault_status_id | id for monitor keyvault_status |

Related documentation
---------------------

DataDog documentation : [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)  
You must search `keyvault`, there is no integration for now.

Azure metrics documentation : [https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftkeyvaultvaults](https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftkeyvaultvaults)
