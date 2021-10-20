# CLOUD GCP LB DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-gcp-lb" {
  source      = "claranet/monitors/datadog//cloud/gcp/lb"
  version     = "{revision}"

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

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.backend_latency_bucket](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.backend_latency_service](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.error_rate_4xx](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.error_rate_5xx](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.request_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_latency_bucket_enabled"></a> [backend\_latency\_bucket\_enabled](#input\_backend\_latency\_bucket\_enabled) | Flag to enable GCP LB Backend Latency monitor | `string` | `"true"` | no |
| <a name="input_backend_latency_bucket_extra_tags"></a> [backend\_latency\_bucket\_extra\_tags](#input\_backend\_latency\_bucket\_extra\_tags) | Extra tags for GCP LB Backend Latency monitor | `list(string)` | `[]` | no |
| <a name="input_backend_latency_bucket_message"></a> [backend\_latency\_bucket\_message](#input\_backend\_latency\_bucket\_message) | Custom message for the GCP LB Backend Latency monitor | `string` | `""` | no |
| <a name="input_backend_latency_bucket_threshold_critical"></a> [backend\_latency\_bucket\_threshold\_critical](#input\_backend\_latency\_bucket\_threshold\_critical) | Latency in milliseconds (critical threshold) | `string` | `8000` | no |
| <a name="input_backend_latency_bucket_threshold_warning"></a> [backend\_latency\_bucket\_threshold\_warning](#input\_backend\_latency\_bucket\_threshold\_warning) | Latency in milliseconds (warning threshold) | `string` | `4000` | no |
| <a name="input_backend_latency_bucket_time_aggregator"></a> [backend\_latency\_bucket\_time\_aggregator](#input\_backend\_latency\_bucket\_time\_aggregator) | Timeframe for the GCP LB Backend Latency monitor | `string` | `"min"` | no |
| <a name="input_backend_latency_bucket_timeframe"></a> [backend\_latency\_bucket\_timeframe](#input\_backend\_latency\_bucket\_timeframe) | Timeframe for the GCP LB Backend Latency monitor | `string` | `"last_10m"` | no |
| <a name="input_backend_latency_service_enabled"></a> [backend\_latency\_service\_enabled](#input\_backend\_latency\_service\_enabled) | Flag to enable GCP LB Backend Latency monitor | `string` | `"true"` | no |
| <a name="input_backend_latency_service_extra_tags"></a> [backend\_latency\_service\_extra\_tags](#input\_backend\_latency\_service\_extra\_tags) | Extra tags for GCP LB Backend Latency monitor | `list(string)` | `[]` | no |
| <a name="input_backend_latency_service_message"></a> [backend\_latency\_service\_message](#input\_backend\_latency\_service\_message) | Custom message for the GCP LB Backend Latency monitor | `string` | `""` | no |
| <a name="input_backend_latency_service_threshold_critical"></a> [backend\_latency\_service\_threshold\_critical](#input\_backend\_latency\_service\_threshold\_critical) | Latency in milliseconds (critical threshold) | `string` | `1500` | no |
| <a name="input_backend_latency_service_threshold_warning"></a> [backend\_latency\_service\_threshold\_warning](#input\_backend\_latency\_service\_threshold\_warning) | Latency in milliseconds (warning threshold) | `string` | `1000` | no |
| <a name="input_backend_latency_service_time_aggregator"></a> [backend\_latency\_service\_time\_aggregator](#input\_backend\_latency\_service\_time\_aggregator) | Timeframe for the GCP LB Backend Latency monitor | `string` | `"min"` | no |
| <a name="input_backend_latency_service_timeframe"></a> [backend\_latency\_service\_timeframe](#input\_backend\_latency\_service\_timeframe) | Timeframe for the GCP LB Backend Latency monitor | `string` | `"last_10m"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_error_rate_4xx_artificial_request"></a> [error\_rate\_4xx\_artificial\_request](#input\_error\_rate\_4xx\_artificial\_request) | Divisor Delta for the GCP LB 4XX Errors monitor | `string` | `5` | no |
| <a name="input_error_rate_4xx_enabled"></a> [error\_rate\_4xx\_enabled](#input\_error\_rate\_4xx\_enabled) | Flag to enable GCP LB 4XX Errors monitor | `string` | `"true"` | no |
| <a name="input_error_rate_4xx_extra_tags"></a> [error\_rate\_4xx\_extra\_tags](#input\_error\_rate\_4xx\_extra\_tags) | Extra tags for GCP LB 4XX Errors monitor | `list(string)` | `[]` | no |
| <a name="input_error_rate_4xx_message"></a> [error\_rate\_4xx\_message](#input\_error\_rate\_4xx\_message) | Custom message for the GCP LB 4XX Errors monitor | `string` | `""` | no |
| <a name="input_error_rate_4xx_threshold_critical"></a> [error\_rate\_4xx\_threshold\_critical](#input\_error\_rate\_4xx\_threshold\_critical) | Rate error in percentage (critical threshold) | `string` | `60` | no |
| <a name="input_error_rate_4xx_threshold_warning"></a> [error\_rate\_4xx\_threshold\_warning](#input\_error\_rate\_4xx\_threshold\_warning) | Rate error in percentage (warning threshold) | `string` | `50` | no |
| <a name="input_error_rate_4xx_time_aggregator"></a> [error\_rate\_4xx\_time\_aggregator](#input\_error\_rate\_4xx\_time\_aggregator) | Timeframe for the GCP LB 4XX Errors monitor | `string` | `"min"` | no |
| <a name="input_error_rate_4xx_timeframe"></a> [error\_rate\_4xx\_timeframe](#input\_error\_rate\_4xx\_timeframe) | Timeframe for the GCP LB 4XX Errors monitor | `string` | `"last_5m"` | no |
| <a name="input_error_rate_5xx_artificial_request"></a> [error\_rate\_5xx\_artificial\_request](#input\_error\_rate\_5xx\_artificial\_request) | Divisor Delta for the GCP LB 5XX Errors monitor | `string` | `5` | no |
| <a name="input_error_rate_5xx_enabled"></a> [error\_rate\_5xx\_enabled](#input\_error\_rate\_5xx\_enabled) | Flag to enable GCP LB 5XX Errors monitor | `string` | `"true"` | no |
| <a name="input_error_rate_5xx_extra_tags"></a> [error\_rate\_5xx\_extra\_tags](#input\_error\_rate\_5xx\_extra\_tags) | Extra tags for GCP LB 5XX Errors monitor | `list(string)` | `[]` | no |
| <a name="input_error_rate_5xx_message"></a> [error\_rate\_5xx\_message](#input\_error\_rate\_5xx\_message) | Custom message for the GCP LB 5XX Errors monitor | `string` | `""` | no |
| <a name="input_error_rate_5xx_threshold_critical"></a> [error\_rate\_5xx\_threshold\_critical](#input\_error\_rate\_5xx\_threshold\_critical) | Rate error in percentage (critical threshold) | `string` | `40` | no |
| <a name="input_error_rate_5xx_threshold_warning"></a> [error\_rate\_5xx\_threshold\_warning](#input\_error\_rate\_5xx\_threshold\_warning) | Rate error in percentage (warning threshold) | `string` | `30` | no |
| <a name="input_error_rate_5xx_time_aggregator"></a> [error\_rate\_5xx\_time\_aggregator](#input\_error\_rate\_5xx\_time\_aggregator) | Timeframe for the GCP LB 5XX Errors monitor | `string` | `"min"` | no |
| <a name="input_error_rate_5xx_timeframe"></a> [error\_rate\_5xx\_timeframe](#input\_error\_rate\_5xx\_timeframe) | Timeframe for the GCP LB 5XX Errors monitor | `string` | `"last_5m"` | no |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags"></a> [filter\_tags](#input\_filter\_tags) | Tags used for filtering | `string` | `"*"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds for the new host evaluation | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_request_count_enabled"></a> [request\_count\_enabled](#input\_request\_count\_enabled) | Flag to enable GCP LB Request Count monitor | `string` | `"true"` | no |
| <a name="input_request_count_extra_tags"></a> [request\_count\_extra\_tags](#input\_request\_count\_extra\_tags) | Extra tags for GCP LB Request Count monitor | `list(string)` | `[]` | no |
| <a name="input_request_count_message"></a> [request\_count\_message](#input\_request\_count\_message) | Custom message for the GCP LB Request Count monitor | `string` | `""` | no |
| <a name="input_request_count_threshold_critical"></a> [request\_count\_threshold\_critical](#input\_request\_count\_threshold\_critical) | Desviation in percentage (critical threshold) | `string` | `500` | no |
| <a name="input_request_count_threshold_warning"></a> [request\_count\_threshold\_warning](#input\_request\_count\_threshold\_warning) | Desviation in percentage (warning threshold) | `string` | `250` | no |
| <a name="input_request_count_time_aggregator"></a> [request\_count\_time\_aggregator](#input\_request\_count\_time\_aggregator) | Timeframe for the GCP LB Request Count monitor | `string` | `"sum"` | no |
| <a name="input_request_count_timeframe"></a> [request\_count\_timeframe](#input\_request\_count\_timeframe) | Timeframe for the GCP LB Request Count monitor | `string` | `"last_5m"` | no |
| <a name="input_request_count_timeshift"></a> [request\_count\_timeshift](#input\_request\_count\_timeshift) | Timeshift for the GCP LB Request Count monitor | `string` | `"last_5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_latency_bucket_id"></a> [backend\_latency\_bucket\_id](#output\_backend\_latency\_bucket\_id) | id for monitor backend\_latency\_bucket |
| <a name="output_backend_latency_service_id"></a> [backend\_latency\_service\_id](#output\_backend\_latency\_service\_id) | id for monitor backend\_latency\_service |
| <a name="output_error_rate_4xx_id"></a> [error\_rate\_4xx\_id](#output\_error\_rate\_4xx\_id) | id for monitor error\_rate\_4xx |
| <a name="output_error_rate_5xx_id"></a> [error\_rate\_5xx\_id](#output\_error\_rate\_5xx\_id) | id for monitor error\_rate\_5xx |
| <a name="output_request_count_id"></a> [request\_count\_id](#output\_request\_count\_id) | id for monitor request\_count |
## Related documentation

* [GCP LB Metrics](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-loadbalancing)
* [Datadog GCP integration](https://docs.datadoghq.com/integrations/google_cloud_platform/)
