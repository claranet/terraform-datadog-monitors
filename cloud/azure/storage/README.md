# CLOUD AZURE STORAGE DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-storage" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//cloud/azure/storage?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Azure Storage is down
- Azure Storage too few successful requests
- Azure Storage too high end to end latency
- Azure Storage too many authorization errors
- Azure Storage too many client_other errors
- Azure Storage too many network errors
- Azure Storage too many server_other errors
- Azure Storage too many throttling errors
- Azure Storage too many timeout errors

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| authorization\_error\_requests\_enabled | Flag to enable Storage authorization errors monitor | string | `"true"` | no |
| authorization\_error\_requests\_extra\_tags | Extra tags for Storage authorization errors monitor | list(string) | `[]` | no |
| authorization\_error\_requests\_message | Custom message for Storage authorization errors monitor | string | `""` | no |
| authorization\_error\_requests\_threshold\_critical | Maximum acceptable percent of authorization error requests for a storage | string | `"90"` | no |
| authorization\_error\_requests\_threshold\_warning | Warning regarding acceptable percent of authorization error requests for a storage | string | `"50"` | no |
| authorization\_error\_requests\_time\_aggregator | Monitor aggregator for Storage authorization errors [available values: min, max or avg] | string | `"min"` | no |
| authorization\_error\_requests\_timeframe | Monitor timeframe for Storage authorization errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| availability\_enabled | Flag to enable Storage availability monitor | string | `"true"` | no |
| availability\_extra\_tags | Extra tags for Storage availability monitor | list(string) | `[]` | no |
| availability\_message | Custom message for Storage availability monitor | string | `""` | no |
| availability\_threshold\_critical | Minimum acceptable percent of availability for a storage | string | `"50"` | no |
| availability\_threshold\_warning | Warning regarding acceptable percent of availability for a storage | string | `"90"` | no |
| availability\_time\_aggregator | Monitor aggregator for Storage availability [available values: min, max or avg] | string | `"max"` | no |
| availability\_timeframe | Monitor timeframe for Storage availability [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| client\_other\_error\_requests\_enabled | Flag to enable Storage other errors monitor | string | `"true"` | no |
| client\_other\_error\_requests\_extra\_tags | Extra tags for Storage other errors monitor | list(string) | `[]` | no |
| client\_other\_error\_requests\_message | Custom message for Storage other errors monitor | string | `""` | no |
| client\_other\_error\_requests\_threshold\_critical | Maximum acceptable percent of client other error requests for a storage | string | `"90"` | no |
| client\_other\_error\_requests\_threshold\_warning | Warning regarding acceptable percent of client other error requests for a storage | string | `"50"` | no |
| client\_other\_error\_requests\_time\_aggregator | Monitor aggregator for Storage other errors [available values: min, max or avg] | string | `"min"` | no |
| client\_other\_error\_requests\_timeframe | Monitor timeframe for Storage other errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags\_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `"*"` | no |
| filter\_tags\_custom\_excluded | Tags excluded for custom filtering when filter_tags_use_defaults is false | string | `""` | no |
| filter\_tags\_use\_defaults | Use default filter tags convention | string | `"true"` | no |
| latency\_enabled | Flag to enable Storage latency monitor | string | `"true"` | no |
| latency\_extra\_tags | Extra tags for Storage latency monitor | list(string) | `[]` | no |
| latency\_message | Custom message for Storage latency monitor | string | `""` | no |
| latency\_threshold\_critical | Maximum acceptable end to end latency (ms) for a storage | string | `"2000"` | no |
| latency\_threshold\_warning | Warning regarding acceptable end to end latency (ms) for a storage | string | `"1000"` | no |
| latency\_time\_aggregator | Monitor aggregator for Storage latency [available values: min, max or avg] | string | `"min"` | no |
| latency\_timeframe | Monitor timeframe for Storage latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| message | Message sent when a Redis monitor is triggered | string | n/a | yes |
| network\_error\_requests\_enabled | Flag to enable Storage network errors monitor | string | `"true"` | no |
| network\_error\_requests\_extra\_tags | Extra tags for Storage network errors monitor | list(string) | `[]` | no |
| network\_error\_requests\_message | Custom message for Storage network errors monitor | string | `""` | no |
| network\_error\_requests\_threshold\_critical | Maximum acceptable percent of network error requests for a storage | string | `"90"` | no |
| network\_error\_requests\_threshold\_warning | Warning regarding acceptable percent of network error requests for a storage | string | `"50"` | no |
| network\_error\_requests\_time\_aggregator | Monitor aggregator for Storage network errors [available values: min, max or avg] | string | `"min"` | no |
| network\_error\_requests\_timeframe | Monitor timeframe for Storage network errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| new\_host\_delay | Delay in seconds before monitor new resource | string | `"300"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | string | `""` | no |
| server\_other\_error\_requests\_enabled | Flag to enable Storage server other errors monitor | string | `"true"` | no |
| server\_other\_error\_requests\_extra\_tags | Extra tags for Storage server other errors monitor | list(string) | `[]` | no |
| server\_other\_error\_requests\_message | Custom message for Storage server other errors monitor | string | `""` | no |
| server\_other\_error\_requests\_threshold\_critical | Maximum acceptable percent of server other error requests for a storage | string | `"90"` | no |
| server\_other\_error\_requests\_threshold\_warning | Warning regarding acceptable percent of server other error requests for a storage | string | `"50"` | no |
| server\_other\_error\_requests\_time\_aggregator | Monitor aggregator for Storage other errors [available values: min, max or avg] | string | `"min"` | no |
| server\_other\_error\_requests\_timeframe | Monitor timeframe for Storage server other errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| successful\_requests\_enabled | Flag to enable Storage sucessful requests monitor | string | `"true"` | no |
| successful\_requests\_extra\_tags | Extra tags for Storage sucessful requests monitor | list(string) | `[]` | no |
| successful\_requests\_message | Custom message for Storage sucessful requests monitor | string | `""` | no |
| successful\_requests\_threshold\_critical | Minimum acceptable percent of successful requests for a storage | string | `"10"` | no |
| successful\_requests\_threshold\_warning | Warning regarding acceptable percent of successful requests for a storage | string | `"30"` | no |
| successful\_requests\_time\_aggregator | Monitor aggregator for Storage sucessful requests [available values: min, max or avg] | string | `"max"` | no |
| successful\_requests\_timeframe | Monitor timeframe for Storage sucessful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| throttling\_error\_requests\_enabled | Flag to enable Storage throttling error monitor | string | `"true"` | no |
| throttling\_error\_requests\_extra\_tags | Extra tags for Storage throttling error monitor | list(string) | `[]` | no |
| throttling\_error\_requests\_message | Custom message for Storage throttling error monitor | string | `""` | no |
| throttling\_error\_requests\_threshold\_critical | Maximum acceptable percent of throttling error requests for a storage | string | `"90"` | no |
| throttling\_error\_requests\_threshold\_warning | Warning regarding acceptable percent of throttling error requests for a storage | string | `"50"` | no |
| throttling\_error\_requests\_time\_aggregator | Monitor aggregator for Storage throttling errors [available values: min, max or avg] | string | `"min"` | no |
| throttling\_error\_requests\_timeframe | Monitor timeframe for Storage throttling errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |
| timeout\_error\_requests\_enabled | Flag to enable Storage timeout monitor | string | `"true"` | no |
| timeout\_error\_requests\_extra\_tags | Extra tags for Storage timeout monitor | list(string) | `[]` | no |
| timeout\_error\_requests\_message | Custom message for Storage timeout monitor | string | `""` | no |
| timeout\_error\_requests\_threshold\_critical | Maximum acceptable percent of timeout error requests for a storage | string | `"90"` | no |
| timeout\_error\_requests\_threshold\_warning | Warning regarding acceptable percent of timeout error requests for a storage | string | `"50"` | no |
| timeout\_error\_requests\_time\_aggregator | Monitor aggregator for Storage timeout [available values: min, max or avg] | string | `"min"` | no |
| timeout\_error\_requests\_timeframe | Monitor timeframe for Storage timeout [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| authorization\_error\_requests\_id | id for monitor authorization_error_requests |
| availability\_id | id for monitor availability |
| client\_other\_error\_requests\_id | id for monitor client_other_error_requests |
| latency\_id | id for monitor latency |
| network\_error\_requests\_id | id for monitor network_error_requests |
| server\_other\_error\_requests\_id | id for monitor server_other_error_requests |
| successful\_requests\_id | id for monitor successful_requests |
| throttling\_error\_requests\_id | id for monitor throttling_error_requests |
| timeout\_error\_requests\_id | id for monitor timeout_error_requests |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_storage/](https://docs.datadoghq.com/integrations/azure_storage/)

DataDog blog: [https://www.datadoghq.com/blog/monitor-azure-storage-datadog/](https://www.datadoghq.com/blog/monitor-azure-storage-datadog/)

Azure Storage metrics documentation: [https://docs.microsoft.com/en-us/azure/storage/common/storage-monitor-storage-account](https://docs.microsoft.com/en-us/azure/storage/common/storage-monitor-storage-account)

Azure Storage metrics detailed documentation [https://docs.microsoft.com/en-us/rest/api/storageservices/storage-analytics-metrics-table-schema](https://docs.microsoft.com/en-us/rest/api/storageservices/storage-analytics-metrics-table-schema)
