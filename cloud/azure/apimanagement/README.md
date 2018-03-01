Azure API Management Datadog monitors
=====================================

How to use this module
----------------------
```
module "datadog-monitors-azure-apimanagement" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/apimanagement?ref={revision}"

  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

Purpose
-------
Creates Datadog monitors with the following checks :

* Service status
* Failed requests ratio
* Other requests ratio
* Unauthorized requests ratio
* Successful requests ratio

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `600` | no |
| environment | Architecture environment | string | - | yes |
| failed_requests_message | Custom message for API Management failed requests monitor | string | `` | no |
| failed_requests_silenced | Groups to mute for API Management failed requests monitor | map | `<map>` | no |
| failed_requests_threshold_critical | Maximum acceptable percent of failed requests | string | `90` | no |
| failed_requests_threshold_warning | Warning regarding acceptable percent of failed requests | string | `50` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| message | Message sent when a Redis monitor is triggered | string | - | yes |
| other_requests_message | Custom message for API Management other requests monitor | string | `` | no |
| other_requests_silenced | Groups to mute for API Management other requests monitor | map | `<map>` | no |
| other_requests_threshold_critical | Maximum acceptable percent of other requests | string | `90` | no |
| other_requests_threshold_warning | Warning regarding acceptable percent of other requests | string | `50` | no |
| status_message | Custom message for API Management status monitor | string | `` | no |
| status_silenced | Groups to mute for API Management status monitor | map | `<map>` | no |
| successful_requests_message | Custom message for API Management successful requests monitor | string | `` | no |
| successful_requests_silenced | Groups to mute for API Management successful requests monitor | map | `<map>` | no |
| successful_requests_threshold_critical | Minimum acceptable percent of successful requests | string | `10` | no |
| successful_requests_threshold_warning | Warning regarding acceptable percent of successful requests | string | `30` | no |
| unauthorized_requests_message | Custom message for API Management unauthorized requests monitor | string | `` | no |
| unauthorized_requests_silenced | Groups to mute for API Management unauthorized requests monitor | map | `<map>` | no |
| unauthorized_requests_threshold_critical | Maximum acceptable percent of unauthorized requests | string | `90` | no |
| unauthorized_requests_threshold_warning | Warning regarding acceptable percent of unauthorized requests | string | `50` | no |

Related documentation
---------------------

Azure API Management metrics documentation: [https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-use-azure-monitor](https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-use-azure-monitor)
