Azure AppServices (Web, API, Functions) DataDog monitors
========================================================

How to use this module
----------------------

```
module "datadog-monitors-azure-app-services" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/app-services?ref={revision}"

  message = "${module.datadog-message-alerting.alerting-message}"

  environment = "${var.environment}"
  client_name = "${var.client_name}"
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
| environment | Architecture environment | string | - | yes |
| http_2xx_status_rate_appserv_eval_delay |  | string | `600` | no |
| http_2xx_status_rate_escalation_message | A message to include with a re-notification. Supports the '@username' notification allowed elsewhere. | string | `Escalation message @pagerduty` | no |
| http_2xx_status_rate_include_tags | A boolean indicating whether notifications from this monitor will automatically insert its triggering tags into the title. Defaults to true. | string | `false` | no |
| http_2xx_status_rate_last_time_window_code | Query time window code, can be: 1h|4h|1d|2d|1w|1m|3m... to write last_#m (1, 5, 10, 15, or 30), last_#h (1, 2, or 4), or last_#d (1 or 2) | string | `5m` | no |
| http_2xx_status_rate_limit | ################################ ##   HTTP 202 status pages   ### ################################ | string | `30` | no |
| http_2xx_status_rate_renotify_interval | The number of minutes after the last notification before a monitor will re-notify on the current status. It will only re-notify if it's not resolved. | string | `0` | no |
| http_2xx_status_rate_require_full_window | A boolean indicating whether this monitor needs a full window of data before it's evaluated. We highly recommend you set this to False for sparse metrics, otherwise some evaluations will be skipped. Default: True for 'on average', 'at all times' and 'in total' aggregation. False otherwise. | string | `true` | no |
| http_2xx_status_rate_tags | A list of tags to associate with your monitor. This can help you categorize and filter monitors in the manage monitors page of the UI. Note: it's not currently possible to filter by these tags when querying via the API | string | `<list>` | no |
| http_2xx_status_rate_threshold_critical | Alerting threshold (percentage) | string | `0.9` | no |
| http_2xx_status_rate_threshold_warning | Warning threshold (percentage) | string | `0.95` | no |
| http_2xx_status_rate_timeout_h | The number of hours of the monitor not reporting data before it will automatically resolve from a triggered state. Defaults to false. | string | `false` | no |
| http_404_errors_count_rate_appserv_eval_delay |  | string | `600` | no |
| http_404_errors_count_rate_escalation_message | A message to include with a re-notification. Supports the '@username' notification allowed elsewhere. | string | `Escalation message @pagerduty` | no |
| http_404_errors_count_rate_include_tags | A boolean indicating whether notifications from this monitor will automatically insert its triggering tags into the title. Defaults to true. | string | `false` | no |
| http_404_errors_count_rate_last_time_window_code | Query time window code, can be: 1h|4h|1d|2d|1w|1m|3m... to write last_#m (1, 5, 10, 15, or 30), last_#h (1, 2, or 4), or last_#d (1 or 2) | string | `5m` | no |
| http_404_errors_count_rate_limit | ################################ ##   HTTP 404 status pages   ### ################################ | string | `30` | no |
| http_404_errors_count_rate_renotify_interval | The number of minutes after the last notification before a monitor will re-notify on the current status. It will only re-notify if it's not resolved. | string | `0` | no |
| http_404_errors_count_rate_require_full_window | A boolean indicating whether this monitor needs a full window of data before it's evaluated. We highly recommend you set this to False for sparse metrics, otherwise some evaluations will be skipped. Default: True for 'on average', 'at all times' and 'in total' aggregation. False otherwise. | string | `true` | no |
| http_404_errors_count_rate_tags | A list of tags to associate with your monitor. This can help you categorize and filter monitors in the manage monitors page of the UI. Note: it's not currently possible to filter by these tags when querying via the API | string | `<list>` | no |
| http_404_errors_count_rate_threshold_critical | Alerting threshold (number of requests) | string | `30` | no |
| http_404_errors_count_rate_threshold_warning | Warning threshold (number of requests) | string | `10` | no |
| http_404_errors_count_rate_timeout_h | The number of hours of the monitor not reporting data before it will automatically resolve from a triggered state. Defaults to false. | string | `false` | no |
| memory_usage_appserv_eval_delay | ################################## ##   MEMORY USAGE VARIABLES   ### ################################## | string | `600` | no |
| memory_usage_escalation_message | A message to include with a re-notification. Supports the '@username' notification allowed elsewhere. | string | `Escalation message @pagerduty` | no |
| memory_usage_include_tags | A boolean indicating whether notifications from this monitor will automatically insert its triggering tags into the title. Defaults to true. | string | `false` | no |
| memory_usage_last_time_window_code | Query time window code, can be: 1h|4h|1d|2d|1w|1m|3m... to write last_#m (1, 5, 10, 15, or 30), last_#h (1, 2, or 4), or last_#d (1 or 2) | string | `5m` | no |
| memory_usage_renotify_interval | The number of minutes after the last notification before a monitor will re-notify on the current status. It will only re-notify if it's not resolved. | string | `0` | no |
| memory_usage_require_full_window | A boolean indicating whether this monitor needs a full window of data before it's evaluated. We highly recommend you set this to False for sparse metrics, otherwise some evaluations will be skipped. Default: True for 'on average', 'at all times' and 'in total' aggregation. False otherwise. | string | `false` | no |
| memory_usage_tags | A list of tags to associate with your monitor. This can help you categorize and filter monitors in the manage monitors page of the UI. Note: it's not currently possible to filter by these tags when querying via the API | string | `<list>` | no |
| memory_usage_threshold_critical | Alerting threshold in Mib | string | `52430000` | no |
| memory_usage_threshold_warning | Warning threshold in MiB | string | `33550000` | no |
| memory_usage_timeout_h | The number of hours of the monitor not reporting data before it will automatically resolve from a triggered state. Defaults to false. | string | `false` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| response_time_appserv_eval_delay | Delay in seconds for the metric evaluation | string | `600` | no |
| response_time_escalation_message | A message to include with a re-notification. Supports the '@username' notification allowed elsewhere. | string | `Escalation message @pagerduty` | no |
| response_time_include_tags | A boolean indicating whether notifications from this monitor will automatically insert its triggering tags into the title. Defaults to true. | string | `false` | no |
| response_time_last_time_window_code | Query time window code, can be: 1h|4h|1d|2d|1w|1m|3m... to write last_#m (1, 5, 10, 15, or 30), last_#h (1, 2, or 4), or last_#d (1 or 2) | string | `1h` | no |
| response_time_renotify_interval | The number of minutes after the last notification before a monitor will re-notify on the current status. It will only re-notify if it's not resolved. | string | `0` | no |
| response_time_require_full_window | A boolean indicating whether this monitor needs a full window of data before it's evaluated. We highly recommend you set this to False for sparse metrics, otherwise some evaluations will be skipped. Default: True for 'on average', 'at all times' and 'in total' aggregation. False otherwise. | string | `false` | no |
| response_time_tags | A list of tags to associate with your monitor. This can help you categorize and filter monitors in the manage monitors page of the UI. Note: it's not currently possible to filter by these tags when querying via the API | string | `<list>` | no |
| response_time_threshold_critical | Alerting threshold in seconds | string | `0.8` | no |
| response_time_threshold_warning | Warning threshold in seconds | string | `0.4` | no |
| response_time_timeout_h | The number of hours of the monitor not reporting data before it will automatically resolve from a triggered state. Defaults to false. | string | `false` | no |
| use_filter_tags | Filter the data with service tags if true | string | `true` | no |


Related documentation
---------------------

DataDog documentation: https://docs.datadoghq.com/integrations/azure_app_services
