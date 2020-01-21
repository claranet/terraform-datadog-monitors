# CLOUD GCP LB DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-gcp-lb" {
  source = "claranet/monitors/datadog//cloud/gcp/lb"
  version = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- GCP LB 4xx errors
- GCP LB 5xx errors
- GCP LB bucket backend latency
- GCP LB Requests count increased abruptly
- GCP LB service backend latency

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| backend\_latency\_bucket\_enabled | Flag to enable GCP LB Backend Latency monitor | `string` | `"true"` | no |
| backend\_latency\_bucket\_extra\_tags | Extra tags for GCP LB Backend Latency monitor | `list(string)` | `[]` | no |
| backend\_latency\_bucket\_message | Custom message for the GCP LB Backend Latency monitor | `string` | `""` | no |
| backend\_latency\_bucket\_threshold\_critical | Latency in milliseconds (critical threshold) | `string` | `8000` | no |
| backend\_latency\_bucket\_threshold\_warning | Latency in milliseconds (warning threshold) | `string` | `4000` | no |
| backend\_latency\_bucket\_time\_aggregator | Timeframe for the GCP LB Backend Latency monitor | `string` | `"min"` | no |
| backend\_latency\_bucket\_timeframe | Timeframe for the GCP LB Backend Latency monitor | `string` | `"last_10m"` | no |
| backend\_latency\_service\_enabled | Flag to enable GCP LB Backend Latency monitor | `string` | `"true"` | no |
| backend\_latency\_service\_extra\_tags | Extra tags for GCP LB Backend Latency monitor | `list(string)` | `[]` | no |
| backend\_latency\_service\_message | Custom message for the GCP LB Backend Latency monitor | `string` | `""` | no |
| backend\_latency\_service\_threshold\_critical | Latency in milliseconds (critical threshold) | `string` | `1500` | no |
| backend\_latency\_service\_threshold\_warning | Latency in milliseconds (warning threshold) | `string` | `1000` | no |
| backend\_latency\_service\_time\_aggregator | Timeframe for the GCP LB Backend Latency monitor | `string` | `"min"` | no |
| backend\_latency\_service\_timeframe | Timeframe for the GCP LB Backend Latency monitor | `string` | `"last_10m"` | no |
| environment | Architecture environment | `string` | n/a | yes |
| error\_rate\_4xx\_artificial\_request | Divisor Delta for the GCP LB 4XX Errors monitor | `string` | `5` | no |
| error\_rate\_4xx\_enabled | Flag to enable GCP LB 4XX Errors monitor | `string` | `"true"` | no |
| error\_rate\_4xx\_extra\_tags | Extra tags for GCP LB 4XX Errors monitor | `list(string)` | `[]` | no |
| error\_rate\_4xx\_message | Custom message for the GCP LB 4XX Errors monitor | `string` | `""` | no |
| error\_rate\_4xx\_threshold\_critical | Rate error in percentage (critical threshold) | `string` | `60` | no |
| error\_rate\_4xx\_threshold\_warning | Rate error in percentage (warning threshold) | `string` | `50` | no |
| error\_rate\_4xx\_time\_aggregator | Timeframe for the GCP LB 4XX Errors monitor | `string` | `"min"` | no |
| error\_rate\_4xx\_timeframe | Timeframe for the GCP LB 4XX Errors monitor | `string` | `"last_5m"` | no |
| error\_rate\_5xx\_artificial\_request | Divisor Delta for the GCP LB 5XX Errors monitor | `string` | `5` | no |
| error\_rate\_5xx\_enabled | Flag to enable GCP LB 5XX Errors monitor | `string` | `"true"` | no |
| error\_rate\_5xx\_extra\_tags | Extra tags for GCP LB 5XX Errors monitor | `list(string)` | `[]` | no |
| error\_rate\_5xx\_message | Custom message for the GCP LB 5XX Errors monitor | `string` | `""` | no |
| error\_rate\_5xx\_threshold\_critical | Rate error in percentage (critical threshold) | `string` | `40` | no |
| error\_rate\_5xx\_threshold\_warning | Rate error in percentage (warning threshold) | `string` | `30` | no |
| error\_rate\_5xx\_time\_aggregator | Timeframe for the GCP LB 5XX Errors monitor | `string` | `"min"` | no |
| error\_rate\_5xx\_timeframe | Timeframe for the GCP LB 5XX Errors monitor | `string` | `"last_5m"` | no |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags | Tags used for filtering | `string` | `"*"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds for the new host evaluation | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| request\_count\_enabled | Flag to enable GCP LB Request Count monitor | `string` | `"true"` | no |
| request\_count\_extra\_tags | Extra tags for GCP LB Request Count monitor | `list(string)` | `[]` | no |
| request\_count\_message | Custom message for the GCP LB Request Count monitor | `string` | `""` | no |
| request\_count\_threshold\_critical | Desviation in percentage (critical threshold) | `string` | `500` | no |
| request\_count\_threshold\_warning | Desviation in percentage (warning threshold) | `string` | `250` | no |
| request\_count\_time\_aggregator | Timeframe for the GCP LB Request Count monitor | `string` | `"sum"` | no |
| request\_count\_timeframe | Timeframe for the GCP LB Request Count monitor | `string` | `"last_5m"` | no |
| request\_count\_timeshift | Timeshift for the GCP LB Request Count monitor | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| backend\_latency\_bucket\_id | id for monitor backend\_latency\_bucket |
| backend\_latency\_service\_id | id for monitor backend\_latency\_service |
| error\_rate\_4xx\_id | id for monitor error\_rate\_4xx |
| error\_rate\_5xx\_id | id for monitor error\_rate\_5xx |
| request\_count\_id | id for monitor request\_count |

## Related documentation

* [GCP LB Metrics](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-loadbalancing)
* [Datadog GCP integration](https://docs.datadoghq.com/integrations/google_cloud_platform/)
