variable "environment" {
  description = "Architecture environment"
  type        = "string"
}

variable "message" {
  description = "Message sent when a monitor is triggered"
  type        = "string"
}

variable "delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 600
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

variable "non_taggable_filter_tags" {
  description = "Tags used for filtering for components without tag support"
  default     = "*"
}

# Azure API Management specific variables
variable "apimanagement_status_silenced" {
  description = "Groups to mute for API Management status monitor"
  type        = "map"
  default     = {}
}

variable "apimanagement_failed_requests_silenced" {
  description = "Groups to mute for API Management failed requests monitor"
  type        = "map"
  default     = {}
}

variable "apimanagement_failed_requests_threshold_critical" {
  description = "Maximum acceptable percent of failed requests"
  default     = 90
}

variable "apimanagement_failed_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of failed requests"
  default     = 50
}

variable "apimanagement_other_requests_silenced" {
  description = "Groups to mute for API Management other requests monitor"
  type        = "map"
  default     = {}
}

variable "apimanagement_other_requests_threshold_critical" {
  description = "Maximum acceptable percent of other requests"
  default     = 90
}

variable "apimanagement_other_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of other requests"
  default     = 50
}

variable "apimanagement_unauthorized_requests_silenced" {
  description = "Groups to mute for API Management unauthorized requests monitor"
  type        = "map"
  default     = {}
}

variable "apimanagement_unauthorized_requests_threshold_critical" {
  description = "Maximum acceptable percent of unauthorized requests"
  default     = 90
}

variable "apimanagement_unauthorized_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of unauthorized requests"
  default     = 50
}

variable "apimanagement_successful_requests_silenced" {
  description = "Groups to mute for API Management successful requests monitor"
  type        = "map"
  default     = {}
}

variable "apimanagement_successful_requests_threshold_critical" {
  description = "Minimum acceptable percent of successful requests"
  default     = 10
}

variable "apimanagement_successful_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of successful requests"
  default     = 30
}

# Azure App Services specific variables
variable "appservices_response_time_silenced" {
  description = "Groups to mute for App Services response time monitor"
  type        = "map"
  default     = {}
}

variable "appservices_response_time_threshold_critical" {
  default     = 10
  description = "Alerting threshold for response time in seconds"
}

variable "appservices_response_time_threshold_warning" {
  default     = 5
  description = "Warning threshold for response time in seconds"
}

variable "appservices_memory_usage_silenced" {
  description = "Groups to mute for App Services memory usage monitor"
  type        = "map"
  default     = {}
}

variable "appservices_memory_usage_threshold_critical" {
  default     = 1073741824                  # 1Gb
  description = "Alerting threshold in Mib"
}

variable "appservices_memory_usage_threshold_warning" {
  default     = 536870912                  # 512Mb
  description = "Warning threshold in MiB"
}

variable "appservices_http_4xx_requests_silenced" {
  description = "Groups to mute for App Services 4xx requests monitor"
  type        = "map"
  default     = {}
}

variable "appservices_http_4xx_requests_threshold_critical" {
  default     = 90
  description = "Maximum critical acceptable percent of 4xx errors"
}

variable "appservices_http_4xx_requests_threshold_warning" {
  default     = 50
  description = "Warning regarding acceptable percent of 4xx errors"
}

variable "appservices_http_5xx_requests_silenced" {
  description = "Groups to mute for App Services 5xx requests monitor"
  type        = "map"
  default     = {}
}

variable "appservices_http_5xx_requests_threshold_critical" {
  default     = 90
  description = "Maximum critical acceptable percent of 5xx errors"
}

variable "appservices_http_5xx_requests_threshold_warning" {
  default     = 50
  description = "Warning regarding acceptable percent of 5xx errors"
}

variable "appservices_http_successful_requests_silenced" {
  description = "Groups to mute for App Services successful requests monitor"
  type        = "map"
  default     = {}
}

variable "appservices_http_successful_requests_threshold_critical" {
  default     = 10
  description = "Minimum critical acceptable percent of 2xx & 3xx requests"
}

