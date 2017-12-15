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
| http_2xx_requests_threshold_critical | Minimum critical acceptable percent of 2xx requests | string | `90` | no |
| http_2xx_requests_threshold_warning | Minimum warning acceptable percent of 2xx requests | string | `95` | no |
| http_4xx_requests_threshold_critical | Maximum critical acceptable percent of 4xx errors | string | `40` | no |
| http_4xx_requests_threshold_warning | Maximum warning acceptable percent of 4xx errors | string | `30` | no |
| http_5xx_requests_threshold_critical | Maximum critical acceptable percent of 5xx errors | string | `40` | no |
| http_5xx_requests_threshold_warning | Maximum warning acceptable percent of 5xx errors | string | `30` | no |
| memory_usage_threshold_critical | Alerting threshold in Mib | string | `52430000` | no |
| memory_usage_threshold_warning | Warning threshold in MiB | string | `33550000` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| response_time_threshold_critical | Alerting threshold in seconds | string | `0.8` | no |
| response_time_threshold_warning | Warning threshold in seconds | string | `0.4` | no |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_app_services](https://docs.datadoghq.com/integrations/azure_app_services)
