# CLOUD GCP LB DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-gcp-lb" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/gcp/lb?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
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
|------|-------------|:----:|:-----:|:-----:|
| backend_latency_bucket_enabled | Flag to enable GCP LB Backend Latency monitor | string | `true` | no |
| backend_latency_bucket_extra_tags | Extra tags for GCP LB Backend Latency monitor | list | `<list>` | no |
| backend_latency_bucket_message | Custom message for the GCP LB Backend Latency monitor | string | `` | no |
| backend_latency_bucket_silenced | Groups to mute for GCP LB Backend Latency monitor | map | `<map>` | no |
| backend_latency_bucket_threshold_critical | Latency in milliseconds (critical threshold) | string | `8000` | no |
| backend_latency_bucket_threshold_warning | Latency in milliseconds (warning threshold) | string | `4000` | no |
| backend_latency_bucket_time_aggregator | Timeframe for the GCP LB Backend Latency monitor | string | `min` | no |
| backend_latency_bucket_timeframe | Timeframe for the GCP LB Backend Latency monitor | string | `last_10m` | no |
| backend_latency_service_enabled | Flag to enable GCP LB Backend Latency monitor | string | `true` | no |
| backend_latency_service_extra_tags | Extra tags for GCP LB Backend Latency monitor | list | `<list>` | no |
| backend_latency_service_message | Custom message for the GCP LB Backend Latency monitor | string | `` | no |
| backend_latency_service_silenced | Groups to mute for GCP LB Backend Latency monitor | map | `<map>` | no |
| backend_latency_service_threshold_critical | Latency in milliseconds (critical threshold) | string | `1500` | no |
| backend_latency_service_threshold_warning | Latency in milliseconds (warning threshold) | string | `1000` | no |
| backend_latency_service_time_aggregator | Timeframe for the GCP LB Backend Latency monitor | string | `min` | no |
| backend_latency_service_timeframe | Timeframe for the GCP LB Backend Latency monitor | string | `last_10m` | no |
| environment | Architecture environment | string | - | yes |
| error_rate_4xx_artificial_request | Divisor Delta for the GCP LB 4XX Errors monitor | string | `5` | no |
| error_rate_4xx_enabled | Flag to enable GCP LB 4XX Errors monitor | string | `true` | no |
| error_rate_4xx_extra_tags | Extra tags for GCP LB 4XX Errors monitor | list | `<list>` | no |
| error_rate_4xx_message | Custom message for the GCP LB 4XX Errors monitor | string | `` | no |
| error_rate_4xx_silenced | Groups to mute for GCP LB 4XX Errors monitor | map | `<map>` | no |
| error_rate_4xx_threshold_critical | Rate error in percentage (critical threshold) | string | `60` | no |
| error_rate_4xx_threshold_warning | Rate error in percentage (warning threshold) | string | `50` | no |
| error_rate_4xx_time_aggregator | Timeframe for the GCP LB 4XX Errors monitor | string | `sum` | no |
| error_rate_4xx_timeframe | Timeframe for the GCP LB 4XX Errors monitor | string | `last_5m` | no |
| error_rate_5xx_artificial_request | Divisor Delta for the GCP LB 5XX Errors monitor | string | `5` | no |
| error_rate_5xx_enabled | Flag to enable GCP LB 5XX Errors monitor | string | `true` | no |
| error_rate_5xx_extra_tags | Extra tags for GCP LB 5XX Errors monitor | list | `<list>` | no |
| error_rate_5xx_message | Custom message for the GCP LB 5XX Errors monitor | string | `` | no |
| error_rate_5xx_silenced | Groups to mute for GCP LB 5XX Errors monitor | map | `<map>` | no |
| error_rate_5xx_threshold_critical | Rate error in percentage (critical threshold) | string | `40` | no |
| error_rate_5xx_threshold_warning | Rate error in percentage (warning threshold) | string | `30` | no |
| error_rate_5xx_time_aggregator | Timeframe for the GCP LB 5XX Errors monitor | string | `sum` | no |
| error_rate_5xx_timeframe | Timeframe for the GCP LB 5XX Errors monitor | string | `last_5m` | no |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `900` | no |
| filter_tags | Tags used for filtering | string | `*` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| new_host_delay | Delay in seconds for the new host evaluation | string | `300` | no |
| request_count_enabled | Flag to enable GCP LB Request Count monitor | string | `true` | no |
| request_count_extra_tags | Extra tags for GCP LB Request Count monitor | list | `<list>` | no |
| request_count_message | Custom message for the GCP LB Request Count monitor | string | `` | no |
| request_count_silenced | Groups to mute for GCP LB Request Count monitor | map | `<map>` | no |
| request_count_threshold_critical | Desviation in percentage (critical threshold) | string | `500` | no |
| request_count_threshold_warning | Desviation in percentage (warning threshold) | string | `250` | no |
| request_count_time_aggregator | Timeframe for the GCP LB Request Count monitor | string | `sum` | no |
| request_count_timeframe | Timeframe for the GCP LB Request Count monitor | string | `last_5m` | no |
| request_count_timeshift | Timeshift for the GCP LB Request Count monitor | string | `last_5m` | no |

## Outputs

| Name | Description |
|------|-------------|
| backend_latency_bucket_id | id for monitor backend_latency_bucket |
| backend_latency_service_id | id for monitor backend_latency_service |
| error_rate_4xx_id | id for monitor error_rate_4xx |
| error_rate_5xx_id | id for monitor error_rate_5xx |
| request_count_id | id for monitor request_count |

## Related documentation

* [GCP LB Metrics](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-loadbalancing)
* [Datadog GCP integration](https://docs.datadoghq.com/integrations/google_cloud_platform/)
