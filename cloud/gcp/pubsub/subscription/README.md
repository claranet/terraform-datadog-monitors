# CLOUD GCP PUBSUB SUBSCRIPTION DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-gcp-pubsub-subscription" {
  source      = "claranet/monitors/datadog//cloud/gcp/pubsub/subscription"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Pub/Sub Subscription latency on push endpoint
- Pub/Sub Subscription latency on push endpoint changed abnormally (disabled by default)
- Pub/Sub Subscription oldest unacknowledged message

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
| [datadog_monitor.oldest_unacked_message_age](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.subscription_push_latency](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.subscription_push_latency_anomaly](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Architecture environment | `string` | n/a | yes |
| <a name="input_evaluation_delay"></a> [evaluation\_delay](#input\_evaluation\_delay) | Delay in seconds for the metric evaluation | `number` | `900` | no |
| <a name="input_filter_tags"></a> [filter\_tags](#input\_filter\_tags) | Tags used for filtering | `string` | `"*"` | no |
| <a name="input_message"></a> [message](#input\_message) | Message sent when a monitor is triggered | `any` | n/a | yes |
| <a name="input_new_host_delay"></a> [new\_host\_delay](#input\_new\_host\_delay) | Delay in seconds for the new host evaluation | `number` | `300` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Will raise no data alert if set to true | `bool` | `true` | no |
| <a name="input_oldest_unacked_message_age_enabled"></a> [oldest\_unacked\_message\_age\_enabled](#input\_oldest\_unacked\_message\_age\_enabled) | Flag to enable GCP Pub/Sub Subscription Oldest Unacked Message Age monitor | `string` | `"true"` | no |
| <a name="input_oldest_unacked_message_age_extra_tags"></a> [oldest\_unacked\_message\_age\_extra\_tags](#input\_oldest\_unacked\_message\_age\_extra\_tags) | Extra tags for GCP Pub/Sub Subscription Oldest Unacked Message Age monitor | `list(string)` | `[]` | no |
| <a name="input_oldest_unacked_message_age_message"></a> [oldest\_unacked\_message\_age\_message](#input\_oldest\_unacked\_message\_age\_message) | Custom message for the GCP Pub/Sub Subscription Oldest Unacked Message Age monitor | `string` | `""` | no |
| <a name="input_oldest_unacked_message_age_threshold_critical"></a> [oldest\_unacked\_message\_age\_threshold\_critical](#input\_oldest\_unacked\_message\_age\_threshold\_critical) | GCP Pub/Sub Subscription Oldest Unacked Message Age critical threshold | `string` | `120` | no |
| <a name="input_oldest_unacked_message_age_threshold_warning"></a> [oldest\_unacked\_message\_age\_threshold\_warning](#input\_oldest\_unacked\_message\_age\_threshold\_warning) | GCP Pub/Sub Subscription Oldest Unacked Message Age warning threshold | `string` | `30` | no |
| <a name="input_oldest_unacked_message_age_time_aggregator"></a> [oldest\_unacked\_message\_age\_time\_aggregator](#input\_oldest\_unacked\_message\_age\_time\_aggregator) | Time aggregator for the GCP Pub/Sub Subscription Oldest Unacked Message Age monitor | `string` | `"min"` | no |
| <a name="input_oldest_unacked_message_age_timeframe"></a> [oldest\_unacked\_message\_age\_timeframe](#input\_oldest\_unacked\_message\_age\_timeframe) | Timeframe for the GCP Pub/Sub Subscription Oldest Unacked Message Age monitor | `string` | `"last_5m"` | no |
| <a name="input_prefix_slug"></a> [prefix\_slug](#input\_prefix\_slug) | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| <a name="input_subscription_push_latency_anomaly_alert_window"></a> [subscription\_push\_latency\_anomaly\_alert\_window](#input\_subscription\_push\_latency\_anomaly\_alert\_window) | Alert window. | `string` | `"last_15m"` | no |
| <a name="input_subscription_push_latency_anomaly_count_default_zero"></a> [subscription\_push\_latency\_anomaly\_count\_default\_zero](#input\_subscription\_push\_latency\_anomaly\_count\_default\_zero) | Count default zero. | `string` | `"true"` | no |
| <a name="input_subscription_push_latency_anomaly_detection_algorithm"></a> [subscription\_push\_latency\_anomaly\_detection\_algorithm](#input\_subscription\_push\_latency\_anomaly\_detection\_algorithm) | Anomaly Detection Algorithm used | `string` | `"basic"` | no |
| <a name="input_subscription_push_latency_anomaly_direction"></a> [subscription\_push\_latency\_anomaly\_direction](#input\_subscription\_push\_latency\_anomaly\_direction) | Direction of the anomaly. It can be both, below or above. | `string` | `"above"` | no |
| <a name="input_subscription_push_latency_anomaly_enabled"></a> [subscription\_push\_latency\_anomaly\_enabled](#input\_subscription\_push\_latency\_anomaly\_enabled) | Flag to enable GCP Pub/Sub Subscription Push Latency Anomaly monitor | `string` | `"false"` | no |
| <a name="input_subscription_push_latency_anomaly_extra_tags"></a> [subscription\_push\_latency\_anomaly\_extra\_tags](#input\_subscription\_push\_latency\_anomaly\_extra\_tags) | Extra tags for GCP Pub/Sub Subscription Push Latency Anomaly monitor | `list(string)` | `[]` | no |
| <a name="input_subscription_push_latency_anomaly_interval"></a> [subscription\_push\_latency\_anomaly\_interval](#input\_subscription\_push\_latency\_anomaly\_interval) | Interval. | `string` | `60` | no |
| <a name="input_subscription_push_latency_anomaly_message"></a> [subscription\_push\_latency\_anomaly\_message](#input\_subscription\_push\_latency\_anomaly\_message) | Custom message for the GCP Pub/Sub Subscription Push Latency Anomaly monitor | `string` | `""` | no |
| <a name="input_subscription_push_latency_anomaly_seasonality"></a> [subscription\_push\_latency\_anomaly\_seasonality](#input\_subscription\_push\_latency\_anomaly\_seasonality) | Seasonality of the algorithm | `string` | `"daily"` | no |
| <a name="input_subscription_push_latency_anomaly_threshold_critical"></a> [subscription\_push\_latency\_anomaly\_threshold\_critical](#input\_subscription\_push\_latency\_anomaly\_threshold\_critical) | GCP Pub/Sub Subscription Push Latency Anomaly critical threshold | `string` | `2` | no |
| <a name="input_subscription_push_latency_anomaly_threshold_warning"></a> [subscription\_push\_latency\_anomaly\_threshold\_warning](#input\_subscription\_push\_latency\_anomaly\_threshold\_warning) | GCP Pub/Sub Subscription Push Latency Anomaly warning threshold | `string` | `1` | no |
| <a name="input_subscription_push_latency_anomaly_time_aggregator"></a> [subscription\_push\_latency\_anomaly\_time\_aggregator](#input\_subscription\_push\_latency\_anomaly\_time\_aggregator) | Time aggregator for the GCP Pub/Sub Subscription Push Latency Anomaly monitor | `string` | `"avg"` | no |
| <a name="input_subscription_push_latency_anomaly_timeframe"></a> [subscription\_push\_latency\_anomaly\_timeframe](#input\_subscription\_push\_latency\_anomaly\_timeframe) | Timeframe for the GCP Pub/Sub Subscription Push Latency Anomaly monitor | `string` | `"last_10m"` | no |
| <a name="input_subscription_push_latency_enabled"></a> [subscription\_push\_latency\_enabled](#input\_subscription\_push\_latency\_enabled) | Flag to enable GCP Pub/Sub Subscription Push Latency High monitor | `string` | `"true"` | no |
| <a name="input_subscription_push_latency_extra_tags"></a> [subscription\_push\_latency\_extra\_tags](#input\_subscription\_push\_latency\_extra\_tags) | Extra tags for GCP Pub/Sub Subscription Push Latency High monitor | `list(string)` | `[]` | no |
| <a name="input_subscription_push_latency_message"></a> [subscription\_push\_latency\_message](#input\_subscription\_push\_latency\_message) | Custom message for the GCP Pub/Sub Subscription Push Latency High monitor | `string` | `""` | no |
| <a name="input_subscription_push_latency_threshold_critical"></a> [subscription\_push\_latency\_threshold\_critical](#input\_subscription\_push\_latency\_threshold\_critical) | GCP Pub/Sub Subscription Push Latency High critical threshold | `string` | `5000` | no |
| <a name="input_subscription_push_latency_threshold_warning"></a> [subscription\_push\_latency\_threshold\_warning](#input\_subscription\_push\_latency\_threshold\_warning) | GCP Pub/Sub Subscription Push Latency High warning threshold | `string` | `1000` | no |
| <a name="input_subscription_push_latency_time_aggregator"></a> [subscription\_push\_latency\_time\_aggregator](#input\_subscription\_push\_latency\_time\_aggregator) | Time aggregator for the GCP Pub/Sub Subscription Push Latency High monitor | `string` | `"avg"` | no |
| <a name="input_subscription_push_latency_timeframe"></a> [subscription\_push\_latency\_timeframe](#input\_subscription\_push\_latency\_timeframe) | Timeframe for the GCP Pub/Sub Subscription Push Latency High monitor | `string` | `"last_10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_oldest_unacked_message_age_id"></a> [oldest\_unacked\_message\_age\_id](#output\_oldest\_unacked\_message\_age\_id) | id for monitor oldest\_unacked\_message\_age |
| <a name="output_subscription_push_latency_anomaly_id"></a> [subscription\_push\_latency\_anomaly\_id](#output\_subscription\_push\_latency\_anomaly\_id) | id for monitor subscription\_push\_latency\_anomaly |
| <a name="output_subscription_push_latency_id"></a> [subscription\_push\_latency\_id](#output\_subscription\_push\_latency\_id) | id for monitor subscription\_push\_latency |
## Related documentation

* [GCP Pub/Sub Metrics](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-pubsub)
* [Datadog GCP Pub/Sub integration](https://docs.datadoghq.com/integrations/google_cloud_pubsub/)
