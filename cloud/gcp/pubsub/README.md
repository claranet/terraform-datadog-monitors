# CLOUD GCP PUBSUB DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-gcp-pubsub" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/gcp/pubsub?ref={revision}"

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
| environment | Architecture environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `900` | no |
| filter_tags | Tags used for filtering | string | `*` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| new_host_delay | Delay in seconds for the new host evaluation | string | `300` | no |
| sending_operations_count_extra_tags | Extra tags for GCP Pub/Sub Sending Operations Count monitor | list | `<list>` | no |
| sending_operations_count_message | Custom message for the GCP Pub/Sub Sending Operations Count monitor | string | `` | no |
| sending_operations_count_silenced | Groups to mute for GCP Pub/Sub Sending Operations Count monitor | map | `<map>` | no |
| sending_operations_count_threshold_critical | Critical threshold for the number of sending operations. | string | `0` | no |
| sending_operations_count_time_aggregator | Timeframe for the GCP Pub/Sub Sending Operations Count monitor | string | `sum` | no |
| sending_operations_count_timeframe | Timeframe for the GCP Pub/Sub Sending Operations Count monitor | string | `last_30m` | no |
| unavailable_sending_operations_count_extra_tags | Extra tags for GCP Pub/Sub Unavailable Sending Operations Count monitor | list | `<list>` | no |
| unavailable_sending_operations_count_message | Custom message for the GCP Pub/Sub Unavailable Sending Operations Count monitor | string | `` | no |
| unavailable_sending_operations_count_silenced | Groups to mute for GCP Pub/Sub Unavailable Sending Operations Count monitor | map | `<map>` | no |
| unavailable_sending_operations_count_threshold_critical | Critical threshold for the number of unavailable sending operations | string | `4` | no |
| unavailable_sending_operations_count_threshold_warning | Warning threshold for the number of unavailable sending operations | string | `2` | no |
| unavailable_sending_operations_count_time_aggregator | Timeframe for the GCP Pub/Sub Unavailable Sending Operations Count monitor | string | `sum` | no |
| unavailable_sending_operations_count_timeframe | Timeframe for the GCP Pub/Sub Unavailable Sending Operations Count monitor | string | `last_10m` | no |

## Outputs

| Name | Description |
|------|-------------|
| sending_operations_count_id | id for monitor sending_operations_count |
| unavailable_sending_operations_count_id | id for monitor unavailable_sending_operations_count |

Related documentation
------------

* [GCP Pub/Sub Metrics](https://cloud.google.com/monitoring/api/metrics_gcp#gcp-pubsub)
* [Datadog GCP Pub/Sub integration](https://docs.datadoghq.com/integrations/google_cloud_pubsub/)
