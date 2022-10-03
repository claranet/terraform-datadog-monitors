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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.1.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_filter-tags"></a> [filter-tags](#module\_filter-tags) | ../../../common/filter-tags | n/a |
| <a name="module_filter-tags-statuscode"></a> [filter-tags-statuscode](#module\_filter-tags-statuscode) | ../../../common/filter-tags | n/a |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.cosmos_db_4xx_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.cosmos_db_5xx_requests](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.cosmos_db_scaling](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.cosmos_db_status](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cosmos_db_4xx_request_extra_tags"></a> [cosmos\_db\_4xx\_request\_extra\_tags](#input\_cosmos\_db\_4xx\_request\_extra\_tags) | Extra tags for Cosmos DB 4xx requests monitor | `list(string)` | `[]` | no |
| <a name="input_cosmos_db_4xx_request_rate_threshold_critical"></a> [cosmos\_db\_4xx\_request\_rate\_threshold\_critical](#input\_cosmos\_db\_4xx\_request\_rate\_threshold\_critical) | Critical threshold for Cosmos DB 4xx requests monitor | `number` | `80` | no |
| <a name="input_cosmos_db_4xx_request_rate_threshold_warning"></a> [cosmos\_db\_4xx\_request\_rate\_threshold\_warning](#input\_cosmos\_db\_4xx\_request\_rate\_threshold\_warning) | Warning threshold for Cosmos DB 4xx requests monitor | `number` | `50` | no |
| <a name="input_cosmos_db_4xx_request_time_aggregator"></a> [cosmos\_db\_4xx\_request\_time\_aggregator](#input\_cosmos\_db\_4xx\_request\_time\_aggregator) | Monitor aggregator for Cosmos DB 4xx requests [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_cosmos_db_4xx_request_timeframe"></a> [cosmos\_db\_4xx\_request\_timeframe](#input\_cosmos\_db\_4xx\_request\_timeframe) | Monitor timeframe for Cosmos DB 4xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_cosmos_db_4xx_requests_enabled"></a> [cosmos\_db\_4xx\_requests\_enabled](#input\_cosmos\_db\_4xx\_requests\_enabled) | Flag to enable Cosmos DB 4xx requests monitor | `string` | `"true"` | no |
| <a name="input_cosmos_db_4xx_requests_message"></a> [cosmos\_db\_4xx\_requests\_message](#input\_cosmos\_db\_4xx\_requests\_message) | Custom message for Cosmos DB 4xx requests monitor | `string` | `""` | no |
| <a name="input_cosmos_db_5xx_request_rate_extra_tags"></a> [cosmos\_db\_5xx\_request\_rate\_extra\_tags](#input\_cosmos\_db\_5xx\_request\_rate\_extra\_tags) | Extra tags for Cosmos DB 5xx requests monitor | `list(string)` | `[]` | no |
| <a name="input_cosmos_db_5xx_request_rate_threshold_critical"></a> [cosmos\_db\_5xx\_request\_rate\_threshold\_critical](#input\_cosmos\_db\_5xx\_request\_rate\_threshold\_critical) | Critical threshold for Cosmos DB 5xx requests monitor | `number` | `80` | no |
| <a name="input_cosmos_db_5xx_request_rate_threshold_warning"></a> [cosmos\_db\_5xx\_request\_rate\_threshold\_warning](#input\_cosmos\_db\_5xx\_request\_rate\_threshold\_warning) | Warning threshold for Cosmos DB 5xx requests monitor | `number` | `50` | no |
| <a name="input_cosmos_db_5xx_request_time_aggregator"></a> [cosmos\_db\_5xx\_request\_time\_aggregator](#input\_cosmos\_db\_5xx\_request\_time\_aggregator) | Monitor aggregator for Cosmos DB 5xx requests [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_cosmos_db_5xx_request_timeframe"></a> [cosmos\_db\_5xx\_request\_timeframe](#input\_cosmos\_db\_5xx\_request\_timeframe) | Monitor timeframe for Cosmos DB 5xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_cosmos_db_5xx_requests_enabled"></a> [cosmos\_db\_5xx\_requests\_enabled](#input\_cosmos\_db\_5xx\_requests\_enabled) | Flag to enable Cosmos DB 5xx requests monitor | `string` | `"true"` | no |
| <a name="input_cosmos_db_5xx_requests_message"></a> [cosmos\_db\_5xx\_requests\_message](#input\_cosmos\_db\_5xx\_requests\_message) | Custom message for Cosmos DB 5xx requests monitor | `string` | `""` | no |
| <a name="input_cosmos_db_scaling_enabled"></a> [cosmos\_db\_scaling\_enabled](#input\_cosmos\_db\_scaling\_enabled) | Flag to enable Cosmos DB scaling monitor | `string` | `"true"` | no |
| <a name="input_cosmos_db_scaling_error_rate_threshold_critical"></a> [cosmos\_db\_scaling\_error\_rate\_threshold\_critical](#input\_cosmos\_db\_scaling\_error\_rate\_threshold\_critical) | Critical threshold for Cosmos DB scaling monitor | `number` | `10` | no |
| <a name="input_cosmos_db_scaling_error_rate_threshold_warning"></a> [cosmos\_db\_scaling\_error\_rate\_threshold\_warning](#input\_cosmos\_db\_scaling\_error\_rate\_threshold\_warning) | Warning threshold for Cosmos DB scaling monitor | `number` | `5` | no |
| <a name="input_cosmos_db_scaling_extra_tags"></a> [cosmos\_db\_scaling\_extra\_tags](#input\_cosmos\_db\_scaling\_extra\_tags) | Extra tags for Cosmos DB scaling monitor | `list(string)` | `[]` | no |
| <a name="input_cosmos_db_scaling_message"></a> [cosmos\_db\_scaling\_message](#input\_cosmos\_db\_scaling\_message) | Custom message for Cosmos DB scaling monitor | `string` | `""` | no |
| <a name="input_cosmos_db_scaling_time_aggregator"></a> [cosmos\_db\_scaling\_time\_aggregator](#input\_cosmos\_db\_scaling\_time\_aggregator) | Monitor aggregator for Cosmos DB scaling [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_cosmos_db_scaling_timeframe"></a> [cosmos\_db\_scaling\_timeframe](#input\_cosmos\_db\_scaling\_timeframe) | Monitor timeframe for Cosmos DB scaling [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_cosmos_db_status_no_data_timeframe"></a> [cosmos\_db\_status\_no\_data\_timeframe](#input\_cosmos\_db\_status\_no\_data\_timeframe) | Number of minutes before reporting no data | `string` | `10` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags_custom"></a> [filter\_tags\_custom](#input\_filter\_tags\_custom) | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| <a name="input_filter_tags_custom_excluded"></a> [filter\_tags\_custom\_excluded](#input\_filter\_tags\_custom\_excluded) | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| <a name="input_filter_tags_use_defaults"></a> [filter\_tags\_use\_defaults](#input\_filter\_tags\_use\_defaults) | Use default filter tags convention | `string` | `"true"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_status_enabled"></a> [status\_enabled](#input\_status\_enabled) | Flag to enable Cosmos DB status monitor | `string` | `"true"` | no |
| <a name="input_status_extra_tags"></a> [status\_extra\_tags](#input\_status\_extra\_tags) | Extra tags for Cosmos DB status monitor | `list(string)` | `[]` | no |
| <a name="input_status_message"></a> [status\_message](#input\_status\_message) | Custom message for Cosmos DB status monitor | `string` | `""` | no |
| <a name="input_status_time_aggregator"></a> [status\_time\_aggregator](#input\_status\_time\_aggregator) | Monitor aggregator for Cosmos DB status [available values: min, max or avg] | `string` | `"max"` | no |
| <a name="input_status_timeframe"></a> [status\_timeframe](#input\_status\_timeframe) | Monitor timeframe for Cosmos DB status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_timeout_h"></a> [timeout\_h](#input\_timeout\_h) | Default auto-resolving state (in hours) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cosmos_db_4xx_requests_id"></a> [cosmos\_db\_4xx\_requests\_id](#output\_cosmos\_db\_4xx\_requests\_id) | id for monitor cosmos\_db\_4xx\_requests |
| <a name="output_cosmos_db_5xx_requests_id"></a> [cosmos\_db\_5xx\_requests\_id](#output\_cosmos\_db\_5xx\_requests\_id) | id for monitor cosmos\_db\_5xx\_requests |
| <a name="output_cosmos_db_scaling_id"></a> [cosmos\_db\_scaling\_id](#output\_cosmos\_db\_scaling\_id) | id for monitor cosmos\_db\_scaling |
| <a name="output_cosmos_db_status_id"></a> [cosmos\_db\_status\_id](#output\_cosmos\_db\_status\_id) | id for monitor cosmos\_db\_status |
<!-- END_TF_DOCS -->
## Related documentation

DataDog documentation : [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)  
You must search `cosmosdb`, there is no integration for now.

Azure metrics documentation : [https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftdocumentdbdatabaseaccounts](https://docs.microsoft.com/fr-fr/azure/monitoring-and-diagnostics/monitoring-supported-metrics#microsoftdocumentdbdatabaseaccounts)

429 status code : [https://docs.microsoft.com/en-us/rest/api/cosmos-db/http-status-codes-for-cosmosdb](https://docs.microsoft.com/en-us/rest/api/cosmos-db/http-status-codes-for-cosmosdb)