variable "appservices_http_successful_requests_threshold_warning" {
  default     = 30
  description = "Warning regarding acceptable percent of 2xx & 3xx requests"
}

# Azure Event Hub specific variables
variable "eventhub_status_silenced" {
  description = "Groups to mute for Event Hub status monitor"
  type        = "map"
  default     = {}
}

variable "eventhub_failed_requests_rate_silenced" {
  description = "Groups to mute for Event Hub failed requests monitor"
  type        = "map"
  default     = {}
}

variable "eventhub_failed_requests_rate_thresold_critical" {
  description = "Failed requests ratio (percentage) to trigger the critical alert"
  default     = 90
}

variable "eventhub_failed_requests_rate_thresold_warning" {
  description = "Failed requests ratio (percentage) to trigger a warning alert"
  default     = 50
}

variable "eventhub_errors_rate_silenced" {
  description = "Groups to mute for Event Hub errors monitor"
  type        = "map"
  default     = {}
}

variable "eventhub_errors_rate_thresold_critical" {
  description = "Errors ratio (percentage) to trigger the critical alert"
  default     = 90
}

variable "eventhub_errors_rate_thresold_warning" {
  description = "Errors ratio (percentage) to trigger a warning alert"
  default     = 50
}

# IOT Hub specific variables
variable "iothub_status_silenced" {
  description = "Groups to mute for IoT Hub status monitor"
  type        = "map"
  default     = {}
}

variable "iothub_total_devices_silenced" {
  description = "Groups to mute for IoT Hub total device monitor"
  type        = "map"
  default     = {}
}

variable "iothub_too_many_d2c_telemetry_ingress_nosent_silenced" {
  description = "Groups to mute for IoT Hub unsent d2c telemetry monitor"
  type        = "map"
  default     = {}
}

variable "iothub_failed_jobs_rate_silenced" {
  description = "Groups to mute for IoT Hub failed jobs monitor"
  type        = "map"
  default     = {}
}

variable "iothub_failed_jobs_rate_threshold_warning" {
  description = "Jobs Failed rate limit (warning threshold)"
  default     = 50
}

variable "iothub_failed_jobs_rate_threshold_critical" {
  description = "Jobs Failed rate limit (critical threshold)"
  default     = 90
}

variable "iothub_failed_listjobs_rate_silenced" {
  description = "Groups to mute for IoT Hub failed list jobs monitor"
  type        = "map"
  default     = {}
}

variable "iothub_failed_listjobs_rate_threshold_warning" {
  description = "ListJobs Failed rate limit (warning threshold)"
  default     = 50
}

variable "iothub_failed_listjobs_rate_threshold_critical" {
  description = "ListJobs Failed rate limit (critical threshold)"
  default     = 90
}

variable "iothub_failed_queryjobs_rate_silenced" {
  description = "Groups to mute for IoT Hub failed query jobs monitor"
  type        = "map"
  default     = {}
}

variable "iothub_failed_queryjobs_rate_threshold_warning" {
  description = "QueryJobs Failed rate limit (warning threshold)"
  default     = 50
}

variable "iothub_failed_queryjobs_rate_threshold_critical" {
  description = "QueryJobs Failed rate limit (critical threshold)"
  default     = 90
}

variable "iothub_failed_c2d_methods_rate_silenced" {
  description = "Groups to mute for IoT Hub failed c2d methods monitor"
  type        = "map"
  default     = {}
}

variable "iothub_failed_c2d_methods_rate_threshold_warning" {
  description = "C2D Methods Failed rate limit (warning threshold)"
  default     = 50
}

variable "iothub_failed_c2d_methods_rate_threshold_critical" {
  description = "C2D Methods Failed rate limit (critical threshold)"
  default     = 90
}

variable "iothub_failed_c2d_twin_read_rate_silenced" {
  description = "Groups to mute for IoT Hub failed c2d twin read monitor"
  type        = "map"
  default     = {}
}

variable "iothub_failed_c2d_twin_read_rate_threshold_warning" {
  description = "C2D Twin Read Failed rate limit (warning threshold)"
  default     = 50
}

