# CLOUD AZURE STORAGE DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-storage" {
  source = "claranet/monitors/datadog//cloud/azure/storage"
  version = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Azure Blob Storage too many authorization errors
- Azure Blob Storage too many client_other errors
- Azure Blob Storage too many network errors
- Azure Blob Storage too many server_other errors
- Azure Blob Storage too many throttling errors
- Azure Blob Storage too many timeout errors
- Azure File Storage too many authorization errors
- Azure File Storage too many client_other errors
- Azure File Storage too many network errors
- Azure File Storage too many server_other errors
- Azure File Storage too many throttling errors
- Azure File Storage too many timeout errors
- Azure Queue Storage too many authorization errors
- Azure Queue Storage too many client_other errors
- Azure Queue Storage too many network errors
- Azure Queue Storage too many server_other errors
- Azure Queue Storage too many throttling errors
- Azure Queue Storage too many timeout errors
- Azure Storage Blob service too few successful requests
- Azure Storage Blob service too high end to end latency
- Azure Storage File service too few successful requests
- Azure Storage File service too high end to end latency
- Azure Storage is down
- Azure Storage Queue service too few successful requests
- Azure Storage Queue service too high end to end latency
- Azure Storage Table service too few successful requests
- Azure Storage Table service too high end to end latency
- Azure Table Storage too many authorization errors
- Azure Table Storage too many client_other errors
- Azure Table Storage too many network errors
- Azure Table Storage too many server_other errors
- Azure Table Storage too many throttling errors
- Azure Table Storage too many timeout errors

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| authorization\_error\_requests\_enabled | Flag to enable Storage authorization errors monitor | `string` | `"true"` | no |
| authorization\_error\_requests\_extra\_tags | Extra tags for Storage authorization errors monitor | `list(string)` | `[]` | no |
| authorization\_error\_requests\_message | Custom message for Storage authorization errors monitor | `string` | `""` | no |
| authorization\_error\_requests\_silenced | Groups to mute for Storage authorization errors monitor | `map(string)` | `{}` | no |
| authorization\_error\_requests\_threshold\_critical | Maximum acceptable percent of authorization error requests for a storage | `number` | `90` | no |
| authorization\_error\_requests\_threshold\_warning | Warning regarding acceptable percent of authorization error requests for a storage | `number` | `50` | no |
| authorization\_error\_requests\_time\_aggregator | Monitor aggregator for Storage authorization errors [available values: min, max or avg] | `string` | `"min"` | no |
| authorization\_error\_requests\_timeframe | Monitor timeframe for Storage authorization errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| availability\_enabled | Flag to enable Storage availability monitor | `string` | `"true"` | no |
| availability\_extra\_tags | Extra tags for Storage availability monitor | `list(string)` | `[]` | no |
| availability\_message | Custom message for Storage availability monitor | `string` | `""` | no |
| availability\_silenced | Groups to mute for Storage availability monitor | `map(string)` | `{}` | no |
| availability\_threshold\_critical | Minimum acceptable percent of availability for a storage | `number` | `50` | no |
| availability\_threshold\_warning | Warning regarding acceptable percent of availability for a storage | `number` | `90` | no |
| availability\_time\_aggregator | Monitor aggregator for Storage availability [available values: min, max or avg] | `string` | `"max"` | no |
| availability\_timeframe | Monitor timeframe for Storage availability [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| client\_other\_error\_requests\_enabled | Flag to enable Storage other errors monitor | `string` | `"true"` | no |
| client\_other\_error\_requests\_extra\_tags | Extra tags for Storage other errors monitor | `list(string)` | `[]` | no |
| client\_other\_error\_requests\_message | Custom message for Storage other errors monitor | `string` | `""` | no |
| client\_other\_error\_requests\_silenced | Groups to mute for Storage other errors monitor | `map(string)` | `{}` | no |
| client\_other\_error\_requests\_threshold\_critical | Maximum acceptable percent of client other error requests for a storage | `number` | `90` | no |
| client\_other\_error\_requests\_threshold\_warning | Warning regarding acceptable percent of client other error requests for a storage | `number` | `50` | no |
| client\_other\_error\_requests\_time\_aggregator | Monitor aggregator for Storage other errors [available values: min, max or avg] | `string` | `"min"` | no |
| client\_other\_error\_requests\_timeframe | Monitor timeframe for Storage other errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter\_tags\_use\_defaults is false | `string` | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter\_tags\_use\_defaults is false | `string` | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | `string` | `"true"` | no |
| latency\_enabled | Flag to enable Storage latency monitor | `string` | `"true"` | no |
| latency\_extra\_tags | Extra tags for Storage latency monitor | `list(string)` | `[]` | no |
| latency\_message | Custom message for Storage latency monitor | `string` | `""` | no |
| latency\_silenced | Groups to mute for Storage latency monitor | `map(string)` | `{}` | no |
| latency\_threshold\_critical | Maximum acceptable end to end latency (ms) for a storage | `number` | `2000` | no |
| latency\_threshold\_warning | Warning regarding acceptable end to end latency (ms) for a storage | `number` | `1000` | no |
| latency\_time\_aggregator | Monitor aggregator for Storage latency [available values: min, max or avg] | `string` | `"min"` | no |
| latency\_timeframe | Monitor timeframe for Storage latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| message | Message sent when a Redis monitor is triggered | `any` | n/a | yes |
| network\_error\_requests\_enabled | Flag to enable Storage network errors monitor | `string` | `"true"` | no |
| network\_error\_requests\_extra\_tags | Extra tags for Storage network errors monitor | `list(string)` | `[]` | no |
| network\_error\_requests\_message | Custom message for Storage network errors monitor | `string` | `""` | no |
| network\_error\_requests\_silenced | Groups to mute for Storage network errors monitor | `map(string)` | `{}` | no |
| network\_error\_requests\_threshold\_critical | Maximum acceptable percent of network error requests for a storage | `number` | `90` | no |
| network\_error\_requests\_threshold\_warning | Warning regarding acceptable percent of network error requests for a storage | `number` | `50` | no |
| network\_error\_requests\_time\_aggregator | Monitor aggregator for Storage network errors [available values: min, max or avg] | `string` | `"min"` | no |
| network\_error\_requests\_timeframe | Monitor timeframe for Storage network errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| new\_host\_delay | Delay in seconds before monitor new resource | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| server\_other\_error\_requests\_enabled | Flag to enable Storage server other errors monitor | `string` | `"true"` | no |
| server\_other\_error\_requests\_extra\_tags | Extra tags for Storage server other errors monitor | `list(string)` | `[]` | no |
| server\_other\_error\_requests\_message | Custom message for Storage server other errors monitor | `string` | `""` | no |
| server\_other\_error\_requests\_silenced | Groups to mute for Storage server other errors monitor | `map(string)` | `{}` | no |
| server\_other\_error\_requests\_threshold\_critical | Maximum acceptable percent of server other error requests for a storage | `number` | `90` | no |
| server\_other\_error\_requests\_threshold\_warning | Warning regarding acceptable percent of server other error requests for a storage | `number` | `50` | no |
| server\_other\_error\_requests\_time\_aggregator | Monitor aggregator for Storage other errors [available values: min, max or avg] | `string` | `"min"` | no |
| server\_other\_error\_requests\_timeframe | Monitor timeframe for Storage server other errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| status\_enabled | Flag to enable App Services status monitor | `string` | `"true"` | no |
| status\_extra\_tags | Extra tags for App Services status monitor | `list(string)` | `[]` | no |
| status\_message | Custom message for storage Services status monitor | `string` | `""` | no |
| status\_silenced | Groups to mute for App Services status monitor | `map(string)` | `{}` | no |
| status\_time\_aggregator | Monitor aggregator for Storage Services status [available values: min, max or avg] | `string` | `"max"` | no |
| status\_timeframe | Monitor timeframe for Storage Services status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| successful\_requests\_enabled | Flag to enable Storage sucessful requests monitor | `string` | `"true"` | no |
| successful\_requests\_extra\_tags | Extra tags for Storage sucessful requests monitor | `list(string)` | `[]` | no |
| successful\_requests\_message | Custom message for Storage sucessful requests monitor | `string` | `""` | no |
| successful\_requests\_silenced | Groups to mute for Storage sucessful requests monitor | `map(string)` | `{}` | no |
| successful\_requests\_time\_aggregator | Monitor aggregator for Storage sucessful requests [available values: min, max or avg] | `string` | `"max"` | no |
| successful\_requests\_timeframe | Monitor timeframe for Storage sucessful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| successful\_storage\_requests\_threshold\_critical | Minimum acceptable percent of successful requests for a storage | `number` | `90` | no |
| successful\_storage\_requests\_threshold\_warning | Warning regarding acceptable percent of successful requests for a storage | `number` | `70` | no |
| throttling\_error\_requests\_enabled | Flag to enable Storage throttling error monitor | `string` | `"true"` | no |
| throttling\_error\_requests\_extra\_tags | Extra tags for Storage throttling error monitor | `list(string)` | `[]` | no |
| throttling\_error\_requests\_message | Custom message for Storage throttling error monitor | `string` | `""` | no |
| throttling\_error\_requests\_silenced | Groups to mute for Storage throttling error monitor | `map(string)` | `{}` | no |
| throttling\_error\_requests\_threshold\_critical | Maximum acceptable percent of throttling error requests for a storage | `number` | `90` | no |
| throttling\_error\_requests\_threshold\_warning | Warning regarding acceptable percent of throttling error requests for a storage | `number` | `50` | no |
| throttling\_error\_requests\_time\_aggregator | Monitor aggregator for Storage throttling errors [available values: min, max or avg] | `string` | `"min"` | no |
| throttling\_error\_requests\_timeframe | Monitor timeframe for Storage throttling errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| timeout\_error\_requests\_enabled | Flag to enable Storage timeout monitor | `string` | `"true"` | no |
| timeout\_error\_requests\_extra\_tags | Extra tags for Storage timeout monitor | `list(string)` | `[]` | no |
| timeout\_error\_requests\_message | Custom message for Storage timeout monitor | `string` | `""` | no |
| timeout\_error\_requests\_silenced | Groups to mute for Storage timeout monitor | `map(string)` | `{}` | no |
| timeout\_error\_requests\_threshold\_critical | Maximum acceptable percent of timeout error requests for a storage | `number` | `90` | no |
| timeout\_error\_requests\_threshold\_warning | Warning regarding acceptable percent of timeout error requests for a storage | `number` | `50` | no |
| timeout\_error\_requests\_time\_aggregator | Monitor aggregator for Storage timeout [available values: min, max or avg] | `string` | `"min"` | no |
| timeout\_error\_requests\_timeframe | Monitor timeframe for Storage timeout [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| blob\_authorization\_error\_requests\_id | id for monitor blob\_authorization\_error\_requests |
| blob\_client\_other\_error\_requests\_id | id for monitor blob\_client\_other\_error\_requests |
| blob\_network\_error\_requests\_id | id for monitor blob\_network\_error\_requests |
| blob\_server\_other\_error\_requests\_id | id for monitor blob\_server\_other\_error\_requests |
| blob\_throttling\_error\_requests\_id | id for monitor blob\_throttling\_error\_requests |
| blob\_timeout\_error\_requests\_id | id for monitor blob\_timeout\_error\_requests |
| blobservices\_latency\_id | id for monitor blobservices\_latency |
| blobservices\_requests\_error\_id | id for monitor blobservices\_requests\_error |
| file\_authorization\_error\_requests\_id | id for monitor file\_authorization\_error\_requests |
| file\_client\_other\_error\_requests\_id | id for monitor file\_client\_other\_error\_requests |
| file\_network\_error\_requests\_id | id for monitor file\_network\_error\_requests |
| file\_server\_other\_error\_requests\_id | id for monitor file\_server\_other\_error\_requests |
| file\_throttling\_error\_requests\_id | id for monitor file\_throttling\_error\_requests |
| file\_timeout\_error\_requests\_id | id for monitor file\_timeout\_error\_requests |
| fileservices\_latency\_id | id for monitor fileservices\_latency |
| fileservices\_requests\_error\_id | id for monitor fileservices\_requests\_error |
| queue\_authorization\_error\_requests\_id | id for monitor queue\_authorization\_error\_requests |
| queue\_client\_other\_error\_requests\_id | id for monitor queue\_client\_other\_error\_requests |
| queue\_network\_error\_requests\_id | id for monitor queue\_network\_error\_requests |
| queue\_server\_other\_error\_requests\_id | id for monitor queue\_server\_other\_error\_requests |
| queue\_throttling\_error\_requests\_id | id for monitor queue\_throttling\_error\_requests |
| queue\_timeout\_error\_requests\_id | id for monitor queue\_timeout\_error\_requests |
| queueservices\_latency\_id | id for monitor queueservices\_latency |
| queueservices\_requests\_error\_id | id for monitor queueservices\_requests\_error |
| storage\_status\_id | id for monitor storage\_status |
| table\_authorization\_error\_requests\_id | id for monitor table\_authorization\_error\_requests |
| table\_client\_other\_error\_requests\_id | id for monitor table\_client\_other\_error\_requests |
| table\_network\_error\_requests\_id | id for monitor table\_network\_error\_requests |
| table\_server\_other\_error\_requests\_id | id for monitor table\_server\_other\_error\_requests |
| table\_throttling\_error\_requests\_id | id for monitor table\_throttling\_error\_requests |
| table\_timeout\_error\_requests\_id | id for monitor table\_timeout\_error\_requests |
| tableservices\_latency\_id | id for monitor tableservices\_latency |
| tableservices\_requests\_error\_id | id for monitor tableservices\_requests\_error |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_storage/](https://docs.datadoghq.com/integrations/azure_storage/)

DataDog blog: [https://www.datadoghq.com/blog/monitor-azure-storage-datadog/](https://www.datadoghq.com/blog/monitor-azure-storage-datadog/)

Azure Storage metrics documentation: [https://docs.microsoft.com/en-us/azure/storage/common/storage-monitor-storage-account](https://docs.microsoft.com/en-us/azure/storage/common/storage-monitor-storage-account)

Azure Storage metrics detailed documentation [https://docs.microsoft.com/en-us/rest/api/storageservices/storage-analytics-metrics-table-schema](https://docs.microsoft.com/en-us/rest/api/storageservices/storage-analytics-metrics-table-schema)
