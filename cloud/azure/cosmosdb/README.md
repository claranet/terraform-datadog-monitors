# CLOUD AZURE COSMOSDB DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-cosmosdb" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/cosmosdb?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Cosmos DB 4xx requests rate is high
- Cosmos DB 5xx requests rate is high
- Cosmos DB is down
- Cosmos DB max scaling reached for collection

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cosmos_db_4xx_request_extra_tags | Extra tags for Cosmos DB 4xx requests monitor | list | `[]` | no |
| cosmos_db_4xx_request_rate_threshold_critical | Critical threshold for Cosmos DB 4xx requests monitor | string | `80` | no |
| cosmos_db_4xx_request_rate_threshold_warning | Warning threshold for Cosmos DB 4xx requests monitor | string | `50` | no |
| cosmos_db_4xx_request_time_aggregator | Monitor aggregator for Cosmos DB 4xx requests [available values: min, max or avg] | string | `min` | no |
| cosmos_db_4xx_request_timeframe | Monitor timeframe for Cosmos DB 4xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| cosmos_db_4xx_requests_enabled | Flag to enable Cosmos DB 4xx requests monitor | string | `true` | no |
| cosmos_db_4xx_requests_message | Custom message for Cosmos DB 4xx requests monitor | string | `` | no |
| cosmos_db_4xx_requests_silenced | Groups to mute for Cosmos DB 4xx requests monitor | map | `{}` | no |
| cosmos_db_5xx_request_rate_extra_tags | Extra tags for Cosmos DB 5xx requests monitor | list | `[]` | no |
| cosmos_db_5xx_request_rate_threshold_critical | Critical threshold for Cosmos DB 5xx requests monitor | string | `80` | no |
| cosmos_db_5xx_request_rate_threshold_warning | Warning threshold for Cosmos DB 5xx requests monitor | string | `50` | no |
| cosmos_db_5xx_request_time_aggregator | Monitor aggregator for Cosmos DB 5xx requests [available values: min, max or avg] | string | `min` | no |
| cosmos_db_5xx_request_timeframe | Monitor timeframe for Cosmos DB 5xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| cosmos_db_5xx_requests_enabled | Flag to enable Cosmos DB 5xx requests monitor | string | `true` | no |
| cosmos_db_5xx_requests_message | Custom message for Cosmos DB 5xx requests monitor | string | `` | no |
| cosmos_db_5xx_requests_silenced | Groups to mute for Cosmos DB 5xx requests monitor | map | `{}` | no |
| cosmos_db_scaling_enabled | Flag to enable Cosmos DB scaling monitor | string | `true` | no |
| cosmos_db_scaling_error_rate_threshold_critical | Critical threshold for Cosmos DB scaling monitor | string | `10` | no |
| cosmos_db_scaling_error_rate_threshold_warning | Warning threshold for Cosmos DB scaling monitor | string | `5` | no |
| cosmos_db_scaling_extra_tags | Extra tags for Cosmos DB scaling monitor | list | `[]` | no |
| cosmos_db_scaling_message | Custom message for Cosmos DB scaling monitor | string | `` | no |
| cosmos_db_scaling_silenced | Groups to mute for Cosmos DB scaling monitor | map | `{}` | no |
| cosmos_db_scaling_time_aggregator | Monitor aggregator for Cosmos DB scaling [available values: min, max or avg] | string | `min` | no |
| cosmos_db_scaling_timeframe | Monitor timeframe for Cosmos DB scaling [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| environment | Architecture environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `900` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_custom_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |
| status_enabled | Flag to enable Cosmos DB status monitor | string | `true` | no |
| status_extra_tags | Extra tags for Cosmos DB status monitor | list | `[]` | no |
| status_message | Custom message for Cosmos DB status monitor | string | `` | no |
| status_silenced | Groups to mute for Cosmos DB status monitor | map | `{}` | no |
| status_time_aggregator | Monitor aggregator for Cosmos DB status [available values: min, max or avg] | string | `max` | no |
| status_timeframe | Monitor timeframe for Cosmos DB status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

## Outputs

| Name | Description |
|------|-------------|
| cosmos_db_4xx_requests_id | id for monitor cosmos_db_4xx_requests |
| cosmos_db_5xx_requests_id | id for monitor cosmos_db_5xx_requests |
| cosmos_db_scaling_id | id for monitor cosmos_db_scaling |
| cosmos_db_status_id | id for monitor cosmos_db_status |

Related documentation
---------------------

DataDog documentation : [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)  
You must search `cosmosdb`, there is no integration for now.

Azure metrics documentation : [https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftdocumentdbdatabaseaccounts](https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftdocumentdbdatabaseaccounts)

429 status code : [https://docs.microsoft.com/en-us/rest/api/cosmos-db/http-status-codes-for-cosmosdb](https://docs.microsoft.com/en-us/rest/api/cosmos-db/http-status-codes-for-cosmosdb)
