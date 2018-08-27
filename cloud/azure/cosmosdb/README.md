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
- Cosmos DB collection ${element(keys(var.cosmos_db_ru_utilization_collections),count.index)} RU utilization is high
- Cosmos DB has no request
- Cosmos DB is down

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cosmos_db_4xx_request_extra_tags | Extra tags for Cosmos DB 4xx requests monitor | list | `<list>` | no |
| cosmos_db_4xx_request_rate_threshold_critical | Critical threshold for Cosmos DB 4xx requests monitor | string | `80` | no |
| cosmos_db_4xx_request_rate_threshold_warning | Warning threshold for Cosmos DB 4xx requests monitor | string | `50` | no |
| cosmos_db_4xx_request_time_aggregator | Monitor aggregator for Cosmos DB 4xx requests [available values: min, max or avg] | string | `sum` | no |
| cosmos_db_4xx_request_timeframe | Monitor timeframe for Cosmos DB 4xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| cosmos_db_4xx_requests_enabled | Flag to enable Cosmos DB 4xx requests monitor | string | `true` | no |
| cosmos_db_4xx_requests_message | Custom message for Cosmos DB 4xx requests monitor | string | `` | no |
| cosmos_db_4xx_requests_silenced | Groups to mute for Cosmos DB 4xx requests monitor | map | `<map>` | no |
| cosmos_db_5xx_request_rate_extra_tags | Extra tags for Cosmos DB 5xx requests monitor | list | `<list>` | no |
| cosmos_db_5xx_request_rate_threshold_critical | Critical threshold for Cosmos DB 5xx requests monitor | string | `80` | no |
| cosmos_db_5xx_request_rate_threshold_warning | Warning threshold for Cosmos DB 5xx requests monitor | string | `50` | no |
| cosmos_db_5xx_request_time_aggregator | Monitor aggregator for Cosmos DB 5xx requests [available values: min, max or avg] | string | `sum` | no |
| cosmos_db_5xx_request_timeframe | Monitor timeframe for Cosmos DB 5xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| cosmos_db_5xx_requests_enabled | Flag to enable Cosmos DB 5xx requests monitor | string | `true` | no |
| cosmos_db_5xx_requests_message | Custom message for Cosmos DB 5xx requests monitor | string | `` | no |
| cosmos_db_5xx_requests_silenced | Groups to mute for Cosmos DB 5xx requests monitor | map | `<map>` | no |
| cosmos_db_no_request_enabled | Flag to enable Cosmos DB no request monitor | string | `true` | no |
| cosmos_db_no_request_extra_tags | Extra tags for Cosmos DB no request monitor | list | `<list>` | no |
| cosmos_db_no_request_message | Custom message for Cosmos DB no request monitor | string | `` | no |
| cosmos_db_no_request_silenced | Groups to mute for Cosmos DB no request monitor | map | `<map>` | no |
| cosmos_db_no_request_time_aggregator | Monitor aggregator for Cosmos DB no request [available values: min, max or avg] | string | `max` | no |
| cosmos_db_no_request_timeframe | Monitor timeframe for Cosmos DB no request [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| cosmos_db_ru_utilization_collections | Group to associate Cosmos DB collection to RU max. RU value has to be correlated with the monitor timeframe | map | - | yes |
| cosmos_db_ru_utilization_enabled | Flag to enable Cosmos DB collection RU utilization monitor | string | `true` | no |
| cosmos_db_ru_utilization_extra_tags | Extra tags for Cosmos DB collection RU utilization monitor | list | `<list>` | no |
| cosmos_db_ru_utilization_message | Custom message for Cosmos DB collection RU utilization monitor | string | `` | no |
| cosmos_db_ru_utilization_rate_threshold_critical | Critical threshold for Cosmos DB collection RU utilization monitor | string | `90` | no |
| cosmos_db_ru_utilization_rate_threshold_warning | Warning threshold for Cosmos DB collection RU utilization monitor | string | `80` | no |
| cosmos_db_ru_utilization_silenced | Groups to mute for Cosmos DB collection RU utilization monitor | map | `<map>` | no |
| cosmos_db_ru_utilization_time_aggregator | Monitor aggregator for Cosmos DB RU utilization [available values: min, max or avg] | string | `sum` | no |
| cosmos_db_ru_utilization_timeframe | Monitor timeframe for Cosmos DB RU utilization [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| environment | Architecture environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `900` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |
| status_enabled | Flag to enable Cosmos DB status monitor | string | `true` | no |
| status_extra_tags | Extra tags for Cosmos DB status monitor | list | `<list>` | no |
| status_message | Custom message for Cosmos DB status monitor | string | `` | no |
| status_silenced | Groups to mute for Cosmos DB status monitor | map | `<map>` | no |
| status_time_aggregator | Monitor aggregator for Cosmos DB status [available values: min, max or avg] | string | `max` | no |
| status_timeframe | Monitor timeframe for Cosmos DB status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

## Outputs

| Name | Description |
|------|-------------|
| cosmos_db_4xx_requests_id | id for monitor cosmos_db_4xx_requests |
| cosmos_db_5xx_requests_id | id for monitor cosmos_db_5xx_requests |
| cosmos_db_ru_utilization_id | id for monitor cosmos_db_ru_utilization |
| cosmos_db_status_id | id for monitor cosmos_db_status |
| cosmos_db_success_no_data_id | id for monitor cosmos_db_success_no_data |

Related documentation
---------------------

DataDog documentation : [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)  
You must search `cosmosdb`, there is no integration for now.

Azure metrics documentation : [https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftdocumentdbdatabaseaccounts](https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftdocumentdbdatabaseaccounts)

