# CLOUD AZURE APIMANAGEMENT DataDog monitors

## How to use this module

```
module "datadog-monitors-cloud-azure-apimanagement" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/apimanagement?ref={revision}"

  environment = "${var.environment}"
  message     = "${module.datadog-message-alerting.alerting-message}"
}

```

## Purpose

Creates DataDog monitors with the following checks:

- API Management is down
- API Management too many failed requests
- API Management too many other requests
- API Management too many unauthorized requests
- API Management successful requests rate too low

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Architecture environment | string | - | yes |
| evaluation_delay | Delay in seconds for the metric evaluation | string | `900` | no |
| failed_requests_extra_tags | Extra tags for API Management failed requests monitor | list | `<list>` | no |
| failed_requests_message | Custom message for API Management failed requests monitor | string | `` | no |
| failed_requests_silenced | Groups to mute for API Management failed requests monitor | map | `<map>` | no |
| failed_requests_threshold_critical | Maximum acceptable percent of failed requests | string | `90` | no |
| failed_requests_threshold_warning | Warning regarding acceptable percent of failed requests | string | `50` | no |
| failed_requests_timeframe | Monitor timeframe for API Management failed requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when a Redis monitor is triggered | string | - | yes |
| new_host_delay | Delay in seconds before monitor new resource | string | `300` | no |
| other_requests_extra_tags | Extra tags for API Management other requests monitor | list | `<list>` | no |
| other_requests_message | Custom message for API Management other requests monitor | string | `` | no |
| other_requests_silenced | Groups to mute for API Management other requests monitor | map | `<map>` | no |
| other_requests_threshold_critical | Maximum acceptable percent of other requests | string | `90` | no |
| other_requests_threshold_warning | Warning regarding acceptable percent of other requests | string | `50` | no |
| other_requests_timeframe | Monitor timeframe for API Management other requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| status_extra_tags | Extra tags for API Management status monitor | list | `<list>` | no |
| status_message | Custom message for API Management status monitor | string | `` | no |
| status_silenced | Groups to mute for API Management status monitor | map | `<map>` | no |
| status_time_aggregator | Monitor aggregator for API Management status [available values: min, max or avg] | string | `max` | no |
| status_timeframe | Monitor timeframe for API Management status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| successful_requests_extra_tags | Extra tags for API Management successful requests monitor | list | `<list>` | no |
| successful_requests_message | Custom message for API Management successful requests monitor | string | `` | no |
| successful_requests_silenced | Groups to mute for API Management successful requests monitor | map | `<map>` | no |
| successful_requests_threshold_critical | Minimum acceptable percent of successful requests | string | `10` | no |
| successful_requests_threshold_warning | Warning regarding acceptable percent of successful requests | string | `30` | no |
| successful_requests_timeframe | Monitor timeframe for API Management successful requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |
| unauthorized_requests_extra_tags | Extra tags for API Management unauthorized requests monitor | list | `<list>` | no |
| unauthorized_requests_message | Custom message for API Management unauthorized requests monitor | string | `` | no |
| unauthorized_requests_silenced | Groups to mute for API Management unauthorized requests monitor | map | `<map>` | no |
| unauthorized_requests_threshold_critical | Maximum acceptable percent of unauthorized requests | string | `90` | no |
| unauthorized_requests_threshold_warning | Warning regarding acceptable percent of unauthorized requests | string | `50` | no |
| unauthorized_requests_timeframe | Monitor timeframe for API Management unauthorized requests [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`] | string | `last_5m` | no |

## Outputs

| Name | Description |
|------|-------------|
| apimgt_failed_requests_id | id for monitor apimgt_failed_requests |
| apimgt_other_requests_id | id for monitor apimgt_other_requests |
| apimgt_status_id | id for monitor apimgt_status |
| apimgt_successful_requests_id | id for monitor apimgt_successful_requests |
| apimgt_unauthorized_requests_id | id for monitor apimgt_unauthorized_requests |

## Related documentation

Azure API Management metrics documentation: [https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-use-azure-monitor](https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-use-azure-monitor)
