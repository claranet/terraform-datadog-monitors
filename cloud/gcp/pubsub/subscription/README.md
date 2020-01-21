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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags | Tags used for filtering | `string` | `"*"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds for the new host evaluation | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| oldest\_unacked\_message\_age\_enabled | Flag to enable GCP Pub/Sub Subscription Oldest Unacked Message Age monitor | `string` | `"true"` | no |
| oldest\_unacked\_message\_age\_extra\_tags | Extra tags for GCP Pub/Sub Subscription Oldest Unacked Message Age monitor | `list(string)` | `[]` | no |
| oldest\_unacked\_message\_age\_message | Custom message for the GCP Pub/Sub Subscription Oldest Unacked Message Age monitor | `string` | `""` | no |
| oldest\_unacked\_message\_age\_threshold\_critical | GCP Pub/Sub Subscription Oldest Unacked Message Age critical threshold | `string` | `120` | no |
| oldest\_unacked\_message\_age\_threshold\_warning | GCP Pub/Sub Subscription Oldest Unacked Message Age warning threshold | `string` | `30` | no |
| oldest\_unacked\_message\_age\_time\_aggregator | Time aggregator for the GCP Pub/Sub Subscription Oldest Unacked Message Age monitor | `string` | `"min"` | no |
| oldest\_unacked\_message\_age\_timeframe | Timeframe for the GCP Pub/Sub Subscription Oldest Unacked Message Age monitor | `string` | `"last_5m"` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| subscription\_push\_latency\_anomaly\_alert\_window | Alert window. | `string` | `"last_15m"` | no |
| subscription\_push\_latency\_anomaly\_count\_default\_zero | Count default zero. | `string` | `"true"` | no |
| subscription\_push\_latency\_anomaly\_detection\_algorithm | Anomaly Detection Algorithm used | `string` | `"basic"` | no |
| subscription\_push\_latency\_anomaly\_direction | Direction of the anomaly. It can be both, below or above. | `string` | `"above"` | no |
| subscription\_push\_latency\_anomaly\_enabled | Flag to enable GCP Pub/Sub Subscription Push Latency Anomaly monitor | `string` | `"false"` | no |
| subscription\_push\_latency\_anomaly\_extra\_tags | Extra tags for GCP Pub/Sub Subscription Push Latency Anomaly monitor | `list(string)` | `[]` | no |
| subscription\_push\_latency\_anomaly\_interval | Interval. | `string` | `60` | no |
| subscription\_push\_latency\_anomaly\_message | Custom message for the GCP Pub/Sub Subscription Push Latency Anomaly monitor | `string` | `""` | no |
| subscription\_push\_latency\_anomaly\_seasonality | Seasonality of the algorithm | `string` | `"daily"` | no |
| subscription\_push\_latency\_anomaly\_threshold\_critical | GCP Pub/Sub Subscription Push Latency Anomaly critical threshold | `string` | `2` | no |
| subscription\_push\_latency\_anomaly\_threshold\_warning | GCP Pub/Sub Subscription Push Latency Anomaly warning threshold | `string` | `1` | no |
| subscription\_push\_latency\_anomaly\_time\_aggregator | Time aggregator for the GCP Pub/Sub Subscription Push Latency Anomaly monitor | `string` | `"avg"` | no |
| subscription\_push\_latency\_anomaly\_timeframe | Timeframe for the GCP Pub/Sub Subscription Push Latency Anomaly monitor | `string` | `"last_10m"` | no |
| subscription\_push\_latency\_enabled | Flag to enable GCP Pub/Sub Subscription Push Latency High monitor | `string` | `"true"` | no |
| subscription\_push\_latency\_extra\_tags | Extra tags for GCP Pub/Sub Subscription Push Latency High monitor | `list(string)` | `[]` | no |
| subscription\_push\_latency\_message | Custom message for the GCP Pub/Sub Subscription Push Latency High monitor | `string` | `""` | no |
| subscription\_push\_latency\_threshold\_critical | GCP Pub/Sub Subscription Push Latency High critical threshold | `string` | `5000` | no |
| subscription\_push\_latency\_threshold\_warning | GCP Pub/Sub Subscription Push Latency High warning threshold | `string` | `1000` | no |
| subscription\_push\_latency\_time\_aggregator | Time aggregator for the GCP Pub/Sub Subscription Push Latency High monitor | `string` | `"avg"` | no |
| subscription\_push\_latency\_timeframe | Timeframe for the GCP Pub/Sub Subscription Push Latency High monitor | `string` | `"last_10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| oldest\_unacked\_message\_age\_id | id for monitor oldest\_unacked\_message\_age |
| subscription\_push\_latency\_anomaly\_id | id for monitor subscription\_push\_latency\_anomaly |
| subscription\_push\_latency\_id | id for monitor subscription\_push\_latency |

## Related documentation

* [GCP Pub/Sub Metrics](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-pubsub)
* [Datadog GCP Pub/Sub integration](https://docs.datadoghq.com/integrations/google_cloud_pubsub/)
