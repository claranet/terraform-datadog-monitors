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
* HTTP 404 errors
* HTTP 50x errors
* HTTP 20x rate

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `600` | no |
| environment | Architecture environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| http_2xx_status_rate_limit |  | string | `30` | no |
| http_2xx_status_rate_threshold_critical | Alerting threshold (percentage) | string | `0.9` | no |
| http_2xx_status_rate_threshold_warning | Warning threshold (percentage) | string | `0.95` | no |
| http_404_errors_count_rate_limit |  | string | `30` | no |
| http_404_errors_count_rate_threshold_critical | Alerting threshold (number of requests) | string | `30` | no |
| http_404_errors_count_rate_threshold_warning | Warning threshold (number of requests) | string | `10` | no |
| memory_usage_threshold_critical | Alerting threshold in Mib | string | `52430000` | no |
| memory_usage_threshold_warning | Warning threshold in MiB | string | `33550000` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| response_time_threshold_critical | Alerting threshold in seconds | string | `0.8` | no |
| response_time_threshold_warning | Warning threshold in seconds | string | `0.4` | no |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_app_services](https://docs.datadoghq.com/integrations/azure_app_services)
