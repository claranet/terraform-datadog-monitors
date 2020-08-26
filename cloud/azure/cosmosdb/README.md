# CLOUD AZURE COSMOSDB DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-azure-cosmosdb" {
  source      = "claranet/monitors/datadog//cloud/azure/cosmosdb"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Cosmos DB 4xx requests rate is high
- Cosmos DB 5xx requests rate is high
- Cosmos DB is down
- Cosmos DB max scaling reached for collection

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cosmos\_db\_4xx\_request\_extra\_tags | Extra tags for Cosmos DB 4xx requests monitor | `list(string)` | `[]` | no |
| cosmos\_db\_4xx\_request\_rate\_threshold\_critical | Critical threshold for Cosmos DB 4xx requests monitor | `number` | `80` | no |
| cosmos\_db\_4xx\_request\_rate\_threshold\_warning | Warning threshold for Cosmos DB 4xx requests monitor | `number` | `50` | no |
| cosmos\_db\_4xx\_request\_time\_aggregator | Monitor aggregator for Cosmos DB 4xx requests [available values: min, max or avg] | `string` | `"min"` | no |
| cosmos\_db\_4xx\_request\_timeframe | Monitor timeframe for Cosmos DB 4xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| cosmos\_db\_4xx\_requests\_enabled | Flag to enable Cosmos DB 4xx requests monitor | `string` | `"true"` | no |
| cosmos\_db\_4xx\_requests\_message | Custom message for Cosmos DB 4xx requests monitor | `string` | `""` | no |
| cosmos\_db\_5xx\_request\_rate\_extra\_tags | Extra tags for Cosmos DB 5xx requests monitor | `list(string)` | `[]` | no |
| cosmos\_db\_5xx\_request\_rate\_threshold\_critical | Critical threshold for Cosmos DB 5xx requests monitor | `number` | `80` | no |
| cosmos\_db\_5xx\_request\_rate\_threshold\_warning | Warning threshold for Cosmos DB 5xx requests monitor | `number` | `50` | no |
| cosmos\_db\_5xx\_request\_time\_aggregator | Monitor aggregator for Cosmos DB 5xx requests [available values: min, max or avg] | `string` | `"min"` | no |
| cosmos\_db\_5xx\_request\_timeframe | Monitor timeframe for Cosmos DB 5xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| cosmos\_db\_5xx\_requests\_enabled | Flag to enable Cosmos DB 5xx requests monitor | `string` | `"true"` | no |
| cosmos\_db\_5xx\_requests\_message | Custom message for Cosmos DB 5xx requests monitor | `string` | `""` | no |
| cosmos\_db\_scaling\_enabled | Flag to enable Cosmos DB scaling monitor | `string` | `"true"` | no |
| cosmos\_db\_scaling\_error\_rate\_threshold\_critical | Critical threshold for Cosmos DB scaling monitor | `number` | `10` | no |
| cosmos\_db\_scaling\_error\_rate\_threshold\_warning | Warning threshold for Cosmos DB scaling monitor | `number` | `5` | no |
| cosmos\_db\_scaling\_extra\_tags | Extra tags for Cosmos DB scaling monitor | `list(string)` | `[]` | no |
| cosmos\_db\_scaling\_message | Custom message for Cosmos DB scaling monitor | `string` | `""` | no |
| cosmos\_db\_scaling\_time\_aggregator | Monitor aggregator for Cosmos DB scaling [available values: min, max or avg] | `string` | `"min"` | no |
| cosmos\_db\_scaling\_timeframe | Monitor timeframe for Cosmos DB scaling [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| cosmos\_db\_status\_no\_data\_timeframe | Number of minutes before reporting no data | `string` | `10` | no |
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| status\_enabled | Flag to enable Cosmos DB status monitor | `string` | `"true"` | no |
| status\_extra\_tags | Extra tags for Cosmos DB status monitor | `list(string)` | `[]` | no |
| status\_message | Custom message for Cosmos DB status monitor | `string` | `""` | no |
| status\_time\_aggregator | Monitor aggregator for Cosmos DB status [available values: min, max or avg] | `string` | `"max"` | no |
| status\_timeframe | Monitor timeframe for Cosmos DB status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| cosmos\_db\_4xx\_requests\_id | id for monitor cosmos\_db\_4xx\_requests |
| cosmos\_db\_5xx\_requests\_id | id for monitor cosmos\_db\_5xx\_requests |
| cosmos\_db\_scaling\_id | id for monitor cosmos\_db\_scaling |
| cosmos\_db\_status\_id | id for monitor cosmos\_db\_status |

## Related documentation

DataDog documentation : [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)  
You must search `cosmosdb`, there is no integration for now.

Azure metrics documentation : [https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftdocumentdbdatabaseaccounts](https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftdocumentdbdatabaseaccounts)

429 status code : [https://docs.microsoft.com/en-us/rest/api/cosmos-db/http-status-codes-for-cosmosdb](https://docs.microsoft.com/en-us/rest/api/cosmos-db/http-status-codes-for-cosmosdb)
