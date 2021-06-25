# CLOUD AWS APIGATEWAY DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-aws-apigateway" {
  source      = "claranet/monitors/datadog//cloud/aws/apigateway"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- API Gateway HTTP 4xx errors
- API Gateway HTTP 5xx errors
- API Gateway latency

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.1.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.API_Gateway_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.API_http_4xx_errors_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.API_http_5xx_errors_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_artificial_requests_count"></a> [artificial\_requests\_count](#input\_artificial\_requests\_count) | Number of false requests used to mitigate false positive in case of low trafic | `number` | `5` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags"></a> [filter\_tags](#input\_filter\_tags) | Tags used for filtering | `string` | `"*"` | no |
| <a name="input_http_4xx_requests_enabled"></a> [http\_4xx\_requests\_enabled](#input\_http\_4xx\_requests\_enabled) | Flag to enable API Gateway HTTP 4xx requests monitor | `string` | `"true"` | no |
| <a name="input_http_4xx_requests_extra_tags"></a> [http\_4xx\_requests\_extra\_tags](#input\_http\_4xx\_requests\_extra\_tags) | Extra tags for API Gateway HTTP 4xx requests monitor | `list(string)` | `[]` | no |
| <a name="input_http_4xx_requests_message"></a> [http\_4xx\_requests\_message](#input\_http\_4xx\_requests\_message) | Custom message for API Gateway HTTP 4xx requests monitor | `string` | `""` | no |
| <a name="input_http_4xx_requests_threshold_critical"></a> [http\_4xx\_requests\_threshold\_critical](#input\_http\_4xx\_requests\_threshold\_critical) | Maximum critical acceptable percent of 4xx errors | `number` | `30` | no |
| <a name="input_http_4xx_requests_threshold_warning"></a> [http\_4xx\_requests\_threshold\_warning](#input\_http\_4xx\_requests\_threshold\_warning) | Maximum warning acceptable percent of 4xx errors | `number` | `15` | no |
| <a name="input_http_4xx_requests_time_aggregator"></a> [http\_4xx\_requests\_time\_aggregator](#input\_http\_4xx\_requests\_time\_aggregator) | Monitor aggregator for API HTTP 4xx requests [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_http_4xx_requests_timeframe"></a> [http\_4xx\_requests\_timeframe](#input\_http\_4xx\_requests\_timeframe) | Monitor timeframe for API HTTP 4xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_http_5xx_requests_enabled"></a> [http\_5xx\_requests\_enabled](#input\_http\_5xx\_requests\_enabled) | Flag to enable API Gateway HTTP 5xx requests monitor | `string` | `"true"` | no |
| <a name="input_http_5xx_requests_extra_tags"></a> [http\_5xx\_requests\_extra\_tags](#input\_http\_5xx\_requests\_extra\_tags) | Extra tags for API Gateway HTTP 5xx requests monitor | `list(string)` | `[]` | no |
| <a name="input_http_5xx_requests_message"></a> [http\_5xx\_requests\_message](#input\_http\_5xx\_requests\_message) | Custom message for API Gateway HTTP 5xx requests monitor | `string` | `""` | no |
| <a name="input_http_5xx_requests_threshold_critical"></a> [http\_5xx\_requests\_threshold\_critical](#input\_http\_5xx\_requests\_threshold\_critical) | Maximum critical acceptable percent of 5xx errors | `number` | `20` | no |
| <a name="input_http_5xx_requests_threshold_warning"></a> [http\_5xx\_requests\_threshold\_warning](#input\_http\_5xx\_requests\_threshold\_warning) | Maximum warning acceptable percent of 5xx errors | `number` | `10` | no |
| <a name="input_http_5xx_requests_time_aggregator"></a> [http\_5xx\_requests\_time\_aggregator](#input\_http\_5xx\_requests\_time\_aggregator) | Monitor aggregator for API HTTP 5xx requests [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_http_5xx_requests_timeframe"></a> [http\_5xx\_requests\_timeframe](#input\_http\_5xx\_requests\_timeframe) | Monitor timeframe for API HTTP 5xx requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_latency_enabled"></a> [latency\_enabled](#input\_latency\_enabled) | Flag to enable API Gateway latency monitor | `string` | `"true"` | no |
| <a name="input_latency_extra_tags"></a> [latency\_extra\_tags](#input\_latency\_extra\_tags) | Extra tags for API Gateway latency monitor | `list(string)` | `[]` | no |
| <a name="input_latency_message"></a> [latency\_message](#input\_latency\_message) | Custom message for API Gateway latency monitor | `string` | `""` | no |
| <a name="input_latency_threshold_critical"></a> [latency\_threshold\_critical](#input\_latency\_threshold\_critical) | Alerting threshold in milliseconds | `number` | `3000` | no |
| <a name="input_latency_threshold_warning"></a> [latency\_threshold\_warning](#input\_latency\_threshold\_warning) | Warning threshold in milliseconds | `number` | `1000` | no |
| <a name="input_latency_time_aggregator"></a> [latency\_time\_aggregator](#input\_latency\_time\_aggregator) | Monitor aggregator for API Gateway latency [available values: min, max or avg] | `string` | `"min"` | no |
| <a name="input_latency_timeframe"></a> [latency\_timeframe](#input\_latency\_timeframe) | Monitor timeframe for API latency [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | `string` | `"last_5m"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds before monitor new resource | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_API_Gateway_latency_id"></a> [API\_Gateway\_latency\_id](#output\_API\_Gateway\_latency\_id) | id for monitor API\_Gateway\_latency |
| <a name="output_API_http_4xx_errors_count_id"></a> [API\_http\_4xx\_errors\_count\_id](#output\_API\_http\_4xx\_errors\_count\_id) | id for monitor API\_http\_4xx\_errors\_count |
| <a name="output_API_http_5xx_errors_count_id"></a> [API\_http\_5xx\_errors\_count\_id](#output\_API\_http\_5xx\_errors\_count\_id) | id for monitor API\_http\_5xx\_errors\_count |
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_api_gateway/](https://docs.datadoghq.com/integrations/amazon_api_gateway/)

AWS API Gateway metrics documentation: [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/api-gateway-metrics-dimensions.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/api-gateway-metrics-dimensions.html)
