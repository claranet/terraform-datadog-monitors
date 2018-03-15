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
| apimanagement_failed_requests_message | Custom message for API Management failed requests monitor | string | `` | no |
| apimanagement_failed_requests_silenced | Groups to mute for API Management failed requests monitor | map | `<map>` | no |
| apimanagement_failed_requests_threshold_critical | Maximum acceptable percent of failed requests | string | `90` | no |
| apimanagement_failed_requests_threshold_warning | Warning regarding acceptable percent of failed requests | string | `50` | no |
| apimanagement_other_requests_message | Custom message for API Management other requests monitor | string | `` | no |
| apimanagement_other_requests_silenced | Groups to mute for API Management other requests monitor | map | `<map>` | no |
| apimanagement_other_requests_threshold_critical | Maximum acceptable percent of other requests | string | `90` | no |
| apimanagement_other_requests_threshold_warning | Warning regarding acceptable percent of other requests | string | `50` | no |
| apimanagement_status_message | Custom message for API Management status monitor | string | `` | no |
| apimanagement_status_silenced | Groups to mute for API Management status monitor | map | `<map>` | no |
| apimanagement_successful_requests_message | Custom message for API Management successful requests monitor | string | `` | no |
| apimanagement_successful_requests_silenced | Groups to mute for API Management successful requests monitor | map | `<map>` | no |
| apimanagement_successful_requests_threshold_critical | Minimum acceptable percent of successful requests | string | `10` | no |
| apimanagement_successful_requests_threshold_warning | Warning regarding acceptable percent of successful requests | string | `30` | no |
| apimanagement_unauthorized_requests_message | Custom message for API Management unauthorized requests monitor | string | `` | no |
| apimanagement_unauthorized_requests_silenced | Groups to mute for API Management unauthorized requests monitor | map | `<map>` | no |
| apimanagement_unauthorized_requests_threshold_critical | Maximum acceptable percent of unauthorized requests | string | `90` | no |
| apimanagement_unauthorized_requests_threshold_warning | Warning regarding acceptable percent of unauthorized requests | string | `50` | no |
| appservices_http_4xx_requests_message | Custom message for App Services 4xx requests monitor | string | `` | no |
| appservices_http_4xx_requests_silenced | Groups to mute for App Services 4xx requests monitor | map | `<map>` | no |
| appservices_http_4xx_requests_threshold_critical | Maximum critical acceptable percent of 4xx errors | string | `90` | no |
| appservices_http_4xx_requests_threshold_warning | Warning regarding acceptable percent of 4xx errors | string | `50` | no |
| appservices_http_5xx_requests_message | Custom message for App Services 5xx requests monitor | string | `` | no |
| appservices_http_5xx_requests_silenced | Groups to mute for App Services 5xx requests monitor | map | `<map>` | no |
| appservices_http_5xx_requests_threshold_critical | Maximum critical acceptable percent of 5xx errors | string | `90` | no |
| appservices_http_5xx_requests_threshold_warning | Warning regarding acceptable percent of 5xx errors | string | `50` | no |
| appservices_http_successful_requests_message | Custom message for App Services successful requests monitor | string | `` | no |
| appservices_http_successful_requests_silenced | Groups to mute for App Services successful requests monitor | map | `<map>` | no |
| appservices_http_successful_requests_threshold_critical | Minimum critical acceptable percent of 2xx & 3xx requests | string | `10` | no |
| appservices_http_successful_requests_threshold_warning | Warning regarding acceptable percent of 2xx & 3xx requests | string | `30` | no |
| appservices_memory_usage_message | Custom message for App Services memory usage monitor | string | `` | no |
| appservices_memory_usage_silenced | Groups to mute for App Services memory usage monitor | map | `<map>` | no |
| appservices_memory_usage_threshold_critical | Alerting threshold in Mib | string | `1073741824` | no |
| appservices_memory_usage_threshold_warning | Warning threshold in MiB | string | `536870912` | no |
| appservices_response_time_message | Custom message for App Services response time monitor | string | `` | no |
| appservices_response_time_silenced | Groups to mute for App Services response time monitor | map | `<map>` | no |
| appservices_response_time_threshold_critical | Alerting threshold for response time in seconds | string | `10` | no |
| appservices_response_time_threshold_warning | Warning threshold for response time in seconds | string | `5` | no |
| delay | Delay in seconds for the metric evaluation | string | `600` | no |
| environment | Architecture environment | string | - | yes |
| eventhub_errors_rate_message | Custom message for Event Hub errors monitor | string | `` | no |
| eventhub_errors_rate_silenced | Groups to mute for Event Hub errors monitor | map | `<map>` | no |
| eventhub_errors_rate_thresold_critical | Errors ratio (percentage) to trigger the critical alert | string | `90` | no |
| eventhub_errors_rate_thresold_warning | Errors ratio (percentage) to trigger a warning alert | string | `50` | no |
| eventhub_failed_requests_rate_message | Custom message for Event Hub failed requests monitor | string | `` | no |
| eventhub_failed_requests_rate_silenced | Groups to mute for Event Hub failed requests monitor | map | `<map>` | no |
| eventhub_failed_requests_rate_thresold_critical | Failed requests ratio (percentage) to trigger the critical alert | string | `90` | no |
| eventhub_failed_requests_rate_thresold_warning | Failed requests ratio (percentage) to trigger a warning alert | string | `50` | no |
| eventhub_status_message | Custom message for Event Hub status monitor | string | `` | no |
| eventhub_status_silenced | Groups to mute for Event Hub status monitor | map | `<map>` | no |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| iothub_dropped_d2c_telemetry_egress_message | Custom message for IoT Hub dropped d2c telemetry monitor | string | `` | no |
| iothub_dropped_d2c_telemetry_egress_silenced | Groups to mute for IoT Hub dropped d2c telemetry monitor | map | `<map>` | no |
| iothub_dropped_d2c_telemetry_egress_threshold_critical | D2C Telemetry Dropped limit (critical threshold) | string | `1000` | no |
| iothub_dropped_d2c_telemetry_egress_threshold_warning | D2C Telemetry Dropped limit (warning threshold) | string | `500` | no |
| iothub_failed_c2d_methods_rate_message | Custom message for IoT Hub failed c2d method monitor | string | `` | no |
| iothub_failed_c2d_methods_rate_silenced | Groups to mute for IoT Hub failed c2d methods monitor | map | `<map>` | no |
| iothub_failed_c2d_methods_rate_threshold_critical | C2D Methods Failed rate limit (critical threshold) | string | `90` | no |
| iothub_failed_c2d_methods_rate_threshold_warning | C2D Methods Failed rate limit (warning threshold) | string | `50` | no |
| iothub_failed_c2d_twin_read_rate_message | Custom message for IoT Hub failed c2d twin read monitor | string | `` | no |
| iothub_failed_c2d_twin_read_rate_silenced | Groups to mute for IoT Hub failed c2d twin read monitor | map | `<map>` | no |
| iothub_failed_c2d_twin_read_rate_threshold_critical | C2D Twin Read Failed rate limit (critical threshold) | string | `90` | no |
| iothub_failed_c2d_twin_read_rate_threshold_warning | C2D Twin Read Failed rate limit (warning threshold) | string | `50` | no |
| iothub_failed_c2d_twin_update_rate_message | Custom message for IoT Hub failed c2d twin update monitor | string | `` | no |
| iothub_failed_c2d_twin_update_rate_silenced | Groups to mute for IoT Hub failed c2d twin update monitor | map | `<map>` | no |
| iothub_failed_c2d_twin_update_rate_threshold_critical | C2D Twin Update Failed rate limit (critical threshold) | string | `90` | no |
| iothub_failed_c2d_twin_update_rate_threshold_warning | C2D Twin Update Failed rate limit (warning threshold) | string | `50` | no |
| iothub_failed_d2c_twin_read_rate_message | Custom message for IoT Hub failed d2c twin read monitor | string | `` | no |
| iothub_failed_d2c_twin_read_rate_silenced | Groups to mute for IoT Hub failed d2c twin read monitor | map | `<map>` | no |
| iothub_failed_d2c_twin_read_rate_threshold_critical | D2C Twin Read Failed rate limit (critical threshold) | string | `90` | no |
| iothub_failed_d2c_twin_read_rate_threshold_warning | D2C Twin Read Failed rate limit (warning threshold) | string | `50` | no |
| iothub_failed_d2c_twin_update_rate_message | Custom message for IoT Hub failed d2c twin update monitor | string | `` | no |
| iothub_failed_d2c_twin_update_rate_silenced | Groups to mute for IoT Hub failed d2c twin update monitor | map | `<map>` | no |
| iothub_failed_d2c_twin_update_rate_threshold_critical | D2C Twin Update Failed rate limit (critical threshold) | string | `90` | no |
| iothub_failed_d2c_twin_update_rate_threshold_warning | D2C Twin Update Failed rate limit (warning threshold) | string | `50` | no |
| iothub_failed_jobs_rate_message | Custom message for IoT Hub failed jobs monitor | string | `` | no |
| iothub_failed_jobs_rate_silenced | Groups to mute for IoT Hub failed jobs monitor | map | `<map>` | no |
| iothub_failed_jobs_rate_threshold_critical | Jobs Failed rate limit (critical threshold) | string | `90` | no |
| iothub_failed_jobs_rate_threshold_warning | Jobs Failed rate limit (warning threshold) | string | `50` | no |
| iothub_failed_listjobs_rate_message | Custom message for IoT Hub failed list jobs monitor | string | `` | no |
| iothub_failed_listjobs_rate_silenced | Groups to mute for IoT Hub failed list jobs monitor | map | `<map>` | no |
| iothub_failed_listjobs_rate_threshold_critical | ListJobs Failed rate limit (critical threshold) | string | `90` | no |
| iothub_failed_listjobs_rate_threshold_warning | ListJobs Failed rate limit (warning threshold) | string | `50` | no |
| iothub_failed_queryjobs_rate_message | Custom message for IoT Hub failed query jobs monitor | string | `` | no |
| iothub_failed_queryjobs_rate_silenced | Groups to mute for IoT Hub failed query jobs monitor | map | `<map>` | no |
| iothub_failed_queryjobs_rate_threshold_critical | QueryJobs Failed rate limit (critical threshold) | string | `90` | no |
| iothub_failed_queryjobs_rate_threshold_warning | QueryJobs Failed rate limit (warning threshold) | string | `50` | no |
| iothub_fallback_d2c_telemetry_egress_message | Custom message for IoT Hub fallback d2c telemetry monitor | string | `` | no |
| iothub_fallback_d2c_telemetry_egress_silenced | Groups to mute for IoT Hub fallback d2c telemetry monitor | map | `<map>` | no |
| iothub_fallback_d2c_telemetry_egress_threshold_critical | D2C Telemetry Fallback limit (critical threshold) | string | `1000` | no |
| iothub_fallback_d2c_telemetry_egress_threshold_warning | D2C Telemetry Fallback limit (warning threshold) | string | `500` | no |
| iothub_invalid_d2c_telemetry_egress_message | Custom message for IoT Hub invalid d2c telemetry monitor | string | `` | no |
| iothub_invalid_d2c_telemetry_egress_silenced | Groups to mute for IoT Hub invalid d2c telemetry monitor | map | `<map>` | no |
| iothub_invalid_d2c_telemetry_egress_threshold_critical | D2C Telemetry Invalid limit (critical threshold) | string | `1000` | no |
| iothub_invalid_d2c_telemetry_egress_threshold_warning | D2C Telemetry Invalid limit (warning threshold) | string | `500` | no |
| iothub_orphaned_d2c_telemetry_egress_message | Custom message for IoT Hub orphaned d2c telemetry monitor | string | `` | no |
| iothub_orphaned_d2c_telemetry_egress_silenced | Groups to mute for IoT Hub orphaned d2c telemetry monitor | map | `<map>` | no |
| iothub_orphaned_d2c_telemetry_egress_threshold_critical | D2C Telemetry Orphaned limit (critical threshold) | string | `1000` | no |
| iothub_orphaned_d2c_telemetry_egress_threshold_warning | D2C Telemetry Orphaned limit (warning threshold) | string | `500` | no |
| iothub_status_message | Custom message for IoT Hub status monitor | string | `` | no |
| iothub_status_silenced | Groups to mute for IoT Hub status monitor | map | `<map>` | no |
| iothub_too_many_d2c_telemetry_ingress_nosent_message | Custom message for IoT Hub unsent d2c telemetry monitor | string | `` | no |
| iothub_too_many_d2c_telemetry_ingress_nosent_silenced | Groups to mute for IoT Hub unsent d2c telemetry monitor | map | `<map>` | no |
| iothub_total_devices_message | Custom message for IoT Hub total devices monitor | string | `` | no |
| iothub_total_devices_silenced | Groups to mute for IoT Hub total devices monitor | map | `<map>` | no |
| message | Message sent when a monitor is triggered | string | - | yes |
| non_taggable_filter_tags | Tags used for filtering for components without tag support | string | `*` | no |
| redis_evictedkeys_limit_message | Custom message for Redis evicted keys monitor | string | `` | no |
| redis_evictedkeys_limit_silenced | Groups to mute for Redis evicted keys monitor | map | `<map>` | no |
| redis_evictedkeys_limit_threshold_critical | Evicted keys limit (critical threshold) | string | `100` | no |
| redis_evictedkeys_limit_threshold_warning | Evicted keys limit (warning threshold) | string | `0` | no |
| redis_percent_processor_time_message | Custom message for Redis processor monitor | string | `` | no |
| redis_percent_processor_time_silenced | Groups to mute for Redis processor monitor | map | `<map>` | no |
| redis_percent_processor_time_threshold_critical | Processor time percent (critical threshold) | string | `80` | no |
| redis_percent_processor_time_threshold_warning | Processor time percent (warning threshold) | string | `60` | no |
| redis_server_load_rate_message | Custom message for Redis server load monitor | string | `` | no |
| redis_server_load_rate_silenced | Groups to mute for Redis server load monitor | map | `<map>` | no |
| redis_server_load_rate_threshold_critical | Server CPU load rate (critical threshold) | string | `90` | no |
| redis_server_load_rate_threshold_warning | Server CPU load rate (warning threshold) | string | `70` | no |
| redis_status_message | Custom message for Redis status monitor | string | `` | no |
| redis_status_silenced | Groups to mute for Redis status monitor | map | `<map>` | no |
| sqldatabase_cpu_message | Custom message for SQL CPU monitor | string | `` | no |
| sqldatabase_cpu_silenced | Groups to mute for SQL CPU monitor | map | `<map>` | no |
| sqldatabase_cpu_threshold_critical | CPU usage in percent (critical threshold) | string | `90` | no |
| sqldatabase_cpu_threshold_warning | CPU usage in percent (warning threshold) | string | `80` | no |
| sqldatabase_deadlock_message | Custom message for SQL Deadlock monitor | string | `` | no |
| sqldatabase_deadlock_silenced | Groups to mute for SQL Deadlock monitor | map | `<map>` | no |
| sqldatabase_deadlock_threshold_critical | Amount of Deadlocks (critical threshold) | string | `1` | no |
| sqldatabase_diskspace_message | Custom message for SQL disk space monitor | string | `` | no |
| sqldatabase_diskspace_silenced | Groups to mute for SQL disk space monitor | map | `<map>` | no |
| sqldatabase_diskspace_threshold_critical | Disk space used in percent (critical threshold) | string | `90` | no |
| sqldatabase_diskspace_threshold_warning | Disk space used in percent (warning threshold) | string | `80` | no |
| sqldatabase_dtu_message | Custom message for SQL DTU monitor | string | `` | no |
| sqldatabase_dtu_silenced | Groups to mute for SQL DTU monitor | map | `<map>` | no |
| sqldatabase_dtu_threshold_critical | Amount of DTU used (critical threshold) | string | `90` | no |
| sqldatabase_dtu_threshold_warning | Amount of DTU used (warning threshold) | string | `85` | no |
| storage_authorization_error_requests_message | Custom message for Storage authorization errors monitor | string | `` | no |
| storage_authorization_error_requests_silenced | Groups to mute for Storage authorization errors monitor | map | `<map>` | no |
| storage_authorization_error_requests_threshold_critical | Maximum acceptable percent of authorization error requests for a storage | string | `90` | no |
| storage_authorization_error_requests_threshold_warning | Warning regarding acceptable percent of authorization error requests for a storage | string | `50` | no |
| storage_availability_message | Custom message for Storage availability monitor | string | `` | no |
| storage_availability_silenced | Groups to mute for Storage availability monitor | map | `<map>` | no |
| storage_availability_threshold_critical | Minimum acceptable percent of availability for a storage | string | `50` | no |
| storage_availability_threshold_warning | Warning regarding acceptable percent of availability for a storage | string | `90` | no |
| storage_client_other_error_requests_message | Custom message for Storage other errors monitor | string | `` | no |
| storage_client_other_error_requests_silenced | Groups to mute for Storage other errors monitor | map | `<map>` | no |
| storage_client_other_error_requests_threshold_critical | Maximum acceptable percent of client other error requests for a storage | string | `90` | no |
| storage_client_other_error_requests_threshold_warning | Warning regarding acceptable percent of client other error requests for a storage | string | `50` | no |
| storage_latency_message | Custom message for Storage latency monitor | string | `` | no |
| storage_latency_silenced | Groups to mute for Storage latency monitor | map | `<map>` | no |
| storage_latency_threshold_critical | Maximum acceptable end to end latency (ms) for a storage | string | `2000` | no |
| storage_latency_threshold_warning | Warning regarding acceptable end to end latency (ms) for a storage | string | `1000` | no |
| storage_network_error_requests_message | Custom message for Storage network errors monitor | string | `` | no |
| storage_network_error_requests_silenced | Groups to mute for Storage network errors monitor | map | `<map>` | no |
| storage_network_error_requests_threshold_critical | Maximum acceptable percent of network error requests for a storage | string | `90` | no |
| storage_network_error_requests_threshold_warning | Warning regarding acceptable percent of network error requests for a storage | string | `50` | no |
| storage_server_other_error_requests_message | Custom message for Storage server other errors monitor | string | `` | no |
| storage_server_other_error_requests_silenced | Groups to mute for Storage server other errors monitor | map | `<map>` | no |
| storage_server_other_error_requests_threshold_critical | Maximum acceptable percent of server other error requests for a storage | string | `90` | no |
| storage_server_other_error_requests_threshold_warning | Warning regarding acceptable percent of server other error requests for a storage | string | `50` | no |
| storage_successful_requests_message | Custom message for Storage sucessful requests monitor | string | `` | no |
| storage_successful_requests_silenced | Groups to mute for Storage sucessful requests monitor | map | `<map>` | no |
| storage_successful_requests_threshold_critical | Minimum acceptable percent of successful requests for a storage | string | `10` | no |
| storage_successful_requests_threshold_warning | Warning regarding acceptable percent of successful requests for a storage | string | `30` | no |
| storage_throttling_error_requests_message | Custom message for Storage throttling error monitor | string | `` | no |
| storage_throttling_error_requests_silenced | Groups to mute for Storage throttling error monitor | map | `<map>` | no |
| storage_throttling_error_requests_threshold_critical | Maximum acceptable percent of throttling error requests for a storage | string | `90` | no |
| storage_throttling_error_requests_threshold_warning | Warning regarding acceptable percent of throttling error requests for a storage | string | `50` | no |
| storage_timeout_error_requests_message | Custom message for Storage timeout monitor | string | `` | no |
| storage_timeout_error_requests_silenced | Groups to mute for Storage timeout monitor | map | `<map>` | no |
| storage_timeout_error_requests_threshold_critical | Maximum acceptable percent of timeout error requests for a storage | string | `90` | no |
| storage_timeout_error_requests_threshold_warning | Warning regarding acceptable percent of timeout error requests for a storage | string | `50` | no |
| streamanalytics_conversion_errors_message | Custom message for Stream Analytics conversion errors monitor | string | `` | no |
| streamanalytics_conversion_errors_silenced | Groups to mute for Stream Analytics conversion errors monitor | map | `<map>` | no |
| streamanalytics_conversion_errors_threshold_critical | Conversion errors limit (critical threshold) | string | `10` | no |
| streamanalytics_conversion_errors_threshold_warning | Conversion errors limit (warning threshold) | string | `0` | no |
| streamanalytics_failed_function_requests_message | Custom message for Stream Analytics failed requests monitor | string | `` | no |
| streamanalytics_failed_function_requests_silenced | Groups to mute for Stream Analytics failed requests monitor | map | `<map>` | no |
| streamanalytics_failed_function_requests_threshold_critical | Failed Function Request rate limit (critical threshold) | string | `10` | no |
| streamanalytics_failed_function_requests_threshold_warning | Failed Function Request rate limit (warning threshold) | string | `0` | no |
| streamanalytics_runtime_errors_message | Custom message for Stream Analytics runtime errors monitor | string | `` | no |
| streamanalytics_runtime_errors_silenced | Groups to mute for Stream Analytics runtime errors monitor | map | `<map>` | no |
| streamanalytics_runtime_errors_threshold_critical | Runtime errors limit (critical threshold) | string | `10` | no |
| streamanalytics_runtime_errors_threshold_warning | Runtime errors limit (warning threshold) | string | `0` | no |
| streamanalytics_status_message | Custom message for Stream Analytics status monitor | string | `` | no |
| streamanalytics_status_silenced | Groups to mute for Stream Analytics status monitor | map | `<map>` | no |
| streamanalytics_su_utilization_message | Custom message for Stream Analytics utilization monitor | string | `` | no |
| streamanalytics_su_utilization_silenced | Groups to mute for Stream Analytics utilization monitor | map | `<map>` | no |
| streamanalytics_su_utilization_threshold_critical | Streaming Unit utilization rate limit (critical threshold) | string | `80` | no |
| streamanalytics_su_utilization_threshold_warning | Streaming Unit utilization rate limit (warning threshold) | string | `60` | no |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/azure/](https://docs.datadoghq.com/integrations/azure/)

Azure metrics documentation: [https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-metrics](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-metrics)
