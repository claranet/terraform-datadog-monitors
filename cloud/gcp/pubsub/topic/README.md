# CLOUD GCP PUBSUB TOPIC DataDog monitors

## How to use this module

```hcl
module "datadog-monitors-cloud-gcp-pubsub-topic" {
  source      = "claranet/monitors/datadog//cloud/gcp/pubsub/topic"
  version     = "{revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
}

```

## Purpose

Creates DataDog monitors with the following checks:

- Pub/Sub Topic ratio of sending messages with result unavailable
- Pub/Sub Topic sending messages operations
- Pub/Sub Topic sending messages with result unavailable (disabled by default)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Architecture environment | `string` | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | `number` | `900` | no |
| filter\_tags | Tags used for filtering | `string` | `"*"` | no |
| message | Message sent when a monitor is triggered | `any` | n/a | yes |
| new\_host\_delay | Delay in seconds for the new host evaluation | `number` | `300` | no |
| notify\_no\_data | Will raise no data alert if set to true | `bool` | `true` | no |
| prefix\_slug | Prefix string to prepend between brackets on every monitors names | `string` | `""` | no |
| sending\_operations\_count\_enabled | Flag to enable GCP Pub/Sub Unavailable Sending Operations Count monitor | `string` | `"true"` | no |
| sending\_operations\_count\_extra\_tags | Extra tags for GCP Pub/Sub Sending Operations Count monitor | `list(string)` | `[]` | no |
| sending\_operations\_count\_message | Custom message for the GCP Pub/Sub Sending Operations Count monitor | `string` | `""` | no |
| sending\_operations\_count\_threshold\_critical | Critical threshold for the number of sending operations. | `string` | `0` | no |
| sending\_operations\_count\_time\_aggregator | Timeframe for the GCP Pub/Sub Sending Operations Count monitor | `string` | `"sum"` | no |
| sending\_operations\_count\_timeframe | Timeframe for the GCP Pub/Sub Sending Operations Count monitor | `string` | `"last_30m"` | no |
| unavailable\_sending\_operations\_count\_enabled | Flag to enable GCP Pub/Sub Unavailable Sending Operations Count monitor | `string` | `"false"` | no |
| unavailable\_sending\_operations\_count\_extra\_tags | Extra tags for GCP Pub/Sub Unavailable Sending Operations Count monitor | `list(string)` | `[]` | no |
| unavailable\_sending\_operations\_count\_message | Custom message for the GCP Pub/Sub Unavailable Sending Operations Count monitor | `string` | `""` | no |
| unavailable\_sending\_operations\_count\_threshold\_critical | Critical threshold for the number of unavailable sending operations | `string` | `4` | no |
| unavailable\_sending\_operations\_count\_threshold\_warning | Warning threshold for the number of unavailable sending operations | `string` | `2` | no |
| unavailable\_sending\_operations\_count\_time\_aggregator | Timeframe for the GCP Pub/Sub Unavailable Sending Operations Count monitor | `string` | `"sum"` | no |
| unavailable\_sending\_operations\_count\_timeframe | Timeframe for the GCP Pub/Sub Unavailable Sending Operations Count monitor | `string` | `"last_10m"` | no |
| unavailable\_sending\_operations\_ratio\_enabled | Flag to enable GCP Pub/Sub Unavailable Sending Operations Ratio monitor | `string` | `"true"` | no |
| unavailable\_sending\_operations\_ratio\_extra\_tags | Extra tags for GCP Pub/Sub Unavailable Sending Operations Ratio monitor | `list(string)` | `[]` | no |
| unavailable\_sending\_operations\_ratio\_message | Custom message for the GCP Pub/Sub Unavailable Sending Operations Ratio monitor | `string` | `""` | no |
| unavailable\_sending\_operations\_ratio\_threshold\_critical | Critical threshold (%) for the ratio of unavailable sending operations | `string` | `20` | no |
| unavailable\_sending\_operations\_ratio\_threshold\_warning | Warning threshold (%) for the ratio of unavailable sending operations | `string` | `10` | no |
| unavailable\_sending\_operations\_ratio\_time\_aggregator | Timeframe for the GCP Pub/Sub Unavailable Sending Operations Ratio monitor | `string` | `"sum"` | no |
| unavailable\_sending\_operations\_ratio\_timeframe | Timeframe for the GCP Pub/Sub Unavailable Sending Operations Ratio monitor | `string` | `"last_10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| sending\_operations\_count\_id | id for monitor sending\_operations\_count |
| unavailable\_sending\_operations\_count\_id | id for monitor unavailable\_sending\_operations\_count |
| unavailable\_sending\_operations\_ratio\_id | id for monitor unavailable\_sending\_operations\_ratio |

## Related documentation

* [GCP Pub/Sub Metrics](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-pubsub)
* [Datadog GCP Pub/Sub integration](https://docs.datadoghq.com/integrations/google_cloud_pubsub/)