variable "iothub_failed_c2d_twin_read_rate_threshold_critical" {
  description = "C2D Twin Read Failed rate limit (critical threshold)"
  default     = 90
}

variable "iothub_failed_c2d_twin_update_rate_silenced" {
  description = "Groups to mute for IoT Hub failed c2d twin update monitor"
  type        = "map"
  default     = {}
}

variable "iothub_failed_c2d_twin_update_rate_threshold_warning" {
  description = "C2D Twin Update Failed rate limit (warning threshold)"
  default     = 50
}

variable "iothub_failed_c2d_twin_update_rate_threshold_critical" {
  description = "C2D Twin Update Failed rate limit (critical threshold)"
  default     = 90
}

variable "iothub_failed_d2c_twin_read_rate_silenced" {
  description = "Groups to mute for IoT Hub failed d2c twin read monitor"
  type        = "map"
  default     = {}
}

variable "iothub_failed_d2c_twin_read_rate_threshold_warning" {
  description = "D2C Twin Read Failed rate limit (warning threshold)"
  default     = 50
}

variable "iothub_failed_d2c_twin_read_rate_threshold_critical" {
  description = "D2C Twin Read Failed rate limit (critical threshold)"
  default     = 90
}

variable "iothub_failed_d2c_twin_update_rate_silenced" {
  description = "Groups to mute for IoT Hub failed d2c twin update monitor"
  type        = "map"
  default     = {}
}

variable "iothub_failed_d2c_twin_update_rate_threshold_warning" {
  description = "D2C Twin Update Failed rate limit (warning threshold)"
  default     = 50
}

variable "iothub_failed_d2c_twin_update_rate_threshold_critical" {
  description = "D2C Twin Update Failed rate limit (critical threshold)"
  default     = 90
}

variable "iothub_dropped_d2c_telemetry_egress_silenced" {
  description = "Groups to mute for IoT Hub dropped d2c telemetry monitor"
  type        = "map"
  default     = {}
}

variable "iothub_dropped_d2c_telemetry_egress_threshold_warning" {
  description = "D2C Telemetry Dropped limit (warning threshold)"
  default     = 500
}

variable "iothub_dropped_d2c_telemetry_egress_threshold_critical" {
  description = "D2C Telemetry Dropped limit (critical threshold)"
  default     = 1000
}

variable "iothub_orphaned_d2c_telemetry_egress_silenced" {
  description = "Groups to mute for IoT Hub orphaned d2c telemetry monitor"
  type        = "map"
  default     = {}
}

variable "iothub_orphaned_d2c_telemetry_egress_threshold_warning" {
  description = "D2C Telemetry Orphaned limit (warning threshold)"
  default     = 500
}

variable "iothub_orphaned_d2c_telemetry_egress_threshold_critical" {
  description = "D2C Telemetry Orphaned limit (critical threshold)"
  default     = 1000
}

variable "iothub_invalid_d2c_telemetry_egress_silenced" {
  description = "Groups to mute for IoT Hub invalid d2c telemetry monitor"
  type        = "map"
  default     = {}
}

variable "iothub_invalid_d2c_telemetry_egress_threshold_warning" {
  description = "D2C Telemetry Invalid limit (warning threshold)"
  default     = 500
}

variable "iothub_invalid_d2c_telemetry_egress_threshold_critical" {
  description = "D2C Telemetry Invalid limit (critical threshold)"
  default     = 1000
}

variable "iothub_fallback_d2c_telemetry_egress_silenced" {
  description = "Groups to mute for IoT Hub fallback d2c telemetry monitor"
  type        = "map"
  default     = {}
}

variable "iothub_fallback_d2c_telemetry_egress_threshold_warning" {
  description = "D2C Telemetry Fallback limit (warning threshold)"
  default     = 500
}

variable "iothub_fallback_d2c_telemetry_egress_threshold_critical" {
  description = "D2C Telemetry Fallback limit (critical threshold)"
  default     = 1000
}

# Azure Redis specific variables
variable "redis_status_silenced" {
  description = "Groups to mute for Redis status monitor"
  type        = "map"
  default     = {}
}

