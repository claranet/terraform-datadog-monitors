# CLOUD GCP PUBSUB DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-gcp-pubsub" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/datadog/terraform/monitors.git//cloud/gcp/pubsub?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- GCP pubsub sending messages operations
- GCP pubsub sending messages with result unavailable

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture environment | string | n/a | yes |
| evaluation\_delay | Delay in seconds for the metric evaluation | string | `"900"` | no |
| filter\_tags | Tags used for filtering | string | `"*"` | no |
| message | Message sent when a monitor is triggered | string | n/a | yes |
| new\_host\_delay | Delay in seconds for the new host evaluation | string | `"300"` | no |
| sending\_operations\_count\_enabled | Flag to enable GCP Pub/Sub Unavailable Sending Operations Count monitor | string | `"true"` | no |
| sending\_operations\_count\_extra\_tags | Extra tags for GCP Pub/Sub Sending Operations Count monitor | list | `[]` | no |
| sending\_operations\_count\_message | Custom message for the GCP Pub/Sub Sending Operations Count monitor | string | `""` | no |
| sending\_operations\_count\_silenced | Groups to mute for GCP Pub/Sub Sending Operations Count monitor | map | `{}` | no |
| sending\_operations\_count\_threshold\_critical | Critical threshold for the number of sending operations. | string | `"0"` | no |
| sending\_operations\_count\_time\_aggregator | Timeframe for the GCP Pub/Sub Sending Operations Count monitor | string | `"sum"` | no |
| sending\_operations\_count\_timeframe | Timeframe for the GCP Pub/Sub Sending Operations Count monitor | string | `"last_30m"` | no |
| unavailable\_sending\_operations\_count\_enabled | Flag to enable GCP Pub/Sub Unavailable Sending Operations Count monitor | string | `"true"` | no |
| unavailable\_sending\_operations\_count\_extra\_tags | Extra tags for GCP Pub/Sub Unavailable Sending Operations Count monitor | list | `[]` | no |
| unavailable\_sending\_operations\_count\_message | Custom message for the GCP Pub/Sub Unavailable Sending Operations Count monitor | string | `""` | no |
| unavailable\_sending\_operations\_count\_silenced | Groups to mute for GCP Pub/Sub Unavailable Sending Operations Count monitor | map | `{}` | no |
| unavailable\_sending\_operations\_count\_threshold\_critical | Critical threshold for the number of unavailable sending operations | string | `"4"` | no |
| unavailable\_sending\_operations\_count\_threshold\_warning | Warning threshold for the number of unavailable sending operations | string | `"2"` | no |
| unavailable\_sending\_operations\_count\_time\_aggregator | Timeframe for the GCP Pub/Sub Unavailable Sending Operations Count monitor | string | `"sum"` | no |
| unavailable\_sending\_operations\_count\_timeframe | Timeframe for the GCP Pub/Sub Unavailable Sending Operations Count monitor | string | `"last_10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| sending\_operations\_count\_id | id for monitor sending_operations_count |
| unavailable\_sending\_operations\_count\_id | id for monitor unavailable_sending_operations_count |

Related documentation
------------

* [GCP Pub/Sub Metrics](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-pubsub)
* [Datadog GCP Pub/Sub integration](https://docs.datadoghq.com/integrations/google_cloud_pubsub/)
