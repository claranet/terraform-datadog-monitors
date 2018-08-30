# CLOUD AWS APIGATEWAY DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-aws-apigateway" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/aws/apigateway?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- API Gateway HTTP 4xx errors
- API Gateway HTTP 5xx errors
- API Gateway latency

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| artificial_requests_count | Number of false requests used to mitigate false positive in case of low trafic | string | `5` | no |
| environment | Environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `900` | no |
| filter_tags | Tags used for filtering | string | `*` | no |
| http_4xx_requests_enabled | Flag to enable API Gateway HTTP 4xx requests monitor | string | `true` | no |
| http_4xx_requests_extra_tags | Extra tags for API Gateway HTTP 4xx requests monitor | list | `<list>` | no |
| http_4xx_requests_message | Custom message for API Gateway HTTP 4xx requests monitor | string | `` | no |
| http_4xx_requests_silenced | Groups to mute for API Gateway HTTP 4xx requests monitor | map | `<map>` | no |
| http_4xx_requests_threshold_critical | Maximum critical acceptable percent of 4xx errors | string | `30` | no |
| http_4xx_requests_threshold_warning | Maximum warning acceptable percent of 4xx errors | string | `15` | no |
| http_4xx_requests_timeframe | Monitor timeframe for API HTTP 4xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| http_5xx_requests_enabled | Flag to enable API Gateway HTTP 5xx requests monitor | string | `true` | no |
| http_5xx_requests_extra_tags | Extra tags for API Gateway HTTP 5xx requests monitor | list | `<list>` | no |
| http_5xx_requests_message | Custom message for API Gateway HTTP 5xx requests monitor | string | `` | no |
| http_5xx_requests_silenced | Groups to mute for API Gateway HTTP 5xx requests monitor | map | `<map>` | no |
| http_5xx_requests_threshold_critical | Maximum critical acceptable percent of 5xx errors | string | `20` | no |
| http_5xx_requests_threshold_warning | Maximum warning acceptable percent of 5xx errors | string | `10` | no |
| http_5xx_requests_timeframe | Monitor timeframe for API HTTP 5xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| latency_enabled | Flag to enable API Gateway latency monitor | string | `true` | no |
| latency_extra_tags | Extra tags for API Gateway latency monitor | list | `<list>` | no |
| latency_message | Custom message for API Gateway latency monitor | string | `` | no |
| latency_silenced | Groups to mute for API Gateway latency monitor | map | `<map>` | no |
| latency_threshold_critical | Alerting threshold in milliseconds | string | `800` | no |
| latency_threshold_warning | Warning threshold in milliseconds | string | `400` | no |
| latency_time_aggregator | Monitor aggregator for API Gateway latency [available values: min, max or avg] | string | `min` | no |
| latency_timeframe | Monitor timeframe for API latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |

## Outputs

| Name | Description |
|------|-------------|
| API_Gateway_latency_id | id for monitor API_Gateway_latency |
| API_http_4xx_errors_count_id | id for monitor API_http_4xx_errors_count |
| API_http_5xx_errors_count_id | id for monitor API_http_5xx_errors_count |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_api_gateway/](https://docs.datadoghq.com/integrations/amazon_api_gateway/)

AWS API Gateway metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/api-gateway-metrics-dimensions.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/api-gateway-metrics-dimensions.html)