variable "redis_evictedkeys_limit_silenced" {
  description = "Groups to mute for Redis evicted keys monitor"
  type        = "map"
  default     = {}
}

variable "redis_evictedkeys_limit_threshold_warning" {
  description = "Evicted keys limit (warning threshold)"
  default     = 0
}

variable "redis_evictedkeys_limit_threshold_critical" {
  description = "Evicted keys limit (critical threshold)"
  default     = 100
}

variable "redis_percent_processor_time_silenced" {
  description = "Groups to mute for Redis processor monitor"
  type        = "map"
  default     = {}
}

variable "redis_percent_processor_time_threshold_critical" {
  description = "Processor time percent (critical threshold)"
  default     = 80
}

variable "redis_percent_processor_time_threshold_warning" {
  description = "Processor time percent (warning threshold)"
  default     = 60
}

variable "redis_server_load_rate_silenced" {
  description = "Groups to mute for Redis server load monitor"
  type        = "map"
  default     = {}
}

variable "redis_server_load_rate_threshold_critical" {
  description = "Server CPU load rate (critical threshold)"
  default     = 90
}

variable "redis_server_load_rate_threshold_warning" {
  description = "Server CPU load rate (warning threshold)"
  default     = 70
}

# Azure SQL Database specific variables
variable "sqldatabase_cpu_silenced" {
  description = "Groups to mute for SQL CPU monitor"
  type        = "map"
  default     = {}
}

variable "sqldatabase_cpu_threshold_warning" {
  description = "CPU usage in percent (warning threshold)"
  default     = "80"
}

variable "sqldatabase_cpu_threshold_critical" {
  description = "CPU usage in percent (critical threshold)"
  default     = "90"
}

variable "sqldatabase_diskspace_silenced" {
  description = "Groups to mute for SQL disk space monitor"
  type        = "map"
  default     = {}
}

variable "sqldatabase_diskspace_threshold_warning" {
  description = "Disk space used in percent (warning threshold)"
  default     = "80"
}

variable "sqldatabase_diskspace_threshold_critical" {
  description = "Disk space used in percent (critical threshold)"
  default     = "90"
}

variable "sqldatabase_dtu_silenced" {
  description = "Groups to mute for SQL DTU monitor"
  type        = "map"
  default     = {}
}

variable "sqldatabase_dtu_threshold_warning" {
  description = "Amount of DTU used (warning threshold)"
  default     = "85"
}

variable "sqldatabase_dtu_threshold_critical" {
  description = "Amount of DTU used (critical threshold)"
  default     = "90"
}

variable "sqldatabase_deadlock_silenced" {
  description = "Groups to mute for SQL Deadlock monitor"
  type        = "map"
  default     = {}
}

variable "sqldatabase_deadlock_threshold_critical" {
  description = "Amount of Deadlocks (critical threshold)"
  default     = "1"
}

# Azure Storage specific variables
variable "storage_availability_silenced" {
  description = "Groups to mute for Storage availability monitor"
  type        = "map"
  default     = {}
}

variable "storage_availability_threshold_critical" {
  description = "Minimum acceptable percent of availability for a storage"
  default     = 50
}

variable "storage_availability_threshold_warning" {
  description = "Warning regarding acceptable percent of availability for a storage"
  default     = 90
}

variable "storage_successful_requests_silenced" {
  description = "Groups to mute for Storage sucessful requests monitor"
  type        = "map"
  default     = {}
}

variable "storage_successful_requests_threshold_critical" {
  description = "Minimum acceptable percent of successful requests for a storage"
  default     = 10
}

variable "storage_successful_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of successful requests for a storage"
  default     = 30
}

variable "storage_latency_silenced" {
  description = "Groups to mute for Storage latency monitor"
  type        = "map"
  default     = {}
}

variable "storage_latency_threshold_critical" {
  description = "Maximum acceptable end to end latency (ms) for a storage"
  default     = 2000
}

variable "storage_latency_threshold_warning" {
  description = "Warning regarding acceptable end to end latency (ms) for a storage"
  default     = 1000
}

