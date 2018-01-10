Azure monitors
==============

How to use this module
----------------------

```
module "datadog-monitors-azure" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure?ref={revision}"

  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

Purpose
-------
Creates a set of Azure DataDog monitors for the following components :

* Azure App Services monitors
* Azure SQL monitors
* Azure Redis monitors
* Azure Event Hub monitors
* Azure Stream Analytics monitors
* Azure Storage monitors
* Azure IOT Hub monitors
* Azure API Management monitors

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| apimanagement_failed_requests_threshold_critical | Maximum acceptable percent of failed requests | string | `5` | no |
| apimanagement_other_requests_threshold_critical | Maximum acceptable percent of other requests | string | `5` | no |
| apimanagement_successful_requests_threshold_critical | Minimum acceptable percent of successful requests | string | `90` | no |
| apimanagement_unauthorized_requests_threshold_critical | Maximum acceptable percent of unauthorized requests | string | `5` | no |
| appservices_http_successful_requests_threshold_critical | Minimum critical acceptable percent of 2xx & 3xx requests | string | `90` | no |
| appservices_http_successful_requests_threshold_warning | Minimum warning acceptable percent of 2xx & 3xx requests | string | `95` | no |
| appservices_http_4xx_requests_threshold_critical | Maximum critical acceptable percent of 4xx errors | string | `30` | no |
| appservices_http_4xx_requests_threshold_warning | Maximum warning acceptable percent of 4xx errors | string | `15` | no |
| appservices_http_5xx_requests_threshold_critical | Maximum critical acceptable percent of 5xx errors | string | `20` | no |
| appservices_http_5xx_requests_threshold_warning | Maximum warning acceptable percent of 5xx errors | string | `10` | no |
| appservices_memory_usage_threshold_critical | Alerting threshold in Mib | string | `52430000` | no |
| appservices_memory_usage_threshold_warning | Warning threshold in MiB | string | `33550000` | no |
| appservices_response_time_threshold_critical | Alerting threshold in seconds | string | `0.8` | no |
| appservices_response_time_threshold_warning | Warning threshold in seconds | string | `0.4` | no |
| delay | Delay in seconds for the metric evaluation | string | `600` | no |
| environment | Architecture environment | string | - | yes |
| eventhub_errors_rate_thresold_critical | Errors ratio (percentage) to trigger the critical alert | string | `3` | no |
| eventhub_errors_rate_thresold_warning | Errors ratio (percentage) to trigger a warning alert | string | `1` | no |
| eventhub_failed_requests_rate_thresold_critical | Failed requests ratio (percentage) to trigger the critical alert | string | `3` | no |
| eventhub_failed_requests_rate_thresold_warning | Failed requests ratio (percentage) to trigger a warning alert | string | `1` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| iothub_dropped_d2c_telemetry_egress_threshold_critical | D2C Telemetry Dropped limit (critical threshold) | string | `1000` | no |
| iothub_dropped_d2c_telemetry_egress_threshold_warning | D2C Telemetry Dropped limit (warning threshold) | string | `500` | no |
| iothub_failed_c2d_methods_rate_threshold_critical | C2D Methods Failed rate limit (critical threshold) | string | `10` | no |
| iothub_failed_c2d_methods_rate_threshold_warning | C2D Methods Failed rate limit (warning threshold) | string | `0` | no |
| iothub_failed_c2d_twin_read_rate_threshold_critical | C2D Twin Read Failed rate limit (critical threshold) | string | `10` | no |
| iothub_failed_c2d_twin_read_rate_threshold_warning | C2D Twin Read Failed rate limit (warning threshold) | string | `0` | no |
| iothub_failed_c2d_twin_update_rate_threshold_critical | C2D Twin Update Failed rate limit (critical threshold) | string | `10` | no |
| iothub_failed_c2d_twin_update_rate_threshold_warning | C2D Twin Update Failed rate limit (warning threshold) | string | `0` | no |
| iothub_failed_d2c_twin_read_rate_threshold_critical | D2C Twin Read Failed rate limit (critical threshold) | string | `10` | no |
| iothub_failed_d2c_twin_read_rate_threshold_warning | D2C Twin Read Failed rate limit (warning threshold) | string | `0` | no |
| iothub_failed_d2c_twin_update_rate_threshold_critical | D2C Twin Update Failed rate limit (critical threshold) | string | `10` | no |
| iothub_failed_d2c_twin_update_rate_threshold_warning | D2C Twin Update Failed rate limit (warning threshold) | string | `0` | no |
| iothub_failed_jobs_rate_threshold_critical | Jobs Failed rate limit (critical threshold) | string | `10` | no |
| iothub_failed_jobs_rate_threshold_warning | Jobs Failed rate limit (warning threshold) | string | `0` | no |
| iothub_failed_listjobs_rate_threshold_critical | ListJobs Failed rate limit (critical threshold) | string | `10` | no |
| iothub_failed_listjobs_rate_threshold_warning | ListJobs Failed rate limit (warning threshold) | string | `0` | no |
| iothub_failed_queryjobs_rate_threshold_critical | QueryJobs Failed rate limit (critical threshold) | string | `10` | no |
| iothub_failed_queryjobs_rate_threshold_warning | QueryJobs Failed rate limit (warning threshold) | string | `0` | no |
| iothub_fallback_d2c_telemetry_egress_threshold_critical | D2C Telemetry Fallback limit (critical threshold) | string | `1000` | no |
| iothub_fallback_d2c_telemetry_egress_threshold_warning | D2C Telemetry Fallback limit (warning threshold) | string | `500` | no |
| iothub_invalid_d2c_telemetry_egress_threshold_critical | D2C Telemetry Invalid limit (critical threshold) | string | `1000` | no |
| iothub_invalid_d2c_telemetry_egress_threshold_warning | D2C Telemetry Invalid limit (warning threshold) | string | `500` | no |
| iothub_orphaned_d2c_telemetry_egress_threshold_critical | D2C Telemetry Orphaned limit (critical threshold) | string | `1000` | no |
| iothub_orphaned_d2c_telemetry_egress_threshold_warning | D2C Telemetry Orphaned limit (warning threshold) | string | `500` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| non_taggable_filter_tags | Tags used for filtering for components without tag support | string | `*` | no |
| redis_evictedkeys_limit_threshold_critical | Evicted keys limit (critical threshold) | string | `100` | no |
| redis_evictedkeys_limit_threshold_warning | Evicted keys limit (warning threshold) | string | `0` | no |
| redis_percent_processor_time_threshold_critical | Processor time percent (critical threshold) | string | `80` | no |
| redis_percent_processor_time_threshold_warning | Processor time percent (warning threshold) | string | `60` | no |
| redis_server_load_rate_threshold_critical | Server CPU load rate (critical threshold) | string | `90` | no |
| redis_server_load_rate_threshold_warning | Server CPU load rate (warning threshold) | string | `70` | no |
| sqldatabase_cpu_threshold_critical | CPU usage in percent (critical threshold) | string | `90` | no |
| sqldatabase_cpu_threshold_warning | CPU usage in percent (warning threshold) | string | `80` | no |
| sqldatabase_deadlock_threshold_critical | Amount of Deadlocks (critical threshold) | string | `1` | no |
| sqldatabase_diskspace_threshold_critical | Disk space used in percent (critical threshold) | string | `90` | no |
| sqldatabase_diskspace_threshold_warning | Disk space used in percent (warning threshold) | string | `80` | no |
| sqldatabase_dtu_threshold_critical | Amount of DTU used (critical threshold) | string | `90` | no |
| sqldatabase_dtu_threshold_warning | Amount of DTU used (warning threshold) | string | `85` | no |
| storage_authorization_error_requests_threshold_critical | Maximum acceptable percent of authorization error requests for a storage | string | `15` | no |
| storage_availability_threshold_critical | Minimum acceptable percent of availability for a storage | string | `90` | no |
| storage_client_other_error_requests_threshold_critical | Maximum acceptable percent of client other error requests for a storage | string | `15` | no |
| storage_latency_threshold_critical | Maximum acceptable end to end latency (ms) for a storage | string | `1000` | no |
| storage_network_error_requests_threshold_critical | Maximum acceptable percent of network error requests for a storage | string | `5` | no |
| storage_server_other_error_requests_threshold_critical | Maximum acceptable percent of server other error requests for a storage | string | `10` | no |
| storage_successful_requests_threshold_critical | Minimum acceptable percent of successful requests for a storage | string | `90` | no |
| storage_throttling_error_requests_threshold_critical | Maximum acceptable percent of throttling error requests for a storage | string | `10` | no |
| storage_timeout_error_requests_threshold_critical | Maximum acceptable percent of timeout error requests for a storage | string | `5` | no |
| streamanalytics_conversion_errors_threshold_critical | Conversion errors limit (critical threshold) | string | `10` | no |
| streamanalytics_conversion_errors_threshold_warning | Conversion errors limit (warning threshold) | string | `0` | no |
| streamanalytics_failed_function_requests_threshold_critical | Failed Function Request rate limit (critical threshold) | string | `10` | no |
| streamanalytics_function_requests_threshold_warning | Failed Function Request rate limit (warning threshold) | string | `0` | no |
| streamanalytics_runtime_errors_threshold_critical | Runtime errors limit (critical threshold) | string | `10` | no |
| streamanalytics_runtime_errors_threshold_warning | Runtime errors limit (warning threshold) | string | `0` | no |
| streamanalytics_su_utilization_threshold_critical | Streaming Unit utilization rate limit (critical threshold) | string | `80` | no |
| streamanalytics_su_utilization_threshold_warning | Streaming Unit utilization rate limit (warning threshold) | string | `60` | no |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)

Azure metrics documentation: [https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-metrics](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-metrics)
