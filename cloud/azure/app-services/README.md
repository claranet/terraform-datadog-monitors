Azure AppServices (Web, API, Functions) DataDog monitors
========================================================

How to use this module
----------------------

```
module "datadog-monitors-azure-app-services" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/app-services?ref={revision}"

  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :

* Response time
* Memory usage count
* HTTP 5xx requests
* HTTP 4xx requests
* HTTP 2xx requests

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `600` | no |
| environment | Architecture environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| http_4xx_requests_message | Custom message for App Services 4xx requests monitor | string | `` | no |
| http_4xx_requests_silenced | Groups to mute for App Services 4xx requests monitor | map | `<map>` | no |
| http_4xx_requests_threshold_critical | Maximum critical acceptable percent of 4xx errors | string | `90` | no |
| http_4xx_requests_threshold_warning | Warning regarding acceptable percent of 4xx errors | string | `50` | no |
| http_5xx_requests_message | Custom message for App Services 5xx requests monitor | string | `` | no |
| http_5xx_requests_silenced | Groups to mute for App Services 5xx requests monitor | map | `<map>` | no |
| http_5xx_requests_threshold_critical | Maximum critical acceptable percent of 5xx errors | string | `90` | no |
| http_5xx_requests_threshold_warning | Warning regarding acceptable percent of 5xx errors | string | `50` | no |
| http_successful_requests_message | Custom message for App Services successful requests monitor | string | `` | no |
| http_successful_requests_silenced | Groups to mute for App Services successful requests monitor | map | `<map>` | no |
| http_successful_requests_threshold_critical | Minimum critical acceptable percent of 2xx & 3xx requests | string | `10` | no |
| http_successful_requests_threshold_warning | Warning regarding acceptable percent of 2xx & 3xx requests | string | `30` | no |
| memory_usage_message | Custom message for App Services memory usage monitor | string | `` | no |
| memory_usage_silenced | Groups to mute for App Services memory usage monitor | map | `<map>` | no |
| memory_usage_threshold_critical | Alerting threshold in Mib | string | `1073741824` | no |
| memory_usage_threshold_warning | Warning threshold in MiB | string | `536870912` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| response_time_message | Custom message for App Services response time monitor | string | `` | no |
| response_time_silenced | Groups to mute for App Services response time monitor | map | `<map>` | no |
| response_time_threshold_critical | Alerting threshold for response time in seconds | string | `10` | no |
| response_time_threshold_warning | Warning threshold for response time in seconds | string | `5` | no |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_app_services](https://docs.datadoghq.com/integrations/azure_app_services)