variable "storage_timeout_error_requests_silenced" {
  description = "Groups to mute for Storage timeout monitor"
  type        = "map"
  default     = {}
}

variable "storage_timeout_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of timeout error requests for a storage"
  default     = 90
}

variable "storage_timeout_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of timeout error requests for a storage"
  default     = 50
}

variable "storage_network_error_requests_silenced" {
  description = "Groups to mute for Storage network errors monitor"
  type        = "map"
  default     = {}
}

variable "storage_network_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of network error requests for a storage"
  default     = 90
}

variable "storage_network_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of network error requests for a storage"
  default     = 50
}

variable "storage_throttling_error_requests_silenced" {
  description = "Groups to mute for Storage throttling error monitor"
  type        = "map"
  default     = {}
}

variable "storage_throttling_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of throttling error requests for a storage"
  default     = 90
}

variable "storage_throttling_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of throttling error requests for a storage"
  default     = 50
}

variable "storage_server_other_error_requests_silenced" {
  description = "Groups to mute for Storage server other errors monitor"
  type        = "map"
  default     = {}
}

variable "storage_server_other_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of server other error requests for a storage"
  default     = 90
}

variable "storage_server_other_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of server other error requests for a storage"
  default     = 50
}

variable "storage_client_other_error_requests_silenced" {
  description = "Groups to mute for Storage other errors monitor"
  type        = "map"
  default     = {}
}

variable "storage_client_other_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of client other error requests for a storage"
  default     = 90
}

variable "storage_client_other_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of client other error requests for a storage"
  default     = 50
}

variable "storage_authorization_error_requests_silenced" {
  description = "Groups to mute for Storage authorization errors monitor"
  type        = "map"
  default     = {}
}

variable "storage_authorization_error_requests_threshold_critical" {
  description = "Maximum acceptable percent of authorization error requests for a storage"
  default     = 90
}

variable "storage_authorization_error_requests_threshold_warning" {
  description = "Warning regarding acceptable percent of authorization error requests for a storage"
  default     = 50
}

# Azure Stream Analytics specific variables
variable "streamanalytics_status_silenced" {
  description = "Groups to mute for Stream Analytics status monitor"
  type        = "map"
  default     = {}
}

variable "streamanalytics_su_utilization_silenced" {
  description = "Groups to mute for Stream Analytics utilization monitor"
  type        = "map"
  default     = {}
}

variable "streamanalytics_su_utilization_threshold_warning" {
  description = "Streaming Unit utilization rate limit (warning threshold)"
  default     = 60
}

variable "streamanalytics_su_utilization_threshold_critical" {
  description = "Streaming Unit utilization rate limit (critical threshold)"
  default     = 80
}

variable "streamanalytics_failed_function_requests_silenced" {
  description = "Groups to mute for Stream Analytics failed requests monitor"
  type        = "map"
  default     = {}
}

variable "streamanalytics_failed_function_requests_threshold_warning" {
  description = "Failed Function Request rate limit (warning threshold)"
  default     = 0
}

variable "streamanalytics_failed_function_requests_threshold_critical" {
  description = "Failed Function Request rate limit (critical threshold)"
  default     = 10
}

variable "streamanalytics_conversion_errors_silenced" {
  description = "Groups to mute for Stream Analytics conversion errors monitor"
  type        = "map"
  default     = {}
}

variable "streamanalytics_conversion_errors_threshold_warning" {
  description = "Conversion errors limit (warning threshold)"
  default     = 0
}

variable "streamanalytics_conversion_errors_threshold_critical" {
  description = "Conversion errors limit (critical threshold)"
  default     = 10
}

variable "streamanalytics_runtime_errors_silenced" {
  description = "Groups to mute for Stream Analytics runtime errors monitor"
  type        = "map"
  default     = {}
}

variable "streamanalytics_runtime_errors_threshold_warning" {
  description = "Runtime errors limit (warning threshold)"
  default     = 0
}

variable "streamanalytics_runtime_errors_threshold_critical" {
  description = "Runtime errors limit (critical threshold)"
  default     = 10
}
